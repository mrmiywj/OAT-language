(** A simple 32-bit only subset of X86.  See the additional documentation in 
    {{:http://www.cis.upenn.edu/~cis341/hw/project1/x86lite.html}X86lite}
    @author Steve Zdancewic 
*)
open Format 
(** {2 Labels} *)

(** The type of labels *)
type lbl = string

(** Generate a unique label (except for abuses of mk_lbl_named) *)
val mk_lbl : unit -> lbl

(** Generate a label containing the given string *)
val mk_lbl_hint  : string -> lbl

(** Force a label to have a particular string representation -- dangerous! *)
val mk_lbl_named : string -> lbl




(** {2 Registers } *)

(** 32-bit general-purpose registers *)
(**)
type reg =
  | Eax (** Accumulator for operands and results data *)
  | Ebx (** Pointer to data in the DS segment *)
  | Ecx (** Counter for string/loop operations *)
  | Edx (** I/O pointer *)
  | Esi (** Pointer to data in the segment pointed to by DS; string src ptr *)
  | Edi (** Pointer to data in segment pointed to by ES; string dst ptr *)
  | Ebp (** Pointer to data on the stack *)
  | Esp (** Stack pointer *)




(** {2 Operands} *)

(** X86 supports several different kinds of instruction operands.*)

(** A displacement is either an [int32] or a [lbl] *)
type disp =
	| DImm of int32
	| DLbl of lbl

(** An indirect offset is calculated as

    [Base + (Index * Scale) + Displacement] 
*)
type ind = {
    i_base : reg option;           (** Base. *)
    i_iscl : (reg * int32) option; (** Index must not be ESP *)
    i_disp : disp option           (** Constant displacement *)
  }

(** Instruction Operands *)
type opnd =
  | Imm of int32 (** Immediate int32 value. *)
  | Lbl of lbl   (** Immediate label value. *)
  | Reg of reg   (** Register operand. *)
  | Ind of ind   (** Indirect operand*)


val eax : opnd
val ebx : opnd
val ecx : opnd
val edx : opnd
val esi : opnd
val edi : opnd
val ebp : opnd
val esp : opnd

(** 32bit int constant operand *)
val i32 : int32 -> opnd

(** Stack offset operands *)
val stack_offset : int32 -> opnd

(** Label as indirect operand *)
val deref_lbl : lbl -> opnd

(** {2 Condition codes} *)

type cnd = 
  | Sgt 
  | Sge 
  | Slt 
  | Sle
  | Eq 
  | NotEq 
  | Zero    (** same as Eq *) 
  | NotZero (** same as NotEq *)

(** {2 Instructions } 
    In general, this module follows the Intel syntax convention
    where the destination appears before the source. Remember that two
    memory locations generally cannot be used in one instruction (and that
    it doesn't make any sense to use a direct immediate as a destination
    operand). Note that this is _not_ nearly a comprehensive list of
    instructions (and in fact many variants of these instructions have been
    omitted). *)


type insn =
  | Add of opnd * opnd       (** DEST <- DEST + SRC R:<OSZ> *)
  | Neg of opnd              (** DEST <- NEG DEST (two's complement negation)
                                 R*:<OSZ>; O=1 if DEST is MIN_INT>*)
  | Sub of opnd * opnd       (** DEST <- DEST - SRC R:<OSZ> *)
  | Lea of reg * ind         (** DEST <- SRC, (calc. as addr) <>*)
  | Mov of opnd * opnd       (** DEST <- SRC, both same types <> *)
  
  | Shl of opnd * opnd       (** DEST <- DEST SHL AMT; AMT = imm or ECX
                                 R*:<OSZ>;
                                  O=defined only for 1-bit shifts; 1 if top two bits different, else 0 *)
  | Sar of opnd * opnd       (** DEST <- DEST SAR AMT; AMT = imm or ECX
                                 R*:<OSZ>;
                                 O=defined only for 1-bit shifts; set to 0 *)
  | Shr of opnd * opnd       (** DEST <- DEST SHR AMT; AMT = imm or ECX
                                 R*:<OSZ>;
                                 O=defined only for 1-bit shifts; set to MSB of original operand *)
  
  | Not of opnd              (** DEST <- NOT DEST (one's complement negation) <> *)
  | And of opnd * opnd       (** DEST <- DEST AND SRC R*:<OSZ>, O=0>*)
  | Or  of opnd * opnd       (** DEST <- DEST OR SRC R*:<OSZ>, O=0> *)
  | Xor of opnd * opnd       (** DEST <- DEST XOR SRC R*:<OSZ>, O=0>*)
  
  | Push of opnd             (** PUSH SRC *)
  | Pop  of opnd             (** DEST <- POP *)
	
  | Cmp of opnd * opnd       (** FLAGS <- SRC1 - sext_if_imm(SRC2)
                                 R:<OSZ>, set as in Sub> *)
  | Setb of opnd * cnd       (** DEST's low-order byte <- c ? 1 : 0;
                                 If used with a register DEST, DEST must be eax ebx ecx or edx.*)

  | Jmp of opnd              (** PC <- SRC <> *)
  | Call of opnd             (** PUSH PC; PC <- SRC <> *)
  | Ret                      (** PC <- top-of-stack <> *)
  | J of cnd * lbl           (** PC <- c ? SRC : NEXT_PC <> *)
  
  | Imul of reg * opnd       (** DEST <- DEST *sign SRC
                                 R*:<OSZ>; O=1 when result truncated; SZ undefined>  *)

(** {2 Instruction Blocks} *)

(** An insn block (with a label and a list of instructions). *)
type insn_block = {
  global : bool;
  label : lbl;
  insns : insn list;
}


(** Make a non-global instruction block with a particular label. *)
val mk_insn_block : lbl -> insn list -> insn_block

(** Make a non-global anonymous instruction block, generating a fresh label for it. *)
val mk_ainsn_block : insn list -> (lbl * insn_block)

(** Make an explicitly named non-global insn block. *)
val mk_block : string -> insn list -> insn_block

(** {2 Pretty Printing} *)

(** Returns the string corresponding to a given label *)
val string_of_lbl : lbl -> string

(** Returns the string corresponding to a given index *)
val string_of_ind  : ind -> string

(** Returns the string corresponding to a given register *)
val string_of_reg : reg -> string

(** Returns the string corresponding to a given operand *)
val string_of_opnd : opnd -> string

(** Returns the string corresponding to a given condition code *)
val string_of_cnd : cnd -> string

(** Returns the string corresponding to a given instruction *)
val string_of_insn : insn -> string

(** Returns the string corresponding to a given instruction block *)
val string_of_insn_block : insn_block -> string

(** Writes an instruction block using the provided printing function. *)
val serialize_insn_block : insn_block -> (string -> unit) -> unit

val pp_insn: formatter -> insn -> unit    
val pp_insn_block: formatter -> insn_block -> unit
val pp_opnd: formatter -> opnd -> unit
