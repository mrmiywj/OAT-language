type ctxt 

val empty_ctxt : ctxt
val enter_local_scope : ctxt -> ctxt
val add_global : ctxt -> string -> Ll.operand -> Ll.global_initializer -> ctxt
val add_local : ctxt -> string -> Ll.operand -> ctxt
val add_external : ctxt -> Ll.fn -> ctxt
val add_fn : ctxt -> Ll.fn -> ctxt
val add_fdecl : ctxt -> Ll.fdecl -> ctxt
val lookup_local : string -> ctxt -> Ll.operand option
val lookup_global_val : string -> ctxt -> Ll.operand option
val lookup_fn : string -> ctxt -> Ll.fn
val get_globals : ctxt -> (Ll.operand * Ll.global_initializer) list
val get_fdecls : ctxt -> Ll.fdecl list
