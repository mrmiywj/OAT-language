type ctxt = {
  this    : Ast.cid option;          (* Current class (cidopt) *)
  globals : Range.t Ast.gcontext;    (* Global values and Function type context *)
  locals  : Range.t Ast.lcontext;    (* Local variable context *)
  sigs    : Ast.signature;           (* Class signatures *)
}

val empty_ctxt : ctxt
val in_locals : string -> ctxt -> bool
val in_globals : string -> ctxt -> bool
val lookup_local : string -> ctxt -> Ast.typ option
val add_local : string -> Ast.typ -> ctxt -> ctxt
val lookup_global_fn : string -> ctxt -> Ast.ftyp option
val lookup_global_val : string -> ctxt -> Ast.typ option
val add_global_fn : string -> Ast.ftyp -> ctxt -> ctxt
val add_global_val : string -> Ast.typ -> ctxt -> ctxt


val add_class_sig : string -> string option -> Ast.fcontext -> Ast.typ list -> Ast.mcontext -> ctxt -> ctxt
val lookup_class_sig : string -> ctxt -> (string option * Ast.fcontext * Ast.typ list * Ast.mcontext) option

val set_this : string option -> ctxt -> ctxt
val lookup_this : ctxt -> string option
