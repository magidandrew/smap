type token =
  | EOF
  | ASSIGN
  | SEMICOLON
  | PROBCOLON
  | COMMA
  | IF
  | ELIF
  | ELSE
  | LBRACKET
  | RBRACKET
  | LBRACE
  | RBRACE
  | LPAREN
  | RPAREN
  | BITNOT
  | BITAND
  | BITOR
  | XOR
  | CONCAT
  | PLUS
  | MINUS
  | TIMES
  | DIVIDE
  | RSHIFT
  | LSHIFT
  | ADDEQUAL
  | MINUSEQUAL
  | TIMESEQUAL
  | DIVEQUAL
  | WHILE
  | FOR
  | AND
  | OR
  | NOT
  | LENGTH
  | OCTOTHORPE
  | INT
  | CHAR
  | BOOL
  | STRING
  | FLOAT
  | PROB
  | LIST
  | VOID
  | RETURN
  | SWITCH
  | CASE
  | DEFAULT
  | BREAK
  | CONTINUE
  | FUNCTION
  | COMMENTLINE
  | COMMENTOPEN
  | COMMENTCLOSE
  | COMPEQ
  | COMPLT
  | COMPLEQ
  | COMPGT
  | COMPGEQ
  | COMPNEQ
  | BOOL_LIT of (bool)
  | INT_LIT of (int)
  | CHAR_LIT of (char)
  | FLOAT_LIT of (float)
  | STRING_LIT of (string)
  | ID of (string)

val program :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Ast.program
