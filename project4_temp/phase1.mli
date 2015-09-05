(* phase1.mli *)

(* Compiles the source AST to its LL representation *)
val cmp_toplevel : Range.t Ast.prog -> Ll.prog

