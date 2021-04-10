%{
open Ast
%}

%token LPAREN RPAREN LBRACE RBRACE LBRACK RBRACK
%token SEMI COMMA ASSIGN
%token NOT EQ NEQ LT LEQ GT GEQ AND OR
%token PLUS MINUS TIMES DIVIDE
%token RETURN IF ELSE FOR WHILE 
%token INT BOOL DOUBLE VOID STRING INTARR BOOLARR DOUBLEARR STRINGARR
%token CLASS DOT CONSTRUCTOR THIS

%token <int> INT_LIT
%token <bool> BOOL_LIT
%token <string> VARIABLE DOUBLE_LIT STRING_LIT
%token EOF

%start program
%type <Ast.program> program

%nonassoc NOELSE
%nonassoc ELSE
%right ASSIGN
%left OR
%left AND
%left EQ NEQ
%left LT GT LEQ GEQ
%left PLUS MINUS
%left TIMES DIVIDE
%right NOT

%%

program:
  decls EOF { $1 }

decls:
   /* nothing */ { ( [] ) }
 | decls fdecl { let (fdecl) = $1 in ($2::fdecl) }

obj_typ:
 CLASS VARIABLE { Object($2) }

fdecl_list:
 /* nothing */ { [] }
 | fdecl_list fdecl { $2 :: $1 }


fdecl:
   typ VARIABLE LPAREN formals_opt RPAREN LBRACE stmt_list RBRACE
     { { typ = $1;
	 fname = $2;
	 formals = List.rev $4;
	 body = List.rev $7 } }

formals_opt:
    /* nothing */ { [] }
  | formal_list   { $1 }

formal_list:
    typ VARIABLE                   { [($1,$2)]     }
  | formal_list COMMA typ VARIABLE { ($3,$4) :: $1 }

typ:
    INT   { Int   }
  | BOOL  { Bool  }
  | DOUBLE { Double }
  | VOID  { Void  }
  | STRING { String }
  | INTARR { IntArr }
  | BOOLARR { BoolArr }
  | DOUBLEARR { DoubleArr }
  | STRINGARR { StringArr }
  | obj_typ { $1 }

stmt_list:
    /* nothing */  { [] }
  | stmt_list stmt { $2 :: $1 }

stmt:
    expr SEMI                               { Expr $1               }
  | RETURN expr_opt SEMI                    { Return $2             }
  | LBRACE stmt_list RBRACE                 { Block(List.rev $2)    }
  | IF LPAREN expr RPAREN stmt %prec NOELSE { If($3, $5, Block([])) }
  | IF LPAREN expr RPAREN stmt ELSE stmt    { If($3, $5, $7)        }
  | FOR LPAREN expr_opt SEMI expr SEMI expr_opt RPAREN stmt
                                            { For($3, $5, $7, $9)   }
  | WHILE LPAREN expr RPAREN stmt           { While($3, $5)         }
  | typ VARIABLE ASSIGN expr SEMI           { DecAssn($1, $2, $4) }

expr_opt:
    /* nothing */ { Noexpr }
  | expr          { $1 }

expr:
    INT_LIT          { IntLit($1)             }
  | DOUBLE_LIT	     { DoubleLit($1)          }
  | BOOL_LIT         { BoolLit($1)            }
  | STRING_LIT       { StrLit($1)             }
  | VARIABLE         { Var($1)                }
  | expr PLUS   expr { Binop($1, Add,   $3)   }
  | expr MINUS  expr { Binop($1, Sub,   $3)   }
  | expr TIMES  expr { Binop($1, Mult,  $3)   }
  | expr DIVIDE expr { Binop($1, Div,   $3)   }
  | expr EQ     expr { Binop($1, Equal, $3)   }
  | expr NEQ    expr { Binop($1, Neq,   $3)   }
  | expr LT     expr { Binop($1, Less,  $3)   }
  | expr LEQ    expr { Binop($1, Leq,   $3)   }
  | expr GT     expr { Binop($1, Greater, $3) }
  | expr GEQ    expr { Binop($1, Geq,   $3)   }
  | expr AND    expr { Binop($1, And,   $3)   }
  | expr OR     expr { Binop($1, Or,    $3)   }
  | MINUS expr %prec NOT { Unop(Neg, $2)      }
  | NOT expr          { Unop(Not, $2)          }
  | VARIABLE ASSIGN expr   { Assign($1, $3)         }
  | VARIABLE LPAREN args_opt RPAREN { Call($1, $3)  }
  | LPAREN expr RPAREN { $2                   }
  /* Class */
  | VARIABLE DOT VARIABLE { ObjAccess($1, $3) }
  | VARIABLE DOT VARIABLE LPAREN args_opt RPAREN { ObjCall($1, $3, $5) }
  | THIS DOT VARIABLE { ThisAccess($3) }
  | THIS DOT VARIABLE LPAREN args_opt RPAREN { ThisCall($3, $5) }
  /* Arrays */
  | VARIABLE LBRACK INT_LIT RBRACK { ArrayAccess($1, $3) }
  | LBRACK args_list RBRACK { ArrayLit($2) }

args_opt:
    /* nothing */ { [] }
  | args_list  { List.rev $1 }

args_list:
    expr                    { [$1] }
  | args_list COMMA expr { $3 :: $1 }