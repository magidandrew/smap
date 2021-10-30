%{ open Ast %}


%token EOF ASSIGN SEMICOLON PROBCOLON COMMA IF ELIF ELSE
// scoping
%token LBRACKET RBRACKET LBRACE RBRACE LPAREN RPAREN

// operators
%token PLUS MINUS TIMES DIVIDE RSHIFT LSHIFT
%token ADDEQUAL MINUSEQUAL TIMESEQUAL DIVEQUAL WHILE FOR
%token AND OR NOT

// primitives
%token INT CHAR BOOL STRING FLOAT PROB LIST VOID RETURN

%token SWITCH CASE DEFAULT BREAK CONTINUE FUNCTION

// comments
%token COMMENTLINE COMMENTOPEN COMMENTCLOSE

//comparison
%token COMPEQ COMPLT COMPLEQ COMPGT COMPGEQ COMPNEQ

//true false
%token <bool> BLIT

%token <int> LITERAL
%token <string> VAR

%left SEMICOLON
%left IF ELSE THEN
%right ASSIGN

%left PLUS MINUS
%left TIMES DIVIDE

%left ADDEQUAL MINUSEQUAL TIMESEQUAL DIVEQUAL COMPEQ COMPLT COMPLEQ RSHIFT LSHIFT
%left COMPGT COMPGEQ COMPNEQ

%start expr
%type <Ast.expr> expr

%%


expr:
  expr PLUS   expr      { Binop($1, $3) }
| expr MINUS  expr      { Binop($1, $3) }
| expr TIMES  expr      { Binop($1, $3) }
| expr DIVIDE expr      { Binop($1, $3) }
| expr ADDEQUAL expr    { Binop($1, $3) }
| expr MINUSEQUAL expr  { Binop($1, $3) }
| expr TIMESEQUAL expr  { Binop($1, $3) }
| expr DIVEQUAL expr    { Binop($1, $3) }
| RSHIFT expr           { ShiftExec($2) }
| LSHIFT expr           { ShiftExec($2) }
| expr COMPEQ expr      { Binop($1, $3) }
| expr COMPLT expr      { Binop($1, $3) }
| expr COMPLEQ expr     { Binop($1, $3) }
| expr COMPGT expr      { Binop($1, $3) }
| expr COMPGEQ expr     { Binop($1, $3) }
| expr COMPNEQ expr     { Binop($1, $3) }
| LITERAL               { Literal($1) }
| VAR                   { Var($1) }
| VAR ASSIGN expr       { Assignment($1, $3) }

stmt_list:
  /* nothing */       { [] }
| stmt_list stmt      { $2 :: $1 }


stmt: 
  expr SEMICOLON                      {  }
| WHILE LPAREN expr RPAREN stmt       {  }
| IF LPAREN expr RPAREN stmt ELSE stmt                                             {  }
| IF LPAREN expr RPAREN stmt ELIF stmt                                             {  }
| FOR LPAREN expr_opt SEMICOLON expr_opt SEMICOLON expr_opt SEMICOLON RPAREN stmt  {  }
| WHILE LPAREN expr RPAREN stmt       {  }
| IF LPAREN expr RPAREN stmt ELSE stmt                                             {  }
| IF LPAREN expr RPAREN stmt ELIF stmt                                             {  }

//check what is the prec used for

expr_opt:
  /* nothing */       { Noexpr }
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
