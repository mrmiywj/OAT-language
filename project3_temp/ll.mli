(* A simplified subset of the LLVM IR *)

(* Unique identifiers and labels *)
type uid
type lbl = X86.lbl

val mk_uid  : string -> uid
val gen_sym : unit -> uid
val mk_lbl  : unit -> lbl

(* Operands *)  
type operand = Local of uid | Const of int32

(* Binary operations *)
type bop = Add | Sub | Mul | Shl | Lshr | Ashr | And | Or | Xor

(* Comparison operations *)
type cmpop = Eq | Ne | Slt | Sle | Sgt | Sge

(* Instructions *)
type insn = 
  | Binop of uid * bop * operand * operand  (* %uid := bop op1 op2    *)
  | Alloca of uid                           (* %uid := int32*         *)
  | Load of uid * operand                   (* %uid := [op1]          *)
  | Store of operand * operand              (* [op2] <- op1           *)
  | Icmp of uid * cmpop * operand * operand (* %uid := cmpop op1 op2  *)

(* Block terminators *)
type terminator = 
  | Ret of operand 
  | Br of lbl 
  | Cbr of operand * lbl * lbl

(* Basic blocks *)
type bblock =
    {label: lbl;
     insns: insn list;
     terminator: terminator
   }

(* Programs - with an entry point label *)
type prog = {ll_cfg: bblock list; ll_entry: lbl}


val serialize_prog : prog -> (string -> unit) -> unit
val string_of_prog : prog -> string
