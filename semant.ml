(* Semantic checking for the MicroC compiler *)

open Ast
open Sast

module StringMap = Map.Make(String);;

module HashtblString =
   struct 
    type t = string
    let equal = ( = )
    let hash = Hashtbl.hash
   end;;

module StringHash = Hashtbl.Make(HashtblString);;

(* Semantic checking of the AST. Returns an SAST if successful,
   throws an exception if something is wrong.

   Check each global variable, then check each function *)

let check (statements, classes, functions) =

  (* Verify a list of bindings has no void types or duplicate names *)
  let check_binds (kind : string) (binds : bind list) =
    List.iter (function
	      (Void, b) -> raise (Failure ("illegal void " ^ kind ^ " " ^ b))
      | _ -> ()) binds;
    let rec dups = function
        [] -> ()
      |	((_,n1) :: (_,n2) :: _) when n1 = n2 ->
	  raise (Failure ("duplicate " ^ kind ^ " " ^ n1))
      | _ :: t -> dups t
    in dups (List.sort (fun (_,a) (_,b) -> compare a b) binds)
  in

  let check_bind tbl (t, n) =
    if t = Void then raise (Failure ("illegal void " ^ n)) else
    if (StringHash.mem tbl n) then raise (Failure ("duplicate " ^ n)) else 
      StringHash.add tbl n t; tbl
  in

  (**** Check global variables ****)

  (* check_binds "global" globals; *)

  (**** Check classes ****)

  (* Add class name to symbol table *)
  let add_class map cd =
    let dup_err = "duplicate class " ^ cd.cname in
    let n = cd.cname in
    match cd with
      _ when StringMap.mem n map -> raise (Failure dup_err)
    | _ -> StringMap.add n cd map
  in

  (* Collect all class names into one symbol table *)
  let class_decls = List.fold_left add_class StringMap.empty classes
  in

  (* Return a function from our symbol table *)
  let find_class s = 
    try StringMap.find s class_decls
    with Not_found -> raise (Failure ("unrecognized class " ^ s))
  in

  let check_class cls =
    (* Make sure no fields are void or duplicates *)
    ignore (check_binds "field" cls.fields);
    { scname = cls.cname;
      sfields = cls.fields }
  in 

  (* find the field bind in class *)
  let find_field (cname, field) =
    let cd = find_class cname in
    let add_field m (t,n) = StringMap.add n (t,n) m in
    let f_names = List.fold_left add_field StringMap.empty cd.fields in
    try StringMap.find field f_names
    with Not_found -> 
      raise (Failure ("unrecognized field " ^ field ^ " in class " ^ cname))
  in

  (**** Check functions ****)

  (* Collect function declarations for built-in functions: no bodies *)
  let built_in_print_decls = 
    let add_bind map name = StringMap.add name {
      typ = Void;
      fname = name; 
      formals = [(Any, "x")];
      locals = []; body = [] } map
    in List.fold_left add_bind StringMap.empty [ "print" ]
  in

  (* Array print support *)
  (* let built_in_print_decls = 
    StringMap.add "to_string" {
      typ = String;
      fname = "to_string"; 
      formals = [(Any, "x")];
      locals = []; 
      body = [] } built_in_print_decls
  in *)

  let built_in_decls = 
    let add_str_func map (name, ty) = StringMap.add name {
      typ = String;
      fname = name; 
      formals = [(ty, "x")];
      locals = []; body = [] } map
    in List.fold_left add_str_func built_in_print_decls [ ("reverse", String);
                                ("upper", String);
                                ("lower", String) ]
  in

  let built_in_decls =
    StringMap.add "substring" {
      typ = String;
      fname = "substring";
      formals = [(String, "str"); (Int, "from"); (Int, "to")];
      locals = [];
      body = [] } built_in_decls
   in

   let built_in_decls =
    StringMap.add "concat" {
      typ = String;
      fname = "concat";
      formals = [(String, "str1"); (String, "str2")];
      locals = [];
      body = [] } built_in_decls
   in

   let built_in_decls =
    StringMap.add "indexOf" {
      typ = Int;
      fname = "indexOf";
      formals = [(String, "str"); (String, "find")];
      locals = [];
      body = [] } built_in_decls
   in

   let built_in_decls =
    StringMap.add "len" {
      typ = Int;
      fname = "len";
      formals = [(String, "str")];
      locals = [];
      body = [] } built_in_decls
   in

   let built_in_decls =
    StringMap.add "length" {
      typ = Int;
      fname = "len";
      formals = [(Any, "arr")];
      locals = [];
      body = [] } built_in_decls
   in

  (* declare main function with all statements *)
  let main_decl = 
    {
      typ = Int;
      fname = "main";
      formals = [];
      locals = [];
      body = List.rev statements }
    in
  let functions = main_decl :: functions in

  (* Add function name to symbol table *)
  let add_func map fd = 
    let built_in_err = "function " ^ fd.fname ^ " may not be defined"
    and dup_err = "duplicate function " ^ fd.fname
    and make_err er = raise (Failure er)
    and n = fd.fname (* Name of the function *)
    in match fd with (* No duplicate functions or redefinitions of built-ins *)
         _ when StringMap.mem n built_in_decls -> make_err built_in_err
       | _ when StringMap.mem n map -> make_err dup_err  
       | _ ->  StringMap.add n fd map 
  in

  let form_constructor_body (cname, field_lst) =
    let field_args = List.map (fun (_,n) -> (n,Var(n))) field_lst in
    let return_body = [ Return (Var("obj")) ] in
    let constructor = Expr (DecAssn(Object(cname), "obj", Construct(cname, field_args))) in
    let body_rev = constructor :: return_body in
    body_rev
  in

  let form_constructor cdecl =
    let cn = cdecl.cname in
    { typ = Object(cn);
      fname = cn;
      formals = cdecl.fields;
      locals = [];
      body = form_constructor_body (cn, cdecl.fields) }
  in

  let all_constructors = List.map (fun cd -> form_constructor cd) classes in

  let all_functions = List.fold_left (fun l c -> c::l) functions all_constructors in

  (* Collect all function names into one symbol table *)
  let function_decls = List.fold_left add_func built_in_decls all_functions
  in
  
  (* Return a function from our symbol table *)
  let find_func s = 
    try StringMap.find s function_decls
    with Not_found -> raise (Failure ("unrecognized function " ^ s))
  in

  let _ = find_func "main" in (* Ensure "main" is defined *)

  let check_function func =
    (* Make sure no formals or locals are void or duplicates *)
    check_binds "formal" func.formals;
    check_binds "local" func.locals;
    let tbl = StringHash.create 10 in
    let formal_tbl = StringHash.create 5 in

    let check_assign lvaluet rvaluet err =
      if lvaluet = Any then rvaluet else
        if lvaluet = rvaluet then lvaluet else
          (match lvaluet with
            Object(_) -> if rvaluet = Null then lvaluet else raise (Failure err)
          | _ -> raise (Failure err))
    in

    (* Build local symbol table of variables for this function *)
    let _ = List.fold_left check_bind
      formal_tbl (func.formals @ func.locals )
    in

    (* Return a variable from our local symbol table *)
    let type_of_identifier s =
      try StringHash.find tbl s
      with Not_found -> 
        try StringHash.find formal_tbl s
        with Not_found -> raise (Failure ("undeclared identifier " ^ s))
    in

    (* check if of array type, return element type *)
    let is_arr_ty (v, ty) = match ty with 
        Arr(_ as t) -> 
          if t = Void then raise (Failure ("void type array " ^ v ^ " is not allowed")) 
          else t
      | _ -> raise (Failure ("cannot access an element in variable " ^ v ^ " of type " ^ string_of_typ ty))
    in

    (* Return a semantically-checked expression, i.e., with a type *)
    let rec expr e = 
      let check_assign_null e lt err =
        let (rt, e') = expr e in
        let ty = check_assign lt rt err in
        if e' = (SNullPtr Null) then (ty, (SNullPtr ty)) else (ty, e')
      in
      
      (match e with
        IntLit  l -> (Int, SIntLit l)
      | DoubleLit l -> (Double, SDoubleLit l)
      | BoolLit l  -> (Bool, SBoolLit l)
      | StrLit s -> (String, SStrLit s)
      | Noexpr     -> (Void, SNoexpr)
      | NullPtr t -> (t, SNullPtr t)
      | Var s       -> (type_of_identifier s, SVar s)
      | Assign(var, e) as ex -> 
          let lt = type_of_identifier var in
          let (rt, _) = expr e in
          let err = "illegal assignment " ^ string_of_typ lt ^ " = " ^ 
            string_of_typ rt ^ " in " ^ string_of_expr ex in
          let (ty, e') = check_assign_null e lt err
          in (ty, SAssign(var, (ty, e')))

      | DecAssn(ty, var, e) as decassgn ->
        ignore (check_bind tbl (ty, var));
        let (rt, _) = expr e in
        let err = "illegal assignment " ^ string_of_typ ty ^ " = " ^ 
            string_of_typ rt ^ " in " ^ string_of_expr decassgn in
        let (ty, e') = check_assign_null e ty err
        in (ty, SDecAssn(ty, var, (ty, e')))

      | Unop(op, e) as ex -> 
          let (t, e') = expr e in
          let ty = match op with
            Neg when t = Int || t = Double -> t
          | Not when t = Bool -> Bool
          | _ -> raise (Failure ("illegal unary operator " ^ 
                                 string_of_uop op ^ string_of_typ t ^
                                 " in " ^ string_of_expr ex))
          in (ty, SUnop(op, (t, e')))
      | Binop(e1, op, e2) as e -> 
          let (t1, e1') = expr e1 
          and (t2, e2') = expr e2 in
          (* All binary operators require operands of the same type *)
          let same = t1 = t2 in
          (* Determine expression type based on operator and operand types *)
          let ty = match op with
            Add | Sub | Mult | Div when same && t1 = Int   -> Int
          | Add | Sub | Mult | Div when same && t1 = Double -> Double
          | Equal | Neq            when same               -> Bool
          (* special case for null *)
          | Equal | Neq when (t2 = Null) -> Bool
          | Less | Leq | Greater | Geq
                     when same && (t1 = Int || t1 = Double || t1 = String) -> Bool
          | And | Or when same && t1 = Bool -> Bool
          | Add when same && t1 = String -> String
          | _ -> raise (
	      Failure ("illegal binary operator " ^
                       string_of_typ t1 ^ " " ^ string_of_op op ^ " " ^
                       string_of_typ t2 ^ " in " ^ string_of_expr e))
          in (ty, SBinop((t1, e1'), op, (t2, e2')))
      | Call(fname, args) as call -> 
          let fd = find_func fname in
          let param_length = List.length fd.formals in
          if List.length args != param_length then
            raise (Failure ("expecting " ^ string_of_int param_length ^ 
                            " arguments in " ^ string_of_expr call))
          (* Ignore types for array functions *)


          else let check_call (ft, _) e = 
            let (et, _) = expr e in 
            let err = "illegal argument found " ^ string_of_typ et ^
              " expected " ^ string_of_typ ft ^ " in " ^ string_of_expr e
            in (check_assign_null e ft err)
          in 
          let args' = List.map2 check_call fd.formals args
          in (fd.typ, SCall(fname, args'))

      | ObjAccess(obj, f) as objaccess ->
        let cname = 
          let obj_ty = type_of_identifier obj in
          (match obj_ty with
            Object(cn) -> cn
          | _ -> raise (Failure (obj ^ " is not a class object in " ^ string_of_expr objaccess))) 
        in
        let (field_ty, _) = find_field (cname, f)
        in (field_ty, SObjAccess(obj, cname, f))
      | ObjAssign(obj, f, e) as objassign -> 
        let cname = 
          let obj_ty = type_of_identifier obj in
          (match obj_ty with
            Object(cn) -> cn
          | _ -> raise (Failure (obj ^ " is not a class object in " ^ string_of_expr objassign))) 
        in
        let (field_ty, _) = find_field (cname, f) in
        let (rt, _) = expr e in
        let err = "illegal assignment " ^ string_of_typ field_ty ^ " = " ^ 
            string_of_typ rt ^ " in " ^ string_of_expr objassign in
        let (ty, e') = check_assign_null e field_ty err 
        in (ty, SObjAssign(obj, cname, f, (ty,e')))
      | ArrayLit(el) as arraylit ->
        (* check if types of expr are consistent *)
          let ty_inconsistent_err = "inconsistent types in array " ^ string_of_expr arraylit in
          let fst_e = List.hd el in
          let (fst_ty, _) = expr fst_e in
          let (arr_ty_len, arr_ty_e) = List.fold_left (fun (t, l) e -> 
            let (et, e') = expr e in
            if et = fst_ty then (t+1, (et, e')::l) else (t, (et, e')::l)) (0,[]) el
          in if arr_ty_len != List.length el 
            then raise (Failure ty_inconsistent_err)
          (* determine arr type *)
          else let arr_ty = Arr(fst_ty)
        in (arr_ty, SArrayLit(arr_ty_e))
      | Construct(cname, args) ->
        let args' = List.map (fun (s,e) -> (s, (expr e))) args
        in (Object(cname), SConstruct(cname, args'))
      | ArrayAccess(v, e) as arrayacess ->
          (* check if type of e is an int *)
          let (t, e') = expr e in
          if t != Int then raise (Failure (string_of_expr e ^ " is not of int type in " ^ string_of_expr arrayacess))
          else
          (* check if variable is array type *)
          let v_ty = type_of_identifier v in
          let e_ty = is_arr_ty (v, v_ty)
        in (e_ty, SArrayAccess(v, (t, e')))
      | ArrAssign(v, e1, e2) as arrassign ->
        (* check if type of e is an int *)
        let (t, e1') = expr e1 in
        if t != Int then raise (Failure (string_of_expr e1 ^ " is not of int type in " ^ string_of_expr arrassign))
        else
        (* check if variable is array type *)
        let v_ty = type_of_identifier v in
        let e_ty = is_arr_ty (v, v_ty) in
        let (rt, _) = expr e2 in
        let err = "illegal assignment " ^ string_of_typ e_ty ^ " = " ^ 
            string_of_typ rt ^ " in " ^ string_of_expr arrassign in
        let (ty, e2') = check_assign_null e2 e_ty err
        in (ty, SArrAssign(v, (t,e1'), (ty,e2')))
      )
    in

    let check_bool_expr e = 
      let (t', e') = expr e
      and err = "expected Boolean expression in " ^ string_of_expr e
      in if t' != Bool then raise (Failure err) else (t', e') 
    in

    (* Return a semantically-checked statement i.e. containing sexprs *)
    let rec check_stmt = function
        Expr e -> SExpr (expr e)
      | If(p, b1, b2) -> SIf(check_bool_expr p, check_stmt b1, check_stmt b2)
      | For(e1, e2, e3, st) ->
        let e1' = expr e1 in
	      SFor(e1', check_bool_expr e2, expr e3, check_stmt st)
      | While(p, s) -> SWhile(check_bool_expr p, check_stmt s)
      | Return e -> let (t, e') = expr e in
        if "main" = func.fname then
        raise (Failure("expected no return statement in outer body")) else
        if t = func.typ then SReturn (t, e') else 
        raise (
	  Failure ("return gives " ^ string_of_typ t ^ " expected " ^
		   string_of_typ func.typ ^ " in " ^ string_of_expr e))
	    
	    (* A block is correct if each statement is correct and nothing
	       follows any Return statement.  Nested blocks are flattened. *)
      | Block sl -> 
          let rec check_stmt_list = function
            [Return _ as s] -> [check_stmt s]
            | Return _ :: _   -> raise (Failure "nothing may follow a return")
            | Block sl :: ss  -> check_stmt_list (sl @ ss) (* Flatten blocks *)
            | s :: ss         -> let c = check_stmt s in
                                  c :: check_stmt_list ss
            | []              -> []
          in SBlock(check_stmt_list sl)

    in (* body of check_function *)
    { styp = func.typ;
      sfname = func.fname;
      sformals = func.formals;
      slocals  = func.locals;
      sbody = match check_stmt (Block func.body) with
	SBlock(sl) -> sl
      | _ -> raise (Failure ("internal error: block didn't become a block?"))
    }
  in (List.map check_class classes, List.map check_function all_functions)
