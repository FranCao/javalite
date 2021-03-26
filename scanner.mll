(* Template taken from MicroC *)

{ open Parser }

let digit = ['0' - '9']
let digits = digit+

rule token = parse
  [' ' '\t' '\r' '\n'] { token lexbuf } (* Whitespace *)
| "/*"     { comment lexbuf }           (* Multi-line Comments *)
| "//"     { singcomment lexbuf }       (* Single-line Comment *)
| '('      { LPAREN }
| ')'      { RPAREN }
| '{'      { LBRACE }
| '}'      { RBRACE }
| '['      { LBRACK }
| ']'      { RBRACK }
| ';'      { SEMI }
| ','      { COMMA }
| '+'      { PLUS }
| '-'      { MINUS }
| '*'      { TIMES }
| '/'      { DIVIDE }
| '='      { ASSIGN }
| "=="     { EQ }
| "!="     { NEQ }
| '<'      { LT }
| "<="     { LEQ }
| ">"      { GT }
| ">="     { GEQ }
| "&&"     { AND }
| "||"     { OR }
| "!"      { NOT }
| "if"     { IF }
| "else"   { ELSE }
| "for"    { FOR }
| "while"  { WHILE }
| "return" { RETURN }
| "int"    { INT }
| "bool"   { BOOL }
| "double"  { DOUBLE }
| "void"   { VOID }
| "string" { STRING }
| "true"   { BOOL_LIT(true)  }
| "false"  { BOOL_LIT(false) }
| "class"  { CLASS }
| "this"   { THIS }
| "constructor" { CONSTRUCTOR }
| "." {DOT}
| digits as lxm { INT_LIT(int_of_string lxm) }
| digits '.'  digit* ( ['e' 'E'] ['+' '-']? digits )? as lxm { DOUBLE_LIT(lxm) }
| ['a'-'z' 'A'-'Z']['a'-'z' 'A'-'Z' '0'-'9' '_']*     as lxm { VARIABLE(lxm) }
| '"'       { STRING_LIT (stringbuf (Buffer.create 256) lexbuf) }
| eof { EOF }
| _ as char { raise (Failure("illegal character " ^ Char.escaped char)) }

and comment = parse
  "*/" { token lexbuf }
| _    { comment lexbuf }

and singcomment = parse
  "\n" { token lexbuf }
| _    { singcomment lexbuf }

and stringbuf buf = parse
  | '"'    { Buffer.contents buf }
  | _ as c { Buffer.add_char buf c; stringbuf buf lexbuf }
