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

  let reset_lexbuf (filename:string) (lnum:int) lexbuf : unit =
    lexbuf.lex_curr_p <- {
      pos_fname = filename;
      pos_cnum = 0;
      pos_bol = 0;
      pos_lnum = lnum;
    }

  let newline lexbuf =
    lexbuf.lex_curr_p <- { (lexeme_end_p lexbuf) with
      pos_lnum = (lexeme_end_p lexbuf).pos_lnum + 1;
      pos_bol = (lexeme_end lexbuf) }
    
  (* Boilerplate to define exceptional cases in the lexer. *)
  let unexpected_char lexbuf (c:char) : 'a =
    raise (Lexer_error (lex_range lexbuf,
        Printf.sprintf "Unexpected character: '%c'" c))

  (* Lexing reserved words *)
  let reserved_words = [
  (* Keywords *)
  ("null", fun i -> NULL i);
  ("true", fun i -> TRUE i);
  ("false", fun i -> FALSE i);
  ("unit", fun i -> TUNIT i);
  ("bool", fun i -> TBOOL i);
  ("int", fun i -> TINT i);
  ("string", fun i -> TSTRING i);
  ("else", fun i -> ELSE i);
  ("if?", fun i -> IFNULL i);
  ("if", fun i -> IF i);
  ("cast", fun i -> CAST i);
  ("this", fun i -> THIS i);
  ("super", fun i -> SUPER i);
  ("fail", fun i -> FAIL i);
  ("for", fun i -> FOR i);
  ("while", fun i -> WHILE i);
  ("return", fun i -> RETURN i);
  ("new", fun i -> NEW i);
  ("fun", fun i -> FUN i);
  ("class", fun i -> CLASS i);
  ("extern", fun i -> EXTERN i);

  (* Symbols *)
  ( ";", fun i -> SEMI i);
  ( ",", fun i -> COMMA i);
  ( "{", fun i -> LBRACE i);
  ( "}", fun i -> RBRACE i);
  ( "+", fun i -> PLUS i);
  ( "-", fun i -> DASH i);
  ( "*", fun i -> STAR i);
  ( "=", fun i -> EQ i);
  ( "==", fun i -> EQEQ i);
  ( "<<", fun i -> LTLT i);
  ( ">>", fun i -> GTGT i);
  ( ">>>", fun i -> GTGTGT i);
  ( "!=", fun i -> BANGEQ i);
  ( "<", fun i -> LT i);
  ( "<=", fun i -> LTEQ i);
  ( ">", fun i -> GT i);
  ( ">=", fun i -> GTEQ i);
  ( "!", fun i -> BANG i);
  ( "~", fun i -> TILDE i);
  ( "&", fun i -> AMPER i);
  ( "|", fun i -> BAR i);
  ( "[&]", fun i -> IAND i);
  ( "[|]", fun i -> IOR i);
  ( "(", fun i -> LPAREN i);
  ( ")", fun i -> RPAREN i);
  ( "[", fun i -> LBRACKET i);
  ( "]", fun i -> RBRACKET i);
  ( "->", fun i -> ARROW i);
  ( "<:", fun i -> EXTEND i);
  ( ".", fun i -> DOT i);
  ( "?", fun i -> QUESTION i);
  ]

  type build_fun = Range.t -> Parser.token
  let (symbol_table : (string, build_fun) Hashtbl.t) = Hashtbl.create 1024
  let _ =
    List.iter (fun (str,f) -> Hashtbl.add symbol_table str f) reserved_words

  let create_token lexbuf =
    let str = lexeme lexbuf in 
    let r = lex_range lexbuf in
    try (Hashtbl.find symbol_table str) r 
    with _ -> IDENT (r, str)

  (* Lexing comments and strings *)
  let string_buffer = ref (String.create 2048)
  let string_end = ref 0
  let start_lex = ref (Range.start_of_range Range.norange)

  let start_pos_of_lexbuf lexbuf : pos =
    (pos_of_lexpos (lexeme_start_p lexbuf))

  let lex_long_range lexbuf : Range.t =
    let end_p = lexeme_end_p lexbuf in
    mk_range end_p.pos_fname (!start_lex) (pos_of_lexpos end_p)  

  let reset_str () = string_end := 0

  let add_str ch =
    let x = !string_end in
    let buffer = !string_buffer
    in
      if x = String.length buffer then
        begin
          let new_buffer = String.create (x*2) in
          String.blit buffer 0 new_buffer 0 x;
          String.set new_buffer x ch;
          string_buffer := new_buffer;
          string_end := x+1
        end
      else
        begin
          String.set buffer x ch;
          string_end := x+1
        end

  let get_str () = String.sub (!string_buffer) 0 (!string_end)

  (* Lexing directives *)
  let lnum = ref 1
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

  | "/*" { start_lex := start_pos_of_lexbuf lexbuf; comments 0 lexbuf }
  | '"' { reset_str(); start_lex := start_pos_of_lexbuf lexbuf; string false lexbuf }
  | '#' { let p = lexeme_start_p lexbuf in
          if p.pos_cnum - p.pos_bol = 0 then directive 0 lexbuf 
          else raise (Lexer_error (lex_long_range lexbuf,
            Printf.sprintf "# can only be the 1st char in a line.")) }

  | lowercase (digit | character | '_')* { create_token lexbuf }
  | uppercase (digit | character | '_')* 
    { CIDENT (lex_range lexbuf, lexeme lexbuf) }
  | digit+ | "0x" hexdigit+ { INT (lex_range lexbuf, (Int32.of_string (lexeme lexbuf))) }
  | whitespace+ { token lexbuf }
  | newline { newline lexbuf; token lexbuf }

  | ';' | ',' | '{' | '}' | '+' | '-' | '*' | '=' | "==" | "<<" | ">>" | ">>>"
  | "!=" | '<' | "<=" | '>' | ">=" | '!' | '~' | '&' | '|' | '(' | ')' | '[' 
  | ']' | "->" | "[|]" | "[&]" | "." | "<:" | "?" | "if?"
    { create_token lexbuf }

  | _ as c { unexpected_char lexbuf c }

and directive state = parse
  | whitespace+ { directive state lexbuf } 
  | digit+ { if state = 0 then 
               (lnum := int_of_string (lexeme lexbuf); 
                directive 1 lexbuf)
             else if state = 2 then directive 3 lexbuf
             else raise (Lexer_error (lex_long_range lexbuf,
               Printf.sprintf "Illegal directives")) }
  | '"' { if state = 1 then
            begin
              reset_str(); 
              start_lex := start_pos_of_lexbuf lexbuf; 
              string true lexbuf
            end 
          else raise (Lexer_error (lex_long_range lexbuf,
            Printf.sprintf "Illegal directives")) 
         }
  | newline { if state = 2 or state = 3 then
                begin 
                  reset_lexbuf (get_str()) !lnum lexbuf;
                  token lexbuf
                end 
              else raise (Lexer_error (lex_long_range lexbuf,
                Printf.sprintf "Illegal directives")) }
  | _ { raise (Lexer_error (lex_long_range lexbuf, 
          Printf.sprintf "Illegal directives")) }

and comments level = parse
  | "*/" { if level = 0 then token lexbuf
	   else comments (level-1) lexbuf }
  | "/*" { comments (level+1) lexbuf}
  | [^ '\n'] { comments level lexbuf }
  | "\n" { newline lexbuf; comments level lexbuf }
  | eof	 { raise (Lexer_error (lex_long_range lexbuf,
             Printf.sprintf "comments are not closed")) }

and string in_directive = parse
  | '"'  { if in_directive = false then
             STRING (lex_long_range lexbuf, get_str())
           else directive 2 lexbuf }  
  | '\\' { add_str(escaped lexbuf); string in_directive lexbuf }
  | '\n' { add_str '\n'; newline lexbuf; string in_directive lexbuf }
  | eof  { raise (Lexer_error (lex_long_range lexbuf,
             Printf.sprintf "String is not terminated")) }
  | _    { add_str (Lexing.lexeme_char lexbuf 0); string in_directive lexbuf }

and escaped = parse
  | 'n'    { '\n' }
  | 't'    { '\t' }
  | '\\'   { '\\' }
  | '"'    { '\034'  }
  | '\''   { '\'' }
  | ['0'-'9']['0'-'9']['0'-'9']
    {
      let x = int_of_string(lexeme lexbuf) in
      if x > 255 then
        raise (Lexer_error (lex_long_range lexbuf,
          (Printf.sprintf "%s is an illegal escaped character constant" (lexeme lexbuf))))
      else
        Char.chr x
    }
  | [^ '"' '\\' 't' 'n' '\'']
    { raise (Lexer_error (lex_long_range lexbuf,
        (Printf.sprintf "%s is an illegal escaped character constant" (lexeme lexbuf) ))) }

