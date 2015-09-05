open Ll
open Lllib
open Ctxt


(* We generate code as a stream of elements, now augmented to include
 * global string constants that should be lifted to the top level. *)
type elt = 
  | L of lbl                (* Block labels *)
  | I of insn               (* LL IR instruction *)
  | T of terminator         (* Block terminators *)
  | G of operand * string   (* String constant -> global *)

(* During generation, we typically emit code so that it is in reverse
 * order when the stream is viewed as a list.  That is, instructions
 * closer to the head of the list are to be executed later in the
 * program.  That is because cons is more efficient then append.
 * 
 * To help make code generation easier, we define snoc (reverse cons)
 * and reverse append, which let us write code sequences in their
 * natural order. *)
type stream = elt list
let ( >@ ) x y = y @ x
let ( >:: ) x y = y :: x


(**************************)
(* LL IR helper functions *)
(**************************)

(* "Lift" Ocaml constants to LL IR constant operands of the right type. *)
let i1_op_of_bool b   = (I1, Const (if b then 1l else 0l))
let i32_op_of_int i   = (I32, Const (Int32.of_int i))
let i32_op_of_int32 i = (I32, Const i)

(* Compute a gep path to index into an Oat array represented as
 *   {i32, [ 0 x u] }*
 *)
let gep_array_index (i:operand) = [
  i32_op_of_int 0;   (* dereference the pointer *)
  i32_op_of_int 1;   (* focus on the array component of the struct *)
  i;                 (* index into the array *)
]


(* Compute a gep path to the length field of an Oat array. *)
let gep_array_len = [
  i32_op_of_int 0;  (* dereference the pointer *)
  i32_op_of_int 0;  (* focus on the length component of the struct *)
]

(*******************)
(* Compiling Types *)
(*******************)

(* Compile Oat types to LLVM types.  Arrays are represented as a
 * pointer to a structure of the form {i32, [0 x t]}.  The first i32
 * stores the size of the array.  A C-style string is stored as a
 * pointer to an array of chars, with no length information, since
 * Oat strings are immutable.
 * 
 * Note cmp_ty the translation of the *expression* types of the
 * language.  Left-hand-sides (of assignments ) are pointers to their
 * contained types.
 * 
 * Thus, a source variable of type t will have LL type: Ptr(cmp_ty t)
 * when used on the left-hand side of an assignment.
 * 
 * INVARIANT: The translation context maps source variables to their
 * LHS types.  *)
let rec cmp_ty (t:Ast.typ) =
  match t with
    | Ast.TInt  -> I32
    | Ast.TBool -> I1
    | Ast.TString -> Ptr I8  
    | Ast.TArray u -> Ptr (Struct [I32; Array(0l, cmp_ty u)])

let cmp_ty_option topt =
  match topt with
    | None -> None
    | Some t -> Some (cmp_ty t)

let cmp_ftyp (name:string) ((args,rto):Ast.ftyp) : fn = {
  name = name;
  rty = cmp_ty_option rto;
  ty_args = List.map (fun t -> cmp_ty t) args;
}

let cmp_fn (rto, (_,fid), args, _, _) : fn = 
  cmp_ftyp fid (List.map fst args, rto)

(************)
(* Builtins *)
(************)

(* Tc.ml defines a collection of 'builtin' functions that are
 * implicitly available for Oat programmers to use.  Here we define
 * their type translation.  *)

(* These functions are implemented in runtime.c but available to the programmer. *)
let builtin_fns =  List.map (fun (n, ft) -> cmp_ftyp n ft) Tc.builtin_functions

(*****************)
(* Oat Internals *)
(*****************)
(* Oat runtime internal functions. These should not be exposed to the
   programmer. *)

(* NOTE: oat_malloc isn't needed for this project, but is supported
   for later use. *)

(* They are not stored in the context, so they won't be found unless
   the user redefines them.  The compiler generates references to them
   directly. *)
let oat_malloc_fn      : fn = 
  {name = "oat_malloc"; rty = Some (Ptr I32); ty_args = [I32]; }

let oat_alloc_array_fn : fn = 
  {name = "oat_alloc_array"; rty = Some (cmp_ty (Ast.TArray Ast.TInt)); ty_args = [cmp_ty Ast.TInt];}

let oat_array_bounds_check_fn : fn = 
  {name = "oat_array_bounds_check"; rty = None; ty_args = [I32; I32]; }

let internal_fns = [
  oat_malloc_fn;
  oat_alloc_array_fn;
  oat_array_bounds_check_fn;
]


(* 
 * Generate a call to the runtime.c function oat_alloc_array.
 *   t is the src type
 *   size is an I32 operand, the number of elements in the array
 * returns: an operand of type (cmp_ty (Ast.TArray t)) and the
 * code for allocating the array.  Note that because oat_all-c_array_fn
 * polymorphic (its proper return type is generic in the element type), 
 * we have to use the Bitcast operation to let LL IR know what type 
 * the array should have. 
 *)
let oat_alloc_array_dynamic (t:Ast.typ) (size:operand) : operand * stream =
  let ans_ty = cmp_ty (Ast.TArray t) in
  let (ptr_id, ptr_op) = gen_local_op (cmp_ty (Ast.TArray Ast.TInt)) "array_ptr" in
  let (ans_id, ans_op) = gen_local_op ans_ty "array" in 
    (ans_op,
     [ I (Call(Some ptr_id, oat_alloc_array_fn, [size])) ] >::
       I (Bitcast(ans_id, ptr_op, ans_ty))) 


let oat_alloc_array_static (t:Ast.typ) (n:int) : operand * stream =
  let static_size = i32_op_of_int n in
    oat_alloc_array_dynamic t static_size

(*
 * Generate code to write eop to the array index i of array array_op.
 * Note that array_op has LL type cmp_ty (TArray t) 
 *    =   Ptr ((Struct [I32; Array(0l, cmp_ty u)])
 * So generate a getelementptr instruction to index into the array.
 *)
let cmp_array_update_static (t:Ast.typ) (i:int) (array_op:operand) (eop:operand) : stream =
  let elt_ty = cmp_ty t in
  let (index_id, index_op) = gen_local_op (Ptr elt_ty) "index_ptr" in
    [ I (Gep(index_id, array_op, gep_array_index (i32_op_of_int i))) ] >::
      I (Store(eop, index_op))


(*
 * Because LL IR is typed, we need some type information about the operations
 * to generate LL operands of the appropriate types.
 *)

(* Find the (source) result type of a binary operation. *)
let ty_of_bop (bop:Range.t Ast.binop) : ty =
  let open Ast in
    match bop with
      | Plus _ | Times _ | Minus _ | Shl _ | Shr _ | Sar _  | IAnd _ | IOr _ -> 
          cmp_ty TInt
      | Eq _ | Neq _ | Lt _ | Lte _ | Gt _ | Gte _ | And _ | Or _ -> 
          cmp_ty TBool

(* Find the (source) result type of a unary operation. *)
let ty_of_unop (unop:Range.t Ast.unop) : ty =
  let open Ast in
    match unop with
      | Neg _ | Not _ -> cmp_ty TInt
      | Lognot _ -> cmp_ty TBool


(* 
 * Compile a source binop to an LL instruction.
 *)
let cmp_binop (b : Range.t Ast.binop) :
    Ll.id -> Ll.operand -> Ll.operand -> Ll.insn  =
  let ib b id op1 op2 = (Ll.Binop (id, b, op1, op2)) in
  let ic c id op1 op2 = (Ll.Icmp (id, c, op1, op2)) in
  match b with
  | Ast.Plus _  -> ib Ll.Add
  | Ast.Times _ -> ib Ll.Mul
  | Ast.Minus _ -> ib Ll.Sub
  | Ast.And _   -> ib Ll.And
  | Ast.IAnd _  -> ib Ll.And 
  | Ast.IOr _   -> ib Ll.Or
  | Ast.Or _    -> ib Ll.Or
  | Ast.Shl _   -> ib Ll.Shl
  | Ast.Shr _   -> ib Ll.Lshr
  | Ast.Sar _   -> ib Ll.Ashr

  | Ast.Eq  _  -> ic Ll.Eq
  | Ast.Neq _  -> ic Ll.Ne
  | Ast.Lt  _  -> ic Ll.Slt
  | Ast.Lte _  -> ic Ll.Sle
  | Ast.Gt  _  -> ic Ll.Sgt
  | Ast.Gte _  -> ic Ll.Sge


(*
 * Compile a constant expression.  Booleans and integers 
 * are just straightforward operands.
 * Strings generate a global string identifier and 
 * create a pointer operand. *)
let cmp_const  (cn:Range.t Ast.const) : operand * stream =
  match cn with
  | Ast.Cbool(_,b)   -> (i1_op_of_bool b, [])
  | Ast.Cint(_,i)    -> (i32_op_of_int32 i ,[])
  | Ast.Cstring(_,s) -> 
      let (gid, gop) = gen_global_op (Ptr (cmp_ty Ast.TString)) "_oat_string" in
      let (lid, lop) = gen_local_op (cmp_ty Ast.TString) "strval" in
	(lop, [G (gop, s)] >:: (I (Load(lid,gop))))
        
(* Compile an expression, yielding a value computed by the stream and
 * stored in the resulting (usually fresh) operand. *)
let rec cmp_exp (c:ctxt) (exp:Range.t Ast.exp) : (operand * stream) =
  match exp with
    | Ast.Const cn -> cmp_const cn

    | Ast.Binop (bop, e1, e2) -> 
	let (op1, code1) = cmp_exp c e1 in
	let (op2, code2) = cmp_exp c e2 in
	let (ans_id, ans_op) = gen_local_op (ty_of_bop bop) "bop" in 
	  ((ans_op , code1 >@ code2 >:: I (cmp_binop bop ans_id op1 op2)))

    | Ast.Unop (uop, e) -> 
	let (op, code) = cmp_exp c e in
	let (ans_id, ans_op) = gen_local_op (ty_of_unop uop) "unop" in
	  ((ans_op, code >::
              I (match uop with
		   | Ast.Neg _    -> Binop (ans_id, Sub, i32_op_of_int 0, op)
		   | Ast.Lognot _ -> Icmp  (ans_id, Eq, op, i1_op_of_bool false)
		   | Ast.Not  _   -> Binop (ans_id, Xor, op, i32_op_of_int (-1)))))

    | Ast.Lhs l -> cmp_lhs_exp c l

    | Ast.Ecall ((_,id), es) ->
	if id = "length_of_array" then cmp_length_of_array c es 
	else
	  let (args,code) = List.fold_left
            (fun (ops,code) e ->
               let (op,s) =  cmp_exp c e in
		 (op::ops,code @ s)) ([],[]) es in
	  let args  = List.rev args in
	  let fn = lookup_fn id c in
	    begin match fn.rty with
	      | Some ty -> 
		  let (ans_id, ans_op) = gen_local_op ty "ret" in 
		    ((ans_op, code >:: I (Call (Some ans_id, fn, args))))
	      | None -> assert false (* true *)
	end

  | Ast.New(elem_ty,e1,id,e2) -> 
failwith "unimplemented"


(* Because length_of_array is polymorphic, we'd have to use bitcast to
 * call it However, its implementation is just a simple lookup of the
 * length data at the pointer representing the array, so we just inline
 * the instructions to do access the length field here. *)
and cmp_length_of_array (c:ctxt) (es:Range.t Ast.exp list) : operand * stream =
  begin match es with
    | [e] ->
	let (array_op, array_code) = cmp_exp c e in
	let (len_id, len_op) = gen_local_op (Ptr I32) "len_ptr" in 
	let (ans_id, ans_op) = gen_local_op I32 "len" in 
	  (ans_op,
           array_code >:: 
	     I (Gep(len_id, array_op, gep_array_len)) >:: 
	     I (Load(ans_id, len_op)))

    | _ -> failwith "Compiler error: length_of_array called on wrong number of arguments"
  end


(* In contrast to an expression, which yields a value, a
 * left-hand-side computes an address in memory to which a value can be
 * stored.  We therefore do not dereference the pointer here.  *)
and cmp_lhs (c:ctxt) (l:Range.t Ast.lhs) : operand * stream =
  match l with
    | Ast.Var(_, id) -> 
	begin match (lookup_local id c) with
	  | None -> 
	      begin match (lookup_global_val id c) with
		| None -> failwith (Printf.sprintf "Compiler error: cmp_lhs: variable %s not in the context" id)
		| Some op -> (op, [])
	      end
	  | Some op -> (op, [])
	end
    | Ast.Index(lhs,exp) ->
failwith "unimplemented"

(* When we treat a left-hand-side as an expression yielding a value,
   we actually load from the resulting pointer. *)
and cmp_lhs_exp c (l:Range.t Ast.lhs) : operand * stream =
  let (lhs_op, lhs_code) = cmp_lhs c l in
    begin match lhs_op with
      | (Ptr t, _) ->
	  let (ans_id, ans_op) = gen_local_op t "_lhs" in
	    (ans_op, lhs_code >:: I (Load(ans_id, lhs_op)))
      | (t, _) -> failwith (Printf.sprintf "Compiler invariant failed: cmp_lhs_exp %s had non-pointer type" (string_of_operand lhs_op))
    end


(* Compile an initializer. *)
and cmp_init c src_ty init : (operand * stream) =
  begin match init with
  | Ast.Iexp e -> cmp_exp c e

  (* Static arrays, like {1, 2, 3} have known size, so we can unroll
     the loop that initializes them. This does not work for the 'new'
     construct, since the array length isn't known until runtime. *)
  | Ast.Iarray (_,es) ->
      begin match src_ty with
	| Ast.TArray t -> 
	    let (array_op, array_code) = oat_alloc_array_static t (List.length es) in
	    let (init_code, _) = List.fold_left
              (fun (acc,i) e ->
		 let (eop, ecode) = cmp_init c t e in
		   (acc >@ ecode >@ cmp_array_update_static t i array_op eop, i+1))
	      ([],0) es  
	    in
	      (array_op, array_code >@ init_code)

	| _ -> failwith ("Compiler error: cmp_init called on non-array src_ty= " ^ (Astlib.string_of_typ src_ty))
      end
  end

(* Compile a variable declaration in a local scope. *)    
and cmp_vdecls (c:ctxt) (vs: Range.t Ast.vdecls) : (ctxt * stream) =
  List.fold_left
    (fun (c, code) {Ast.v_id=(_,src_id);v_init;v_ty=src_ty} ->
       let ll_ty = cmp_ty src_ty in
       let (init_op, init_code) = cmp_init c src_ty v_init in
       let alloca_id = gen_local src_id in
       let slot = id_op (Ptr ll_ty) alloca_id in
       let c = add_local c src_id slot in
	 (c, 
	  code >@
	    init_code >@
	    [I (Alloca (alloca_id, ll_ty))] >::
	    I (Store (init_op, slot)) )
    ) 
    (c,[]) vs


(* Compile statements. *)
and cmp_stmt (c:ctxt) (stmt : Range.t Ast.stmt) : stream =
  match stmt with
    | Ast.Assign (lhs ,e) ->
	let (lop, lhs_code) = cmp_lhs c lhs in
	let (eop, exp_code) = cmp_exp c e in
	  (lhs_code >@ exp_code >@ [I (Store (eop, lop))])

    | Ast.If (guard, st1, sto2) -> 
	let (op, guard_code) = cmp_exp c guard in
	let then_code = cmp_stmt c st1 in
	let else_code = match sto2 with 
	  | None -> [] | Some s -> cmp_stmt c s  in
	let (lt, le, lm) = (mk_lbl_hint "then", mk_lbl_hint "else", mk_lbl_hint "merge") in
	  guard_code >:: T (Cbr (op, lt, le)) >:: 
	    L lt >@ then_code >:: T (Br lm) >:: 
            L le >@ else_code >:: 
            L lm

    | Ast.While (guard, body) ->
	let (op, guard_code) = cmp_exp c guard in
	let (lcond, lbody, lpost) = mk_lbl_hint "cond", mk_lbl_hint "body", mk_lbl_hint "post" in
	let body_code = cmp_stmt c body  in
	  [L lcond] >@ guard_code >:: T (Cbr (op, lbody, lpost)) >::
            L lbody >@ body_code >:: T (Br lcond) >::
            L lpost

    | Ast.For (inits, guard, after, body) ->
	let guard = match guard with Some e -> e | None -> (Astlib.ast_of_bool true) in
	let after = match after with Some s -> [s] | None -> [] in
	let body = Ast.Block ([], body :: after) in
	  cmp_stmt c (Ast.Block (inits, [Ast.While (guard, body)]))

    | Ast.Block block -> snd (cmp_block c block)

    | Ast.Scall ((_,id),es)->
	let (args,code) = List.fold_left
          (fun (os,code) e ->
             let (op,s) = cmp_exp c e in
               (op::os,code @ s)) ([],[]) es in
	let args  = List.rev args in
	let fn  = lookup_fn id c in
	  code >:: I (Call (None,fn,args))

and cmp_stmts (c:ctxt) (stmts:Range.t Ast.stmts) : stream =
  List.fold_left
    (fun code s -> code >@ (cmp_stmt c s)) [] stmts

and cmp_block (c:ctxt) ((vdecls, stmts):Range.t Ast.block) : (ctxt * stream) =
  let (c, vdecl_code) = cmp_vdecls c vdecls in
  let block_code =  cmp_stmts c stmts in
    (c, vdecl_code >@ block_code)


(* Turns code for a function into a fdecl and adds it to the context
 * Along the way, it hoists global string values into the context too. *)

let build_fdecl (c:ctxt) (f:fn) (args:operand list) (code:stream) : ctxt =
  let blocks_of_stream (c:ctxt) (elts:stream) : ctxt * Ll.bblock list =
    let fresh_or o = match o with Some l -> l | None -> mk_lbl_hint "fresh" in
    let (c, _l, _is, bs) =
      List.fold_right
	(fun e (c, l, is, bs) ->
           begin match e with
             | L l' -> (c, Some l', [], 
			{label=fresh_or l;
			 insns=  List.rev is;
			 terminator= Ll.Br l'}::bs)
             | I i  -> (c, l, i::is, bs)
             | T t  -> (c, None, [], 
			{Ll.label=fresh_or l;
			 insns= List.rev is;
			 terminator= t}::bs)
	     | G (op, s) ->  (add_global c (mk_tmp ()) op (GString s), l, is, bs)
	   end)
	elts (c, None, [], []) in
      (c, List.rev bs)
  in
    
  let (c, cfg) = blocks_of_stream c code in
  let fdecl = {
    ll_name = f.name;
    ll_type = f.rty;
    ll_args = args;
    ll_cfg = cfg;
  } 
  in
    add_fdecl c fdecl

(* Compile the arguments to a function, mapping them to alloca'd storage space. *)
let cmp_args (c:ctxt) args : (ctxt * stream * operand list) =
  List.fold_right
    (fun  (src_ty,(_,src_arg_name)) (c,code,args) ->
       let ll_ty = cmp_ty src_ty in

       (* arg_op is the LL representation of the 'formal argument' *)
       let arg_op = id_op ll_ty (gen_local src_arg_name) in 

       (* alloca_id is the name of the stack slot for the argument *)
       let alloca_id = gen_local (src_arg_name ^ "_slot") in

       (* Invariant: the context maps source variables to pointers *)
       let slot = id_op (Ptr ll_ty) alloca_id in
       let c = add_local c src_arg_name slot in
         (c,
          [I (Alloca (alloca_id, ll_ty))] >::  
	    I (Store (arg_op, slot)) >@ code,
          arg_op :: args)) args (c,[],[]) 


(* Compile a function declaration. *)
let cmp_fdecl (c:ctxt) ((rtype, (_,fid),args,block,reto) : Range.t Ast.fdecl) : ctxt = 
  let c = enter_local_scope c in
  let (c, args_code, args) = cmp_args c args in
  let (c,block_code) = cmp_block c block in
  let ll_rty = match rtype with
    | None -> None
    | Some ty -> Some (cmp_ty ty) 
  in
  let fn = {name=fid; rty=ll_rty; ty_args=(List.map fst args)} in
  let code =
    match reto with
    | Some ret ->
        let (ans,exp_stream) = cmp_exp c ret in
        (args_code >@ block_code >@ (exp_stream >:: T (Ret (Some ans))))
    | None ->
        (args_code >@ block_code >:: T (Ret None)) 
  in 
    build_fdecl c fn args code 

(* The toplevel compilation context needs to have mappings for the
   signatures of all the builtin Oat functions. *)
let toplevel_ctxt = List.fold_left add_external empty_ctxt builtin_fns 

let cmp_gvdecl (c:ctxt) (v:Range.t Ast.vdecl) : ctxt =
  let {Ast.v_ty=t; Ast.v_id=(info,id); Ast.v_init=init} = v in
    (* Note that global initializers are compiled in the toplevel
       context -- they cannot refer to other globals. *)
  let (op, code) = cmp_init toplevel_ctxt t init in
  let u = cmp_ty t in
  let gid = mk_uid id in  (* globals are always pointer types *)
  let gop = (Ptr u, Id (Global gid)) in 
    begin match op with
      | (_, Const x) -> add_global c id gop (GConst x)  (* code should be empty *)
      | _ -> 
	  let init_name = (string_of_uid gid) ^ ".init" in
	  let init_fn = {name = init_name; rty = None; ty_args = []} in
	  let init_code = (code >@ [I(Store(op, gop))] >:: T (Ret None)) in
	  let c = build_fdecl c init_fn [] init_code in
	    add_global c id gop (GInit init_fn)
    end

(* Compile all of the program's top-level declarations, producing a
  new context *)
let rec cmp_prog (c:ctxt) (p:Range.t Ast.prog) : ctxt =
  begin match p with
    | [] -> c
    | Ast.Gvdecl vd :: q -> cmp_prog (cmp_gvdecl c vd) q 
    | Ast.Gfdecl fd :: q -> cmp_prog (cmp_fdecl c fd) q
  end

(* Collect the signatures for the global context.  Could in theory be
   provided by inspecting the globals of the typechecking context, but
   we re-do it here anyway. *)
let rec cmp_fctxt (c:ctxt) (p:Range.t Ast.prog) : ctxt =
  begin match p with
    | [] -> c
    | Ast.Gvdecl _ :: q -> cmp_fctxt c q
    | Ast.Gfdecl fd :: q -> cmp_fctxt (add_fn c (cmp_fn fd)) q
  end


(* Compile a toplevel program.  This program also creates an oat
   function called oat_init that is run before the program starts to
   initialize all the global data values by running the code
   associated with them.  The function prototypes exposed include both
   the builtin functions and the Oat internal functions. *)
let cmp_toplevel (p: Range.t Ast.prog) : Ll.prog =
  let global_initializer c gs =
    let code = List.concat 
      (List.map (fun (_, ginit) -> match ginit with
		   | GConst _ | GString _ -> []
		   | GInit fn -> [I(Call(None, fn, []))]) gs) in
        build_fdecl c {name="oat_init"; rty=None; ty_args=[]} [] (code >:: (T (Ret None)))
  in		      
  let c = cmp_fctxt toplevel_ctxt p in
  let c = cmp_prog c p in
  let c = global_initializer c (get_globals c) in
    {
      Ll.prototypes = builtin_fns @ internal_fns;
      Ll.globals    = get_globals c;
      Ll.functions  = get_fdecls c;
    }



    
