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

open Parsing;;
let _ = parse_error;;
# 2 "parser.mly"
open Ast
# 49 "parser.ml"
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
  290 (* CLASS *);
  291 (* DOT *);
    0 (* EOF *);
    0|]

let yytransl_block = [|
  292 (* INT_LIT *);
  293 (* BOOL_LIT *);
  294 (* VARIABLE *);
  295 (* DOUBLE_LIT *);
  296 (* STRING_LIT *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\002\000\003\000\004\000\007\000\007\000\
\009\000\009\000\006\000\006\000\006\000\006\000\006\000\006\000\
\006\000\005\000\005\000\010\000\008\000\008\000\011\000\011\000\
\011\000\011\000\011\000\011\000\011\000\013\000\013\000\012\000\
\012\000\012\000\012\000\012\000\012\000\012\000\012\000\012\000\
\012\000\012\000\012\000\012\000\012\000\012\000\012\000\012\000\
\012\000\012\000\012\000\012\000\012\000\012\000\012\000\012\000\
\012\000\012\000\012\000\014\000\014\000\015\000\015\000\000\000"

let yylen = "\002\000\
\002\000\000\000\002\000\002\000\005\000\008\000\000\000\001\000\
\002\000\004\000\001\000\001\000\001\000\001\000\001\000\002\000\
\002\000\000\000\002\000\003\000\000\000\002\000\002\000\003\000\
\003\000\005\000\007\000\009\000\005\000\000\000\001\000\001\000\
\001\000\001\000\001\000\001\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
\002\000\002\000\003\000\004\000\003\000\004\000\003\000\006\000\
\003\000\005\000\004\000\000\000\001\000\001\000\003\000\002\000"

let yydefred = "\000\000\
\002\000\000\000\064\000\000\000\011\000\012\000\013\000\014\000\
\015\000\000\000\001\000\003\000\004\000\000\000\000\000\016\000\
\000\000\018\000\000\000\000\000\000\000\000\000\000\000\000\000\
\005\000\000\000\019\000\017\000\009\000\000\000\000\000\000\000\
\021\000\000\000\020\000\000\000\010\000\000\000\021\000\006\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\032\000\
\034\000\000\000\033\000\035\000\000\000\022\000\000\000\000\000\
\000\000\000\000\000\000\050\000\049\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\023\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\053\000\025\000\055\000\000\000\
\024\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\039\000\040\000\000\000\000\000\
\000\000\000\000\052\000\000\000\000\000\000\000\000\000\000\000\
\029\000\000\000\000\000\000\000\000\000\000\000\027\000\000\000\
\000\000\028\000"

let yydgoto = "\002\000\
\003\000\004\000\012\000\013\000\020\000\053\000\023\000\036\000\
\024\000\027\000\054\000\055\000\063\000\093\000\059\000"

let yysindex = "\010\000\
\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\
\000\000\233\254\000\000\000\000\000\000\232\254\052\255\000\000\
\048\255\000\000\165\255\235\255\023\255\242\254\068\255\056\255\
\000\000\018\255\000\000\000\000\000\000\074\255\165\255\067\255\
\000\000\038\255\000\000\062\255\000\000\222\255\000\000\000\000\
\222\255\222\255\222\255\222\255\079\255\094\255\096\255\000\000\
\000\000\012\255\000\000\000\000\040\255\000\000\016\001\095\000\
\102\255\044\001\075\255\000\000\000\000\044\001\103\255\222\255\
\222\255\222\255\222\255\222\255\222\255\083\255\114\255\000\000\
\222\255\222\255\222\255\222\255\222\255\222\255\222\255\222\255\
\222\255\222\255\222\255\222\255\000\000\000\000\000\000\222\255\
\000\000\116\000\117\255\137\000\133\255\129\255\006\000\044\001\
\144\255\222\255\135\255\135\255\139\255\139\255\139\255\139\255\
\068\001\056\001\011\255\011\255\000\000\000\000\044\001\182\255\
\222\255\182\255\000\000\154\255\222\255\044\001\119\255\032\001\
\000\000\222\255\044\001\182\255\222\255\044\001\000\000\162\255\
\182\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\071\255\000\000\
\000\000\000\000\173\255\000\000\000\000\000\000\000\000\175\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\160\255\000\000\000\000\000\000\000\000\
\000\000\032\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\010\255\000\000\000\000\000\000\106\255\000\000\000\000\
\160\255\000\000\184\255\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\186\255\000\000\112\255\
\053\000\000\000\223\255\008\001\196\000\213\000\230\000\247\000\
\051\255\109\255\158\000\177\000\000\000\000\000\046\255\000\000\
\000\000\000\000\000\000\074\000\000\000\241\255\142\255\000\000\
\000\000\000\000\096\000\000\000\068\255\117\000\000\000\000\000\
\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\003\000\000\000\145\000\
\000\000\000\000\152\255\218\255\193\255\000\000\122\000"

let yytablesize = 602
let yytable = "\056\000\
\011\000\091\000\058\000\060\000\061\000\062\000\014\000\119\000\
\016\000\121\000\001\000\062\000\067\000\017\000\015\000\062\000\
\068\000\062\000\016\000\127\000\069\000\022\000\026\000\029\000\
\130\000\090\000\062\000\092\000\058\000\095\000\096\000\083\000\
\084\000\034\000\099\000\100\000\101\000\102\000\103\000\104\000\
\105\000\106\000\107\000\108\000\109\000\110\000\070\000\063\000\
\019\000\111\000\016\000\063\000\047\000\063\000\018\000\032\000\
\047\000\047\000\047\000\118\000\028\000\128\000\038\000\031\000\
\039\000\040\000\041\000\047\000\047\000\030\000\016\000\042\000\
\016\000\035\000\120\000\037\000\033\000\071\000\123\000\064\000\
\087\000\043\000\088\000\126\000\044\000\045\000\062\000\046\000\
\047\000\005\000\006\000\007\000\008\000\009\000\065\000\021\000\
\066\000\048\000\049\000\050\000\051\000\052\000\038\000\017\000\
\039\000\086\000\041\000\031\000\017\000\089\000\048\000\042\000\
\031\000\051\000\048\000\048\000\048\000\051\000\051\000\051\000\
\097\000\043\000\098\000\113\000\044\000\045\000\048\000\046\000\
\047\000\005\000\006\000\007\000\008\000\009\000\115\000\021\000\
\088\000\048\000\049\000\050\000\051\000\052\000\026\000\124\000\
\026\000\026\000\026\000\075\000\076\000\077\000\078\000\026\000\
\117\000\081\000\082\000\083\000\084\000\081\000\082\000\083\000\
\084\000\026\000\122\000\129\000\026\000\026\000\030\000\026\000\
\026\000\026\000\026\000\026\000\026\000\026\000\007\000\026\000\
\008\000\026\000\026\000\026\000\026\000\026\000\038\000\057\000\
\039\000\060\000\041\000\061\000\094\000\000\000\000\000\042\000\
\005\000\006\000\007\000\008\000\009\000\000\000\021\000\000\000\
\000\000\043\000\000\000\000\000\044\000\045\000\000\000\046\000\
\047\000\005\000\006\000\007\000\008\000\009\000\000\000\021\000\
\000\000\048\000\049\000\050\000\051\000\052\000\038\000\000\000\
\041\000\000\000\041\000\000\000\041\000\041\000\041\000\042\000\
\000\000\041\000\041\000\000\000\000\000\000\000\025\000\041\000\
\041\000\043\000\059\000\000\000\000\000\000\000\059\000\059\000\
\059\000\005\000\006\000\007\000\008\000\009\000\000\000\021\000\
\000\000\048\000\049\000\050\000\051\000\052\000\005\000\006\000\
\007\000\008\000\009\000\116\000\021\000\000\000\000\000\000\000\
\073\000\074\000\075\000\076\000\077\000\078\000\079\000\080\000\
\081\000\082\000\083\000\084\000\005\000\006\000\007\000\008\000\
\009\000\036\000\010\000\000\000\000\000\036\000\036\000\036\000\
\000\000\000\000\036\000\036\000\036\000\036\000\036\000\036\000\
\036\000\036\000\036\000\036\000\036\000\036\000\057\000\000\000\
\000\000\000\000\057\000\057\000\057\000\000\000\000\000\057\000\
\057\000\057\000\057\000\057\000\057\000\057\000\057\000\057\000\
\057\000\057\000\057\000\054\000\000\000\000\000\000\000\054\000\
\054\000\054\000\000\000\000\000\054\000\054\000\054\000\054\000\
\054\000\054\000\054\000\054\000\054\000\054\000\054\000\054\000\
\085\000\058\000\000\000\000\000\000\000\058\000\058\000\058\000\
\000\000\073\000\074\000\075\000\076\000\077\000\078\000\079\000\
\080\000\081\000\082\000\083\000\084\000\112\000\056\000\000\000\
\000\000\000\000\056\000\056\000\056\000\000\000\073\000\074\000\
\075\000\076\000\077\000\078\000\079\000\080\000\081\000\082\000\
\083\000\084\000\114\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\073\000\074\000\075\000\076\000\077\000\
\078\000\079\000\080\000\081\000\082\000\083\000\084\000\037\000\
\000\000\000\000\000\000\037\000\037\000\037\000\000\000\000\000\
\037\000\037\000\037\000\037\000\037\000\037\000\037\000\037\000\
\037\000\037\000\038\000\000\000\000\000\000\000\038\000\038\000\
\038\000\000\000\000\000\038\000\038\000\038\000\038\000\038\000\
\038\000\038\000\038\000\038\000\038\000\043\000\000\000\000\000\
\000\000\043\000\043\000\043\000\000\000\000\000\043\000\043\000\
\043\000\043\000\043\000\043\000\043\000\043\000\044\000\000\000\
\000\000\000\000\044\000\044\000\044\000\000\000\000\000\044\000\
\044\000\044\000\044\000\044\000\044\000\044\000\044\000\045\000\
\000\000\000\000\000\000\045\000\045\000\045\000\000\000\000\000\
\045\000\045\000\045\000\045\000\045\000\045\000\045\000\045\000\
\046\000\000\000\000\000\000\000\046\000\046\000\046\000\000\000\
\000\000\046\000\046\000\046\000\046\000\046\000\046\000\046\000\
\046\000\042\000\000\000\000\000\000\000\042\000\042\000\042\000\
\000\000\000\000\042\000\042\000\000\000\000\000\072\000\000\000\
\042\000\042\000\073\000\074\000\075\000\076\000\077\000\078\000\
\079\000\080\000\081\000\082\000\083\000\084\000\125\000\000\000\
\000\000\000\000\073\000\074\000\075\000\076\000\077\000\078\000\
\079\000\080\000\081\000\082\000\083\000\084\000\073\000\074\000\
\075\000\076\000\077\000\078\000\079\000\080\000\081\000\082\000\
\083\000\084\000\073\000\074\000\075\000\076\000\077\000\078\000\
\079\000\000\000\081\000\082\000\083\000\084\000\073\000\074\000\
\075\000\076\000\077\000\078\000\000\000\000\000\081\000\082\000\
\083\000\084\000"

let yycheck = "\038\000\
\000\000\065\000\041\000\042\000\043\000\044\000\004\000\112\000\
\033\001\114\000\001\000\002\001\001\001\038\001\038\001\006\001\
\005\001\008\001\033\001\124\000\009\001\019\000\020\000\038\001\
\129\000\064\000\065\000\066\000\067\000\068\000\069\000\021\001\
\022\001\031\000\073\000\074\000\075\000\076\000\077\000\078\000\
\079\000\080\000\081\000\082\000\083\000\084\000\035\001\002\001\
\001\001\088\000\033\001\006\001\002\001\008\001\003\001\038\001\
\006\001\007\001\008\001\098\000\038\001\125\000\001\001\008\001\
\003\001\004\001\005\001\017\001\018\001\002\001\033\001\010\001\
\033\001\007\001\113\000\038\001\003\001\038\001\117\000\001\001\
\006\001\020\001\008\001\122\000\023\001\024\001\125\000\026\001\
\027\001\028\001\029\001\030\001\031\001\032\001\001\001\034\001\
\001\001\036\001\037\001\038\001\039\001\040\001\001\001\033\001\
\003\001\004\001\005\001\002\001\038\001\007\001\002\001\010\001\
\007\001\002\001\006\001\007\001\008\001\006\001\007\001\008\001\
\038\001\020\001\009\001\007\001\023\001\024\001\018\001\026\001\
\027\001\028\001\029\001\030\001\031\001\032\001\002\001\034\001\
\008\001\036\001\037\001\038\001\039\001\040\001\001\001\025\001\
\003\001\004\001\005\001\013\001\014\001\015\001\016\001\010\001\
\009\001\019\001\020\001\021\001\022\001\019\001\020\001\021\001\
\022\001\020\001\009\001\002\001\023\001\024\001\007\001\026\001\
\027\001\028\001\029\001\030\001\031\001\032\001\002\001\034\001\
\002\001\036\001\037\001\038\001\039\001\040\001\001\001\039\000\
\003\001\002\001\005\001\002\001\067\000\255\255\255\255\010\001\
\028\001\029\001\030\001\031\001\032\001\255\255\034\001\255\255\
\255\255\020\001\255\255\255\255\023\001\024\001\255\255\026\001\
\027\001\028\001\029\001\030\001\031\001\032\001\255\255\034\001\
\255\255\036\001\037\001\038\001\039\001\040\001\001\001\255\255\
\002\001\255\255\005\001\255\255\006\001\007\001\008\001\010\001\
\255\255\011\001\012\001\255\255\255\255\255\255\004\001\017\001\
\018\001\020\001\002\001\255\255\255\255\255\255\006\001\007\001\
\008\001\028\001\029\001\030\001\031\001\032\001\255\255\034\001\
\255\255\036\001\037\001\038\001\039\001\040\001\028\001\029\001\
\030\001\031\001\032\001\006\001\034\001\255\255\255\255\255\255\
\011\001\012\001\013\001\014\001\015\001\016\001\017\001\018\001\
\019\001\020\001\021\001\022\001\028\001\029\001\030\001\031\001\
\032\001\002\001\034\001\255\255\255\255\006\001\007\001\008\001\
\255\255\255\255\011\001\012\001\013\001\014\001\015\001\016\001\
\017\001\018\001\019\001\020\001\021\001\022\001\002\001\255\255\
\255\255\255\255\006\001\007\001\008\001\255\255\255\255\011\001\
\012\001\013\001\014\001\015\001\016\001\017\001\018\001\019\001\
\020\001\021\001\022\001\002\001\255\255\255\255\255\255\006\001\
\007\001\008\001\255\255\255\255\011\001\012\001\013\001\014\001\
\015\001\016\001\017\001\018\001\019\001\020\001\021\001\022\001\
\002\001\002\001\255\255\255\255\255\255\006\001\007\001\008\001\
\255\255\011\001\012\001\013\001\014\001\015\001\016\001\017\001\
\018\001\019\001\020\001\021\001\022\001\002\001\002\001\255\255\
\255\255\255\255\006\001\007\001\008\001\255\255\011\001\012\001\
\013\001\014\001\015\001\016\001\017\001\018\001\019\001\020\001\
\021\001\022\001\002\001\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\011\001\012\001\013\001\014\001\015\001\
\016\001\017\001\018\001\019\001\020\001\021\001\022\001\002\001\
\255\255\255\255\255\255\006\001\007\001\008\001\255\255\255\255\
\011\001\012\001\013\001\014\001\015\001\016\001\017\001\018\001\
\019\001\020\001\002\001\255\255\255\255\255\255\006\001\007\001\
\008\001\255\255\255\255\011\001\012\001\013\001\014\001\015\001\
\016\001\017\001\018\001\019\001\020\001\002\001\255\255\255\255\
\255\255\006\001\007\001\008\001\255\255\255\255\011\001\012\001\
\013\001\014\001\015\001\016\001\017\001\018\001\002\001\255\255\
\255\255\255\255\006\001\007\001\008\001\255\255\255\255\011\001\
\012\001\013\001\014\001\015\001\016\001\017\001\018\001\002\001\
\255\255\255\255\255\255\006\001\007\001\008\001\255\255\255\255\
\011\001\012\001\013\001\014\001\015\001\016\001\017\001\018\001\
\002\001\255\255\255\255\255\255\006\001\007\001\008\001\255\255\
\255\255\011\001\012\001\013\001\014\001\015\001\016\001\017\001\
\018\001\002\001\255\255\255\255\255\255\006\001\007\001\008\001\
\255\255\255\255\011\001\012\001\255\255\255\255\007\001\255\255\
\017\001\018\001\011\001\012\001\013\001\014\001\015\001\016\001\
\017\001\018\001\019\001\020\001\021\001\022\001\007\001\255\255\
\255\255\255\255\011\001\012\001\013\001\014\001\015\001\016\001\
\017\001\018\001\019\001\020\001\021\001\022\001\011\001\012\001\
\013\001\014\001\015\001\016\001\017\001\018\001\019\001\020\001\
\021\001\022\001\011\001\012\001\013\001\014\001\015\001\016\001\
\017\001\255\255\019\001\020\001\021\001\022\001\011\001\012\001\
\013\001\014\001\015\001\016\001\255\255\255\255\019\001\020\001\
\021\001\022\001"

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
  CLASS\000\
  DOT\000\
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
# 393 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    Obj.repr(
# 39 "parser.mly"
                 ( ([], [])               )
# 399 "parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'cdecl) in
    Obj.repr(
# 40 "parser.mly"
               ( ((_2 :: fst _1), snd _1) )
# 407 "parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fdecl) in
    Obj.repr(
# 41 "parser.mly"
               ( (fst _1, (_2 :: snd _1)) )
# 415 "parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'vdecl_list) in
    Obj.repr(
# 51 "parser.mly"
  ( { cname = _2;
      fields = List.rev _4 } )
# 424 "parser.ml"
               : 'cdecl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 7 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 6 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 4 : 'formals_opt) in
    let _7 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 57 "parser.mly"
     ( { typ = _1;
	 fname = _2;
	 formals = List.rev _4;
	 locals = [];
	 body = _7 } )
# 438 "parser.ml"
               : 'fdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 64 "parser.mly"
                  ( [] )
# 444 "parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'formal_list) in
    Obj.repr(
# 65 "parser.mly"
                  ( _1 )
# 451 "parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 68 "parser.mly"
                                   ( [(_1,_2)]     )
# 459 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'formal_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'typ) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 69 "parser.mly"
                                   ( (_3,_4) :: _1 )
# 468 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    Obj.repr(
# 72 "parser.mly"
          ( Int   )
# 474 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 73 "parser.mly"
          ( Bool  )
# 480 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 74 "parser.mly"
           ( Double )
# 486 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 75 "parser.mly"
          ( Void  )
# 492 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 76 "parser.mly"
           ( String )
# 498 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'typ) in
    Obj.repr(
# 77 "parser.mly"
              ( Arr(_1) )
# 505 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 78 "parser.mly"
                   ( Object(_2) )
# 512 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 81 "parser.mly"
                     ( [] )
# 518 "parser.ml"
               : 'vdecl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'vdecl_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'vdecl) in
    Obj.repr(
# 82 "parser.mly"
                     ( _2 :: _1 )
# 526 "parser.ml"
               : 'vdecl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 85 "parser.mly"
                     ( (_1, _2) )
# 534 "parser.ml"
               : 'vdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 88 "parser.mly"
                   ( [] )
# 540 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 89 "parser.mly"
                   ( _2 :: _1 )
# 548 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 92 "parser.mly"
                                            ( Expr _1               )
# 555 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr_opt) in
    Obj.repr(
# 93 "parser.mly"
                                            ( Return _2             )
# 562 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 94 "parser.mly"
                                            ( Block(List.rev _2)    )
# 569 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 95 "parser.mly"
                                            ( If(_3, _5, Block([])) )
# 577 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : 'stmt) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 96 "parser.mly"
                                            ( If(_3, _5, _7)        )
# 586 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 6 : 'expr_opt) in
    let _5 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : 'expr_opt) in
    let _9 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 98 "parser.mly"
                                            ( For(_3, _5, _7, _9)   )
# 596 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 99 "parser.mly"
                                            ( While(_3, _5)         )
# 604 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 102 "parser.mly"
                  ( Noexpr )
# 610 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 103 "parser.mly"
                  ( _1 )
# 617 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 106 "parser.mly"
                     ( IntLit(_1)             )
# 624 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 107 "parser.mly"
                    ( DoubleLit(_1)          )
# 631 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : bool) in
    Obj.repr(
# 108 "parser.mly"
                     ( BoolLit(_1)            )
# 638 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 109 "parser.mly"
                     ( StrLit(_1)             )
# 645 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 110 "parser.mly"
                     ( Var(_1)                )
# 652 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 111 "parser.mly"
                     ( Binop(_1, Add,   _3)   )
# 660 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 112 "parser.mly"
                     ( Binop(_1, Sub,   _3)   )
# 668 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 113 "parser.mly"
                     ( Binop(_1, Mult,  _3)   )
# 676 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 114 "parser.mly"
                     ( Binop(_1, Div,   _3)   )
# 684 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 115 "parser.mly"
                     ( Binop(_1, Equal, _3)   )
# 692 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 116 "parser.mly"
                     ( Binop(_1, Neq,   _3)   )
# 700 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 117 "parser.mly"
                     ( Binop(_1, Less,  _3)   )
# 708 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 118 "parser.mly"
                     ( Binop(_1, Leq,   _3)   )
# 716 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 119 "parser.mly"
                     ( Binop(_1, Greater, _3) )
# 724 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 120 "parser.mly"
                     ( Binop(_1, Geq,   _3)   )
# 732 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 121 "parser.mly"
                     ( Binop(_1, And,   _3)   )
# 740 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 122 "parser.mly"
                     ( Binop(_1, Or,    _3)   )
# 748 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 123 "parser.mly"
                         ( Unop(Neg, _2)      )
# 755 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 124 "parser.mly"
                      ( Unop(Not, _2)          )
# 762 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 125 "parser.mly"
                           ( Assign(_1, _3)         )
# 770 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'args_opt) in
    Obj.repr(
# 126 "parser.mly"
                                    ( Call(_1, _3)  )
# 778 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 127 "parser.mly"
                       ( _2                   )
# 785 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 129 "parser.mly"
                                ( ArrayAccess(_1, _3) )
# 793 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'args_list) in
    Obj.repr(
# 130 "parser.mly"
                            ( ArrayLit(_2) )
# 800 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 5 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 131 "parser.mly"
                                            ( ArrAssign(_1, _3, _6) )
# 809 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 133 "parser.mly"
                          ( ObjAccess(_1, _3) )
# 817 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 134 "parser.mly"
                                        ( ObjAssign(_1, _3, _5) )
# 826 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 136 "parser.mly"
                             ( DecAssn(_1, _2, _4) )
# 835 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 140 "parser.mly"
                  ( [] )
# 841 "parser.ml"
               : 'args_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'args_list) in
    Obj.repr(
# 141 "parser.mly"
               ( List.rev _1 )
# 848 "parser.ml"
               : 'args_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 144 "parser.mly"
                            ( [_1] )
# 855 "parser.ml"
               : 'args_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'args_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 145 "parser.mly"
                         ( _3 :: _1 )
# 863 "parser.ml"
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
