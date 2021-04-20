type token =
  | LPAREN
  | RPAREN
  | LBRACE
  | RBRACE
  | LBRACK
  | RBRACK
  | SEMI
  | COMMA
  | ASSIGN
  | NOT
  | EQ
  | NEQ
  | LT
  | LEQ
  | GT
  | GEQ
  | AND
  | OR
  | PLUS
  | MINUS
  | TIMES
  | DIVIDE
  | RETURN
  | IF
  | ELSE
  | FOR
  | WHILE
  | INT
  | BOOL
  | DOUBLE
  | VOID
  | STRING
  | ARRAY
  | CLASS
  | DOT
  | INT_LIT of (int)
  | BOOL_LIT of (bool)
  | VARIABLE of (string)
  | DOUBLE_LIT of (string)
  | STRING_LIT of (string)
  | EOF

val program :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Ast.program
