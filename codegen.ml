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

module StringMap = Map.Make(String);;

module HashtblString =
   struct 
    type t = string
    let equal = ( = )
    let hash = Hashtbl.hash
   end;;

module StringHash = Hashtbl.Make(HashtblString);;

(* translate : Sast.program -> Llvm.module *)
let translate (classes, functions) =
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

  let add_class_typ map cd =
    let cname = cd.scname in
    let typ_lst = List.map (fun (t,_) -> t) cd.sfields in
    StringMap.add cname typ_lst map
  in
  (* store all class name and corresponding field type list *)
  let class_types = List.fold_left add_class_typ StringMap.empty classes
  in
  (* get the list of field types for a class *)
  let find_field_typs cname = 
    try StringMap.find cname class_types 
    with Not_found -> raise (Failure ("find_field_typs not found " ^ cname))
  in 

  let add_field_name map cd =
    let cname = cd.scname in
    let field_lst = List.map (fun (_,n) -> n) cd.sfields in
    StringMap.add cname field_lst map
  in

  let class_fields = List.fold_left add_field_name StringMap.empty classes
  in

  let add_cd m cd = StringMap.add cd.scname cd.sfields m in
  let class_ty_fields = List.fold_left add_cd StringMap.empty classes 
  in

  let get_field_ind (cname, fname) = 
    let f_lst = 
      try StringMap.find cname class_fields
      with Not_found -> raise (Failure ("get_field_ind not found " ^ cname))
     in
    let f_lst_ind = List.mapi (fun i n -> (n, i)) f_lst in
    snd (List.hd (List.filter (fun (n, _) -> n = fname) f_lst_ind))
  in

  let class_tbl = StringHash.create 10 in
  let find_struct cls = 
    try StringHash.find class_tbl cls
    with Not_found -> 
      let cls_struct = L.named_struct_type context cls in
      StringHash.add class_tbl cls cls_struct; cls_struct
  
  in
  (* Return the LLVM type for a MicroC type *)
  let rec ltype_of_typ = function
      A.Int    -> i32_t
    | A.Bool   -> i1_t
    | A.Double -> double_t
    | A.Void   -> void_t
    | A.String -> string_t
    | A.Arr(ty,_) -> L.pointer_type (ltype_of_typ ty)
    | A.Object(cls) -> L.pointer_type (find_struct cls)
    | _        -> raise (Failure "Unmatched LLVM type in ltype_of_typ")
  in
  
  (* Import modules for our built-in functions and print *)
  let printf_t : L.lltype = 
      L.var_arg_function_type i32_t [| string_t |] in
  let printf_func : L.llvalue = 
      L.declare_function "printf" printf_t the_module in
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

  let stringindexof_t : L.lltype =
      L.function_type i32_t [| string_t ; string_t |] in
  let stringindexof_func : L.llvalue =
      L.declare_function "indexOf" stringindexof_t the_module in

  let stringlen_t : L.lltype =
      L.function_type i32_t [| string_t |] in
  let stringlen_func : L.llvalue =
      L.declare_function "len" stringlen_t the_module in

  let stringconcat_t : L.lltype =
      L.function_type string_t [| string_t ; string_t |] in
  let stringconcat_func : L.llvalue =
      L.declare_function "concat" stringconcat_t the_module in

  (* Array functions *)
  let to_string_t : L.lltype = 
      L.var_arg_function_type string_t [| string_t |] in
  let to_string : L.llvalue =
      L.declare_function "to_string" to_string_t the_module in

  (* let arraylen_t : L.lltype =
      L.function_type i32_t [| L.pointer_type i32_t |] in
  let arraylen_func : L.llvalue =
      L.declare_function "length" arraylen_t the_module in *)

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
    let (the_function, _) = 
      try StringMap.find fdecl.sfname function_decls
      with Not_found -> raise (Failure ("build_function_body not found " ^ fdecl.sfname))
    in
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

    (* Construct a hash table for function formals and locals
       add all the formals first *)
    let tbl = StringHash.create 10 in
    let formal_tbl = StringHash.create 5 in
      let add_formal tbl (t, n) p = 
        L.set_value_name n p;
        let local = L.build_alloca (ltype_of_typ t) n builder in
            ignore (L.build_store p local builder);
        StringHash.add tbl n local; tbl in
      let _ = List.fold_left2 add_formal formal_tbl fdecl.sformals
        (Array.to_list (L.params the_function)) in

    
    (* Return the value for a variable or formal argument.
       Check local names first, then global names *)
    let lookup n = try StringHash.find tbl n
                  with Not_found -> 
                    try StringHash.find formal_tbl n
                    with Not_found -> raise (Failure ("variable " ^ n ^ " not found in lookup"))
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
      | SNullPtr _ -> A.String 
      | SCall(f, _) -> let (_, fdecl) = StringMap.find f function_decls in 
                            (match fdecl.styp with
                              A.Void -> raise (Failure "Cannot print void")
                              | _     -> fdecl.styp)
      | SVar v        -> match_typ (L.element_type (L.type_of (lookup v)))
      | SAssign(v, _)        -> find_type (SVar(v))
      | SArrayAccess(s, _)   -> match_typ (L.element_type (L.element_type (L.type_of (lookup s))))
      | SObjAccess(_, c, f) -> 
        let f_lst = StringMap.find c class_ty_fields in
        fst (List.hd (List.filter (fun (_,n) -> n = f) f_lst))
        (* todo *)
      | SArrayLit (el)    ->  let (_, e_fst) = (List.nth el 0) in 
            A.Arr (find_type e_fst, List.length el)
      | SConstruct _ -> raise (Failure "SConstruct cannot be printed")
      | SArrAssign _ -> raise (Failure "SArrAssign cannot be printed")
      | SObjAssign _ -> raise (Failure "SObjAssign cannot be printed")
      | SDecAssn _ -> raise (Failure "SDecAssn not implemented")
    in

    (* Construct code for an expression; return its value *)
    let rec expr builder ((_, e) : sexpr) = match e with
	      SIntLit i  -> L.const_int i32_t i
      | SBoolLit b  -> L.const_int i1_t (if b then 1 else 0)
      | SDoubleLit l -> L.const_float_of_string double_t l
      | SStrLit s -> L.build_global_stringptr s "str" builder
      | SArrayLit arr   -> 
        (* arr: sexpr list = typ * sx list *)
        (* let len = L.const_int i32_t ((List.length arr) + 1) in *)
        let len = L.const_int i32_t (List.length arr) in
        let size = L.const_int i32_t ((List.length arr) + 1) in
        let (fst_t, _) = List.hd arr in 
        let ty = ltype_of_typ (A.Arr(fst_t, (List.length arr))) in
        (* allocate memory for array *)
        let arr_alloca = L.build_array_alloca ty size "arr" builder in
        (* bitcast *)
        let arr_ptr = L.build_pointercast arr_alloca ty "arrptr" builder in 
        (* store all elements *)
        let elts = List.map (expr builder) arr in
        let store_elt ind elt = 
          let pos = L.const_int i32_t (ind) in
            let elt_ptr = L.build_gep arr_ptr [| pos |] "arrelt" builder in
          ignore(L.build_store elt elt_ptr builder)
        in List.iteri store_elt elts;
        let elt_ptr = L.build_gep arr_ptr [| len |] "arrlast" builder in
        let null_elt = L.const_null (L.element_type ty) in
        ignore(L.build_store null_elt elt_ptr builder);
        arr_ptr
      | SConstruct (cname, args) ->
        (* let obj_ty = ltype_of_typ (A.Object(cname)) in  *)
        let obj_ty = find_struct cname in
        let fields' = List.map (fun ty -> ltype_of_typ ty) (find_field_typs cname) in
        let _ = L.struct_set_body obj_ty (Array.of_list fields') false in
        let obj_alloca = L.build_malloc obj_ty "constrObj" builder in
        (* bitcast *)
        let obj_ptr = L.build_pointercast obj_alloca (L.pointer_type obj_ty) "constrPtr" builder in
        (* store all fields *)
        let store_field (fname, e) =
          let f_val = expr builder e in
          let ind = get_field_ind (cname, fname) in
          let f_ptr = L.build_struct_gep obj_ptr ind fname builder in
            ignore(L.build_store f_val f_ptr builder)
        in List.iter store_field args; obj_ptr
      | SArrayAccess (s, e)  -> 
        let ind = expr builder e in
        let (ty, _) = e in
        (* increment index by one to get actual ptr position *)
        let pos = L.build_add ind (L.const_int i32_t 0) "accpos" builder in
        let arr = expr builder (ty, (SVar s)) in
        let elt = L.build_gep arr [| pos |] "acceltptr" builder in
        L.build_load elt "accelt" builder
      | SObjAccess (s, cname, f) -> 
        let obj = expr builder (A.String, (SVar s)) in
        let obj_ptr = L.build_load obj "objld" builder in
        let ind = get_field_ind (cname, f) in
        L.build_extractvalue obj_ptr ind f builder
      | SArrAssign (s, e1, e2) ->
        let ind = expr builder e1 in
        let (ty, _) = e1 in
        (* increment index by one to get actual ptr position *)
        let pos = L.build_add ind (L.const_int i32_t 0) "accpos" builder in
        let arr = expr builder (ty, (SVar s)) in
        let new_val = expr builder e2 in
        let elt_ptr = L.build_gep arr [| pos |] "arrelt" builder in
        L.build_store new_val elt_ptr builder
      | SObjAssign (s, cname, f, e) ->
        let obj = expr builder (A.String, (SVar s)) in
        let f_val = expr builder e in
        let ind = get_field_ind (cname, f) in
        let f_ptr = L.build_struct_gep obj ind f builder in
        L.build_store f_val f_ptr builder
      | SNoexpr     -> L.const_int i32_t 0
      | SNullPtr t -> L.const_pointer_null (ltype_of_typ t)
      | SVar s       -> L.build_load (lookup s) s builder
      | SAssign (s, e) -> let e' = expr builder e in
                          ignore(L.build_store e' (lookup s) builder); e'
      | SDecAssn (t, s, e) -> 
        let e' = expr builder e in
        let var = L.build_alloca (ltype_of_typ t) s builder in
            ignore (L.build_store e' var builder);
        StringHash.add tbl s var; e'
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
      (match op with 
        A.Add     -> expr builder (A.String, SStrLit((print_sstring e1) ^ (print_sstring e2)))
      | _ -> 
        let load_str e =
          let e' = expr builder e in
          let e_ptr = L.build_pointercast e' (L.pointer_type string_t) "strPtr" builder in
          L.build_load e_ptr "strptrld" builder in
        let s1 = load_str e1
        and s2 = load_str e2 in
          (match op with
        | A.Equal   -> L.build_icmp L.Icmp.Eq
        | A.Neq     -> L.build_icmp L.Icmp.Ne
        | A.Less    -> L.build_icmp L.Icmp.Slt
        | A.Leq     -> L.build_icmp L.Icmp.Sle
        | A.Greater -> L.build_icmp L.Icmp.Sgt
        | A.Geq     -> L.build_icmp L.Icmp.Sge
        | _ -> raise (Failure "internal error: cannot perform this operation on string")
        ) s1 s2 "strcmp" builder
      )

      (* object Null equality *)
      | SBinop((A.Object(_),_ ) as e1, op, _) -> 
        let obj = expr builder e1 in
        (match op with 
          A.Equal -> L.build_is_null
        | A.Neq -> L.build_is_not_null
        | _ -> raise (Failure "internal error: cannot perform this operation on object"))
        obj "objcmp" builder

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
      | SCall ("indexOf", [e1;e2]) ->
      L.build_call stringindexof_func [| (expr builder e1) ; (expr builder e2) |] "indexOf" builder
      | SCall ("len", [e]) ->
      L.build_call stringlen_func [| (expr builder e) |] "len" builder
      | SCall ("concat", [e1;e2]) ->
      L.build_call stringconcat_func [| (expr builder e1) ; (expr builder e2) |] "concat" builder
      
      | SCall ("to_string", [e]) ->
        let e' = expr builder e in
        let p_e = L.build_alloca (L.type_of e') "to_string" builder in
        ignore(L.build_store e' p_e builder);
        let v_e = L.build_bitcast p_e (string_t) "cast" builder in
        L.build_call to_string [| (v_e) |] "to_string" builder
      
      (* array length function *)
      | SCall ("length", [e]) ->
        let (ty,_) = e in
        (match ty with
          A.Arr(_,l) -> L.const_int i32_t l
        | _ -> raise (Failure "function length cannot be called on non array type"))

      | SCall (f, args) ->
         let (fdef, fdecl) = 
          try StringMap.find f function_decls
          with Not_found -> raise (Failure ("SCALL not found " ^ f))
         in
	 let llargs = List.rev (List.map (expr builder) (List.rev args)) in
	 let result = (match fdecl.styp with 
                        A.Void -> ""
                      | _ -> f ^ "_result") in
         L.build_call fdef (Array.of_list llargs) result builder
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
      | SFor (e1, e2, e3, body) -> let e1' = SExpr e1
      in stmt builder
	    ( SBlock [e1' ; SWhile (e2, SBlock [body ; SExpr e3]) ] )
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