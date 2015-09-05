type ctxt

val empty_ctxt : ctxt
val in_locals : string -> ctxt -> bool
val in_globals : string -> ctxt -> bool
val lookup_local : string -> ctxt -> Ast.typ option
val add_local : string -> Ast.typ -> ctxt -> ctxt
val lookup_global_fn : string -> ctxt -> Ast.ftyp option
val lookup_global_val : string -> ctxt -> Ast.typ option
val add_global_fn : string -> Ast.ftyp -> ctxt -> ctxt
val add_global_val : string -> Ast.typ -> ctxt -> ctxt
