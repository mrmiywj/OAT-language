open Ll

(* Utilities for working with LL IR identifiers *)

(* Generate a fresh temporary name *)
val mk_tmp: unit -> string

(* Generate fresh local or global identifiers *)
val gen_local : string -> uid
val gen_global: string -> gid


(* Package a type and id into an operand *)
val id_op : ty -> uid -> operand

(* Convenience functions that compose the above id generation and op
 * packaging -- the id returned is the one used in the operand. *)
val gen_local_op  : ty -> string -> uid * operand 
val gen_global_op : ty -> string -> gid * operand 

(* For working with labels *)
val mk_lbl_hint : string -> lbl
val lbl_of_gid: gid -> X86.lbl  (* Needed? *)

(* General-purpose printing utilities *)
val pp_fdecl: (string -> unit) -> fdecl -> unit
val pp_prog : (string -> unit) -> prog -> unit  

(* Converting LL IR objects to strings *)
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



