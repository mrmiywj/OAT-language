(* x86.ml     *)

(**********)
(* Labels *)
(**********)
(* open LibUtil *)
open Format
(* The type of labels *)
type lbl = string

type reg =
  | Eax (* Accumulator for operands and results data *)
  | Ebx (* Pointer to data in the DS segment *)
  | Ecx (* Counter for string/loop operations *)
  | Edx (* I/O pointer *)
  | Esi (* Pointer to data in the segment pointed to by DS; string src ptr *)
  | Edi (* Pointer to data in segment pointed to by ES; string dst ptr *)
  | Ebp (* Pointer to data on the stack *)
  | Esp (* Stack pointer *)

type disp =
  | DImm of int32
  | DLbl of lbl

type ind = {
  i_base : reg option;           (* Base. *)
  i_iscl : (reg * int32) option; (* Index must not be ESP *)
  i_disp : disp option           (* Constant displacement (int32 or label). *)
}
 
(* Operands *) 
type opnd =
  | Imm of int32 (* Immediate int32 value. *)
  | Lbl of lbl   (* Immediate label value. *)
  | Reg of reg   (* Register operand *)
  | Ind of ind   (* Indirect operand*)

(* Condition codes *)
type cnd = 
  | Sgt 
  | Sge 
  | Slt 
  | Sle
  | Eq 
  | NotEq 
  | Zero (* same as Eq *) 
  | NotZero (* same as NotEq *)

(* Instructions *)
type insn =
  | Add of opnd * opnd       
  | Neg of opnd              
  | Sub of opnd * opnd       
  | Lea of reg * ind         
  | Mov of opnd * opnd       
  | Shl of opnd * opnd       
  | Sar of opnd * opnd       
  | Shr of opnd * opnd       
  | Not of opnd              
  | And of opnd * opnd       
  | Or of opnd * opnd        
  | Xor of opnd * opnd       
  | Push of opnd             
  | Pop of opnd              
  | Cmp of opnd * opnd       
  | Setb of opnd * cnd       
  | Jmp of opnd              
  | Call of opnd             
  | Ret                      
  | J of cnd * lbl           
  | Imul of reg * opnd       

(* A insn block (with a label and a list of instructions). *)
type insn_block = {
  global : bool;
  label : lbl;
  insns : insn list;
}
      
let lbl_ctr = ref 0
    
(* Generate a unique label (except for abuses of mk_lbl_named) *)
let mk_lbl () : lbl = 
  let ctr = !lbl_ctr in
  let _ = lbl_ctr := ctr + 1 in
    "__" ^ (string_of_int ctr)
      
	
(* Generate a label containing the given string *)
let mk_lbl_hint (s:string) : lbl =
  let ctr = !lbl_ctr in
  let _ = lbl_ctr := ctr + 1 in
    "__" ^ s ^ (string_of_int ctr)
      
(* Force a label to have a particular string representation -- dangerous! *)
let mk_lbl_named (s:string) : lbl = s


let string_of_lbl (l:lbl) : string = l


let string_of_reg (r:reg) : string =
  "%" ^ (match r with
           | Eax-> "eax" | Ebx -> "ebx" | Ecx -> "ecx" | Edx -> "edx"
           | Esi -> "esi" | Edi -> "edi" | Ebp -> "ebp" | Esp -> "esp")



(* 32bit int constant operand *)
let i32 (x:int32) : opnd = Imm x

(* Register Operands *)
let eax : opnd = Reg Eax
let ebx : opnd = Reg Ebx
let ecx : opnd = Reg Ecx
let edx : opnd = Reg Edx
let esi : opnd = Reg Esi
let edi : opnd = Reg Edi
let ebp : opnd = Reg Ebp
let esp : opnd = Reg Esp

(* Generate a stack offset *)
let stack_offset (amt:int32) : opnd =
  Ind{i_base = Some Esp;
      i_iscl = None;
      i_disp = Some (DImm amt)} 

(* Use label as indirect operand *)
let deref_lbl (l:lbl) : opnd =
  Ind{i_base = None;
      i_iscl = None;
      i_disp = Some (DLbl l)} 

let string_of_ind  (i:ind) : string =
  let has_iscl_or_base = 
    match (i.i_base, i.i_iscl) with
      | (Some _, _) -> true
      | (_, Some _) -> true
      | _ -> false 
  in
    (match i.i_disp with
       | Some(DImm x) -> Int32.to_string x
       | Some(DLbl l) -> string_of_lbl l
       | None -> "") 
    ^ (if not has_iscl_or_base then "" else
	 "(" ^ (
	   match i.i_base with
	     | None -> ""
	     | Some r -> string_of_reg r
	 ) ^ (
	   match i.i_iscl with
	     | Some (r, scl) -> "," ^ (string_of_reg r) ^ "," ^
		 (Int32.to_string scl)
	     | None -> ""
	 ) ^ ")"
      )
      
      
let string_of_opnd (op:opnd) : string =
  match op with
    | Imm x -> "$" ^ (Int32.to_string x)
    | Lbl l -> "$" ^ (string_of_lbl l)
    | Reg r  -> string_of_reg r
    | Ind i  -> string_of_ind i


	
let cfstring_of_opnd (op:opnd) : string = 
  match op with
    | Imm _ ->
	failwith "Bad x86: PC-relative jump with non-symbolic offset"
    | Lbl l -> string_of_lbl l
    | Reg r -> "*" ^ (string_of_reg r)
    | Ind i -> "*" ^ (string_of_ind i)
	
      
let string_of_cnd  = function
    | Sgt -> "G" 
    | Sge -> "GE" 
    | Slt -> "L" 
    | Sle -> "LE"
    | Eq  -> "E"  
    | NotEq -> "NE" 
    | Zero -> "Z" 
    | NotZero -> "NZ"

    
let generic_to_string name (dest, src) =
    name ^ "l " ^ (string_of_opnd src) ^ ", " ^ (string_of_opnd dest)

let shift_to_string name (dest, src) =
  match src with
    | Imm _ ->  name ^ "l " ^ (string_of_opnd src) ^ ", " ^ (string_of_opnd dest)
    | Reg Ecx -> name ^ "l " ^ "%cl" ^ ", " ^ (string_of_opnd dest)
    | _ -> failwith "Shift amount not ECX or immediate"
      
let oneop_to_string name op =
    name ^ "l " ^ (string_of_opnd op)
		
let lea_to_string (dest,src) =
    "leal" ^ " " ^ (string_of_ind src) ^ ", " ^
        (string_of_reg dest)

let cfop_to_string name op =
    name ^ " " ^ (cfstring_of_opnd op)



let regdest_to_string name (dest, src) =
    name ^ "l " ^ (string_of_opnd src) ^ ", " ^ (string_of_reg dest)  

let  string_of_insn = function
  | Add (d,s) -> generic_to_string "add" (d,s)
  | Neg o     -> oneop_to_string "neg" o 
  | Sub (d,s) -> generic_to_string "sub" (d,s)
  | Lea (d,s) -> lea_to_string (d,s)
  | Mov (d,s) -> generic_to_string "mov" (d,s)
  | Shl (d,s) -> shift_to_string "shl" (d,s)
  | Sar (d,s) -> shift_to_string "sar" (d,s)
  | Shr (d,s) -> shift_to_string "shr" (d,s)
  | Not o     -> oneop_to_string "not" o 
  | And (d,s) -> generic_to_string "and" (d,s)
  | Or (d,s)  -> generic_to_string "or" (d,s)
  | Xor (d,s) -> generic_to_string "xor" (d,s)
  | Push o    -> oneop_to_string "push" o 
  | Pop o     -> oneop_to_string "pop" o 
  | Cmp (c1,c2)    -> generic_to_string "cmp" (c1,c2)
  | Setb (dest,cc) ->
      let byte_string_of_reg (r:reg) : string =
        "%" ^ (match r with
        | Eax-> "al" | Ebx -> "bl" | Ecx -> "cl" | Edx -> "dl"
        | _ -> failwith "X86 illegal register - not byte addressable") in
      let string_of_opnd_low_byte = function
        | Imm _ -> failwith "X86 illegal operand - not byte size"
        | Lbl _ -> failwith "X86 illegal operand - not byte size"
        | Reg r -> byte_string_of_reg r
        | Ind i -> string_of_ind i in
      let setb_to_string (dest, cc) =
        "set" ^ string_of_cnd cc ^ " " ^ string_of_opnd_low_byte dest in
      setb_to_string (dest,cc)
  | Jmp o     -> cfop_to_string "jmp" o
  | Call o    -> cfop_to_string "call" o
  | Ret       -> "ret"
  | J (cond,lbl) ->
      let j_to_string (cc,lbl) =
        "j" ^ (string_of_cnd cc) ^ " " ^ (string_of_lbl lbl) in j_to_string (cond,lbl)
  | Imul (d,s)   -> regdest_to_string "imul" (d,s)


(* Make an non-global insn block with a particular label. *)
let mk_insn_block (l:lbl) (body:insn list) : insn_block =
  {label = l;
   insns = body;
   global = false}

(* Make a non-global anonymous insn block, generating a fresh label for it. *)
let mk_ainsn_block (body:insn list) : (lbl * insn_block) =
  let l = mk_lbl () in
    (l, mk_insn_block l body)

(* Make an explicitly named non-global insn block. *)
let mk_block (s:string) (insns:insn list) =
  mk_insn_block (mk_lbl_named s) insns

(* Write an insn block using the provided printing function. *)
let serialize_insn_block (blk : insn_block) (pfunc : string -> unit) : unit =
  if blk.global then (
    pfunc (sprintf ".globl %s\n" (string_of_lbl blk.label))
  ) else ();
  pfunc (sprintf "%s:\n" (string_of_lbl blk.label));
  List.iter (fun insn -> pfunc (sprintf "\t%s\n" (string_of_insn insn)))
    blk.insns
			
let string_of_insn_block (blk:insn_block) : string =
  List.fold_left (fun x i -> x ^ string_of_insn i) 
    (if blk.global 
     then sprintf ".global %s\n" (string_of_lbl blk.label)
     else sprintf "%s\n" (string_of_lbl blk.label))
    blk.insns
    
let pp_insn f i =
  fprintf f "%s" (string_of_insn i)

let pp_insn_block f (blk:insn_block) =
  fprintf f "%s" (string_of_insn_block blk)

let pp_opnd f i =
  fprintf f "%s" (string_of_opnd i)




