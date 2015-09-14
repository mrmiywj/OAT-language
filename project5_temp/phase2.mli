(* phase2.mli *)

(* Builds a globally-visible X86 instruction block that acts like the C fuction:
   int program() { <prog> }
   Follows cdecl calling conventions and platform-specific name mangling policy. *)
val compile_prog : Ll.prog -> Cunit.cunit
