open Ll
open X86
open LibUtil



let compile_prog (prog : Ll.prog) : Cunit.cunit =
    let block_name = (Platform.decorate_cdecl "program") in

    (* given an instruction list, returns a list of all the uid and the *)
    (* prologue code which offset the stack accordingly *)
    let rec emit_uid_list (l : Ll.insn list) (accum : uid list) : uid list =
      begin match l with
      | [] -> accum
      | hd::tl -> 
        begin match hd with
        | Binop (u,_,_,_)  | Alloca u | Load (u,_) | Icmp (u,_,_,_) ->
          emit_uid_list tl (accum @ [u])
        | _ -> emit_uid_list tl (accum)
        end
      end in
      
    let get_ind (u : uid) (ul : uid list) : opnd =
      let rec index_of (elt : uid) (l : uid list) : int = 
        begin match l with
        | [] -> failwith ("not found")
        | hd::tl ->
          if hd = elt
          then 0
          else 1 + index_of elt tl
        end in
				
        
      let idx = index_of u ul in
      let offset = Int32.of_int (4 * idx) in
				Ind { i_base = Some Esp;
              i_iscl = None;
              i_disp = Some (DImm offset) } in
    
    let emit_opnd (o : Ll.operand) (u_list : uid list) : X86.opnd =
      begin match o with
      | Local u -> get_ind u u_list
      | Const i -> Imm i
      end in
    
    let emit_insn (i : Ll.insn) ((insn_accum, uid_l) : X86.insn list * uid list) 
                                           : X86.insn list * uid list =    
                
      let emit_binop (b : Ll.bop) : X86.insn =
        begin match b with
        | Ll.Add  -> Add (eax, ecx)
        | Ll.Sub  -> Sub (eax, ecx)
        | Ll.Mul  -> Imul(Eax, ecx)
        | Ll.Shl  -> Shl (eax, ecx)
        | Ll.Lshr -> Shr (eax, ecx)
        | Ll.Ashr -> Sar (eax, ecx)
        | Ll.And  -> And (eax, ecx)
        | Ll.Or   -> Or  (eax, ecx)
        | Ll.Xor  -> Xor (eax, ecx)
        end in
        
      let emit_icmp (i : Ll.cmpop) : X86.cnd = 
        begin match i with
        | Ll.Eq   -> Eq
        | Ll.Ne   -> NotEq
        | Ll.Slt   -> Slt
        | Ll.Sle   -> Sle
        | Ll.Sgt   -> Sgt
        | Ll.Sge   -> Sge
        end in
      
      begin match i with
      | Binop (u, b, o1, o2) ->
        let loc = get_ind u uid_l in
        let insn1 = Mov (ecx, emit_opnd o2 uid_l) in
        let insn2 = Mov (eax, emit_opnd o1 uid_l) in
        let binop = emit_binop b :: [(Mov (loc, eax))] in
        
        (insn1 :: insn2 :: binop @ insn_accum, uid_l)
      | Alloca u -> (insn_accum, uid_l)
      | Load (u, o) -> 
        let loc = get_ind u uid_l in
				
				Mov (ecx, emit_opnd o uid_l) :: Mov (loc, ecx) :: insn_accum, uid_l
      | Store (o1, o2) ->
        Mov (ecx, emit_opnd o1 uid_l) :: Mov (emit_opnd o2 uid_l, ecx) :: insn_accum, uid_l
          
      | Icmp (u, c, o1, o2) -> 
        let loc = get_ind u uid_l in
        let cmpr  = 
					Mov (ebx, emit_opnd o1 uid_l) ::
					Mov (ecx, emit_opnd o2 uid_l) ::
					Mov (loc, Imm 0l) ::
					Cmp (ebx, ecx) :: 
					Setb (loc, (emit_icmp c)) :: 
					[] in
        
        (cmpr @ insn_accum, uid_l)
				
      end in
      
    let emit_bblock ((bl_accum, uid_l) : insn_block list * uid list ) (b : Ll.bblock)
																								: insn_block list * uid list =
      let up_uid_l = emit_uid_list b.Ll.insns uid_l in
      let b_insns, uid_l = List.fold_right emit_insn b.Ll.insns ([], up_uid_l) in
      
      (* cdecl stuff *)
			let offset = Int32.of_int (4 * (List.length up_uid_l)) in
      let epilogue = 
        (Add (esp, Imm offset)) ::
        (Pop (ebp)) :: 
        [] in
        
      let b_end =
				
        begin match b.terminator with
        | Ll.Ret op  -> Mov (eax, emit_opnd op uid_l) :: epilogue @ [Ret]
        | Ll.Br l   ->  [Jmp (Lbl l)]
        | Cbr (op, l1, l2) ->
					[Cmp (emit_opnd op uid_l, Imm 0l)] @
          [J (Eq, l2)] @
          [J (NotEq, l1)]
        end in
      
      let new_blk = {
        global = true;
        label = b.Ll.label;
        insns = b_insns @ b_end
      } in
      
      (bl_accum @ [new_blk], up_uid_l) in
      
    let emit_bblocks (b : Ll.bblock list) : insn_block list =
      let blk_list, u_list = List.fold_left emit_bblock ([],[]) b in
			let offset = Int32.of_int (-4 * (List.length u_list)) in
      let prologue = 
        (Push (ebp)) ::
        (Mov (ebp, esp)) ::
        (Add (esp, Imm (offset))) ::
        [] in
      let blk_list = 
  					{ global = true;
              label = mk_lbl_named block_name;
              insns = prologue @ [Jmp (Lbl prog.ll_entry)]
              } :: blk_list in
			blk_list in
   
    
    List.map (fun blk -> Cunit.Code blk) (emit_bblocks prog.ll_cfg)
    
