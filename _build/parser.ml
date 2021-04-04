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
  | INTARR
  | BOOLARR
  | DOUBLEARR
  | STRINGARR
  | CLASS
  | DOT
  | CONSTRUCTOR
  | THIS
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
# 54 "parser.ml"
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
  289 (* INTARR *);
  290 (* BOOLARR *);
  291 (* DOUBLEARR *);
  292 (* STRINGARR *);
  293 (* CLASS *);
  294 (* DOT *);
  295 (* CONSTRUCTOR *);
  296 (* THIS *);
    0 (* EOF *);
    0|]

let yytransl_block = [|
  297 (* INT_LIT *);
  298 (* BOOL_LIT *);
  299 (* VARIABLE *);
  300 (* DOUBLE_LIT *);
  301 (* STRING_LIT *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\002\000\002\000\006\000\005\000\011\000\
\010\000\010\000\004\000\007\000\007\000\013\000\013\000\012\000\
\012\000\012\000\012\000\012\000\012\000\012\000\012\000\012\000\
\012\000\008\000\008\000\003\000\009\000\009\000\014\000\014\000\
\014\000\014\000\014\000\014\000\014\000\016\000\016\000\015\000\
\015\000\015\000\015\000\015\000\015\000\015\000\015\000\015\000\
\015\000\015\000\015\000\015\000\015\000\015\000\015\000\015\000\
\015\000\015\000\015\000\015\000\015\000\015\000\015\000\015\000\
\015\000\015\000\015\000\017\000\017\000\018\000\018\000\000\000"

let yylen = "\002\000\
\002\000\000\000\002\000\002\000\002\000\008\000\007\000\002\000\
\000\000\002\000\009\000\000\000\001\000\002\000\004\000\001\000\
\001\000\001\000\001\000\001\000\001\000\001\000\001\000\001\000\
\001\000\000\000\002\000\003\000\000\000\002\000\002\000\003\000\
\003\000\005\000\007\000\009\000\005\000\000\000\001\000\001\000\
\001\000\001\000\001\000\001\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
\002\000\002\000\003\000\004\000\003\000\003\000\006\000\003\000\
\006\000\004\000\003\000\000\000\001\000\001\000\003\000\002\000"

let yydefred = "\000\000\
\002\000\000\000\072\000\000\000\016\000\017\000\018\000\019\000\
\020\000\021\000\022\000\023\000\024\000\000\000\001\000\003\000\
\004\000\005\000\025\000\000\000\000\000\000\000\026\000\000\000\
\028\000\000\000\000\000\000\000\000\000\000\000\000\000\027\000\
\009\000\000\000\008\000\000\000\014\000\000\000\000\000\000\000\
\000\000\026\000\000\000\000\000\007\000\010\000\000\000\000\000\
\015\000\000\000\000\000\000\000\026\000\000\000\029\000\011\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\040\000\042\000\000\000\041\000\043\000\030\000\000\000\000\000\
\000\000\000\000\000\000\000\000\058\000\057\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\031\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\061\000\033\000\
\067\000\000\000\032\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\047\000\048\000\
\006\000\000\000\000\000\000\000\000\000\000\000\060\000\066\000\
\000\000\000\000\000\000\037\000\000\000\000\000\000\000\000\000\
\065\000\063\000\035\000\000\000\000\000\036\000"

let yydgoto = "\002\000\
\003\000\004\000\032\000\017\000\018\000\033\000\028\000\026\000\
\052\000\040\000\019\000\034\000\030\000\070\000\071\000\080\000\
\112\000\113\000"

let yysindex = "\010\000\
\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\248\254\000\000\000\000\
\000\000\000\000\000\000\008\255\050\255\061\255\000\000\087\001\
\000\000\051\001\030\255\073\255\034\255\071\255\083\255\000\000\
\000\000\049\255\000\000\098\255\000\000\087\001\087\001\219\255\
\101\255\000\000\066\255\109\255\000\000\000\000\069\255\087\001\
\000\000\112\255\118\255\062\255\000\000\014\255\000\000\000\000\
\014\255\014\255\014\255\014\255\122\255\123\255\124\255\088\255\
\000\000\000\000\011\255\000\000\000\000\000\000\028\001\087\001\
\079\000\090\255\056\001\042\255\000\000\000\000\056\001\121\255\
\014\255\014\255\014\255\086\255\014\255\095\255\014\255\096\255\
\000\000\014\255\014\255\014\255\014\255\014\255\014\255\014\255\
\014\255\014\255\014\255\014\255\014\255\117\255\000\000\000\000\
\000\000\014\255\000\000\100\000\131\255\121\000\141\255\148\255\
\138\255\145\255\056\001\151\255\112\001\112\001\077\255\077\255\
\077\255\077\255\092\001\080\001\039\255\039\255\000\000\000\000\
\000\000\056\001\198\255\014\255\198\255\014\255\000\000\000\000\
\014\255\128\255\044\001\000\000\153\255\154\255\198\255\014\255\
\000\000\000\000\000\000\161\255\198\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\126\255\000\000\000\000\163\255\
\000\000\000\000\000\000\000\000\000\000\164\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\163\255\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\144\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\166\255\000\000\000\000\000\000\000\000\
\000\000\000\000\255\255\000\000\000\000\000\000\000\000\144\255\
\000\000\000\000\024\255\000\000\000\000\000\000\007\255\000\000\
\000\000\166\255\000\000\000\000\175\255\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\037\000\000\000\
\177\255\000\000\015\255\058\000\248\000\000\001\180\000\197\000\
\214\000\231\000\013\001\020\001\142\000\161\000\000\000\000\000\
\000\000\068\255\000\000\000\000\000\000\175\255\000\000\000\000\
\175\255\171\255\000\000\000\000\000\000\000\000\000\000\178\255\
\000\000\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\174\000\143\000\000\000\000\000\151\000\221\255\
\209\255\000\000\000\000\196\000\000\000\194\255\202\255\176\255\
\132\255\125\000"

let yytablesize = 646
let yytable = "\073\000\
\015\000\109\000\075\000\077\000\078\000\079\000\048\000\074\000\
\039\000\141\000\001\000\085\000\142\000\039\000\054\000\086\000\
\059\000\072\000\057\000\087\000\059\000\059\000\059\000\058\000\
\102\000\070\000\108\000\079\000\110\000\070\000\075\000\070\000\
\115\000\059\000\021\000\117\000\118\000\119\000\120\000\121\000\
\122\000\123\000\124\000\125\000\126\000\127\000\128\000\105\000\
\088\000\106\000\022\000\130\000\023\000\064\000\065\000\066\000\
\067\000\068\000\069\000\100\000\101\000\024\000\054\000\148\000\
\055\000\056\000\057\000\025\000\138\000\071\000\140\000\058\000\
\035\000\071\000\036\000\071\000\037\000\139\000\038\000\075\000\
\147\000\059\000\075\000\039\000\060\000\061\000\150\000\062\000\
\063\000\079\000\054\000\041\000\055\000\104\000\057\000\098\000\
\099\000\100\000\101\000\058\000\042\000\064\000\065\000\066\000\
\067\000\068\000\069\000\025\000\049\000\059\000\050\000\051\000\
\060\000\061\000\053\000\062\000\063\000\054\000\024\000\055\000\
\129\000\057\000\081\000\082\000\083\000\084\000\058\000\107\000\
\111\000\064\000\065\000\066\000\067\000\068\000\069\000\114\000\
\059\000\132\000\116\000\060\000\061\000\134\000\062\000\063\000\
\029\000\106\000\029\000\029\000\029\000\135\000\136\000\137\000\
\143\000\029\000\145\000\146\000\064\000\065\000\066\000\067\000\
\068\000\069\000\149\000\029\000\012\000\013\000\029\000\029\000\
\008\000\029\000\029\000\034\000\038\000\034\000\034\000\034\000\
\068\000\016\000\069\000\038\000\034\000\076\000\046\000\029\000\
\029\000\029\000\029\000\029\000\029\000\044\000\034\000\000\000\
\000\000\034\000\034\000\000\000\034\000\034\000\054\000\020\000\
\055\000\000\000\057\000\000\000\000\000\000\000\000\000\058\000\
\000\000\000\000\034\000\034\000\034\000\034\000\034\000\034\000\
\000\000\059\000\000\000\029\000\060\000\061\000\045\000\062\000\
\063\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\043\000\029\000\047\000\000\000\064\000\065\000\066\000\
\067\000\068\000\069\000\000\000\000\000\000\000\005\000\006\000\
\007\000\008\000\009\000\010\000\011\000\012\000\013\000\027\000\
\044\000\000\000\000\000\000\000\044\000\044\000\044\000\000\000\
\000\000\044\000\044\000\044\000\044\000\044\000\044\000\044\000\
\044\000\044\000\044\000\044\000\044\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\005\000\006\000\007\000\008\000\
\009\000\010\000\011\000\012\000\013\000\014\000\064\000\000\000\
\000\000\000\000\064\000\064\000\064\000\000\000\000\000\064\000\
\064\000\064\000\064\000\064\000\064\000\064\000\064\000\064\000\
\064\000\064\000\064\000\062\000\000\000\000\000\000\000\062\000\
\062\000\062\000\000\000\000\000\062\000\062\000\062\000\062\000\
\062\000\062\000\062\000\062\000\062\000\062\000\062\000\062\000\
\103\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\090\000\091\000\092\000\093\000\094\000\095\000\096\000\
\097\000\098\000\099\000\100\000\101\000\131\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\090\000\091\000\
\092\000\093\000\094\000\095\000\096\000\097\000\098\000\099\000\
\100\000\101\000\133\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\090\000\091\000\092\000\093\000\094\000\
\095\000\096\000\097\000\098\000\099\000\100\000\101\000\045\000\
\000\000\000\000\000\000\045\000\045\000\045\000\000\000\000\000\
\045\000\045\000\045\000\045\000\045\000\045\000\045\000\045\000\
\045\000\045\000\046\000\000\000\000\000\000\000\046\000\046\000\
\046\000\000\000\000\000\046\000\046\000\046\000\046\000\046\000\
\046\000\046\000\046\000\046\000\046\000\051\000\000\000\000\000\
\000\000\051\000\051\000\051\000\000\000\000\000\051\000\051\000\
\051\000\051\000\051\000\051\000\051\000\051\000\052\000\000\000\
\000\000\000\000\052\000\052\000\052\000\000\000\000\000\052\000\
\052\000\052\000\052\000\052\000\052\000\052\000\052\000\053\000\
\000\000\000\000\000\000\053\000\053\000\053\000\000\000\000\000\
\053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
\054\000\000\000\000\000\000\000\054\000\054\000\054\000\000\000\
\000\000\054\000\054\000\054\000\054\000\054\000\054\000\054\000\
\054\000\049\000\000\000\000\000\000\000\049\000\049\000\049\000\
\000\000\050\000\049\000\049\000\000\000\050\000\050\000\050\000\
\049\000\049\000\050\000\050\000\000\000\000\000\055\000\000\000\
\050\000\050\000\055\000\055\000\055\000\056\000\000\000\000\000\
\000\000\056\000\056\000\056\000\000\000\055\000\055\000\000\000\
\000\000\000\000\089\000\000\000\000\000\056\000\090\000\091\000\
\092\000\093\000\094\000\095\000\096\000\097\000\098\000\099\000\
\100\000\101\000\144\000\000\000\000\000\000\000\090\000\091\000\
\092\000\093\000\094\000\095\000\096\000\097\000\098\000\099\000\
\100\000\101\000\090\000\091\000\092\000\093\000\094\000\095\000\
\096\000\097\000\098\000\099\000\100\000\101\000\005\000\006\000\
\007\000\008\000\009\000\010\000\011\000\012\000\013\000\027\000\
\000\000\031\000\090\000\091\000\092\000\093\000\094\000\095\000\
\096\000\000\000\098\000\099\000\100\000\101\000\090\000\091\000\
\092\000\093\000\094\000\095\000\000\000\000\000\098\000\099\000\
\100\000\101\000\005\000\006\000\007\000\008\000\009\000\010\000\
\011\000\012\000\013\000\027\000\092\000\093\000\094\000\095\000\
\000\000\000\000\098\000\099\000\100\000\101\000"

let yycheck = "\054\000\
\000\000\082\000\057\000\058\000\059\000\060\000\042\000\055\000\
\002\001\134\000\001\000\001\001\137\000\007\001\001\001\005\001\
\002\001\053\000\005\001\009\001\006\001\007\001\008\001\010\001\
\072\000\002\001\081\000\082\000\083\000\006\001\085\000\008\001\
\087\000\020\001\043\001\090\000\091\000\092\000\093\000\094\000\
\095\000\096\000\097\000\098\000\099\000\100\000\101\000\006\001\
\038\001\008\001\043\001\106\000\003\001\040\001\041\001\042\001\
\043\001\044\001\045\001\021\001\022\001\001\001\001\001\144\000\
\003\001\004\001\005\001\007\001\131\000\002\001\133\000\010\001\
\043\001\006\001\002\001\008\001\043\001\132\000\008\001\134\000\
\143\000\020\001\137\000\001\001\023\001\024\001\149\000\026\001\
\027\001\144\000\001\001\043\001\003\001\004\001\005\001\019\001\
\020\001\021\001\022\001\010\001\003\001\040\001\041\001\042\001\
\043\001\044\001\045\001\007\001\043\001\020\001\002\001\043\001\
\023\001\024\001\003\001\026\001\027\001\001\001\001\001\003\001\
\004\001\005\001\001\001\001\001\001\001\038\001\010\001\007\001\
\043\001\040\001\041\001\042\001\043\001\044\001\045\001\041\001\
\020\001\007\001\043\001\023\001\024\001\001\001\026\001\027\001\
\001\001\008\001\003\001\004\001\005\001\002\001\006\001\001\001\
\025\001\010\001\002\001\002\001\040\001\041\001\042\001\043\001\
\044\001\045\001\002\001\020\001\002\001\002\001\023\001\024\001\
\043\001\026\001\027\001\001\001\007\001\003\001\004\001\005\001\
\002\001\004\000\002\001\002\001\010\001\057\000\040\000\040\001\
\041\001\042\001\043\001\044\001\045\001\039\000\020\001\255\255\
\255\255\023\001\024\001\255\255\026\001\027\001\001\001\004\000\
\003\001\255\255\005\001\255\255\255\255\255\255\255\255\010\001\
\255\255\255\255\040\001\041\001\042\001\043\001\044\001\045\001\
\255\255\020\001\255\255\024\000\023\001\024\001\004\001\026\001\
\027\001\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\038\000\039\000\040\000\255\255\040\001\041\001\042\001\
\043\001\044\001\045\001\255\255\255\255\255\255\028\001\029\001\
\030\001\031\001\032\001\033\001\034\001\035\001\036\001\037\001\
\002\001\255\255\255\255\255\255\006\001\007\001\008\001\255\255\
\255\255\011\001\012\001\013\001\014\001\015\001\016\001\017\001\
\018\001\019\001\020\001\021\001\022\001\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\028\001\029\001\030\001\031\001\
\032\001\033\001\034\001\035\001\036\001\037\001\002\001\255\255\
\255\255\255\255\006\001\007\001\008\001\255\255\255\255\011\001\
\012\001\013\001\014\001\015\001\016\001\017\001\018\001\019\001\
\020\001\021\001\022\001\002\001\255\255\255\255\255\255\006\001\
\007\001\008\001\255\255\255\255\011\001\012\001\013\001\014\001\
\015\001\016\001\017\001\018\001\019\001\020\001\021\001\022\001\
\002\001\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\011\001\012\001\013\001\014\001\015\001\016\001\017\001\
\018\001\019\001\020\001\021\001\022\001\002\001\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\011\001\012\001\
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
\255\255\002\001\011\001\012\001\255\255\006\001\007\001\008\001\
\017\001\018\001\011\001\012\001\255\255\255\255\002\001\255\255\
\017\001\018\001\006\001\007\001\008\001\002\001\255\255\255\255\
\255\255\006\001\007\001\008\001\255\255\017\001\018\001\255\255\
\255\255\255\255\007\001\255\255\255\255\018\001\011\001\012\001\
\013\001\014\001\015\001\016\001\017\001\018\001\019\001\020\001\
\021\001\022\001\007\001\255\255\255\255\255\255\011\001\012\001\
\013\001\014\001\015\001\016\001\017\001\018\001\019\001\020\001\
\021\001\022\001\011\001\012\001\013\001\014\001\015\001\016\001\
\017\001\018\001\019\001\020\001\021\001\022\001\028\001\029\001\
\030\001\031\001\032\001\033\001\034\001\035\001\036\001\037\001\
\255\255\039\001\011\001\012\001\013\001\014\001\015\001\016\001\
\017\001\255\255\019\001\020\001\021\001\022\001\011\001\012\001\
\013\001\014\001\015\001\016\001\255\255\255\255\019\001\020\001\
\021\001\022\001\028\001\029\001\030\001\031\001\032\001\033\001\
\034\001\035\001\036\001\037\001\013\001\014\001\015\001\016\001\
\255\255\255\255\019\001\020\001\021\001\022\001"

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
  INTARR\000\
  BOOLARR\000\
  DOUBLEARR\000\
  STRINGARR\000\
  CLASS\000\
  DOT\000\
  CONSTRUCTOR\000\
  THIS\000\
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
# 35 "parser.mly"
            ( _1 )
# 428 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    Obj.repr(
# 38 "parser.mly"
                 ( ([], [], []) )
# 434 "parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'vdecl) in
    Obj.repr(
# 39 "parser.mly"
               ( let (vdecl, fdecl, cdecl) = _1 in (_2::vdecl, fdecl, cdecl) )
# 442 "parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fdecl) in
    Obj.repr(
# 40 "parser.mly"
               ( let (vdecl, fdecl, cdecl) = _1 in (vdecl, _2::fdecl, cdecl) )
# 450 "parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'cdecl) in
    Obj.repr(
# 41 "parser.mly"
               ( let (vdecl, fdecl, cdecl) = _1 in (vdecl, fdecl, _2::cdecl) )
# 458 "parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 5 : 'formals_opt) in
    let _6 = (Parsing.peek_val __caml_parser_env 2 : 'vdecl_list) in
    let _7 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 46 "parser.mly"
  ( { typ = Constrtyp;
	 fname = "constructor";
	 formals = List.rev _3;
	 locals = List.rev _6;
	 body = List.rev _7 } )
# 471 "parser.ml"
               : 'constr_decl))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 5 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 3 : 'vdecl_list) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : 'constr_decl) in
    let _6 = (Parsing.peek_val __caml_parser_env 1 : 'fdecl_list) in
    Obj.repr(
# 54 "parser.mly"
  ( { cname = _2;
    fields = List.rev _4;
    constructor = _5;
    methods = List.rev _6;
  } )
# 485 "parser.ml"
               : 'cdecl))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 61 "parser.mly"
                ( Object(_2) )
# 492 "parser.ml"
               : 'obj_typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 64 "parser.mly"
               ( [] )
# 498 "parser.ml"
               : 'fdecl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'fdecl_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fdecl) in
    Obj.repr(
# 65 "parser.mly"
                    ( _2 :: _1 )
# 506 "parser.ml"
               : 'fdecl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 8 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 7 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 5 : 'formals_opt) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : 'vdecl_list) in
    let _8 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 70 "parser.mly"
     ( { typ = _1;
	 fname = _2;
	 formals = List.rev _4;
	 locals = List.rev _7;
	 body = List.rev _8 } )
# 521 "parser.ml"
               : 'fdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 77 "parser.mly"
                  ( [] )
# 527 "parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'formal_list) in
    Obj.repr(
# 78 "parser.mly"
                  ( _1 )
# 534 "parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 81 "parser.mly"
                                   ( [(_1,_2)]     )
# 542 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'formal_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'typ) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 82 "parser.mly"
                                   ( (_3,_4) :: _1 )
# 551 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    Obj.repr(
# 85 "parser.mly"
          ( Int   )
# 557 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 86 "parser.mly"
          ( Bool  )
# 563 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 87 "parser.mly"
           ( Double )
# 569 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 88 "parser.mly"
          ( Void  )
# 575 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 89 "parser.mly"
           ( String )
# 581 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 90 "parser.mly"
           ( IntArr )
# 587 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 91 "parser.mly"
            ( BoolArr )
# 593 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 92 "parser.mly"
              ( DoubleArr )
# 599 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 93 "parser.mly"
              ( StringArr )
# 605 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'obj_typ) in
    Obj.repr(
# 94 "parser.mly"
            ( _1 )
# 612 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 97 "parser.mly"
                     ( [] )
# 618 "parser.ml"
               : 'vdecl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'vdecl_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'vdecl) in
    Obj.repr(
# 98 "parser.mly"
                     ( _2 :: _1 )
# 626 "parser.ml"
               : 'vdecl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 101 "parser.mly"
                     ( (_1, _2) )
# 634 "parser.ml"
               : 'vdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 104 "parser.mly"
                   ( [] )
# 640 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 105 "parser.mly"
                   ( _2 :: _1 )
# 648 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 108 "parser.mly"
                                            ( Expr _1               )
# 655 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr_opt) in
    Obj.repr(
# 109 "parser.mly"
                                            ( Return _2             )
# 662 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 110 "parser.mly"
                                            ( Block(List.rev _2)    )
# 669 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 111 "parser.mly"
                                            ( If(_3, _5, Block([])) )
# 677 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : 'stmt) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 112 "parser.mly"
                                            ( If(_3, _5, _7)        )
# 686 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 6 : 'expr_opt) in
    let _5 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : 'expr_opt) in
    let _9 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 114 "parser.mly"
                                            ( For(_3, _5, _7, _9)   )
# 696 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 115 "parser.mly"
                                            ( While(_3, _5)         )
# 704 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 118 "parser.mly"
                  ( Noexpr )
# 710 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 119 "parser.mly"
                  ( _1 )
# 717 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 122 "parser.mly"
                     ( IntLit(_1)             )
# 724 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 123 "parser.mly"
                    ( DoubleLit(_1)          )
# 731 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : bool) in
    Obj.repr(
# 124 "parser.mly"
                     ( BoolLit(_1)            )
# 738 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 125 "parser.mly"
                     ( StrLit(_1)             )
# 745 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 126 "parser.mly"
                     ( Var(_1)                )
# 752 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 127 "parser.mly"
                     ( Binop(_1, Add,   _3)   )
# 760 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 128 "parser.mly"
                     ( Binop(_1, Sub,   _3)   )
# 768 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 129 "parser.mly"
                     ( Binop(_1, Mult,  _3)   )
# 776 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 130 "parser.mly"
                     ( Binop(_1, Div,   _3)   )
# 784 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 131 "parser.mly"
                     ( Binop(_1, Equal, _3)   )
# 792 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 132 "parser.mly"
                     ( Binop(_1, Neq,   _3)   )
# 800 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 133 "parser.mly"
                     ( Binop(_1, Less,  _3)   )
# 808 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 134 "parser.mly"
                     ( Binop(_1, Leq,   _3)   )
# 816 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 135 "parser.mly"
                     ( Binop(_1, Greater, _3) )
# 824 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 136 "parser.mly"
                     ( Binop(_1, Geq,   _3)   )
# 832 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 137 "parser.mly"
                     ( Binop(_1, And,   _3)   )
# 840 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 138 "parser.mly"
                     ( Binop(_1, Or,    _3)   )
# 848 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 139 "parser.mly"
                         ( Unop(Neg, _2)      )
# 855 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 140 "parser.mly"
                      ( Unop(Not, _2)          )
# 862 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 141 "parser.mly"
                           ( Assign(_1, _3)         )
# 870 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'args_opt) in
    Obj.repr(
# 142 "parser.mly"
                                    ( Call(_1, _3)  )
# 878 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 143 "parser.mly"
                       ( _2                   )
# 885 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 145 "parser.mly"
                          ( ObjAccess(_1, _3) )
# 893 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 5 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'args_opt) in
    Obj.repr(
# 146 "parser.mly"
                                                 ( ObjCall(_1, _3, _5) )
# 902 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 147 "parser.mly"
                      ( ThisAccess(_3) )
# 909 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'args_opt) in
    Obj.repr(
# 148 "parser.mly"
                                             ( ThisCall(_3, _5) )
# 917 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : int) in
    Obj.repr(
# 150 "parser.mly"
                                   ( ArrayAccess(_1, _3) )
# 925 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'args_list) in
    Obj.repr(
# 151 "parser.mly"
                            ( ArrayLit(_2) )
# 932 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 154 "parser.mly"
                  ( [] )
# 938 "parser.ml"
               : 'args_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'args_list) in
    Obj.repr(
# 155 "parser.mly"
               ( List.rev _1 )
# 945 "parser.ml"
               : 'args_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 158 "parser.mly"
                            ( [_1] )
# 952 "parser.ml"
               : 'args_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'args_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 159 "parser.mly"
                         ( _3 :: _1 )
# 960 "parser.ml"
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
