(* compiler.mli *)
(* A compiler for simple arithmetic expressions. *)

(* Parses an expression from the given lexbuf.  

   The first argument is the filename (or "stdin") from
   which the program is read -- it is used to generate
   error messages.
*)
val parse : string -> Lexing.lexbuf -> Ast.exp


(* Builds a globally-visible X86 instruction block that acts like the C fuction:

   int program(int X) { return <expression>; }

   Follows cdecl calling conventions and platform-specific name mangling policy. *)
val compile_exp : Ast.exp -> Cunit.cunit


