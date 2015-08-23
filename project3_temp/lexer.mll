{
  open Lexing
  open Parser
  open Range
  
  exception Lexer_error of Range.t * string

  let pos_of_lexpos (p:Lexing.position) : pos =
    mk_pos (p.pos_lnum) (p.pos_cnum - p.pos_bol)
    
  let mk_lex_range (p1:Lexing.position) (p2:Lexing.position) : Range.t =
    mk_range p1.pos_fname (pos_of_lexpos p1) (pos_of_lexpos p2)

  let lex_range lexbuf : Range.t = mk_lex_range (lexeme_start_p lexbuf)
      (lexeme_end_p lexbuf)

  let reset_lexbuf (filename:string) lexbuf : unit =
    lexbuf.lex_curr_p <- {
      pos_fname = filename;
      pos_cnum = 0;
      pos_bol = 0;
      pos_lnum = 1;
    }

  let newline lexbuf =
    lexbuf.lex_curr_p <- { (lexeme_end_p lexbuf) with
      pos_lnum = (lexeme_end_p lexbuf).pos_lnum + 1;
      pos_bol = (lexeme_end lexbuf) }
    
  (* Boilerplate to define exceptional cases in the lexer. *)
  let unexpected_char lexbuf (c:char) : 'a =
    raise (Lexer_error (lex_range lexbuf,
        Printf.sprintf "Unexpected character: '%c'" c))

}

(* Declare your aliases (let foo = regex) and rules here. *)
let newline = '\n' | ('\r' '\n') | '\r'
let lowercase = ['a'-'z']
let uppercase = ['A'-'Z']
let character = uppercase | lowercase
let whitespace = ['\t' ' ']
let digit = ['0'-'9']
let hexdigit = ['0'-'9'] | ['a'-'f'] | ['A'-'F']

rule token = parse
  | eof { EOF }
  | "if" { IF (lex_range lexbuf) }
  | "int" { TINT (lex_range lexbuf) }
  | "else" { ELSE (lex_range lexbuf) }
  | "while" { WHILE (lex_range lexbuf) }
  | "for" { FOR (lex_range lexbuf) }
  | "return" { RETURN (lex_range lexbuf) }
  | character (digit | character | '_')* { IDENT (lex_range lexbuf, lexeme lexbuf) }
  | digit+ | "0x" hexdigit+ { INT (lex_range lexbuf, (Int32.of_string (lexeme lexbuf))) }
  | whitespace+ { token lexbuf }
  | newline { newline lexbuf; token lexbuf }

  | ';' { SEMI (lex_range lexbuf) }
  | ',' { COMMA (lex_range lexbuf) }
  | '{' { LBRACE (lex_range lexbuf) }
  | '}' { RBRACE (lex_range lexbuf) }
  | '+' { PLUS (lex_range lexbuf) }
  | '-' { DASH (lex_range lexbuf) }
  | '*' { STAR (lex_range lexbuf) }
  | '=' { EQ (lex_range lexbuf) }
  | "==" { EQEQ (lex_range lexbuf) }
  | "<<" { LTLT (lex_range lexbuf) }
  | ">>" { GTGT (lex_range lexbuf) }
  | ">>>" { GTGTGT (lex_range lexbuf) }
  | "!=" { BANGEQ (lex_range lexbuf) }
  | '<' { LT (lex_range lexbuf) }
  | "<=" { LTEQ (lex_range lexbuf) }
  | '>' { GT (lex_range lexbuf) }
  | ">=" { GTEQ (lex_range lexbuf) }
  | '!' { BANG (lex_range lexbuf) }
  | '~' { TILDE (lex_range lexbuf) }
  | '&' { AMPER (lex_range lexbuf) }
  | '|' { BAR (lex_range lexbuf) }
  | '(' { LPAREN (lex_range lexbuf) }
  | ')' { RPAREN (lex_range lexbuf) }
  | _ as c { unexpected_char lexbuf c }
