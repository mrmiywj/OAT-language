(** A compilation unit is a collection of labeled, global data. It is processed by the assembler to produce an object file.  
    @author Steve Zdancewic
  *)

(** {2 Global Data Values} *)

type global =
| GStringz of string      (** null-terminated string *)
| GSafeStringz of string  (** null-terminated string prefixed by its length *)
| GLabelOffset of X86.lbl * int32 (** A label with offset *)
| GLabels of X86.lbl list (** labels *)
| GInt32 of int32         (** literal [int32] value *)
| GZero  of int           (** n bytes of zeroed memory *)
| GExtern                 (** Defined outside this compilation unit *)

type global_data = {
  link   : bool;          (** Determines whether this label is exposed outside the compilation unit *)
  label  : X86.lbl;       (** The label of this data *)
  value  : global;        (** The value stored at this label *)
}


(** {2 Compilation Units} *)

(** A component is either code or data *)
type component =
| Code of X86.insn_block
| Data of global_data

(** A compilation unit is just a list of components *)
type cunit = component list

(** {2 Pretty Printing }*)

(** Returns the string corresponding to the global data *)
val string_of_global_data : global_data -> string

(** Returns the string corresponding to the compilation unit *)
val string_of_cunit : cunit -> string

(** Writes a compilation unit given the provided printing function *)
val serialize_cunit : cunit -> (string -> unit) -> unit

(** Writes a compilation unit to the given output channel *)
val output_cunit : cunit -> out_channel -> unit

