(* The Oat Typechecker *)

open Ast
open Astlib
open Tctxt

let norange = Range.norange
let sprintf = Printf.sprintf

(* Type alias for an element of csigs *)
type csig = string option * fcontext * typ list * mcontext


(* See oat.pdf for a complete specification of the functions
   containined in this file.

   Each judgment is implemented by an OCaml function named tc_<foo>
   where <foo> name of the judgment rules.  For example, the judgment
   for typechecking optional statments has two cases named
   OPT_EXP_NONE and OPT_EXP_SOME.  Those rules are implemented by the
   single OCaml function tc_opt_exp, which has two cases.

   Every judgment found in oat.pdf translates similarly.  Before
   starting the assignment, spend some time looking at the
   relationship between the functions defined here and the inference
   rules in oat.pdf.

   The typechecker uses the Tctxt module to implement the
   \Delta;\Gamma data structure used in the type inference rules of
   oat.pdf.  You'll need to use the context operations documented in
   tctxt.ml to manipulate the \Delta and \Gamma contexts. *)


(* Helper functions for generating error message.
 *
 * All typechecking errors are reported using the TypeError exception
 * with an informative error message as the string.
 *
 * Errors / unexpected conditions in the typechecking code itself
 * should signal a Failure exception (using failwith).
 *
 * Use assert_equal_types to validate that two Oat types are equal.
 * See its use in tc_opt_exp for an example.
 *)
exception TypeError of string

let type_error s = raise (TypeError s)

(* Prefix a message with file location info. *)
let info_msg (info:Range.t) (msg:string) : string =
  (Range.string_of_range info) ^ ": " ^ msg

(* Prefix a format string with file location info. *)
let imsg (info:Range.t) fmt =
  sprintf ("%s: " ^^ fmt) (Range.string_of_range info)

(* A standard type checking error. *)
let type_error_msg (info:Range.t) (expected:typ) (found:typ) : string =
  imsg info "This expression has type %s but an expression was expected of type %s."
    (string_of_typ found) (string_of_typ expected)

(* Illegally redefining an identifier. *)
let redef_msg (info:Range.t) (id:string) : string =
  imsg info "The identifier '%s' has already been defined." id

(* Assertions *)
let tc_assert (b:bool) (msg:string) : unit =
  if not b then type_error msg

(* Assert that the type found is the type that was expected *)
let assert_equal_types (info:Range.t) (expected:typ) (found:typ) : unit =
  tc_assert (found = expected) (type_error_msg info expected found)

let in_sigs (cid:string) (c:ctxt) : bool =
  match lookup_class_sig cid c with Some _ -> true | None -> false


(*******************************)
(* Builtin functions' types.   *)
(*******************************)

(* Object *)
let object_cid = "Object"

let cid_of_extopt cid =
  match cid with Some id -> id | None -> object_cid

(* Defines the types of the built-in Oat functions.  *)
let builtin_functions : (string * ftyp) list = [
  ("string_of_array", ([TRef (RArray TInt)], Some (TRef RString)));
  ("array_of_string", ([TRef RString], Some (TRef (RArray TInt))));
  ("string_of_int", ([TInt], Some (TRef RString)));
  ("string_cat", ([TRef RString; TRef RString], Some (TRef RString)));
  ("length_of_string", ([TRef RString], Some (TInt)));
  ("print_string", ([TRef RString], None));
  ("print_int", ([TInt], None));
  ("print_bool", ([TBool], None));
]


(*****************************)
(* Typechecking functions.   *)
(*****************************)

(* Each function is derived from one of the sets of inference rules of
 * oat.pdf.  *)

let rec wf_typ (c:ctxt) (t:typ) : bool =
  match t with
    | TRef r | TNullable r -> wf_ref c r
    | _ -> true

and wf_ref (c:ctxt) (r:ref) : bool =
  match r with
    | RString -> true
    | RArray t -> wf_typ c t
    | RClass cid -> in_sigs cid c

let wf_rtyp (c:ctxt) (r:rtyp) : bool =
  match r with Some t -> wf_typ c t | None -> true

(* Subtyping *)

(* Returns whether cid1 is a subclass of cid2 (transitively) according to
 * the given signatures. *)
let rec subclass (c:ctxt) (cid1:cid) (cid2:cid) : bool =
  if cid1 = cid2 then in_sigs cid1 c
  else match lookup_class_sig cid1 c with
  | None | Some (None, _, _,_) -> false
  | Some (Some sup1, fc,cs, mc) -> subclass c sup1 cid2

(* Determines whether r1 is a subtype (as a reference) of r2. *)
let subref (c:ctxt) (r1:ref) (r2:ref) : bool =
  match r1,r2 with
  | RClass cid1, RClass cid2 -> subclass c cid1 cid2
  | r1, r2 -> r1 = r2

let subtype (c:ctxt) (t1:typ) (t2:typ) : bool =
  match t1,t2 with
  | TRef r1, TRef r2
  | TNullable r1, TNullable r2
  | TRef r1, TNullable r2 -> subref c r1 r2
  | TBot, TNullable r2 -> true
  | t1,t2 -> t1 = t2

let assoc' k a = try Some (List.assoc k a) with Not_found -> None

(* Class contexts *)
let rec get_field (c:ctxt) (cid:string) (id:string) : typ option =
  match lookup_class_sig cid c with
    | None -> failwith (sprintf "BUG: get_field given undefined cid '%s' cid" cid)
    | Some (None, fc, _, _) -> assoc' id fc
    | Some (Some ext, fc, _, _) ->
      match assoc' id fc with
        | Some t -> Some t
        | None -> get_field c ext id

let rec get_method (c:ctxt) (cid:string) (id:string) : ftyp option =
  match lookup_class_sig cid c with
    | None -> failwith (sprintf "BUG: get_method given undefined cid '%s' cid" cid)
    | Some (None, _, _, mc) -> assoc' id mc
    | Some (Some ext, _, _, mc) ->
      match assoc' id mc with
        | Some ft -> Some ft
        | None -> get_method c ext id

(* Unary operations *)
let tc_unop (uop:Range.t unop) (t:typ) : typ =
  let error_msg = imsg (unop_info uop) "%s cannot take input type: %s."
    (string_of_unop uop) (string_of_typ t) in
  match uop with
      Neg _ | Not _ ->
        if t = TInt then TInt else type_error error_msg
    | Lognot _ ->
        if t = TBool then TBool else type_error error_msg

(* Binary operations *)
let tc_bop (bop:Range.t binop) (t1:typ) (t2:typ) : typ =
  let error_msg = imsg (binop_info bop) "%s cannot take input type: (%s, %s)."
    (string_of_binop bop) (string_of_typ t1) (string_of_typ t2) in
  match bop with
      Plus _ | Times _ | Minus _ | Shl _ | Shr _ | Sar _ ->
        if (t1 = TInt && t2 = TInt) then TInt else type_error error_msg
    | Eq _ | Neq _ ->
        if (t1 = t2) then TBool else type_error error_msg
    | Lt _ | Lte _ | Gt _ | Gte _ ->
        if (t1 = TInt && t2 = TInt) then TBool else type_error error_msg
    | IAnd _ | IOr _ ->
        if (t1 = TInt && t2 = TInt) then TInt else type_error error_msg
    | And _ | Or _ ->
        if (t1 = TBool && t2 = TBool) then TBool else type_error error_msg

(* Constants *)
let tc_const (cn:Range.t const) : typ =
  match cn with
      Cnull _ -> TBot
    | Cbool _ -> TBool
    | Cint _ -> TInt
    | Cstring _ -> TRef RString

(* A few more helper functions
 * find_this: find sig of current class in ctxt
 * assert_subtype: throw error if t1 is not a subtype of t2
 * assert_all_types: check subtyping of list of exps against list of types
 *)
let find_this (c:ctxt) : (cid * csig) option =
  match lookup_this c with
    | None -> None
    | Some cid -> match lookup_class_sig cid c with
        | Some csig -> Some (cid, csig)
        | None -> None

let assert_subtype (c:ctxt) (info:Range.t) (t1:typ) (t2:typ) : unit =
  tc_assert (subtype c t1 t2)
    (imsg info "Expected subtype of '%s' but got '%s'."
       (string_of_typ t2) (string_of_typ t1))

let rec assert_args (c:ctxt) (info:Range.t) (ts:typ list) (es:'a exp list) : unit =
  let lt = List.length ts in
  let le = List.length es in
  tc_assert (lt = le) (imsg info "Expected %d arguments but found %d" lt le);
  List.iter2 (fun e t' ->
    let t = tc_exp c e in
    assert_subtype c (exp_info e) t t'
  ) es ts


(* Typecheck paths *)
and tc_path (c:ctxt) (p:Range.t path) : gtyp =
  let cid, (info, id) = match p with
    | ThisId (info, id) ->
      begin match lookup_this c with
        | Some cid -> cid, (info, id)
        | None -> type_error (imsg info "This referenced from outside of class.")
      end
    | PathId (l, (info, id)) ->
      begin match tc_lhs_or_call c l with
        | TRef (RClass cid) -> cid, (info, id)
        | _ -> type_error (imsg info "Path root must be of class type.")
      end
  in
  match get_field c cid id, get_method c cid id with
    | Some t, None -> GVal t
    | None, Some ft -> GFn ft
    | None, None -> type_error
      (imsg (path_info p) "'%s' is not a field or method of class '%s'." id cid)
    | Some _, Some _ ->
      failwith (sprintf "BUG: %s.%s is both a field and method in ctxt" cid id)


and tc_call (c:ctxt) (ca:Range.t call) : rtyp =
  match ca with
    | Func ((info,fid), es) ->
      begin match (lookup_global_fn fid c) with
	    | None ->
	      (* We have to handle length_of_array specially because it has a
           * generic type, which isn't expressible in the language of Oat types *)
          if (fid = "length_of_array")
          then Some (tc_length_of_array c info es)
          else type_error (imsg info "Function '%s' is not declared." fid)
        | Some (ts, rt) -> assert_args c info ts es; rt
      end
    | SuperMethod ((info,id), es) ->
      begin match find_this c with
        | None -> type_error (imsg info "Super referenced outside of class scope.")
        | Some (this, (None, _, _, _)) ->
          type_error (imsg info "Class '%s' has no parent class." this)
        | Some (this, (Some ext, _, ctor, _)) ->
          match get_method c ext id with
            | None ->
              type_error (imsg info "Method '%s' not defined for class '%s'." id this)
            | Some (ts,rt) -> assert_args c info ts es; rt
      end
    | PathMethod (p, es) ->
      let info = path_info p in
      begin match tc_path c p with
        | GVal _ -> type_error (imsg info "Expected path of function type.")
        | GFn (ts,rt) -> assert_args c info ts es; rt
      end


and tc_lhs_or_call (c:ctxt) (lc:Range.t lhs_or_call) : typ =
  match lc with
    | Lhs l -> tc_lhs c l
    | Call ca ->
      match (tc_call c ca) with
        | Some t -> t
        | _ -> type_error
          (imsg (lhs_or_call_info lc) "Call expression can not have type unit.")


(* Expressions *)
and tc_exp (c:ctxt) (e:Range.t exp) : typ =
  match e with
    | Const cn -> tc_const cn

    | This info ->
      begin match lookup_this c with
        | Some cid -> TRef (RClass cid)
        | None -> type_error (imsg info "This referenced outside of class scope.")
      end

    | LhsOrCall lc -> tc_lhs_or_call c lc

    | New (elem_typ,e1, (_,id), e2) ->
      let indext = tc_exp c e1 in
	  let _ = assert_equal_types (exp_info e1) TInt indext in
      let c' = add_local id TInt c in
      let found = tc_exp c' e2 in
	  let _ = assert_equal_types (exp_info e2) elem_typ found in
      TRef (RArray elem_typ )

    | Ctor ((info, cid), es) ->
      begin match lookup_class_sig cid c with
        | Some (_, _, ts, _) -> assert_args c info ts es; TRef (RClass cid)
        | None -> type_error (imsg info "Class '%s' not defined." cid)
      end

    | Binop (bop, e1, e2) ->
      let t1 = tc_exp c e1 in
      let t2 = tc_exp c e2 in
      tc_bop bop t1 t2

    | Unop (uop, e) ->
      let t = tc_exp c e in
      tc_unop uop t


(* Left-hand sides *)
and tc_lhs (c:ctxt) (l:Range.t lhs) : typ =
  match l with
    | Var (info,id) ->
      begin match lookup_local id c, lookup_global_val id c with
        | Some t, _ | None, Some t -> t
        | None, None -> type_error (imsg info "The identifier '%s' is not defined." id)
      end
    | Path p ->
      begin match tc_path c p with
        | GVal t -> t
        | _ -> type_error (imsg (path_info p) "lhs cannot be of function type")
      end
    | Index (clhs, e) ->
	  begin match (tc_lhs_or_call c clhs) with
	    | TRef (RArray t) ->
	      let found = tc_exp c e in
	      assert_equal_types (exp_info e) TInt found; t
	    | _ -> type_error
          (imsg (lhs_or_call_info clhs) "Indexed lhs is not of array type.")
      end

(* length_of_array has a polymorphic type that works for any array.  We special-case
 * typechecking here. *)
and tc_length_of_array c info es : typ =
  match es with
    | [e] ->
      begin match tc_exp c e with
        | TRef (RArray _) -> TInt
        | _ -> type_error (imsg (exp_info e) "This expression should be of array type.")
      end
    | _ -> type_error (imsg info "Call to length_of_array has wrong number of args.")

(* An optional exception is used in For loops, it must have type bool *)
let tc_opt_exp (c:ctxt) (eo:(Range.t opt_exp)) : unit =
  begin match eo with
    | None -> ()
    | Some e ->
	let found = tc_exp c e in
	  assert_equal_types (exp_info e) TBool found
  end

(* Variable initializers *)
let rec tc_init (c:ctxt) (expected:typ) (i:Range.t init) : unit =
  begin match i with
    | Iexp e -> let found = tc_exp c e in
	  assert_subtype c (init_info i) found expected
    | Iarray (info, is) ->
	  begin match expected with
	    | TRef (RArray t) | TNullable (RArray t) -> List.iter (tc_init c t) is
	    | _ -> type_error (imsg info "Array initializer used for non-array type.")
	end
  end

(* List of variable declarations *)
let tc_vdecls (c:ctxt) (vdecls:(Range.t vdecl) list) : ctxt =
  List.fold_left (fun c ({v_ty=expected; v_id=(info,id); v_init=i;}) ->
    tc_init c expected i;
    tc_assert (wf_typ c expected)
      (imsg info "Variable decl has poorly formed type '%s'." (string_of_typ expected));
    tc_assert (not (in_locals id c))
      (imsg info "Local variable %s already in scope." id);
    add_local id expected c
  ) c vdecls

(* Statements *)
let rec tc_stmt (c:ctxt) (s:Range.t stmt) : unit =
  match s with
  |  Assign (l, e) ->
      let tl = tc_lhs c l in
      let te = tc_exp c e in
	  assert_subtype c (lhs_info l) te tl

  | Scall cl ->
    tc_assert (tc_call c cl = None)
      (imsg (call_info cl) "Function called as stmt must return unit.")

  | Fail e ->
    assert_equal_types (exp_info e) (TRef RString) (tc_exp c e)

  | If (e, st1, sto2) ->
      let found = tc_exp c e in
      assert_equal_types (exp_info e) TBool found;
      tc_stmt c st1;
      tc_opt_stmt c sto2

  | IfNull (r, (info, id), e, st, sto) ->
    begin match tc_exp c e with
      | TNullable _ ->
        let c' = add_local id (TRef r) c in
        tc_stmt c' st;
        tc_opt_stmt c sto;              (* check without r in scope *)
      | _ -> type_error (imsg (exp_info e) "Null check must be on nullable ref.")
    end

  | While (e, st) ->
    let found = tc_exp c e in
    assert_equal_types (exp_info e) TBool found;
    tc_stmt c st

  | For (vdecls, eo, sto1, st2) ->
    let c' = tc_vdecls c vdecls in
    tc_opt_exp c' eo;
    tc_opt_stmt c' sto1;
    tc_stmt c' st2

  | Block block ->
    ignore (tc_block c block)

  | Cast (cid, (info, id), e, st1, sto) ->
     begin match tc_exp c e with
         | TRef (RClass cid') as t'->
            let t = TRef (RClass cid) in
            tc_assert (subtype c t t')  (imsg (exp_info e) "Cast expects super class of %s, but found %s" (string_of_typ t) (string_of_typ t'));
            tc_stmt (add_local id (TRef (RClass cid)) c) st1;
            tc_opt_stmt c sto;
         | t -> type_error (imsg (exp_info e) "Cast takes a class type, but found '%s'." (string_of_typ t))
     end


(* Sequence of statements *)
and tc_stmts (c:ctxt) (stmts:'a stmts) : unit =
  List.iter (tc_stmt c) stmts

(* Blocks *)
and tc_block (c:ctxt) ((vdecls, stmts):Range.t block) : ctxt =
  let c' = tc_vdecls c vdecls in
  tc_stmts c' stmts; c'

(* Optional statements *)
and tc_opt_stmt (c:ctxt) (so:(Range.t stmt) option) : unit =
  match so with
    | Some s -> tc_stmt c s
    | None -> ()

(* Function argument lists *)
let tc_args (c:ctxt) args : ctxt =
  let extend c (t, (info, id)) =
    tc_assert (wf_typ c t)
      (imsg info "Argument '%s' has poorly formed type." id);
    tc_assert (not (in_locals id c))
      (imsg info "Argument '%s' occurs multiple times." id);
    add_local id t c
  in List.fold_left extend c args

(* Function declarations *)
let tc_fdecl (c:ctxt)  ((rt, (info,fid), args, block, eo): Range.t fdecl) : unit =
  let c' = tc_args c args in
  let c'' = tc_block c' block in
  match (eo, rt) with
    | (Some e, Some expected) ->
	  let found = tc_exp c'' e in
	  assert_subtype c'' info found expected
    | (None, None) -> ()
    | (Some _, None) ->
        type_error (imsg info "Expected to return unit.")
    | (None, Some expected) ->
        type_error (imsg info "Expected to return %s." (string_of_typ expected))

(* Check whether a method id of type ftype can override the corresponding id
   of extopt. *)
let can_override (c:ctxt) (extopt:cid option) (id:string) (ft:ftyp) : bool =
  match extopt with
    | None -> true
    | Some ext ->
      match get_method c ext id, ft with
        | None, _ -> true
        | Some (ts, None), (ts', None) ->
          List.length ts = List.length ts'
          && List.for_all2 (subtype c) ts ts'
        | Some (ts, Some r), (ts', Some r')  ->
          List.length ts = List.length ts'
          && List.for_all2 (subtype c) ts ts' && subtype c r' r
        | _, _ -> false

let tc_method (c:ctxt) (m:Range.t fdecl) : unit =
  match find_this c with
    | None -> failwith "BUG: tc_method could not find csig of 'this'"
    | Some (this, (extopt, _, _, _)) ->
      let (r, (info,id), args, _, _) = m in
      let ats = List.map fst args in
      tc_assert (can_override c extopt id (ats, r))
        (imsg info "Method '%s'.'%s' can't override superclass." this id);
      tc_fdecl c m

let tc_fields (c:ctxt) (fs:Range.t fields) : unit =
  List.iter (fun (t, (info, id)) ->
    tc_assert (wf_typ c t)
      (imsg info "Field '%s' has poorly formed type" id)
  ) fs

let rec tc_cinits (c:ctxt) (cs:Range.t cinits) : unit =
  match find_this c with
    | None -> failwith "BUG: tc_cinits could not find csig of 'this'"
    | Some (this, (extopt, fc, _, _)) ->
      let init_ids = List.map (fun ((info, id), init) ->
        match get_field c this id with
          | None -> type_error (imsg info "Class '%s' has no field '%s'." this id)
          | Some t -> tc_init {c with this=None} t init; id
      ) cs in
      List.iter (function
        | id, TRef _ -> tc_assert (List.exists ((=) id) init_ids)
          (imsg (cinits_info cs) "Ref field '%s'.'%s' not initialized." id this)
        | _, _ -> ()
      ) fc

let tc_ctor (c:ctxt) ((args, es, is, block):Range.t ctor) : unit =
  let this = match lookup_this c with
    | None -> failwith "BUG: tc_ctor expected this to be set in ctxt"
    | Some cid -> cid
  in
  let c' = tc_args c args in
  (* find signature of super class *)
  let ctor = match lookup_class_sig this c with
    | None -> failwith ("BUG: tc_ctor called with cid not in ctxt: " ^ this)
    | Some (None, _, _, _) -> []
    | Some (Some ext, _, _, _) ->
      match lookup_class_sig ext c with
        | None -> failwith ("BUG: super class not in ctxt: " ^ ext)
        | Some (_, _, cs, _) -> cs
  in
  assert_args (set_this None c') norange ctor es;
  tc_cinits c' is;
  ignore (tc_block c' block)

let tc_cdecl (c:ctxt) ((cid, extopt, fs, cs, ms):Range.t cdecl) : unit =
  let c' = set_this (Some cid) c in
  tc_fields c' fs;
  tc_ctor c' cs;
  List.iter (tc_method c') ms

let rec ext_fcontext (c:ctxt) (ext:cid) (fc:fcontext) (fs:'a fields) : fcontext =
  match fs with
    | [] -> fc
    | (t, (info, id))::fs' ->
      tc_assert (not (List.mem_assoc id fc))
        (imsg info "Field '%s' already defined in this class." id);
      tc_assert (get_field c ext id = None)
        (imsg info "Field '%s' shadows a field of a superclass." id);
      ext_fcontext c ext ((id, t)::fc) fs'

let rec ext_mcontext (c:ctxt) (ext:cid)
    (fc:fcontext) (mc:mcontext) (ms:'a fdecl list) : mcontext =
  match ms with
    | [] -> mc
    | (r, (info, id), args, _, _)::ms' ->
      tc_assert (not (List.mem_assoc id fc))
        (imsg info "Identifier '%s' already bound to field." id);
      tc_assert (not (List.mem_assoc id mc))
        (imsg info "Method '%s' already defined in this class class." id);
      let argts = List.map fst args in
      ext_mcontext c ext fc ((id, (argts, r))::mc) ms'


(* Collect the global function and class contexts *)
let rec tc_fctxt (c:ctxt) (p:Range.t prog) : ctxt =
  match p with
    | [] -> c

    | (Gvdecl _) :: q -> tc_fctxt c q

    | (Gfdecl  (rtyp, (info, fid), args, _, _)) :: q
    | (Gefdecl (rtyp, (info, fid), args)) :: q ->
      tc_assert (not (in_globals fid c)) (redef_msg info fid);
      let tjs = List.map fst args in
	  tc_fctxt (add_global_fn fid (tjs, rtyp) c) q

    | (Gcdecl (cid, extopt, fs, (cargs, _, _, _), ms)) :: q ->
      let ext = cid_of_extopt extopt in
      tc_assert (not (in_sigs cid c))
        (imsg norange "Class '%s' redeclared." cid);
      tc_assert (in_sigs ext c)
        (imsg norange "Super class '%s' of class '%s' not declared." ext cid);
      let fctxt = ext_fcontext c ext [] fs in
      let mctxt = ext_mcontext c ext fctxt [] ms in
      let cts = List.map fst cargs in
      let c' = add_class_sig cid (Some ext) fctxt cts mctxt c in
      tc_fctxt c' q


(* Create the toplevel typechecking context. *)
let toplevel_ctxt =
  List.fold_left (fun c (name, t) -> add_global_fn name t c)
    empty_ctxt builtin_functions

(* Typechecks a program assuming that c has already got the
 * function context initialized properly *)
let rec tc_prog (c:ctxt) (p:Range.t prog) : unit =
  match p with
    | [] -> ()
    | Gvdecl {v_ty=expected; v_id=(info, id); v_init=init} :: q ->
      tc_assert (wf_typ c expected)
        (imsg info "Global variable '%s' has poorly formed type." id);
      tc_assert (not (in_globals id c)) (redef_msg info id);
      tc_init {c with globals=[]; locals=[]} expected init;
	  tc_prog (add_global_val id expected c) q
    | Gfdecl fd :: q ->
	  tc_fdecl c fd;
	  tc_prog c q
    | Gefdecl (r, (info,id), args) :: q ->
      ignore (tc_args c args);
      tc_assert (wf_rtyp c r)
        (imsg info "Argument '%s' has poorly formed type." id);
      tc_prog c q
    | Gcdecl cd :: q ->
      tc_cdecl c cd;
      tc_prog c q

(* A toplevel program: ensures that there is a function called
 * 'program' with the right type. *)
let tc_toplevel (p:Range.t prog) : unit =
  let c = tc_fctxt toplevel_ctxt p in
  begin match lookup_global_fn "program" c with
    | None -> ()
    | Some([TInt; TRef (RArray (TRef RString))], Some TInt) -> ()
    | Some(ts,ret) ->
	  type_error ("'program' must have type (int, string[]) -> int")
  end;
  tc_prog c p
