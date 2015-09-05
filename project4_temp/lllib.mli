open Ll

(* Utilities for working with LL IR identifiers *)

(* Primitives for generating fresh uid and globally unique string
 * values *)
val mk_uid  : string -> uid
val mk_tmp: unit -> string

(* Generate fresh local or global identifiers *)
val gen_local : string -> id
val gen_global: string -> id


(* Package a type and id into an operand *)
val id_op : ty -> id -> operand

val uid_of_id : id -> uid

(* Convenience functions that compose the above id generation and op
 * packaging -- the id returned is the one used in the operand. *)
val gen_local_op  : ty -> string -> id * operand 
val gen_global_op : ty -> string -> id * operand 

(* For working with labels *)
val mk_lbl_hint : string -> lbl
val lbl_of_uid: uid -> X86.lbl  (* Needed? *)

(* General-purpose printing utilities *)
val pp_fdecl: (string -> unit) -> fdecl -> unit
val pp_prog : (string -> unit) -> prog -> unit  

(* Converting LL IR objects to strings *)
val string_of_uid : uid -> string
val string_of_ty : ty -> string
val string_of_operand : operand -> string
val string_of_prog : prog -> string

(* Write the LL IR to a file *)
val write_prog_to_file: string -> prog -> unit

(* Write to stdout for testing purposes *)
val output_ty : ty -> unit
val output_operand : operand -> unit
val output_insn  : insn -> unit
val output_terminator  : terminator -> unit
val output_block : bblock -> unit
val output_fdecl : fdecl -> unit
val output_prog  : prog  -> unit



