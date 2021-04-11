(* Code generation: translate takes a semantically checked AST and
produces LLVM IR

LLVM tutorial: Make sure to read the OCaml version of the tutorial

http://llvm.org/docs/tutorial/index.html

Detailed documentation on the OCaml LLVM library:

http://llvm.moe/
http://llvm.moe/ocaml/

*)

module L = Llvm
module A = Ast
open Sast 

module StringMap = Map.Make(String)

(* translate : Sast.program -> Llvm.module *)
let translate (globals, functions) =
  let context    = L.global_context () in
  
  (* Create the LLVM compilation module into which
     we will generate code *)
  let the_module = L.create_module context "JavaLite" in

  (* Get types from the context *)
  let i32_t      = L.i32_type    context
  and i8_t       = L.i8_type     context
  and i1_t       = L.i1_type     context
  and double_t   = L.double_type context
  and void_t     = L.void_type   context in

  (* string type *)
  let string_t   = L.pointer_type i8_t in

  (* Return the LLVM type for a MicroC type *)
  let ltype_of_typ = function
      A.Int    -> i32_t
    | A.Bool   -> i1_t
    | A.Double -> double_t
    | A.Void   -> void_t
    | A.String -> string_t
    | _        -> raise (Failure "Unmatched LLVM type in ltype_of_typ")
  in

  (* Create a map of global variables after creating each *)
  let global_vars : L.llvalue StringMap.t =
    let global_var m (t, n) = 
      let init = match t with
          A.Double -> L.const_float (ltype_of_typ t) 0.0
        | _ -> L.const_int (ltype_of_typ t) 0
      in StringMap.add n (L.define_global n init the_module) m in
    List.fold_left global_var StringMap.empty globals in
  
  (* Import modules for our built-in functions and print *)
  let printf_t : L.lltype = 
      L.var_arg_function_type i32_t [| string_t |] in
  let printf_func : L.llvalue = 
      L.declare_function "printf" printf_t the_module in
  
  (* testing *)
  (* let sizeof_t : L.lltype = 
    L.var_arg_function_type i32_t [| string_t |] in
  let sizeof_func : L.llvalue = 
      L.declare_function "sizeof" sizeof_t the_module in *)

  let reversestring_t : L.lltype =
      L.function_type string_t [| string_t |] in
  let reversestring_func : L.llvalue =
      L.declare_function "reverse" reversestring_t the_module in

  let stringupper_t : L.lltype =
      L.function_type string_t [| string_t |] in
  let stringupper_func : L.llvalue =
      L.declare_function "upper" stringupper_t the_module in

  let stringlower_t : L.lltype =
      L.function_type string_t [| string_t |] in
  let stringlower_func : L.llvalue =
      L.declare_function "lower" stringlower_t the_module in

  let stringsubstring_t : L.lltype =
      L.function_type string_t [| string_t ; i32_t ; i32_t |] in
  let stringsubstring_func : L.llvalue =
      L.declare_function "substring" stringsubstring_t the_module in

  (* Define each function (arguments and return type) so we can 
     call it even before we've created its body *)
  let function_decls : (L.llvalue * sfunc_decl) StringMap.t =
    let function_decl m fdecl =
      let name = fdecl.sfname
      and formal_types = 
	Array.of_list (List.map (fun (t,_) -> ltype_of_typ t) fdecl.sformals)
      in let ftype = L.function_type (ltype_of_typ fdecl.styp) formal_types in
      StringMap.add name (L.define_function name ftype the_module, fdecl) m in
    List.fold_left function_decl StringMap.empty functions in
  
  (* Fill in the body of the given function *)
  let build_function_body fdecl =
    let (the_function, _) = StringMap.find fdecl.sfname function_decls in
    let builder = L.builder_at_end context (L.entry_block the_function) in

    let int_format_str = L.build_global_stringptr "%d\n" "fmt" builder
    and float_format_str = L.build_global_stringptr "%g\n" "fmt" builder
    and str_format_str = L.build_global_stringptr "%s\n" "fmt" builder
    in

    (* Find the type of the input *)
    let find_str_typ = function
        A.Int     -> int_format_str
      | A.Bool    -> int_format_str 
      | A.Double  -> float_format_str 
      | A.String  -> str_format_str 
      | _         -> raise (Failure "Invalid type")
    in

    (* Construct the function's "locals": formal arguments and locally
       declared variables.  Allocate each on the stack, initialize their
       value, if appropriate, and remember their values in the "locals" map *)
    let local_vars =
      let add_formal m (t, n) p = 
        L.set_value_name n p;
	  let local = L.build_alloca (ltype_of_typ t) n builder in
        ignore (L.build_store p local builder);
	  StringMap.add n local m 

    (* Allocate space for any locally declared variables and add the
      * resulting registers to our map *)
      and add_local m (t, n) =
    let local_var = L.build_alloca (ltype_of_typ t) n builder
    in StringMap.add n local_var m 
      in

      let formals = List.fold_left2 add_formal StringMap.empty fdecl.sformals
          (Array.to_list (L.params the_function)) in
      List.fold_left add_local formals fdecl.slocals 
    in
    
    (* Return the value for a variable or formal argument.
       Check local names first, then global names *)
    let lookup n = try StringMap.find n local_vars
                   with Not_found -> StringMap.find n global_vars
    in

    let i32_t_pt = L.string_of_lltype i32_t in
    let i1_t_pt = L.string_of_lltype i1_t in
    let double_t_pt = L.string_of_lltype double_t in
    let string_t_pt = L.string_of_lltype string_t in

    let match_typ t = 
      let t_pt = L.string_of_lltype t in
      if t_pt = string_t_pt then A.String else
        if t_pt = double_t_pt then A.Double else
          if t_pt = i32_t_pt then A.Int else
            if t_pt = i1_t_pt then A.Int else
              raise (Failure ("cannot match type: " ^ t_pt)) in

    let is_arith = function
        A.Add     -> true
      | A.Sub     -> true
      | A.Mult    -> true
      | A.Div     -> true
      | _         -> false in

    let rec find_type = function
      | SIntLit _     -> A.Int
      | SBoolLit _     -> A.Int
      | SDoubleLit _   -> A.Double
      | SStrLit _      -> A.String 
      | SBinop((_, e_x), op, _) -> if (is_arith op) = true then find_type e_x
                                    else A.Int
      | SUnop(_, (_, e_x)) -> find_type e_x
      | SNoexpr        -> raise (Failure "Unmatched NoExpr")
      | SCall(f, _) -> let (_, fdecl) = StringMap.find f function_decls in 
                            (match fdecl.styp with
                              A.Void -> raise (Failure "Cannot print void")
                              | _     -> fdecl.styp)
      | SVar v        -> match_typ (L.element_type (L.type_of (lookup v)))
      | SAssign(v, _)        -> find_type (SVar(v))
      | SArrayAccess _   -> raise (Failure "SArrayAccess not implemented")
      | SArrayLit _      -> raise (Failure "SArrayLit not implemented")
    in

    (* Construct code for an expression; return its value *)
    let rec expr builder ((_, e) : sexpr) = match e with
	      SIntLit i  -> L.const_int i32_t i
      | SBoolLit b  -> L.const_int i1_t (if b then 1 else 0)
      | SDoubleLit l -> L.const_float_of_string double_t l
      | SStrLit s -> L.build_global_stringptr s "str" builder
      | SNoexpr     -> L.const_int i32_t 0
      | SVar s       -> L.build_load (lookup s) s builder
      | SAssign (s, e) -> let e' = expr builder e in
                          ignore(L.build_store e' (lookup s) builder); e'
      | SBinop ((A.Double,_ ) as e1, op, e2) ->
	  let e1' = expr builder e1
	  and e2' = expr builder e2 in
	  (match op with 
	    A.Add     -> L.build_fadd
	  | A.Sub     -> L.build_fsub
	  | A.Mult    -> L.build_fmul
	  | A.Div     -> L.build_fdiv 
	  | A.Equal   -> L.build_fcmp L.Fcmp.Oeq
	  | A.Neq     -> L.build_fcmp L.Fcmp.One
	  | A.Less    -> L.build_fcmp L.Fcmp.Olt
	  | A.Leq     -> L.build_fcmp L.Fcmp.Ole
	  | A.Greater -> L.build_fcmp L.Fcmp.Ogt
	  | A.Geq     -> L.build_fcmp L.Fcmp.Oge
	  | A.And | A.Or ->
	      raise (Failure "internal error: semant should have rejected and/or on float")
	  ) e1' e2' "tmp" builder

    (* String operations *)
      | SBinop ((A.String,_ ) as e1, op, e2) ->
	  (* let e1' = expr builder e1
	  and e2' = expr builder e2 in *)
	  (match op with 
	    A.Add     -> expr builder (A.String, SStrLit((print_sstring e1) ^ (print_sstring e2)))
    | _         -> raise (Failure "internal error: cannot perform this operation on string")
    )

      | SBinop (e1, op, e2) ->
	  let e1' = expr builder e1
	  and e2' = expr builder e2 in
	  (match op with
	    A.Add     -> L.build_add
	  | A.Sub     -> L.build_sub
	  | A.Mult    -> L.build_mul
    | A.Div     -> L.build_sdiv
	  | A.And     -> L.build_and
	  | A.Or      -> L.build_or
	  | A.Equal   -> L.build_icmp L.Icmp.Eq
	  | A.Neq     -> L.build_icmp L.Icmp.Ne
	  | A.Less    -> L.build_icmp L.Icmp.Slt
	  | A.Leq     -> L.build_icmp L.Icmp.Sle
	  | A.Greater -> L.build_icmp L.Icmp.Sgt
	  | A.Geq     -> L.build_icmp L.Icmp.Sge
	  ) e1' e2' "tmp" builder
      | SUnop(op, ((t, _) as e)) ->
          let e' = expr builder e in
	  (match op with
	    A.Neg when t = A.Double -> L.build_fneg 
	  | A.Neg                  -> L.build_neg
    | A.Not                  -> L.build_not) e' "tmp" builder
      | SCall ("print", [e]) ->
        let (_, e_x) = e in
        let e_type = find_type e_x in
	      L.build_call printf_func [| (find_str_typ e_type) ; (expr builder e) |]
	    "printf" builder
      | SCall ("reverse", [e]) ->
	  L.build_call reversestring_func [| (expr builder e) |] "reverse" builder
      | SCall ("upper", [e]) ->
      L.build_call stringupper_func [| (expr builder e) |] "upper" builder
      | SCall ("lower", [e]) ->
      L.build_call stringlower_func [| (expr builder e) |] "lower" builder
      | SCall ("substring", [e;s1;s2]) ->
      L.build_call stringsubstring_func [| (expr builder e) ; (expr builder s1) ; (expr builder s2) |] "substring" builder
      (* Testing sizeof function *)
      (* | SCall ("len", [e]) ->
      L.build_call sizeof_func [| (int_format_str) ; (expr builder e) |]
	    "sizeof" builder *)

      | SCall (f, args) ->
         let (fdef, fdecl) = StringMap.find f function_decls in
	 let llargs = List.rev (List.map (expr builder) (List.rev args)) in
	 let result = (match fdecl.styp with 
                        A.Void -> ""
                      | _ -> f ^ "_result") in
         L.build_call fdef (Array.of_list llargs) result builder
      | SArrayAccess _   -> raise (Failure "SArrayAccess not implemented")
      | SArrayLit _      -> raise (Failure "SArrayLit not implemented")
    in
    
    (* LLVM insists each basic block end with exactly one "terminator" 
       instruction that transfers control.  This function runs "instr builder"
       if the current block does not already have a terminator.  Used,
       e.g., to handle the "fall off the end of the function" case. *)
    let add_terminal builder instr =
      match L.block_terminator (L.insertion_block builder) with
	Some _ -> ()
      | None -> ignore (instr builder) in
	
    (* Build the code for the given statement; return the builder for
       the statement's successor (i.e., the next instruction will be built
       after the one generated by this call) *)

    let rec stmt builder = function
	SBlock sl -> List.fold_left stmt builder sl
      | SExpr e -> ignore(expr builder e); builder 
      | SReturn e -> ignore(match fdecl.styp with
                              (* Special "return nothing" instr *)
                              A.Void -> L.build_ret_void builder 
                              (* Build return statement *)
                            | _ -> L.build_ret (expr builder e) builder );
                     builder
      | SIf (predicate, then_stmt, else_stmt) ->
         let bool_val = expr builder predicate in
	 let merge_bb = L.append_block context "merge" the_function in
         let build_br_merge = L.build_br merge_bb in (* partial function *)

	 let then_bb = L.append_block context "then" the_function in
	 add_terminal (stmt (L.builder_at_end context then_bb) then_stmt)
	   build_br_merge;

	 let else_bb = L.append_block context "else" the_function in
	 add_terminal (stmt (L.builder_at_end context else_bb) else_stmt)
	   build_br_merge;

	 ignore(L.build_cond_br bool_val then_bb else_bb builder);
	 L.builder_at_end context merge_bb

      | SWhile (predicate, body) ->
	  let pred_bb = L.append_block context "while" the_function in
	  ignore(L.build_br pred_bb builder);

	  let body_bb = L.append_block context "while_body" the_function in
	  add_terminal (stmt (L.builder_at_end context body_bb) body)
	    (L.build_br pred_bb);

	  let pred_builder = L.builder_at_end context pred_bb in
	  let bool_val = expr pred_builder predicate in

	  let merge_bb = L.append_block context "merge" the_function in
	  ignore(L.build_cond_br bool_val body_bb merge_bb pred_builder);
	  L.builder_at_end context merge_bb

      (* Implement for loops as while loops *)
      | SFor (e1, e2, e3, body) -> stmt builder
	    ( SBlock [SExpr e1 ; SWhile (e2, SBlock [body ; SExpr e3]) ] )
    in

    (* Build the code for each statement in the function *)
    let builder = stmt builder (SBlock fdecl.sbody) in

    (* Add a return if the last block falls off the end *)
    add_terminal builder (match fdecl.styp with
        A.Void -> L.build_ret_void
      | A.Double -> L.build_ret (L.const_float double_t 0.0)
      | t -> L.build_ret (L.const_int (ltype_of_typ t) 0))
  in

  List.iter build_function_body functions;
  the_module
