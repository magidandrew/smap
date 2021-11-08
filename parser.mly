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

%left PROBCOLON COMMA LENGTH

%nonassoc ELIF
%nonassoc ELSE
%nonassoc NOELSE
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
/* unary expressions     */
| MINUS expr                                      { Blank                }
| BITNOT expr                                      { Blank                }
| NOT expr                                      { Blank                }
| expr NOT                                      { Blank                }
| expr OCTOTHORPE                                      { Blank                }
/* literal expressions    */
| INT_LIT                                         { Blank                }
| BOOL_LIT                                        { Blank                }
| STRING_LIT                                      { Blank                }
| FLOAT_LIT                                       { Blank                }
| CHAR_LIT                                        { Blank                }
| LBRACKET expr_list_opt RBRACKET                 { Blank                }  
/* identifiers            */
| identifier                                      { $1}
/* List expressions       */
| ID LBRACKET COMPLT RBRACKET ASSIGN expr         { Blank                } /* add head */      
| ID LBRACKET COMPGT RBRACKET ASSIGN expr         { Blank                } /* add tail */
| expr CONCAT expr                                { Blank                }
| expr RSHIFT expr PROBCOLON expr                 { Blank                }
| expr LSHIFT expr PROBCOLON expr                 { Blank                } 
| ID LENGTH                                       { Blank }                /* also for prob types */
/*function call expression */
| ID LPAREN args_opt RPAREN                       { Blank                }

/* identifier */
identifier:
| ID                                               {Id($1)}             /* regular identifier      */
| ID LBRACKET expr RBRACKET                        {ListElement($1,$3)} /* indexing a list element */

/* assignment expressions */
assign_expr:
| identifier ASSIGN expr                                  { ($1, Assign, $3)      }
| identifier ADDEQUAL expr                                { ($1, PlusEqual, $3)                  }
| identifier MINUSEQUAL expr                              { ($1, MinusEqual, $3)                 }
| identifier TIMESEQUAL expr                              { ($1, TimesEqual, $3)                 }
| identifier DIVEQUAL expr                                { ($1, DivEqual, $3)                }

expr_opt:                            /* zero or one expressions */
                      { Noexpr }
| expr                { Blank  }

expr_list_opt:                       /* zero or more expressions */
                        { Blank }
| expr_list             { Blank }

expr_list:                           /* one or more expressions */
  expr                  { [$1] }
| expr_list COMMA expr  { $3 :: $1 }

args_opt: 
                     { []          } /* zero or more arguments */
| args_list          { List.rev $1 }

args_list:
  expr                  { [$1]     } /* one argument           */
| args_list COMMA expr  { $3 :: $1 } /* more than one argument */

/* STATEMENTS *********************************************************************************************/

stmt: /* statements end with either a semicolon or a block */
  expr SEMICOLON                                                                   {  Dummy   }
| assign_expr SEMICOLON                                                            {  Dummy   }
| BREAK SEMICOLON                                                                  {  Dummy   }
| CONTINUE SEMICOLON                                                               {  Dummy   }
| RETURN expr_opt SEMICOLON                                                        {  Dummy   }
| IF LPAREN expr RPAREN block                                                      {  Dummy   }
| IF LPAREN expr RPAREN block ELSE block                                           {  Dummy   }
| IF LPAREN expr RPAREN block ELIF block elif_list                                 {  Dummy   }
| IF LPAREN expr RPAREN block ELIF block elif_list ELSE block                      {  Dummy   }
| FOR LPAREN expr_opt SEMICOLON expr_opt SEMICOLON expr_opt SEMICOLON RPAREN block {  Dummy   }
| WHILE LPAREN expr RPAREN block                                                   {  Dummy   }

block:
| LBRACE stmt_list RBRACE { Dummy  }

stmt_list:
  /* nothing */       { Block([])      }  /* zero or more statements */
| stmt_list stmt      {Block([Dummy])  }

elif_list:
| /*nothing*/           { []     }        /* zero or more elif statements*/
| ELIF block elif_list  {$2 :: $3}


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
| typ_decl ID ASSIGN expr SEMICOLON { InitDecl (($1, $2),($2, Assign, $4))}  /* and optional initializer */


/* TYPE DECLARATIONS **************************************************************************************/
typ_decl:                               /* A type decl is composed of a list of types */
| spec_qual_list     {$1}

typ_spec: 
  INT     { Int } 
| BOOL    { Bool }
| FLOAT   { Float } 
| VOID    { Void }
| CHAR    { Char }
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
