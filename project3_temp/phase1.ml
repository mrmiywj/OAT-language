open LibUtil

(* 
 * Parse and AST from a lexbuf 
 * - the filename is used to generate error messages
 *)
let parse (filename : string) (buf : Lexing.lexbuf) : Ast.prog =
  try
    Lexer.reset_lexbuf filename buf;
    Parser.toplevel Lexer.token buf
  with Parsing.Parse_error ->
    failwithf  "Parse error at %s." (Range.string_of_range (Lexer.lex_range buf))


(* 
 * Compile a source binop in to an LL instruction.
 *)
let compile_binop (b : Ast.binop) : Ll.uid -> Ll.operand -> Ll.operand -> Ll.insn  =
  let ib b id op1 op2 = (Ll.Binop (id, b, op1, op2)) in
  let ic c id op1 op2 = (Ll.Icmp (id, c, op1, op2)) in
  match b with
  | Ast.Plus  -> ib Ll.Add
  | Ast.Times -> ib Ll.Mul
  | Ast.Minus -> ib Ll.Sub
  | Ast.And   -> ib Ll.And
  | Ast.Or    -> ib Ll.Or
  | Ast.Shl   -> ib Ll.Shl
  | Ast.Shr   -> ib Ll.Lshr
  | Ast.Sar   -> ib Ll.Ashr

  | Ast.Eq    -> ic Ll.Eq
  | Ast.Neq   -> ic Ll.Ne
  | Ast.Lt    -> ic Ll.Slt
  | Ast.Lte   -> ic Ll.Sle
  | Ast.Gt    -> ic Ll.Sgt
  | Ast.Gte   -> ic Ll.Sge

let compile_uop u id op  =
  match u with
  | Ast.Neg -> (Ll.Binop (id, Ll.Mul, op, Ll.Const (-1l)))
  | Ast.Lognot -> (Ll.Icmp (id,Ll.Eq, op, Ll.Const(0l)))
  | Ast.Not -> (Ll.Binop (id,Ll.Xor,op, Ll.Const (-1l)))

let compile_opnd (e : Ast.exp) (c: Ctxt.t) : Ll.operand option =
  match e with
  | Ast.Cint i -> Some (Ll.Const i)
  | Ast.Id s -> Some (Ll.Local (Ctxt.lookup s c))
  | _ -> None

let rec compile_exp (e : Ast.exp) (c : Ctxt.t) :Ll.uid * Ll.insn list =
  begin match e with
  | Ast.Cint i ->
    let new_uid = Ll.gen_sym() in
    (new_uid, [Ll.Binop (new_uid, Ll.Add, Ll.Const 0l, Ll.Const i)])
  | Ast.Id _ ->
    let op =
      begin match compile_opnd e c with
      | None -> failwith "What's the fuck !!!"
      | Some o -> o
      end in
    let new_uid = Ll.gen_sym () in
    (new_uid, [Ll.Load (new_uid, op)])
  | Ast.Binop (b, e1, e2) ->
    let (op1, insn1) = decode_op e1 c in
    let (op2, insn2) = decode_op e2 c in

    let new_uid = Ll.gen_sym () in
    let binop_insn = compile_binop b new_uid op1 op2 in
    (new_uid, insn1 @ insn2 @ [binop_insn])

  | Ast.Unop (u, e1) ->
    let (op1, insn1) = decode_op e1 c in
    let new_uid = Ll.gen_sym () in
    let unop_insn = compile_uop u new_uid op1 in
    (new_uid, insn1 @[unop_insn])
  end

and decode_op (e : Ast.exp) (c : Ctxt.t) : Ll.operand * Ll.insn list =
  let (uid1, insn1) = compile_exp e c in
  (Ll.Local uid1, insn1)

let rec compile_var_decls (vars : Ast.var_decl list) (old_ctxt : Ctxt.t) =
  let fold_vds ((insns, ctxt) : Ll.insn list * Ctxt.t ) (var : Ast.var_decl) =
    let up_ctxt, new_uid = Ctxt.alloc var.Ast.v_id ctxt in
    let exp_op, exp_insn = decode_op var.Ast.v_init ctxt in
    let vd_insns = Ll.Alloca(new_uid)::Ll.Store(exp_op, Ll.Local(new_uid))::[] in
    let up_insns = insns @ exp_insn @vd_insns in
    (up_insns, up_ctxt)
  in List.fold_left fold_vds ([], old_ctxt) vars

and compile_stmt (s : Ast.stmt) (c: Ctxt.t) (next_l : Ll.lbl) =
  begin match s with
  | Ast.Assign (l, e) ->
    let l_uid =
      begin match l with
      | Ast.Var str -> (Ctxt.lookup str c)
      end in
    let (op1, insn1) = decode_op e c in
    let a_insns = insn1 @[Ll.Store (op1, Ll.Local l_uid)] in
    let a_lbl = Ll.mk_lbl () in
    let a_blk =
    {Ll.label = a_lbl;
     Ll.insns = a_insns;
     Ll.terminator = Ll.Br next_l} in
    (a_lbl,[a_blk])
  | Ast.If (e,s1,s2op) ->
    let bool_uid, cmp_insns = compile_exp e c in
    let then_lbl, then_blks = compile_stmt s1 c next_l in
    let else_lbl, else_blks =
      begin match s2op with
      | None ->
        let new_lbl = Ll.mk_lbl () in
        let new_blk = {
          Ll.label = new_lbl;
          Ll.insns = [];
          Ll.terminator = Ll.Br next_l
        } in
        (new_lbl, [new_blk])
      | Some s2 -> compile_stmt s2 c next_l
      end in
    let strt_lbl = Ll.mk_lbl () in
    let strt_blk = {
      Ll.label = strt_lbl;
      Ll.insns = cmp_insns;
      Ll.terminator = Ll.Cbr (Ll.Local (bool_uid),then_lbl,else_lbl)
    } in
    (strt_lbl,[strt_blk] @ then_blks @ else_blks)
  | Ast.While (e,s1) ->
    let strt_lbl = Ll.mk_lbl () in
    let bool_uid, cmp_insns = compile_exp e c in
    let then_lbl, then_blk = compile_stmt s1 c strt_lbl in
    let else_lbl = next_l in

    let strt_blk =
      {
        Ll.label = strt_lbl;
        Ll.insns = cmp_insns;
        Ll.terminator = Ll.Cbr (Ll.Local (bool_uid),then_lbl,else_lbl )
      } in
    (strt_lbl,[strt_blk] @ then_blk)
  | Ast.For (vs, eop, s1op, s2) ->
    let vs_insns, vs_ctxt = compile_var_decls vs c in
    let pre_lbl = Ll.mk_lbl () in
    let strt_lbl = Ll.mk_lbl () in
    let else_lbl = next_l in
    let pre_blk = {
      Ll.label = pre_lbl;
      Ll.insns = vs_insns;
      Ll.terminator = Ll.Br strt_lbl
    } in
    let then_lbl, then_blk =
      begin match s1op with
      | None -> compile_stmt s2 vs_ctxt strt_lbl
      | Some s1 -> compile_stmts (s2::s1::[]) vs_ctxt strt_lbl
      end in

    let strt_blk =
      begin match eop with 
      | None ->
        {
          Ll.label = strt_lbl;
          Ll.insns = [];
          Ll.terminator = Ll.Br then_lbl;
        }
      | Some e ->
        let bool_uid, cmp_insns = compile_exp e vs_ctxt in
        {
          Ll.label = strt_lbl;
          Ll.insns = cmp_insns;
          Ll.terminator = Ll.Cbr (Ll.Local (bool_uid), then_lbl, else_lbl)
        }
      end in
    (pre_lbl,[pre_blk] @ [strt_blk] @ then_blk)
  | Ast.Block b ->
    let b_lbl, b_bl, b_ctxt = compile_block b c next_l in
    (b_lbl,b_bl)
  end


and compile_stmts (s : Ast.stmt list) (c : Ctxt.t) (next : Ll.lbl) =
  let block_list, next_l =
    List.fold_right(
      fun st (bblist, next_lbl) ->
        let s_lbl, s_blk = compile_stmt st c next_lbl in
        (s_blk@bblist, s_lbl)
    ) s ([],next) in
  (next_l, block_list)

and compile_block (b : Ast.block) (outer_ctxt: Ctxt.t) (next : Ll.lbl) =
  let vars,stmts = b in
  let entry_insns, inner_ctxt = compile_var_decls vars outer_ctxt in
  let top_lbl, bblist = compile_stmts stmts inner_ctxt next in
  let b_lbl = Ll.mk_lbl () in
  let entry_block =
    {
      Ll.label = b_lbl;
      Ll.insns = entry_insns;
      Ll.terminator = Ll.Br top_lbl
    } in
  (b_lbl, entry_block::bblist, inner_ctxt)

let compile_prog ((block, ret):Ast.prog) : Ll.prog =
  let end_lbl = Ll.mk_lbl () in
	
	let strt_lbl, blk_list, blk_ctxt = compile_block block Ctxt.empty end_lbl in

	let end_uid, end_insns =  compile_exp ret blk_ctxt in
	let end_blk = 
	{ Ll.label = end_lbl;
		Ll.insns = end_insns;
		Ll.terminator = Ll.Ret (Ll.Local (end_uid)) } in
	
	{ Ll.ll_cfg = blk_list @ [end_blk] ; Ll.ll_entry = strt_lbl }
