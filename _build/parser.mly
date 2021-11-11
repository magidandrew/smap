%{ open Ast %}

/* TOKENS *************************************************************************************************/

%token EOF ASSIGN SEMICOLON PROBCOLON COMMA IF ELIF ELSE 
// scoping
%token LBRACKET RBRACKET LBRACE RBRACE LPAREN RPAREN

// operators
%token BITNOT BITAND BITOR XOR CONCAT
%token PLUS MINUS TIMES DIVIDE RSHIFT LSHIFT
%token ADDEQUAL MINUSEQUAL TIMESEQUAL DIVEQUAL WHILE FOR
%token AND OR NOT LENGTH OCTOTHORPE

// primitives
%token INT CHAR BOOL STRING FLOAT PROB LIST VOID RETURN

%token SWITCH CASE DEFAULT BREAK CONTINUE FUNCTION

// comments
%token COMMENTLINE COMMENTOPEN COMMENTCLOSE

//comparison
%token COMPEQ COMPLT COMPLEQ COMPGT COMPGEQ COMPNEQ

//literals
%token <bool>   BOOL_LIT
%token <int>    INT_LIT
%token <char>   CHAR_LIT
%token <float>  FLOAT_LIT
%token <string> STRING_LIT
//identifier
%token <string> ID


/* OPERATOR PRECEDENCE ************************************************************************************/

%left SEMICOLON
%right ASSIGN 


%left CONCAT 
%left PLUS MINUS
%left TIMES DIVIDE

%left ADDEQUAL MINUSEQUAL TIMESEQUAL DIVEQUAL COMPEQ COMPLT COMPLEQ RSHIFT LSHIFT 
%left COMPGT COMPGEQ COMPNEQ
%left BITOR BITAND BITNOT XOR
%left OCTOTHORPE 

%left COMMA LENGTH PROBCOLON

%nonassoc ELIF
%nonassoc ELSE
%nonassoc CAST
%right NOT

%start program
%type <Ast.program> program

%%

/* EXPRESSIONS ********************************************************************************************/
expr:
/* binary expressions    */
  expr PLUS   expr         { Binop($1, Add, $3)        }
| expr MINUS  expr         { Binop($1, Sub,  $3)       }
| expr TIMES  expr         { Binop($1, Mul, $3)        }
| expr DIVIDE expr         { Binop($1, Div, $3)        }
| expr COMPEQ expr         { Binop($1, CompEq, $3)     }
| expr COMPLT expr         { Binop($1, CompLt, $3)     }
| expr COMPLEQ expr        { Binop($1, CompLeq, $3)    }
| expr COMPGT expr         { Binop($1, CompGt, $3)     }
| expr COMPGEQ expr        { Binop($1, CompEq, $3)     }
| expr COMPNEQ expr        { Binop($1, CompNeq, $3)    }
| expr RSHIFT expr         { Binop($1, RShift, $3)     }
| expr LSHIFT expr         { Binop($1, LShift, $3)     }
| expr BITAND expr         { Binop($1, BitAnd, $3)     }
| expr BITOR expr          { Binop($1, BitOr, $3)      }
| expr XOR    expr         { Binop($1, Xor, $3)        }
/* unary expressions     */                     /* what is our syntax for negative numbers? */
| LPAREN MINUS expr RPAREN                      { Unop(Neg, $3)            } 
| BITNOT expr                                   { Unop(BitNot, $2)         }
| NOT expr                                      { Unop(Not, $2)            }
| expr NOT                                      { Unop(Bang, $1)           }
| expr OCTOTHORPE                               { Unop(Octothorpe, $1)     }
| LPAREN typ_decl RPAREN expr   %prec CAST      { Cast($2, $4)             } /* added this in for now. Hoping precedence is correct*/
/* literal expressions    */
| INT_LIT                                       { Int_lit ($1)             }
| BOOL_LIT                                      { Bool_lit($1)             }
| STRING_LIT                                    { String_lit($1)           } 
| FLOAT_LIT                                     { Float_lit ($1)           }
| CHAR_LIT                                      { Char_lit($1)             }
| list_lit                                      { $1                       }
/* identifiers            */
| identifier                                    { $1                       }
/* List expressions       */
| ID LBRACKET COMPLT RBRACKET ASSIGN expr       { ListAddHead($1,$6)       } /* add head */      
| ID LBRACKET COMPGT RBRACKET ASSIGN expr       { ListAddTail($1,$6)       } /* add tail */
| expr CONCAT expr                              { Binop($1, Concat, $3)    }
| expr RSHIFT expr PROBCOLON expr               { ListRightShift($1,$3,$5) }
| expr LSHIFT expr PROBCOLON expr               { ListLeftShift($1,$3,$5)  } 
| expr LENGTH                                   { Length($1)               } /* also for prob types */
/*function call expression */
| ID LPAREN args_opt RPAREN                     { FunCall ($1,$3)          }
/* parentheses around an expression*/
| LPAREN expr RPAREN                            { $2                       }

/* need to distinguish probability initialization from others' because of normalization requirement*/
/* any prob type bound to a name doesn't need special treatment here because it has already been   */
/* intialized and therefore normalized. (prob types with names count as inits of type Regular)*/

init:                            /* used in variable declaration rule and assignment expressions */
| expr      { Regular($1)  }     /* common case, includes prob types with names        */
| prob_init { Prob_Init($1)}     /* special case, unnamed prob types about to be bound */

prob_init:
| expr PROBCOLON expr               { ($1,$3)              } 

list_lit:
| LBRACKET expr_list_opt RBRACKET   { List_lit($2)         }

/* identifier */
identifier:
| ID                                { Id($1)               } /* regular identifier      */
| ID LBRACKET expr RBRACKET         { ListElement($1,$3)   } /* indexing a list element */

/* assignment expressions */
assign_expr:
| identifier ASSIGN init            { ($1, Assign, $3)     }
| identifier ADDEQUAL init          { ($1, PlusEqual,$3)   }
| identifier MINUSEQUAL init        { ($1, MinusEqual, $3) }
| identifier TIMESEQUAL init        { ($1, TimesEqual, $3) }
| identifier DIVEQUAL init          { ($1, DivEqual, $3)   }

expr_opt:                               /* zero or one expressions */
                        { Noexpr     }
| expr                  { $1      }

expr_list_opt:                          /* zero or more expressions */
                        { []          }
| expr_list             { $1          }

expr_list:                              /* one or more expressions */
  expr                  { [$1]        }
| expr_list COMMA expr  { $3 :: $1    }

args_opt: 
                        { []          } /* zero or more arguments */
| args_list             { List.rev $1 }

args_list:
  expr                  { [$1]        } /* one argument           */
| args_list COMMA expr  { $3 :: $1    } /* more than one argument */

/* STATEMENTS *********************************************************************************************/

stmt: /* statements end with either a semicolon or a block */
  expr SEMICOLON                                                                   { Expr($1)          }
| assign_expr SEMICOLON                                                            { Assign_stmt($1)   }
| BREAK SEMICOLON                                                                  { Break             }
| CONTINUE SEMICOLON                                                               { Continue          }
| RETURN expr_opt SEMICOLON                                                        { Return($2)        }
| if_stmt                                                                          { $1                }
| if_stmt ELSE block                                                               { If_Else($1,$3)    }
| if_stmt elif elif_list                                                           { If_Elif($1,$2,$3) }
| if_stmt elif elif_list ELSE block                                                { If_Elif_Else($1,$2,$3,$5)}
| FOR LPAREN expr_opt SEMICOLON expr_opt SEMICOLON expr_opt SEMICOLON RPAREN block { For($3,$5,$7,$10) }
| WHILE LPAREN expr RPAREN block                                                   { While($3,$5)      }

if_stmt: IF LPAREN expr RPAREN block                                               { If($3,$5)         }
elif:    ELIF LPAREN expr RPAREN  block                                            { Elif($3,$5)       }
block:   LBRACE stmt_list RBRACE                                                   { Block(List.rev $2)}

stmt_list:
  /* nothing */       { []     }           /* zero or more statements */
| stmt_list stmt      { $2::$1 }

elif_list:
| /*nothing*/           { []     }         /* zero or more elif statements*/
| elif elif_list        { $1::$2 }


program: decls EOF { $1 }                  /* a program consists of declarations and the EOF token*/
decls: 
  /* nothing */ { ([], []) }
| decls vdecl { (($2 :: fst $1), snd $1) } /* global variable declarations */
| decls fdecl { (fst $1, ($2 :: snd $1)) } /* function definitions         */


/* FUNCTION DECLARATIONS **********************************************************************************/
fdecl: typ_decl ID LPAREN formals_opt RPAREN     /* are we going to use the function keyword??*/         
LBRACE vdecl_list stmt_list RBRACE                    
{{ typ_name = $1; 
   fname = $2; 
   formals = List.rev $4;
   locals = List.rev $7; 
   body = $8; 
  }}                

formals_opt: 
/* nothing */ { [] }                              /* zero or more formal parameters                          */
| formal_list { $1 }

formal_list: 
  typ_decl ID                   { [($1,$2)]     } /* formal param consists of type declaration and identifer */
| formal_list COMMA typ_decl ID { ($3,$4) :: $1 } /* a list of formal params are separted by commas          */

vdecl_list: 
/* nothing */      { []       }                             /*      zero or more variable declarations  */
| vdecl_list vdecl { $2 :: $1 } 

vdecl:                                                      /*      a variable declaration consists of   */
typ_decl ID SEMICOLON { PlainDecl ($1, $2) }                /*      a type declaration and identifier,   */
| typ_decl ID ASSIGN init SEMICOLON { InitDecl (($1, $2),(Id($2), Assign, $4))}  /* and optional initializer */


/* TYPE DECLARATIONS **************************************************************************************/
typ_decl:                               /* A type decl is composed of a list of types */
| spec_qual_list     {$1}

typ_spec: 
  INT     { Int    } 
| BOOL    { Bool   }
| FLOAT   { Float  } 
| VOID    { Void   }
| CHAR    { Char   }
| STRING  { String }

typ_qual:
| PROB    { Prob }
| LIST    { List }

spec_qual_list:                         
| typ_spec spec_qual_list_opt {$1::$2}  /* int/bool/float/void/char/string, followed by zero or more types */
| typ_qual spec_qual_list {$1::$2}      /* list/prob, followed by at least on type */

spec_qual_list_opt:                     /* zero or more types */
| /*nothing*/    {[]}
| spec_qual_list {$1}
