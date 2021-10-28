type token =
  | PLUS
  | MINUS
  | TIMES
  | DIVIDE
  | EOF
  | ASSIGN
  | SEMICOLON
  | IF
  | THEN
  | ELSE
  | HOWDY
  | LITERAL of (int)
  | VAR of (string)

val expr :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Ast.expr
