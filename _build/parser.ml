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
  | INT_LIT of (int)
  | BOOL_LIT of (bool)
  | VARIABLE of (string)
  | DOUBLE_LIT of (string)
  | STRING_LIT of (string)
  | EOF

open Parsing;;
let _ = parse_error;;
# 2 "parser.mly"
open Ast
# 47 "parser.ml"
let yytransl_const = [|
  257 (* LPAREN *);
  258 (* RPAREN *);
  259 (* LBRACE *);
  260 (* RBRACE *);
  261 (* LBRACK *);
  262 (* RBRACK *);
  263 (* SEMI *);
  264 (* COMMA *);
  265 (* ASSIGN *);
  266 (* NOT *);
  267 (* EQ *);
  268 (* NEQ *);
  269 (* LT *);
  270 (* LEQ *);
  271 (* GT *);
  272 (* GEQ *);
  273 (* AND *);
  274 (* OR *);
  275 (* PLUS *);
  276 (* MINUS *);
  277 (* TIMES *);
  278 (* DIVIDE *);
  279 (* RETURN *);
  280 (* IF *);
  281 (* ELSE *);
  282 (* FOR *);
  283 (* WHILE *);
  284 (* INT *);
  285 (* BOOL *);
  286 (* DOUBLE *);
  287 (* VOID *);
  288 (* STRING *);
  289 (* ARRAY *);
    0 (* EOF *);
    0|]

let yytransl_block = [|
  290 (* INT_LIT *);
  291 (* BOOL_LIT *);
  292 (* VARIABLE *);
  293 (* DOUBLE_LIT *);
  294 (* STRING_LIT *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\002\000\004\000\006\000\006\000\009\000\
\009\000\005\000\005\000\005\000\005\000\005\000\005\000\007\000\
\007\000\003\000\008\000\008\000\010\000\010\000\010\000\010\000\
\010\000\010\000\010\000\012\000\012\000\011\000\011\000\011\000\
\011\000\011\000\011\000\011\000\011\000\011\000\011\000\011\000\
\011\000\011\000\011\000\011\000\011\000\011\000\011\000\011\000\
\011\000\011\000\011\000\011\000\011\000\011\000\013\000\013\000\
\014\000\014\000\000\000"

let yylen = "\002\000\
\002\000\000\000\002\000\002\000\009\000\000\000\001\000\002\000\
\004\000\001\000\001\000\001\000\001\000\001\000\002\000\000\000\
\002\000\003\000\000\000\002\000\002\000\003\000\003\000\005\000\
\007\000\009\000\005\000\000\000\001\000\001\000\001\000\001\000\
\001\000\001\000\003\000\003\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\002\000\002\000\
\003\000\004\000\003\000\004\000\003\000\006\000\000\000\001\000\
\001\000\003\000\002\000"

let yydefred = "\000\000\
\002\000\000\000\059\000\000\000\010\000\011\000\012\000\013\000\
\014\000\001\000\003\000\004\000\000\000\015\000\000\000\000\000\
\018\000\000\000\000\000\000\000\008\000\000\000\000\000\016\000\
\000\000\000\000\009\000\017\000\000\000\000\000\000\000\000\000\
\019\000\005\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\030\000\032\000\000\000\031\000\033\000\020\000\000\000\
\000\000\000\000\000\000\000\000\048\000\047\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\021\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\051\000\023\000\053\000\000\000\022\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\037\000\038\000\000\000\000\000\000\000\000\000\050\000\
\000\000\000\000\000\000\027\000\000\000\000\000\000\000\000\000\
\025\000\000\000\000\000\026\000"

let yydgoto = "\002\000\
\003\000\004\000\011\000\012\000\013\000\019\000\026\000\030\000\
\020\000\047\000\048\000\056\000\084\000\052\000"

let yysindex = "\023\000\
\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\012\255\000\000\093\255\149\255\
\000\000\023\255\029\255\036\255\000\000\104\255\149\255\000\000\
\075\255\149\255\000\000\000\000\083\255\048\255\110\255\209\255\
\000\000\000\000\209\255\209\255\209\255\209\255\092\255\125\255\
\134\255\000\000\000\000\045\255\000\000\000\000\000\000\006\000\
\053\000\086\255\250\000\072\255\000\000\000\000\250\000\111\255\
\209\255\209\255\209\255\209\255\209\255\209\255\000\000\209\255\
\209\255\209\255\209\255\209\255\209\255\209\255\209\255\209\255\
\209\255\209\255\209\255\000\000\000\000\000\000\209\255\000\000\
\074\000\133\255\095\000\139\255\135\255\001\255\250\000\117\255\
\117\255\245\254\245\254\245\254\245\254\018\001\006\001\080\255\
\080\255\000\000\000\000\250\000\201\255\209\255\201\255\000\000\
\136\255\121\255\238\000\000\000\209\255\201\255\209\255\250\000\
\000\000\140\255\201\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\150\255\
\000\000\000\000\000\000\154\255\000\000\000\000\000\000\000\000\
\000\000\124\255\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\157\255\000\000\000\000\
\000\000\000\000\000\000\246\255\000\000\000\000\000\000\000\000\
\000\000\000\000\167\255\000\000\000\000\000\000\090\255\000\000\
\000\000\157\255\000\000\155\255\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\166\255\000\000\058\255\222\000\
\230\000\154\000\171\000\188\000\205\000\097\255\055\255\116\000\
\135\000\000\000\000\000\168\255\000\000\000\000\000\000\000\000\
\032\000\162\255\000\000\000\000\000\000\000\000\169\255\147\255\
\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\157\000\000\000\072\000\000\000\000\000\151\000\
\000\000\222\255\224\255\200\255\000\000\127\000"

let yytablesize = 552
let yytable = "\049\000\
\010\000\082\000\051\000\053\000\054\000\055\000\105\000\072\000\
\073\000\074\000\075\000\064\000\065\000\066\000\067\000\068\000\
\069\000\070\000\071\000\072\000\073\000\074\000\075\000\001\000\
\081\000\055\000\083\000\051\000\086\000\087\000\022\000\088\000\
\089\000\090\000\091\000\092\000\093\000\094\000\095\000\096\000\
\097\000\098\000\099\000\023\000\014\000\060\000\100\000\015\000\
\032\000\061\000\033\000\034\000\035\000\062\000\114\000\014\000\
\046\000\036\000\021\000\049\000\046\000\046\000\046\000\049\000\
\049\000\049\000\106\000\037\000\108\000\107\000\038\000\039\000\
\046\000\040\000\041\000\113\000\112\000\078\000\055\000\079\000\
\116\000\042\000\043\000\044\000\045\000\046\000\032\000\018\000\
\033\000\077\000\035\000\029\000\057\000\016\000\025\000\036\000\
\029\000\029\000\045\000\017\000\074\000\075\000\045\000\045\000\
\045\000\037\000\024\000\014\000\038\000\039\000\027\000\040\000\
\041\000\045\000\045\000\014\000\017\000\080\000\031\000\042\000\
\043\000\044\000\045\000\046\000\019\000\058\000\019\000\019\000\
\019\000\066\000\067\000\068\000\069\000\019\000\059\000\072\000\
\073\000\074\000\075\000\102\000\104\000\115\000\079\000\019\000\
\109\000\110\000\019\000\019\000\054\000\019\000\019\000\006\000\
\054\000\054\000\054\000\007\000\055\000\019\000\019\000\019\000\
\019\000\019\000\024\000\028\000\024\000\024\000\024\000\056\000\
\057\000\058\000\028\000\024\000\057\000\058\000\057\000\058\000\
\005\000\006\000\007\000\008\000\009\000\024\000\028\000\050\000\
\024\000\024\000\085\000\024\000\024\000\000\000\000\000\000\000\
\000\000\000\000\000\000\024\000\024\000\024\000\024\000\024\000\
\000\000\032\000\000\000\033\000\000\000\035\000\000\000\000\000\
\000\000\032\000\036\000\000\000\000\000\035\000\000\000\000\000\
\000\000\000\000\036\000\000\000\037\000\000\000\000\000\038\000\
\039\000\000\000\040\000\041\000\037\000\000\000\000\000\000\000\
\000\000\000\000\042\000\043\000\044\000\045\000\046\000\000\000\
\000\000\000\000\042\000\043\000\044\000\045\000\046\000\034\000\
\000\000\000\000\000\000\034\000\034\000\034\000\000\000\000\000\
\034\000\034\000\034\000\034\000\034\000\034\000\034\000\034\000\
\034\000\034\000\034\000\034\000\063\000\000\000\000\000\000\000\
\064\000\065\000\066\000\067\000\068\000\069\000\070\000\071\000\
\072\000\073\000\074\000\075\000\005\000\006\000\007\000\008\000\
\009\000\052\000\000\000\000\000\000\000\052\000\052\000\052\000\
\000\000\000\000\052\000\052\000\052\000\052\000\052\000\052\000\
\052\000\052\000\052\000\052\000\052\000\052\000\076\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\064\000\
\065\000\066\000\067\000\068\000\069\000\070\000\071\000\072\000\
\073\000\074\000\075\000\101\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\064\000\065\000\066\000\067\000\
\068\000\069\000\070\000\071\000\072\000\073\000\074\000\075\000\
\103\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\064\000\065\000\066\000\067\000\068\000\069\000\070\000\
\071\000\072\000\073\000\074\000\075\000\035\000\000\000\000\000\
\000\000\035\000\035\000\035\000\000\000\000\000\035\000\035\000\
\035\000\035\000\035\000\035\000\035\000\035\000\035\000\035\000\
\036\000\000\000\000\000\000\000\036\000\036\000\036\000\000\000\
\000\000\036\000\036\000\036\000\036\000\036\000\036\000\036\000\
\036\000\036\000\036\000\041\000\000\000\000\000\000\000\041\000\
\041\000\041\000\000\000\000\000\041\000\041\000\041\000\041\000\
\041\000\041\000\041\000\041\000\042\000\000\000\000\000\000\000\
\042\000\042\000\042\000\000\000\000\000\042\000\042\000\042\000\
\042\000\042\000\042\000\042\000\042\000\043\000\000\000\000\000\
\000\000\043\000\043\000\043\000\000\000\000\000\043\000\043\000\
\043\000\043\000\043\000\043\000\043\000\043\000\044\000\000\000\
\000\000\000\000\044\000\044\000\044\000\000\000\000\000\044\000\
\044\000\044\000\044\000\044\000\044\000\044\000\044\000\039\000\
\000\000\000\000\000\000\039\000\039\000\039\000\000\000\040\000\
\039\000\039\000\000\000\040\000\040\000\040\000\039\000\039\000\
\040\000\040\000\000\000\000\000\111\000\000\000\040\000\040\000\
\064\000\065\000\066\000\067\000\068\000\069\000\070\000\071\000\
\072\000\073\000\074\000\075\000\064\000\065\000\066\000\067\000\
\068\000\069\000\070\000\071\000\072\000\073\000\074\000\075\000\
\064\000\065\000\066\000\067\000\068\000\069\000\070\000\000\000\
\072\000\073\000\074\000\075\000\064\000\065\000\066\000\067\000\
\068\000\069\000\000\000\000\000\072\000\073\000\074\000\075\000"

let yycheck = "\032\000\
\000\000\058\000\035\000\036\000\037\000\038\000\006\001\019\001\
\020\001\021\001\022\001\011\001\012\001\013\001\014\001\015\001\
\016\001\017\001\018\001\019\001\020\001\021\001\022\001\001\000\
\057\000\058\000\059\000\060\000\061\000\062\000\002\001\064\000\
\065\000\066\000\067\000\068\000\069\000\070\000\071\000\072\000\
\073\000\074\000\075\000\008\001\033\001\001\001\079\000\036\001\
\001\001\005\001\003\001\004\001\005\001\009\001\111\000\033\001\
\002\001\010\001\036\001\002\001\006\001\007\001\008\001\006\001\
\007\001\008\001\101\000\020\001\103\000\102\000\023\001\024\001\
\018\001\026\001\027\001\110\000\109\000\006\001\111\000\008\001\
\115\000\034\001\035\001\036\001\037\001\038\001\001\001\016\000\
\003\001\004\001\005\001\002\001\001\001\001\001\023\000\010\001\
\007\001\026\000\002\001\007\001\021\001\022\001\006\001\007\001\
\008\001\020\001\003\001\033\001\023\001\024\001\036\001\026\001\
\027\001\017\001\018\001\033\001\007\001\007\001\036\001\034\001\
\035\001\036\001\037\001\038\001\001\001\001\001\003\001\004\001\
\005\001\013\001\014\001\015\001\016\001\010\001\001\001\019\001\
\020\001\021\001\022\001\007\001\002\001\002\001\008\001\020\001\
\009\001\025\001\023\001\024\001\002\001\026\001\027\001\002\001\
\006\001\007\001\008\001\002\001\002\001\034\001\035\001\036\001\
\037\001\038\001\001\001\007\001\003\001\004\001\005\001\002\001\
\002\001\002\001\002\001\010\001\006\001\006\001\008\001\008\001\
\028\001\029\001\030\001\031\001\032\001\020\001\026\000\033\000\
\023\001\024\001\060\000\026\001\027\001\255\255\255\255\255\255\
\255\255\255\255\255\255\034\001\035\001\036\001\037\001\038\001\
\255\255\001\001\255\255\003\001\255\255\005\001\255\255\255\255\
\255\255\001\001\010\001\255\255\255\255\005\001\255\255\255\255\
\255\255\255\255\010\001\255\255\020\001\255\255\255\255\023\001\
\024\001\255\255\026\001\027\001\020\001\255\255\255\255\255\255\
\255\255\255\255\034\001\035\001\036\001\037\001\038\001\255\255\
\255\255\255\255\034\001\035\001\036\001\037\001\038\001\002\001\
\255\255\255\255\255\255\006\001\007\001\008\001\255\255\255\255\
\011\001\012\001\013\001\014\001\015\001\016\001\017\001\018\001\
\019\001\020\001\021\001\022\001\007\001\255\255\255\255\255\255\
\011\001\012\001\013\001\014\001\015\001\016\001\017\001\018\001\
\019\001\020\001\021\001\022\001\028\001\029\001\030\001\031\001\
\032\001\002\001\255\255\255\255\255\255\006\001\007\001\008\001\
\255\255\255\255\011\001\012\001\013\001\014\001\015\001\016\001\
\017\001\018\001\019\001\020\001\021\001\022\001\002\001\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\011\001\
\012\001\013\001\014\001\015\001\016\001\017\001\018\001\019\001\
\020\001\021\001\022\001\002\001\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\011\001\012\001\013\001\014\001\
\015\001\016\001\017\001\018\001\019\001\020\001\021\001\022\001\
\002\001\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\011\001\012\001\013\001\014\001\015\001\016\001\017\001\
\018\001\019\001\020\001\021\001\022\001\002\001\255\255\255\255\
\255\255\006\001\007\001\008\001\255\255\255\255\011\001\012\001\
\013\001\014\001\015\001\016\001\017\001\018\001\019\001\020\001\
\002\001\255\255\255\255\255\255\006\001\007\001\008\001\255\255\
\255\255\011\001\012\001\013\001\014\001\015\001\016\001\017\001\
\018\001\019\001\020\001\002\001\255\255\255\255\255\255\006\001\
\007\001\008\001\255\255\255\255\011\001\012\001\013\001\014\001\
\015\001\016\001\017\001\018\001\002\001\255\255\255\255\255\255\
\006\001\007\001\008\001\255\255\255\255\011\001\012\001\013\001\
\014\001\015\001\016\001\017\001\018\001\002\001\255\255\255\255\
\255\255\006\001\007\001\008\001\255\255\255\255\011\001\012\001\
\013\001\014\001\015\001\016\001\017\001\018\001\002\001\255\255\
\255\255\255\255\006\001\007\001\008\001\255\255\255\255\011\001\
\012\001\013\001\014\001\015\001\016\001\017\001\018\001\002\001\
\255\255\255\255\255\255\006\001\007\001\008\001\255\255\002\001\
\011\001\012\001\255\255\006\001\007\001\008\001\017\001\018\001\
\011\001\012\001\255\255\255\255\007\001\255\255\017\001\018\001\
\011\001\012\001\013\001\014\001\015\001\016\001\017\001\018\001\
\019\001\020\001\021\001\022\001\011\001\012\001\013\001\014\001\
\015\001\016\001\017\001\018\001\019\001\020\001\021\001\022\001\
\011\001\012\001\013\001\014\001\015\001\016\001\017\001\255\255\
\019\001\020\001\021\001\022\001\011\001\012\001\013\001\014\001\
\015\001\016\001\255\255\255\255\019\001\020\001\021\001\022\001"

let yynames_const = "\
  LPAREN\000\
  RPAREN\000\
  LBRACE\000\
  RBRACE\000\
  LBRACK\000\
  RBRACK\000\
  SEMI\000\
  COMMA\000\
  ASSIGN\000\
  NOT\000\
  EQ\000\
  NEQ\000\
  LT\000\
  LEQ\000\
  GT\000\
  GEQ\000\
  AND\000\
  OR\000\
  PLUS\000\
  MINUS\000\
  TIMES\000\
  DIVIDE\000\
  RETURN\000\
  IF\000\
  ELSE\000\
  FOR\000\
  WHILE\000\
  INT\000\
  BOOL\000\
  DOUBLE\000\
  VOID\000\
  STRING\000\
  ARRAY\000\
  EOF\000\
  "

let yynames_block = "\
  INT_LIT\000\
  BOOL_LIT\000\
  VARIABLE\000\
  DOUBLE_LIT\000\
  STRING_LIT\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    Obj.repr(
# 36 "parser.mly"
            ( _1 )
# 367 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    Obj.repr(
# 39 "parser.mly"
                 ( ([], [])               )
# 373 "parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'vdecl) in
    Obj.repr(
# 40 "parser.mly"
               ( ((_2 :: fst _1), snd _1) )
# 381 "parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fdecl) in
    Obj.repr(
# 41 "parser.mly"
               ( (fst _1, (_2 :: snd _1)) )
# 389 "parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 8 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 7 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 5 : 'formals_opt) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : 'vdecl_list) in
    let _8 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 57 "parser.mly"
     ( { typ = _1;
	 fname = _2;
	 formals = List.rev _4;
	 locals = List.rev _7;
	 body = List.rev _8 } )
# 404 "parser.ml"
               : 'fdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 64 "parser.mly"
                  ( [] )
# 410 "parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'formal_list) in
    Obj.repr(
# 65 "parser.mly"
                  ( _1 )
# 417 "parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 68 "parser.mly"
                                   ( [(_1,_2)]     )
# 425 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'formal_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'typ) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 69 "parser.mly"
                                   ( (_3,_4) :: _1 )
# 434 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    Obj.repr(
# 72 "parser.mly"
          ( Int   )
# 440 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 73 "parser.mly"
          ( Bool  )
# 446 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 74 "parser.mly"
           ( Double )
# 452 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 75 "parser.mly"
          ( Void  )
# 458 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 76 "parser.mly"
           ( String )
# 464 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'typ) in
    Obj.repr(
# 77 "parser.mly"
              ( Arr(_1) )
# 471 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 81 "parser.mly"
                     ( [] )
# 477 "parser.ml"
               : 'vdecl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'vdecl_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'vdecl) in
    Obj.repr(
# 82 "parser.mly"
                     ( _2 :: _1 )
# 485 "parser.ml"
               : 'vdecl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 85 "parser.mly"
                     ( (_1, _2) )
# 493 "parser.ml"
               : 'vdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 88 "parser.mly"
                   ( [] )
# 499 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 89 "parser.mly"
                   ( _2 :: _1 )
# 507 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 92 "parser.mly"
                                            ( Expr _1               )
# 514 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr_opt) in
    Obj.repr(
# 93 "parser.mly"
                                            ( Return _2             )
# 521 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 94 "parser.mly"
                                            ( Block(List.rev _2)    )
# 528 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 95 "parser.mly"
                                            ( If(_3, _5, Block([])) )
# 536 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : 'stmt) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 96 "parser.mly"
                                            ( If(_3, _5, _7)        )
# 545 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 6 : 'expr_opt) in
    let _5 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : 'expr_opt) in
    let _9 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 98 "parser.mly"
                                            ( For(_3, _5, _7, _9)   )
# 555 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 99 "parser.mly"
                                            ( While(_3, _5)         )
# 563 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 102 "parser.mly"
                  ( Noexpr )
# 569 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 103 "parser.mly"
                  ( _1 )
# 576 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 106 "parser.mly"
                     ( IntLit(_1)             )
# 583 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 107 "parser.mly"
                    ( DoubleLit(_1)          )
# 590 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : bool) in
    Obj.repr(
# 108 "parser.mly"
                     ( BoolLit(_1)            )
# 597 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 109 "parser.mly"
                     ( StrLit(_1)             )
# 604 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 110 "parser.mly"
                     ( Var(_1)                )
# 611 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 111 "parser.mly"
                     ( Binop(_1, Add,   _3)   )
# 619 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 112 "parser.mly"
                     ( Binop(_1, Sub,   _3)   )
# 627 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 113 "parser.mly"
                     ( Binop(_1, Mult,  _3)   )
# 635 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 114 "parser.mly"
                     ( Binop(_1, Div,   _3)   )
# 643 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 115 "parser.mly"
                     ( Binop(_1, Equal, _3)   )
# 651 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 116 "parser.mly"
                     ( Binop(_1, Neq,   _3)   )
# 659 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 117 "parser.mly"
                     ( Binop(_1, Less,  _3)   )
# 667 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 118 "parser.mly"
                     ( Binop(_1, Leq,   _3)   )
# 675 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 119 "parser.mly"
                     ( Binop(_1, Greater, _3) )
# 683 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 120 "parser.mly"
                     ( Binop(_1, Geq,   _3)   )
# 691 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 121 "parser.mly"
                     ( Binop(_1, And,   _3)   )
# 699 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 122 "parser.mly"
                     ( Binop(_1, Or,    _3)   )
# 707 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 123 "parser.mly"
                         ( Unop(Neg, _2)      )
# 714 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 124 "parser.mly"
                      ( Unop(Not, _2)          )
# 721 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 125 "parser.mly"
                           ( Assign(_1, _3)         )
# 729 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'args_opt) in
    Obj.repr(
# 126 "parser.mly"
                                    ( Call(_1, _3)  )
# 737 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 127 "parser.mly"
                       ( _2                   )
# 744 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 129 "parser.mly"
                                ( ArrayAccess(_1, _3) )
# 752 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'args_list) in
    Obj.repr(
# 130 "parser.mly"
                            ( ArrayLit(_2) )
# 759 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 5 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 131 "parser.mly"
                                            ( ArrAssign(_1, _3, _6) )
# 768 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 138 "parser.mly"
                  ( [] )
# 774 "parser.ml"
               : 'args_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'args_list) in
    Obj.repr(
# 139 "parser.mly"
               ( List.rev _1 )
# 781 "parser.ml"
               : 'args_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 142 "parser.mly"
                            ( [_1] )
# 788 "parser.ml"
               : 'args_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'args_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 143 "parser.mly"
                         ( _3 :: _1 )
# 796 "parser.ml"
               : 'args_list))
(* Entry program *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let program (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Ast.program)
