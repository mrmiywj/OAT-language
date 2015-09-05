
open Ll
open X86
open Cunit
open LibUtil


(*************************)
(* Miscellaneous Helpers *)
(*************************)

(* Type translation: an LLVM type maps to a size in bytes. *)
let rec byte_size_of_ty (t:Ll.ty) : int =
  begin match t with
    | I1 -> 4     (* Target 32-bit only subset of X86 *)
    | I8 -> 4     (* Target 32-bit only subset of X86 *)
    | I32 -> 4
    | Ptr _ -> 4  (* All pointers are word sized *)
    | Struct ts -> List.fold_left (fun acc t -> acc + (byte_size_of_ty t)) 0 ts
    | Array (n, t) -> (Int32.to_int n) * (byte_size_of_ty t)
  end


(* Compute the size of the offset (in bytes) of the nth element of a region of memory 
   whose types are given by the list.  Also returns the nth type. *)
let index_into (ts:ty list) (n:int) : int * ty =
  let rec loop ts n acc =
    begin match (ts, n) with
      | (u::_, 0) -> (acc, u)
      | (u::us, n) -> loop us (n-1) (acc + (byte_size_of_ty u))
      | _ -> failwith "index_into encountered bogus index"
    end
  in
    loop ts n 0


(* Map LL comparison operations to X86 condition codes *)
let ccode_for_compare = function
  | Ll.Eq  -> X86.Eq
  | Ll.Ne  -> X86.NotEq
  | Ll.Slt -> X86.Slt
  | Ll.Sle -> X86.Sle
  | Ll.Sgt -> X86.Sgt
  | Ll.Sge -> X86.Sge

let x86_imm_of_int (n:int) = Imm (Int32.of_int n)

(* Operand for dereferencing a pointer stored in eax *)
let deref_eax = Ind {i_base = Some Eax; i_iscl = None; i_disp = None}

(* Compute an indirect address that is a fixed byte offset from ebp. *)    
let ebp_offset (offset:int) : X86.ind =
  let amt = Int32.of_int offset in
    {i_base = Some Ebp;
     i_iscl = None;
     i_disp = Some (DImm amt)} 



(*********************)
(* LL IR Compilation *)
(*********************)


(********************)
(* Compiling Locals *)
(********************)


(* Each LL local %uid maps to a stack slot used for storing the value.
 * An Alloca instruction allocates additional stack space, which is
 * allocated statically by the compiler.
 * 
 * We call the datastructure that maps each %uid to its stack slot a
 * 'stack'.  *)

(* A stack has three components:
   - size (in bytes) of the storage needed

   - local_map: maps a uid to an X86 operand for accessing its
   contents.  The operand is the offset from ebp (in bytes) that
   represents a storage slot on the stack.

   - alloca_map: maps uids that store alloca'ed memory into the
   location of the associated storage space, as an X86.ind value for
   use with the Lea instruction. *)
type stack = {
  size : int32;                 (* size of the stack space to allocate in bytes *)
  local_map : uid -> X86.opnd;  (* domain is all Local uid's in the cfg *)
  alloca_map : uid -> X86.ind;  (* domain is all uid's assigned to by an alloca *)
}


(* Collect the local identifiers, which map to stack
   slots. Pre-allocate an extra stack slot for each alloca. *)
let id_of_insn : Ll.insn -> uid option * (uid * Ll.ty) option = function
  | Binop (Local i, _, _, _) 
  | Load (Local i, _) 
  | Icmp (Local i, _, _, _) 
  | Ll.Call (Some (Local i), _, _)
  | Bitcast (Local i, _, _) 
  | Gep (Local i, _, _) -> (Some i, None)
  | Alloca (Local i, t) -> (Some i, Some (i,t))
  | Alloca (Global i, t) -> (None, Some (i,t))
  | _ -> (None, None)

let ids_of_insns (is : Ll.insn list) : uid list * (uid * Ll.ty) list =
  List.filter_map2 id_of_insn is

(* Compute a stack layout from a list of blocks.  The first uid list
   determines the order in which uids are store in the stack.  The
   second list determines the order of pre-allocated stack space for
   use by Alloca instructions.  The ebp_offset_of_local and
   ebp_offset_of_alloca functions convert the layout data into offsets
   into the stack frame. *)
let stack_layout (cfg : Ll.bblock list) : uid list * (uid * Ll.ty) list =
  List.concat_map2 (fun {Ll.insns=is;_} -> ids_of_insns is) cfg


(* Map a Local uid to a byte offset from EBP.  Each uid that is not a
   function argument is assigned the nth slot after (at negative
   offsets from ) ebp, where n is its position in the list.  Function
   arguments live at positive offsets from ebp. 

   The slot calculation might need to be changed if the function prologue 
*)

let ebp_offset_of_local (ids : uid list) (args : uid list) (id : uid) : int =
  try    (* Check the locals first *)
    let slot = List.find_index ids id in
      -4 * (slot + 1)     
  with Not_found -> 
    begin try  (* Then look through the function arguments *)
      let slot = List.find_index args id in 
	4 * (slot + 2)
    with Not_found -> 
      failwith (Printf.sprintf "ebp_offset_of_local: %s not found among ids = [%s], args = [%s]"
		  (Lllib.string_of_uid id)
		  (String.concat ", " (List.map Lllib.string_of_uid ids))
		  (String.concat ", " (List.map Lllib.string_of_uid args))
	       )
    end


(* Calculate the offset from ebp in bytes of a given alloca'ed storage space.
   the offs parameter is the number of words taken up by the uid slots *)
let ebp_offset_of_alloca (offs : int) (allocas : (uid * Ll.ty) list) (id : uid) : int =
  try
    let slot = List.find_index (List.map fst allocas) id in
      -4 * (slot + offs + 1)
  with Not_found -> 
    failwith (Printf.sprintf "lookup_alloca: %s not found among ids."
		(Lllib.string_of_uid id))



(* Get the label of a global identifier *)
let lbl_of_global globals uid = List.assoc uid globals


(* Translate an LL identifier to an X86 operand *)
let compile_id globals stack i : X86.opnd =
  begin match i with
    | Local uid ->  stack.local_map uid 
    | Global uid -> X86.deref_lbl (lbl_of_global globals uid)
  end

(* Compiles the value of the LL operand, putting the value into eax *)
let compile_op globals stack : Ll.operand -> X86.insn = function
  | (_, Const i)  -> Mov(eax, X86.Imm i)
  | (_, Id id)    -> Mov(eax, compile_id globals stack id)




(* Puts the address computed by a gep computation into eax.  On 32-bit
   x86, the getelementptr instruction supports only i32
   indices. Moreover, the first index must be excactly 0l.  Subsequent
   indices are interpreted as offsets whose size is determined by the
   type of the op pointer. val_op compiles an operand into the eax
   register.

   Full LLVM allows non-constant indexing into structured types, but
   here we allow non-constant indices only into arrays (whose element
   sizes are known statically. *)
let compile_gep_path val_op op (path: (ty*opn) list) : insn list =
  let rec loop ty path code =
    match (ty, path) with
    | (_, []) -> List.rev code

    | (Struct ts, (I32, Const n)::rest) ->
       let (offset, u) = index_into ts (Int32.to_int n) in
       loop u rest ((Add(eax, x86_imm_of_int offset))::code)

    | (Array(_, u), (I32, Const n)::rest) ->
       (* Statically calculate the offset *)
       let offset = (byte_size_of_ty u) * (Int32.to_int n) in
       loop u rest ((Add(eax, x86_imm_of_int offset))::code)

    | (Array(_, u), offset_op::rest) ->
       loop u rest
	    ([ Add(eax, ecx);
	       Imul(Eax, x86_imm_of_int (byte_size_of_ty u));]
	     @ (val_op offset_op) :: (Mov(ecx, eax)) :: code)

    | _ -> failwith "compile_gep_path encountered unsupported getelementptr data" in
  match (op, path) with
  | ((Ptr t, _),  (I32, Const 0l)::rest) -> 
     loop t rest [val_op op]
  | _ -> failwith "compile_gep_path got incorrect parameters"



(* LL local ids map to stack slots, so accessing a value means moving
   it from the stack slot into a register for processing. The strategy
   for compiling instructions is to use eax as the primary register for
   holding such intermediate values. ecx is used when needed to save the
   value of eax. *)
let compile_insn globals stack (i : Ll.insn) : X86.insn list =
  let val_op = compile_op globals stack in   (* Move the value of op into eax *)
  let dst_op = compile_id globals stack in   (* Compute an operand for the destination *)
    match i with
      | Binop (i, bop, op1, op2) -> 
	  let res = dst_op i in
	    (val_op op1) :: [Mov (res, eax); ] @ (val_op op2) :: [Mov (ecx, eax)] @
	      (match bop with
		 | Ll.Add ->  [Add (res, ecx)]
		 | Ll.Sub ->  [Sub (res, ecx)]
		 | Ll.Mul ->  [Mov (eax, res); Imul (Eax, ecx); Mov (res, eax)]
		 | Ll.Shl ->  [Shl (res, ecx)]
		 | Ll.Lshr -> [Shr (res, ecx)]
		 | Ll.Ashr -> [Sar (res, ecx)]
		 | Ll.And ->  [And (res, ecx)]
		 | Ll.Or ->   [Or  (res, ecx)]
		 | Ll.Xor ->  [Xor (res, ecx)])

      (* Alloca instructions move the address of the storage into the
	 destination.  The stack space is pre-allocated by the combination
	 of the stack_layout and lookup_alloca functions. *)
      | Alloca (i, _t) -> 
	  [Lea(Eax, stack.alloca_map (Lllib.uid_of_id i));
	   Mov(dst_op i, eax);
	  ]

      (* Load dereferences the pointer value stored in a local, global
	 and constant pointers don't need indirection. *)
      | Load (i, ((_, Id (Local uid)) as op)) -> 
	  (val_op op) :: [Mov(ecx, deref_eax); Mov (dst_op i, ecx)]
      | Load (i, op)  -> 
	  (val_op op) :: [Mov(dst_op i, eax)]

      (* Store also needs to dereference the destination pointer if it
	 is a local. *)
      | Store (src, ((_, Id (Local uid)) as dest)) -> 
	  (val_op src) :: (Mov(ecx, eax)) :: (val_op dest) :: [Mov(deref_eax, ecx)]
      | Store (src, (_, Id dest)) ->
	  (val_op src) :: [Mov(dst_op dest, eax)]
      | Store (src, (_, Const i)) ->
	  (val_op src) :: [Mov(X86.Imm i, eax)] 

      (* Treat LL i1 values as words, so zero-out the rest of the bits. *)
      | Icmp (i, cop, op1, op2) -> 
	  let res = dst_op i in
	    (val_op op1) :: (Mov(ecx, eax)) :: (val_op op2) ::
	      [Cmp(ecx, eax);
	       Setb (res, ccode_for_compare cop);
	       And (res, Imm 1l)]

      (* Push the arguments, call the function, move the result (if
	 any) to the destination, and then clean up the stack. *)
      | Ll.Call(iopt,{name=fid;_},args) ->
failwith "unimplemented"

      (* Bitcast is effectively just a Mov at the assembly level *)
      | Bitcast (i, op, _) -> 
failwith "unimplemented"

      (* Defer to the helper function to compute the pointer value *)
      | Gep (i, op, path) -> 
	  let code = compile_gep_path val_op op path in
	    code @ [Mov(dst_op i, eax)]



(* Compile a block terminator.  Epilogue is the code that cleans up
   the local stack frame. *)
let compile_term globals stack epilogue t =
  match t with
    | Ll.Ret (Some o) -> 
	(compile_op globals stack o) :: epilogue
    | Ll.Ret None -> epilogue
    | Ll.Br l -> [Jmp (Lbl l)]
    | Ll.Cbr (o, l1, l2) -> 
	(compile_op globals stack o) :: [Cmp (eax, Imm 0l); J (X86.NotEq, l1); Jmp (Lbl l2)]



(* Compile a block *)
let compile_block globals stack epilogue {Ll.label=l;insns=code;terminator=t} : component =
  let link = compile_term globals stack epilogue  t in
  let body =
    (List.fold_right
       (fun i stream -> 
          (compile_insn globals stack i)@stream) code link) in
    Code (mk_insn_block l (body))



(* Compile the stack frame for a function.  It allocates storage space
   and creates the mapping from LL Local uids to their stack slots. *)

let compile_stack ll_cfg ll_args = 
  let (local_ids, allocas) = stack_layout ll_cfg in
  let args = List.map (function (_, Id (Local i)) -> i | _ -> assert false) ll_args in 
  let num_ids = List.length local_ids in
  let num_allocas = List.length allocas in
    {
      size = Int32.of_int (4 * (num_ids + num_allocas));
      local_map = (fun uid -> Ind (ebp_offset (ebp_offset_of_local local_ids args uid)));
      alloca_map = (fun uid -> ebp_offset (ebp_offset_of_alloca num_ids allocas uid));
    }



(* Compile a function body. *)
let compile_fdecl globals ({ll_name;ll_cfg;ll_args;_} :Ll.fdecl) : cunit =
  let block_name = (Platform.decorate_cdecl ll_name) in
  let stack = compile_stack ll_cfg ll_args in

  (* The function prologue follows cdecl calling conventions, setting
     up ebp as the frame pointer.  Adjustments here (to save other
     registers for example) might require adjusting the stack slot
     calculation. The epilogue restores the stack. *)
  let prologue = [(Push ebp);  Mov (ebp, esp); Sub (esp, Imm stack.size);] in
  let epilogue = [Mov (esp, ebp); (Pop ebp); Ret] in

  let blocks = List.map (compile_block globals stack epilogue) ll_cfg in
  let main = Code {X86.global = true;
		   label = mk_lbl_named block_name;
		   insns = prologue } in
    main::blocks




(* Compile a global value into an X86 global data declaration and a
   mapping the Global uid to its associated X86 label.  Strings
   generate two things: the string data itself and a pointer that
   refers to the string. *)
let compile_global (g : Ll.global) = 
  let mk_data lbl data = Data {link=false; label=lbl; value=data} 
  in
    match g with
      | ((ty, Id (Global uid)), ginit) ->
	  let lbl = Lllib.lbl_of_uid uid in
	  let data = 
	    begin match ginit with
	      | GConst n  -> [mk_data lbl (GInt32 n)]
	      | GInit _   -> [mk_data lbl (GInt32 0l)]  (* Pointer to be initialized later *)
	      | GString s -> 
		  let strlbl = X86.mk_lbl_named ((Lllib.string_of_uid uid) ^ ".str.") in
		    [(mk_data strlbl (GStringz s));
		     (mk_data lbl (GLabels [strlbl]));
		    ]
	    end
	  in
	    (data, (uid, lbl))
      | _ -> failwith "compile_global: found non-global id"



	  
(* Compile a top-level program by creating the globals map and then
compiling the functions in that global context. *)
let compile_prog (p:Ll.prog) : Cunit.cunit =
  let (globals_cu, globals) = List.split (List.map compile_global p.globals) in
  let functions_cu = List.map (compile_fdecl globals) p.functions in
    (List.concat globals_cu) @ (List.concat functions_cu)
