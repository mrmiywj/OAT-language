type ctxt

(* Class signatures *)
type csig = { 
  ext: string option;              (* Super class id *)
  vtable: Ll.operand;              (* Vtable pointer operand *)
  ctor: Ll.fn;                     (* Constructor function signature *)
  fields: (string * Ll.ty) list;   (* Source field id -> type map *)
  methods: (string * Ll.fn) list;  (* Source method id -> sig map *)
}

val empty_ctxt : ctxt
val enter_local_scope : ctxt -> ctxt
val add_global : ctxt -> string -> Ll.operand -> Ll.global_initializer -> ctxt
val add_local : ctxt -> string -> Ll.operand -> ctxt
val add_external : ctxt -> string -> Ll.fn -> ctxt
val add_fn : ctxt -> string -> Ll.fn -> ctxt
val add_fdecl : ctxt -> Ll.fdecl -> ctxt
val lookup_local : string -> ctxt -> Ll.operand option
val lookup_global_val : string -> ctxt -> Ll.operand option
val lookup_fn : ctxt -> string -> Ll.fn
val get_globals : ctxt -> (Ll.operand * Ll.global_initializer) list
val get_fdecls : ctxt -> Ll.fdecl list

(* New in project 5 *)
val get_efdecls : ctxt -> Ll.fn list
val get_namedts : ctxt -> (string * Ll.ty) list
val get_csigs : ctxt -> (string * csig) list

val set_this : ctxt -> string option -> ctxt
val add_namedt : ctxt -> string -> Ll.ty -> ctxt
val add_csig : ctxt -> string -> csig -> ctxt 

val lookup_csig : ctxt -> string -> csig
val lookup_this : ctxt -> string
