(* Semantically-checked Abstract Syntax Tree and functions for printing it *)

open Ast

type sexpr = typ * sx
and sx =
    SIntLit of int
  | SDoubleLit of string
  | SBoolLit of bool
  | SStrLit of string
  | SVar of string
  | SBinop of sexpr * op * sexpr
  | SUnop of uop * sexpr
  | SAssign of string * sexpr
  | SCall of string * sexpr list
  | SArrayAccess of string * sexpr
  | SArrayLit of sexpr list
  | SArrAssign of string * sexpr * sexpr
  | SObjAccess of string * string * string
  | SObjAssign of string * string * string * sexpr
  (* cname * (field_name * field_value) list *)
  | SConstruct of string * (string * sexpr) list
  | SDecAssn of typ * string * sexpr
  | SNoexpr

type sstmt =
    SBlock of sstmt list
  | SExpr of sexpr
  | SReturn of sexpr
  | SIf of sexpr * sstmt * sstmt
  | SFor of sexpr * sexpr * sexpr * sstmt
  | SWhile of sexpr * sstmt

type sfunc_decl = {
    styp : typ;
    sfname : string;
    sformals : bind list;
    slocals : bind list;
    sbody : sstmt list;
  }

type sclass_decl = {
  scname : string;
  sfields : bind list;
}

type sprogram = sclass_decl list * sfunc_decl list

(* Pretty-printing functions *)

let rec string_of_sexpr (t, e) =
  "(" ^ string_of_typ t ^ " : " ^ (match e with
    SIntLit(l) -> string_of_int l
  | SBoolLit(true) -> "true"
  | SBoolLit(false) -> "false"
  | SDoubleLit(l) -> l
  | SStrLit(s) -> "\"" ^ s ^ "\""
  | SVar(s) -> s
  | SBinop(e1, o, e2) ->
      string_of_sexpr e1 ^ " " ^ string_of_op o ^ " " ^ string_of_sexpr e2
  | SUnop(o, e) -> string_of_uop o ^ string_of_sexpr e
  | SAssign(v, e) -> v ^ " = " ^ string_of_sexpr e
  | SCall(f, el) ->
      f ^ "(" ^ String.concat ", " (List.map string_of_sexpr el) ^ ")"
  | SArrayAccess(s, e) ->
      s ^ "[" ^ string_of_sexpr e ^ "]"
  | SArrayLit(e) -> "[" ^ String.concat "," (List.map string_of_sexpr (List.rev e)) ^ "]"
  | SArrAssign(s, e1, e2) -> s ^ "[" ^ string_of_sexpr e1 ^ "] = " ^ string_of_sexpr e2
  | SObjAccess(s1, c, s2) -> s1 ^ "(class " ^ c ^ ")." ^ s2
  | SObjAssign(s1, c, s2, e) -> s1 ^ "(class " ^ c ^ ")." ^ s2 ^ " = " ^ string_of_sexpr e
  | SConstruct(s, _) -> "Constructor " ^ s 
  | SDecAssn(t, s, e) -> string_of_typ t ^ " " ^ s ^ " = " ^ string_of_sexpr e
  | SNoexpr -> ""
				  ) ^ ")"

let print_sstring (_, e) = match e with
    SStrLit(s) -> s
  | _ -> raise (Failure "error: only string type allowed")

let compare_sstring ((_, e1),(_,e2)) =
    if SStrLit(e1) = SStrLit(e2) then true
    else false

let rec string_of_sstmt = function
    SBlock(stmts) ->
      "{\n" ^ String.concat "" (List.map string_of_sstmt stmts) ^ "}\n"
  | SExpr(expr) -> string_of_sexpr expr ^ ";\n";
  | SReturn(expr) -> "return " ^ string_of_sexpr expr ^ ";\n";
  | SIf(e, s, SBlock([])) ->
      "if (" ^ string_of_sexpr e ^ ")\n" ^ string_of_sstmt s
  | SIf(e, s1, s2) ->  "if (" ^ string_of_sexpr e ^ ")\n" ^
      string_of_sstmt s1 ^ "else\n" ^ string_of_sstmt s2
  | SFor(e1, e2, e3, s) ->
      "for (" ^ string_of_sexpr e1  ^ " ; " ^ string_of_sexpr e2 ^ " ; " ^
      string_of_sexpr e3  ^ ") " ^ string_of_sstmt s
  | SWhile(e, s) -> "while (" ^ string_of_sexpr e ^ ") " ^ string_of_sstmt s

let string_of_sfdecl fdecl =
  string_of_typ fdecl.styp ^ " " ^
  fdecl.sfname ^ "(" ^ String.concat ", " (List.map snd fdecl.sformals) ^
  ")\n{\n" ^
  String.concat "" (List.map string_of_vdecl fdecl.slocals) ^
  String.concat "" (List.map string_of_sstmt fdecl.sbody) ^
  "}\n"

let string_of_scdecl cdecl =
  "class " ^ cdecl.scname ^ " {\n" ^ 
  String.concat "" (List.map string_of_vdecl cdecl.sfields) ^
  "}\n"

let string_of_sprogram (classes, funcs) =
  (* String.concat "" (List.map string_of_vdecl vars) ^ "\n" ^ *)
  String.concat "\n" (List.map string_of_scdecl classes) ^ "\n" ^
  String.concat "\n" (List.map string_of_sfdecl funcs)
