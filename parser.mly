%{ open Ast %}


%token EOF ASSIGN SEMICOLON PROBCOLON COMMA IF ELIF ELSE
// scoping
%token LBRACKET RBRACKET LBRACE RBRACE
// operators
%token PLUS MINUS TIMES DIVIDE RSHIFT LSHIFT
%token ADDEQUAL MINUSEQUAL TIMESEQUAL DIVEQUAL WHILE FOR
// primitives
%token INT CHAR BOOL STRING FLOAT PROB LIST VOID

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

%start expr
%type <Ast.expr> expr

%%

expr:
  expr PLUS   expr {  }
| expr MINUS  expr {  }
| expr TIMES  expr {  }
| expr DIVIDE expr {  }
| LITERAL          {  }
// | VAR              { Var($1) }
// | VAR ASSIGN expr             { Assign($1, $3)     }
// | expr SEMICOLON expr         { Sequence($1, $3)   }
// | IF expr THEN expr ELSE expr { IfElse($2, $4, $6) }


