# 1 "lexer.mll"
 
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
    
  (* Boilerplate to define exceptional cases in the lexer. *)
  let unexpected_char lexbuf (c:char) : 'a =
    raise (Lexer_error (lex_range lexbuf,
        Printf.sprintf "Unexpected character: '%c'" c))


# 33 "lexer.ml"
let __ocaml_lex_tables = {
  Lexing.lex_base = 
   "\000\000\232\255\233\255\234\255\235\255\237\255\238\255\239\255\
    \002\000\003\000\006\000\007\000\250\255\251\255\252\255\002\000\
    \014\000\021\000\255\255\249\255\248\255\242\255\247\255\241\255\
    \017\000\245\255\240\255";
  Lexing.lex_backtrk = 
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \019\000\012\000\011\000\023\000\255\255\255\255\255\255\002\000\
    \002\000\001\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \009\000\255\255\255\255";
  Lexing.lex_default = 
   "\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \255\255\255\255\255\255\255\255\000\000\000\000\000\000\255\255\
    \255\255\255\255\000\000\000\000\000\000\000\000\000\000\000\000\
    \255\255\000\000\000\000";
  Lexing.lex_trans = 
   "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\015\000\015\000\015\000\015\000\015\000\000\000\015\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\015\000\
    \015\000\000\000\000\000\015\000\000\000\000\000\000\000\000\000\
    \016\000\008\000\015\000\000\000\000\000\000\000\007\000\000\000\
    \003\000\002\000\012\000\013\000\000\000\005\000\015\000\000\000\
    \017\000\017\000\017\000\017\000\017\000\017\000\017\000\017\000\
    \017\000\017\000\000\000\019\000\010\000\011\000\009\000\026\000\
    \023\000\024\000\022\000\021\000\020\000\017\000\017\000\017\000\
    \017\000\017\000\017\000\017\000\017\000\017\000\017\000\025\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \014\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\006\000\000\000\004\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \018\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000";
  Lexing.lex_check = 
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\000\000\000\000\015\000\015\000\000\000\255\255\015\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\016\000\
    \016\000\255\255\255\255\016\000\255\255\255\255\255\255\255\255\
    \000\000\000\000\015\000\255\255\255\255\255\255\000\000\255\255\
    \000\000\000\000\000\000\000\000\255\255\000\000\016\000\255\255\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\255\255\016\000\000\000\000\000\000\000\008\000\
    \009\000\009\000\010\000\010\000\011\000\017\000\017\000\017\000\
    \017\000\017\000\017\000\017\000\017\000\017\000\017\000\024\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\000\000\255\255\000\000\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255";
  Lexing.lex_base_code = 
   "";
  Lexing.lex_backtrk_code = 
   "";
  Lexing.lex_default_code = 
   "";
  Lexing.lex_trans_code = 
   "";
  Lexing.lex_check_code = 
   "";
  Lexing.lex_code = 
   "";
}

let rec token lexbuf =
    __ocaml_lex_token_rec lexbuf 0
and __ocaml_lex_token_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 38 "lexer.mll"
        ( EOF )
# 143 "lexer.ml"

  | 1 ->
# 39 "lexer.mll"
           (INT (lex_range lexbuf, (Int32.of_string(lexeme lexbuf))))
# 148 "lexer.ml"

  | 2 ->
# 40 "lexer.mll"
                ( token lexbuf )
# 153 "lexer.ml"

  | 3 ->
# 41 "lexer.mll"
        ( X (lex_range lexbuf) )
# 158 "lexer.ml"

  | 4 ->
# 42 "lexer.mll"
        (PLUS (lex_range lexbuf) )
# 163 "lexer.ml"

  | 5 ->
# 43 "lexer.mll"
        (TIMES (lex_range lexbuf) )
# 168 "lexer.ml"

  | 6 ->
# 44 "lexer.mll"
             (MINUS (lex_range lexbuf) )
# 173 "lexer.ml"

  | 7 ->
# 45 "lexer.mll"
         (EQ (lex_range lexbuf))
# 178 "lexer.ml"

  | 8 ->
# 46 "lexer.mll"
         (SHL (lex_range lexbuf))
# 183 "lexer.ml"

  | 9 ->
# 47 "lexer.mll"
         (SAR (lex_range lexbuf))
# 188 "lexer.ml"

  | 10 ->
# 48 "lexer.mll"
          (SHR (lex_range lexbuf))
# 193 "lexer.ml"

  | 11 ->
# 49 "lexer.mll"
        (LT (lex_range lexbuf))
# 198 "lexer.ml"

  | 12 ->
# 50 "lexer.mll"
        (GT (lex_range lexbuf))
# 203 "lexer.ml"

  | 13 ->
# 51 "lexer.mll"
         (LTE (lex_range lexbuf))
# 208 "lexer.ml"

  | 14 ->
# 52 "lexer.mll"
         (GTE (lex_range lexbuf))
# 213 "lexer.ml"

  | 15 ->
# 53 "lexer.mll"
         (NEQ (lex_range lexbuf))
# 218 "lexer.ml"

  | 16 ->
# 54 "lexer.mll"
        (AND (lex_range lexbuf))
# 223 "lexer.ml"

  | 17 ->
# 55 "lexer.mll"
        (OR (lex_range lexbuf))
# 228 "lexer.ml"

  | 18 ->
# 56 "lexer.mll"
        (NEG (lex_range lexbuf))
# 233 "lexer.ml"

  | 19 ->
# 57 "lexer.mll"
        (LOGNOT (lex_range lexbuf))
# 238 "lexer.ml"

  | 20 ->
# 58 "lexer.mll"
        (NOT (lex_range lexbuf))
# 243 "lexer.ml"

  | 21 ->
# 59 "lexer.mll"
        (LPAREN (lex_range lexbuf))
# 248 "lexer.ml"

  | 22 ->
# 60 "lexer.mll"
        (RPAREN (lex_range lexbuf))
# 253 "lexer.ml"

  | 23 ->
let
# 61 "lexer.mll"
         c
# 259 "lexer.ml"
= Lexing.sub_lexeme_char lexbuf lexbuf.Lexing.lex_start_pos in
# 61 "lexer.mll"
           ( unexpected_char lexbuf c )
# 263 "lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf; 
      __ocaml_lex_token_rec lexbuf __ocaml_lex_state

;;

