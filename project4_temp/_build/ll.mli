(* A simplified subset of the LLVM IR *)

(* The semantics of this language are intended to be the same as those
   described at: http://llvm.org/docs/LangRef.html *)

(* Unique identifiers and labels *)
type uid = int * string
type lbl = X86.lbl


(* LLVM IR types *)
(* Note that I8* is used only for dealing with C-style string
 * constants.  I1 is only for computing conditional tests.  Because we
 * target x86lite, we'll compile I1 to 32-bit integers in Phase2.  *)
type ty =  
  | I1 | I8 | I32         (*   integer types        *)
  | Ptr of ty             (*   t*                   *)
  | Struct of ty list     (*   { t1, t2, ... , tn } *)
  | Array of int32 * ty   (*   [ NNN x t ]          *)


(* Identifiers, excluding function names, which are always global. *)
type id = 
  | Local of uid    (* a local identifier *)
  | Global of uid   (* global identifier *)

(* Operands *)
type opn = 
  | Id    of id     (* An identifier *)
  | Const of int32  (* represents either an i1 or i32 constant *)

(* Typed operands *)
type operand = ty * opn

(* Binary operations *)
type bop = Add | Sub | Mul | Shl | Lshr | Ashr | And | Or | Xor      

(* Comparison Operators *)
type cmpop = Eq | Ne | Slt | Sle | Sgt | Sge

(* An LL function signature *)
type fn = {
    name: string;       (* always global *)
    rty: ty option;     
    ty_args: ty list;
  }
  
(* Instructions *)
type insn = 
  | Binop of id * bop * operand * operand
        (* "%t = bop ty %o1, %o2"  *)

  | Alloca of  id * ty
        (* "%s = alloca ty" *)

  | Load of id * operand 
        (* "%t = load ty %u" *)
        
  | Store of  operand * operand  (* -> *)
        (* "store ty %t, ty* %u" *)

  | Icmp of id * cmpop * operand * operand
        (* "%s = icmp %s i32 %s, %s"  *)

  | Call of id option * fn * operand list
        (* "%s = @fn(%1, %2, ...)" *) 
        (* "@fn(%1, %2, ...)" *)

  | Bitcast of id * operand * ty 
        (* "%t = bitcast ty1 %u to ty2" *)
        
  | Gep of id * operand * (operand list)
        (* %t = getelementptr ty* %u, i32 %v1, i32 %v2, ... *)


(* Block terminators *)
type terminator = 
  | Ret of operand option        (* "ret i32 %s" *)
  | Br of lbl                    (* "br label %lbl" *)
  | Cbr of operand * lbl * lbl   (* operand should be of type i1 *)
        (* "br i1 %s, label %lbl1, label %lbl2" *)


(* Basic blocks *)
type bblock = {
  label: lbl;
  insns: insn list;
  terminator: terminator
}


(* Function declarations *)
type fdecl = {
  ll_name: string;
  ll_type: ty option;
  ll_args: operand list;
  ll_cfg:  bblock list;
}

(* Initializers for global data:
 * Integers can often be initialized without running code.
 * String constants are hoisted out of the program text during compilation and
 * given global names.
 * Other values require running code to initialize them, these are  treated
 * as functions of type () -> unit with known names. 
 *)
type global_initializer = 
  | GConst of int32     (* constant value associated with this global value *)
  | GString of string   (* constant global string *)
  | GInit of fn         (* name of function that initializes this global value *)

type global = operand * global_initializer  (* operand must be a Global *)
      
type prog = {
  prototypes: fn list;  (* external functions / built-ins used in this program *)
  globals: global list;   
  functions: fdecl list;
}


