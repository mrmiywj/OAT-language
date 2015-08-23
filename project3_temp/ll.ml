(* A simplified subset of the LLVM IR *)

type uid = int * string

type lbl = X86.lbl

(* Binary operations *)
type bop = Add | Sub | Mul | Shl | Lshr | Ashr | And | Or | Xor      

(* Operands *)
type operand = Local of uid | Const of int32

(* Comparison Operators *)
type cmpop = Eq | Ne | Slt | Sle | Sgt | Sge
  
(* Instructions *)
type insn = 
  | Binop of uid * bop * operand * operand
        (* "%s = %s i32 %s, %s"  *)
  | Alloca of uid
        (* "%s = alloca i32" *)
  | Load of uid * operand
        (* "%s = load i32* %s" *)
  | Store of operand * operand
        (* "store i32 %s, i32* %s" *)
  | Icmp of uid * cmpop * operand * operand
        (* 
           "%s = icmp %s i32 %s, %s"
           "%s = zext i1 %s to i32"
         *)

(* Block terminators *)
type terminator = 
  | Ret of operand
        (* "ret i32 %s" *)
  | Br of lbl
        (* "br label %%%s" *)
  | Cbr of operand * lbl * lbl
        (*
          "%s = icmp ne i32 %s, 0" 
          "br i1 %s, label %%%s, label %%%s"
         *)

(* Basic Blocks *)
type bblock = {
    label: lbl;
    insns: insn list;
    terminator: terminator
  }

type prog = {ll_cfg: bblock list; ll_entry: lbl}

let mk_uid : string -> uid =
  let ctr = ref 0 in
  fun h -> incr ctr; (!ctr, h)

let gen_sym () : uid = mk_uid "_"

let mk_lbl : unit -> lbl = X86.mk_lbl
  

let string_of_uid (i, s) : string =
  Printf.sprintf "%%%s%d" s i 

let pp_uid = string_of_uid

let pp_op : operand -> string = function
    | Local u -> pp_uid u
    | Const i -> Int32.to_string i

let pp_bop : bop -> string = function
    | Add -> "add"  | Sub  -> "sub"  | Mul  -> "mul" 
    | Shl -> "shl"  | Lshr -> "lshr" | Ashr -> "ashr"
    | And -> "and"  | Or   -> "or"   | Xor  -> "xor"

let pp_cmpop : cmpop -> string = function
    | Eq  -> "eq"  | Ne  -> "ne"  | Slt -> "slt" 
    | Sle -> "sle" | Sgt -> "sgt" | Sge -> "sge"

let pp pat = Printf.sprintf ("  " ^^ pat ^^ "\n")

let pp_insn pf : insn -> unit = function
  | Binop (u, bo, op1, op2) -> 
    pf (pp "%s = %s i32 %s, %s" 
          (pp_uid u) (pp_bop bo) (pp_op op1) (pp_op op2))
  | Alloca u -> 
    pf (pp "%s = alloca i32" (pp_uid u))
  | Load (u, op) ->
    pf (pp "%s = load i32* %s" (pp_uid u) (pp_op op))
  | Store (op1, op2) ->
    pf (pp "store i32 %s, i32* %s" (pp_op op1) (pp_op op2))
  | Icmp (u, co, op1, op2) -> 
    let tmp = gen_sym () in
    pf (pp "%s = icmp %s i32 %s, %s" 
          (pp_uid tmp) (pp_cmpop co) (pp_op op1) (pp_op op2));
    pf (pp "%s = zext i1 %s to i32" (pp_uid u) (pp_uid tmp))

let pp_lbl = X86.string_of_lbl

let pp_term pf : terminator -> unit = function
  | Ret op -> pf (pp "ret i32 %s" (pp_op op))
  | Br l -> pf (pp "br label %%%s" (pp_lbl l))
  | Cbr (op, l1, l2) -> let tmp = gen_sym () in
    pf (pp "%s = icmp ne i32 %s, 0" (pp_uid tmp) (pp_op op));
    pf (pp "br i1 %s, label %%%s, label %%%s" (pp_uid tmp) (pp_lbl l1) (pp_lbl l2))

let serialize_block (printfn : string -> unit) ({label=l;insns=is;terminator=t}: bblock) =
  printfn (Printf.sprintf "%s:\n" (pp_lbl l));
  List.iter (pp_insn printfn) is;
  pp_term printfn t

let serialize_prog {ll_cfg=cfg;_} (printfn : string -> unit) =
  printfn "define i32 @program() {\n";
  List.iter (serialize_block printfn) cfg;
  printfn "\n}\n"

let string_of_prog (p : prog) : string =
  let b = Buffer.create 256 in
  (serialize_prog p (Buffer.add_string b));
  Buffer.contents b

