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
%left IF ELSE 
%right ASSIGN

%left CONCAT
%left PLUS MINUS
%left TIMES DIVIDE

%right OVERLAP
%left ADDEQUAL MINUSEQUAL TIMESEQUAL DIVEQUAL COMPEQ COMPLT COMPLEQ RSHIFT LSHIFT 
%left COMPGT COMPGEQ COMPNEQ

%left PROBCOLON COMMA DOT LENGTH

%start expr
%type <Ast.expr> expr

%%


expr:
/* simple binary expressions */
  expr PLUS   expr                                { Binop($1, $3) }
| expr MINUS  expr                                { Binop($1, $3) }
| expr TIMES  expr                                { Binop($1, $3) }
| expr DIVIDE expr                                { Binop($1, $3) }
| expr COMPEQ expr                                { Binop($1, $3) }
| expr COMPLT expr                                { Binop($1, $3) }
| expr COMPLEQ expr                               { Binop($1, $3) }
| expr COMPGT expr                                { Binop($1, $3) }
| expr COMPGEQ expr                               { Binop($1, $3) }
| expr COMPNEQ expr                               { Binop($1, $3) }
/* literal expressions */
| INT_LIT                                         { Blank         }
| BOOL_LIT                                        { Blank         }
| STRING_LIT                                      { Blank         }
| FLOAT_LIT                                       { Blank         }
| CHAR_LIT                                        { Blank         }
/* identifier */
| ID                                              { Var($1) }
/* assignment expressions*/
| ID ASSIGN expr                                  { Assignment($1, $3) }
| ID ADDEQUAL expr                                { Blank  }
| ID MINUSEQUAL expr                              { Blank   }
| ID TIMESEQUAL expr                              { Blank   }
| ID DIVEQUAL expr                                { Blank  }
/* List expressions*/
| expr CONCAT expr                                { Blank                }
| expr OVERLAP expr PROBCOLON                     { Blank                }
| expr RSHIFT expr                                { Blank                }
| expr LSHIFT expr                                { Blank                }
| expr RSHIFT expr PROBCOLON expr                 { Blank                }
| expr LSHIFT expr PROBCOLON expr                 { Blank                }
| PROB typ ID ASSIGN list PROBCOLON list          { Prob($2, $3) }        //declaring a prob
| typ ID ASSIGN ID DOT LENGTH                     { Prob($1, $2) }        // Assigning length to a variable   
| PROB list typ ID                                { Prob($3, $4) }   
| ID LBRACKET COMPLT RBRACKET ASSIGN expr SEMICOLON  {Assertassign($6)}       //Using Assertassign because it takes in one value; this is incorrect but we don't have to worry about matching it with ast   
| ID LBRACKET COMPGT RBRACKET ASSIGN expr SEMICOLON  {Assertassign($6)}       //Using Assertassign bc it takes in one value; this is incorrect but we don't have to worry about matching it with ast

expr_list:
  expr                  { [$1] }
| expr_list COMMA expr  { $3 :: $1 }




stmt_list:
  /* nothing */       { [] }
| stmt_list stmt      { $2 :: $1 }

block:
| LBRACE stmt_list RBRACE {Blank}

stmt: 
  expr SEMICOLON                                                                   {  }
| expr PROBCOLON                                                                   {  }
| expr COMMA                                                                       {  } 
| WHILE LPAREN expr RPAREN stmt                                                    {  }
| IF LPAREN expr RPAREN block ELSE block                                             {  }
| IF LPAREN expr RPAREN block ELIF block                                            {  }
| FOR LPAREN expr_opt SEMICOLON expr_opt SEMICOLON expr_opt SEMICOLON RPAREN block  {  }
| WHILE LPAREN expr RPAREN block                                                    {  }
| IF LPAREN expr RPAREN block ELSE block                                            {  }
| IF LPAREN expr RPAREN block ELIF block                                            {  }
| block                                                                            {  }
| SWITCH LPAREN expr RPAREN LBRACE case_block RBRACE                                {  }


case:
| CASE expr PROBCOLON stmt_list {}

case_list:
| /*nothing */   { []       }
| case_list case { $2 :: $1 }

case_block:
| case_list DEFAULT PROBCOLON stmt_list {}

decls: 
  /* nothing */ { ([], []) }
| decls vdecl { (($2 :: fst $1), snd $1) } 
| decls fdecl { (fst $1, ($2 :: snd $1)) }


fdecl: typ ID LPAREN formals_opt RPAREN              //we had to exclude the body arg 
LBRACE vdecl_list stmt_list RBRACE                    //it was giving a error
{{ typ = $1; fname = $2; formals = List.rev $4;
  locals = List.rev $7; 
  }}

formals_opt: 
  /* nothing */ { [] } 
| formal_list { $1 }

formal_list: 
typ ID    { [($1,$2)] }
| formal_list COMMA typ ID { ($3,$4) :: $1 }

vdecl_list: 
/* nothing */ { [] }
| vdecl_list vdecl { $2 :: $1 } 

vdecl: 
typ ID SEMICOLON { ($1, $2) }


list:
| LIST typ ID ASSIGN LBRACE expr RBRACE SEMICOLON                                 {  }     
| LIST typ ID SEMICOLON                                                           {  }   

//check what is the prec used for

expr_opt:
/* nothing */         { Noexpr }
| expr                { Endof($1) }

args_opt:
  /* nothing */          { [] }
| args_list              { List.rev $1 }

args_list:
  expr                  { [$1] }
| args_list COMMA expr  { $3 :: $1 }

/* DECLARATIONS */
typ: 
  INT     { Int } 
| BOOL    { Bool }
| FLOAT   { Float } 
| VOID    { Void }
| CHAR    { Char }
| STRING  { String }