%{ open Ast %}


%token EOF ASSIGN SEMICOLON PROBCOLON COMMA IF ELIF ELSE 
// scoping
%token LBRACKET RBRACKET LBRACE RBRACE LPAREN RPAREN

// operators
%token BITNOT BITAND BITOR XOR CONCAT
%token PLUS MINUS TIMES DIVIDE RSHIFT LSHIFT
%token ADDEQUAL MINUSEQUAL TIMESEQUAL DIVEQUAL WHILE FOR
%token AND OR NOT OVERLAP DOT LENGTH

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



%left SEMICOLON
%right ASSIGN

%left CONCAT
%left PLUS MINUS
%left TIMES DIVIDE

%right OVERLAP
%left ADDEQUAL MINUSEQUAL TIMESEQUAL DIVEQUAL COMPEQ COMPLT COMPLEQ RSHIFT LSHIFT 
%left COMPGT COMPGEQ COMPNEQ

%left PROBCOLON COMMA DOT LENGTH

%nonassoc ELIF
%nonassoc ELSE
%nonassoc NOELSE
%right NOT

%start program
%type <Ast.program> program

%%


expr:
/* simple binary expressions */
  expr PLUS   expr                                { Binop($1, $3)        }
| expr MINUS  expr                                { Binop($1, $3)        }
| expr TIMES  expr                                { Binop($1, $3)        }
| expr DIVIDE expr                                { Binop($1, $3)        }
| expr COMPEQ expr                                { Binop($1, $3)        }
| expr COMPLT expr                                { Binop($1, $3)        }
| expr COMPLEQ expr                               { Binop($1, $3)        }
| expr COMPGT expr                                { Binop($1, $3)        }
| expr COMPGEQ expr                               { Binop($1, $3)        }
| expr COMPNEQ expr                               { Binop($1, $3)        }
/* literal expressions */
| INT_LIT                                         { Blank                }
| BOOL_LIT                                        { Blank                }
| STRING_LIT                                      { Blank                }
| FLOAT_LIT                                       { Blank                }
| CHAR_LIT                                        { Blank                }
| LBRACKET expr_list_opt RBRACKET                 { Blank                }  
/* identifier */
| ID                                              { Var($1)              }
/* List expressions*/
| ID LBRACKET COMPLT RBRACKET ASSIGN expr         { Blank                }       
| ID LBRACKET COMPGT RBRACKET ASSIGN expr         { Blank                } 
| expr CONCAT expr                                { Blank                }
| expr RSHIFT expr                                { Blank                }
| expr LSHIFT expr                                { Blank                }
| expr RSHIFT expr PROBCOLON expr                 { Blank                }
| expr LSHIFT expr PROBCOLON expr                 { Blank                } 
/*function call expression*/
| ID LPAREN args_opt RPAREN                       { Blank                }

/* assignment expressions*/
assign_expr:
| ID ASSIGN expr                                  { ($1, Assign, $3)      }
| ID ADDEQUAL expr                                { ($1, PlusEqual, $3)                  }
| ID MINUSEQUAL expr                              { ($1, MinusEqual, $3)                 }
| ID TIMESEQUAL expr                              { ($1, TimesEqual, $3)                 }
| ID DIVEQUAL expr                                { ($1, DivEqual, $3)                }


expr_list:
  expr                  { [$1] }
| expr_list COMMA expr  { $3 :: $1 }

expr_list_opt:
                        { Blank }
| expr_list             { Blank }

expr_opt:
                       { Noexpr }
| expr                { Blank }

stmt_list:
  /* nothing */       { Block([])  }
| stmt_list stmt      {Block([Dummy])  }

block:
| LBRACE stmt_list RBRACE { Dummy  }

stmt: 
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


elif_list:
| /*nothing*/            {[]}
| ELIF block elif_list  {$2 :: $3}


program: decls EOF { $1 }

decls: 
  /* nothing */ { ([], []) }
| decls vdecl { (($2 :: fst $1), snd $1) } /* global var declarations */
| decls fdecl { (fst $1, ($2 :: snd $1)) } /* function definitions    */


fdecl: typ_name ID LPAREN formals_opt RPAREN              
LBRACE vdecl_list stmt_list RBRACE                    
{{ typ_name = $1; 
   fname = $2; 
   formals = List.rev $4;
   locals = List.rev $7; 
   body = $8;
  }}

formals_opt: 
  /* nothing */ { [] } 
| formal_list { $1 }

formal_list: 
typ_name ID    { [($1,$2)] }
| formal_list COMMA typ_name ID { ($3,$4) :: $1 }

vdecl_list: 
/* nothing */ { [] }
| vdecl_list vdecl { $2 :: $1 } 

vdecl: 
typ_name ID SEMICOLON { PlainDecl ($1, $2) }
| typ_name assign_expr SEMICOLON { match $2 with
                                   | (a,_,_) -> InitDecl(($1,a),$2)}





args_opt:
          { [] }
| args_list              { List.rev $1 }

args_list:
  expr                  { [$1] }
| args_list COMMA expr  { $3 :: $1 }



/* DECLARATIONS */
typ_spec: 
  INT     { Int } 
| BOOL    { Bool }
| FLOAT   { Float } 
| VOID    { Void }
| CHAR    { Char }
| STRING  { String }


typ_qual:
| PROB    { Prob}
| LIST    { List }

typ_name:
| spec_qual_list     {$1}

spec_qual_list:
| typ_spec spec_qual_list_opt {$1::$2}
| typ_qual spec_qual_list_opt {$1::$2}

spec_qual_list_opt:
| /*nothing*/    {[]}
| spec_qual_list {$1}

/*
| typ_decl ID                                     { Blank                }
| expr PROBCOLON expr                             { Blank  }        //declaring a prob
| expr DOT LENGTH                                 { Blank  }        // getting length 




*/