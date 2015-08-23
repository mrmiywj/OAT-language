(* phase1.mli *)

(* Parses an expression from the given lexbuf.  

   The first argument is the filename (or "stdin") from
   which the program is read -- it is used to generate
   error messages.
*)
val parse : string -> Lexing.lexbuf -> Ast.prog
        
(* Compiles the source AST to its LL representation *)
val compile_prog : Ast.prog -> Ll.prog


