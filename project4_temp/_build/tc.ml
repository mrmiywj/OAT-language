(* The Oat Typechecker *)

open Ast
open Astlib
open Printf
open Tctxt

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

(* A standard type checking error. *)
let type_error_msg (info:Range.t) (expected:typ) (found:typ) : string =
  info_msg info 
    (sprintf 
    "This expression has type %s but an expression was expected of type %s." 
    (string_of_typ found) (string_of_typ expected))

(* Assert that the type found is the type that was expected *)
let assert_equal_types (info:Range.t) (expected:typ) (found:typ) : unit =
  if (not (found = expected)) then 
    type_error (type_error_msg info expected found)


(*******************************)
(* Builtin functions' types.   *)
(*******************************)


(* Defines the types of the built-in Oat functions.  *)
let builtin_functions : (string * ftyp) list = [
  ("string_of_array", ([TArray TInt], Some TString));
  ("array_of_string", ([TString], Some (TArray TInt)));
  ("print_string", ([TString], None));
  ("print_int", ([TInt], None));
  ("print_bool", ([TBool], None));
]




(*****************************)
(* Typechecking functions.   *)
(*****************************)

(* Each function is derived from one of the sets of inference rules of
 * oat.pdf.  *)


(* Unary operations *)
let tc_unop (uop:Range.t unop) (t:typ) : typ =
  let error_msg = info_msg (unop_info uop)
    (sprintf "%s cannot take input type: %s." (string_of_unop uop)
       (string_of_typ t))
  in
  match uop with
      Neg _ | Not _ -> 
        if t = TInt then TInt else type_error error_msg
    | Lognot _ -> 
        if t = TBool then TBool else type_error error_msg

(* Binary operations *)
let tc_bop (bop:Range.t binop) (t1:typ) (t2:typ) : typ =
  let error_msg = info_msg (binop_info bop) 
    (sprintf "%s cannot take input type: (%s, %s)." 
             (string_of_binop bop) (string_of_typ t1) (string_of_typ t2))
  in
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
let  tc_const (cn:Range.t const) : typ =
  match cn with
    | Cbool _ -> TBool
    | Cint _ -> TInt
    | Cstring _ -> TString

(* Expressions *)
let rec tc_exp (c:ctxt) (e:Range.t exp) : typ =
  let error_msg = info_msg (exp_info e)
    (sprintf "%s cannot be matched."
       (string_of_exp e))
  in
  begin match e with
  | Const x  -> tc_const x
  | Lhs x -> tc_lhs c x
  | Binop (x,y,z) -> tc_bop x (tc_exp c y) (tc_exp c z)
  | New (typ,e1,id,e2) -> if (tc_exp c e1 <> TInt) then
      type_error error_msg
    else
      let newc = add_local (snd id) TInt c in
      TArray (tc_exp newc e2)
  | Unop (uop, e) -> tc_unop uop (tc_exp c e)
  | Ecall ((_,s),explist) ->
    if s = "length_of_array" then
      begin match explist with
      | hd::[] ->
        begin match tc_exp c hd with
        | TArray t -> TInt
        | _ -> type_error "length_of_array's arg is not array"
        end
      | _-> type_error "length_of_array has too much args"
      end
    else 
    let f = lookup_global_fn s c in
    begin match f with
    | Some (paratyplist, rtyp) -> if
        List.length paratyplist <> List.length explist then type_error "their length donot match"
      else 
      if rtyp = None then type_error error_msg else
        List.iter2 (fun a -> fun b -> if (a = tc_exp c b) then () else type_error "Call type wrong") paratyplist explist;
      begin match rtyp with
      | Some t -> t
      | None -> type_error error_msg
      end
    | None -> type_error error_msg
    end
  end



(* Left-hand sides *)
and tc_lhs (c:ctxt) (l:Range.t lhs) : typ =
  begin  match l with
  | Var (_,s) ->  begin match lookup_local s c,lookup_global_val s c with
                 | Some t,_ | None, Some t -> t
                 | None,None -> type_error "Some var does not have a type"
                 end
  | Index (lh,e) -> if (tc_exp c e <> TInt) then
      type_error "Some array's index is not TInt"
    else
      let l = tc_lhs c lh in
      begin match l with
      | TArray (t) -> t
      | _ -> type_error "Some array is not defined"
      end
  end 


let rec cmp_typs (e:Range.t exp list) (t: typ list) (c:ctxt) :unit =
  if List.length e <> List.length t then type_error "args dont match up" else
    begin match t with
    | h :: tl ->
      begin match e with
      | h2::tl2 -> if tc_exp c h2 <> h then type_error "type error!"
        else cmp_typs tl2 tl c
      | [] -> ()
      end
    | [] -> ()
    end

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
  | Iexp e -> if (tc_exp c e = expected) then () else type_error (type_error_msg (exp_info e) expected (tc_exp c e))
  | Iarray (_,elist) ->
    begin match expected with
    | TArray t ->  List.iter (fun init -> tc_init c t init) elist
    | _ -> type_error "which expected is not an array"
    end
  end

(* List of variable declarations *)
let tc_vdecls (c:ctxt) (vdecls:(Range.t vdecl) list) : ctxt =
  List.fold_left (fun c vdecl -> if (in_locals (snd vdecl.v_id) c) then type_error "Some val has ben declared " else ((tc_init c vdecl.v_ty vdecl.v_init);add_local (snd vdecl.v_id) vdecl.v_ty c)) c vdecls

(* Statements *)
let rec tc_stmt (c:ctxt) (s:Range.t stmt) : unit =
  begin match s with
  | Assign (lh,e) -> if (tc_lhs c lh = tc_exp c e) then () else type_error "assign wrong"
  | Scall ((_,s),elist) -> let f = lookup_global_fn s c in
                            begin match f with
                            | Some (tl,rt) -> cmp_typs elist tl c; if rt <> None then
                                type_error "functions whose return type is not None cannot be stmt";()
                            | None -> type_error "couldn't find this function";()
                            end
  | If (e1,st1,st2) -> if tc_exp c e1 <> TBool then
      type_error "If statement should have TBool"else
      tc_stmt c st1;tc_opt_stmt c st2
  | While (e,st) -> if (tc_exp c e <> TBool) then type_error "while should have TBool" else
      tc_stmt c st
  | For (v,opt_exp, st1,st2) -> let newc = tc_vdecls c v in
                                tc_opt_exp newc opt_exp;tc_stmt newc st2;tc_opt_stmt newc st1
  | Block (vdecls, stmts) -> let newc = tc_vdecls c vdecls in
                             tc_stmts newc stmts
  end 

(* Sequence of statements *)
and tc_stmts (c:ctxt) (stmts:'a stmts) : unit =
  List.iter (tc_stmt c) stmts

(* Blocks *)
and tc_block (c:ctxt) (vdecls, stmts) : ctxt =
  let c' = tc_vdecls c vdecls in
  let () = tc_stmts c' stmts in
    c'

(* Optional statements *)
and tc_opt_stmt (c:ctxt) (so:(Range.t stmt) option) : unit =
  match so with
    | Some s -> tc_stmt c s
    | None -> ()

(* Function argument lists *)
let tc_args (c:ctxt) args : ctxt =
  let extend c (t, (info, id)) = 
    if in_locals id c then 
      type_error (info_msg info ("argument "^ id ^" occurs twice."))
    else 
      add_local id t c
  in List.fold_left extend c args

(* Function declarations *)
let tc_fdecl (c:ctxt)  ((rt, (info,fid), args, block, eo): Range.t fdecl) : unit =
  let c' = tc_args c args in
  let c'' = tc_block c' block in 
  match (eo, rt) with
    | (Some e, Some expected) -> 
	let found = tc_exp c'' e in
	  assert_equal_types info expected found
    | (None, None) -> ()
    | (Some _, None) -> 
        type_error (info_msg info "Expected to return unit.")
    | (None, Some expected) -> 
        type_error (info_msg info ("Expected to return "^ (string_of_typ expected) ^"."))

(* Collect the global function context *)
let rec tc_fctxt (c:ctxt) (p:Range.t prog) : ctxt =
  begin match p with
    | [] -> c
    | (Gvdecl _) :: q -> tc_fctxt c q
    | (Gfdecl (rtyp, (info, fid), args, _, _)) :: q-> 
	let (tjs, _)  = List.split args in
	  if in_globals fid c then 
	    type_error (info_msg info (sprintf "Function %s already declared in global context." fid))
	  else
	    let c' = add_global_fn fid (tjs, rtyp) c in
	      tc_fctxt c' q
  end

(* Create the toplevel typechecking context. *)
let toplevel_ctxt = 
  List.fold_left (fun c (name, t) -> add_global_fn name t c) 
    empty_ctxt builtin_functions

(* Typechecks a program assuming that c has already got the 
 * function context initialized properly *)
let rec tc_prog (c:ctxt) (p:Range.t prog) : unit =
  begin match p with
    | [] -> ()
    | Gvdecl vd :: q ->
	let {v_ty=expected; v_id=(info, id); v_init=init} = vd in
	  if in_globals id c then 
	    type_error (info_msg info (sprintf "Identifier %s already declared in global context." id))
	  else
	    let _ = tc_init toplevel_ctxt expected init in
	      tc_prog (add_global_val id expected c) q
    | Gfdecl fd :: q ->
	let _ = tc_fdecl c fd in
	  tc_prog c q
  end


(* A toplevel program: ensures that there is a function called
 * 'program' with the right type. *)
let tc_toplevel (p:Range.t prog) : unit =
  let c = tc_fctxt toplevel_ctxt p in
  let _ =
    (* If a function named 'program' is defined, it must have the correct type. *)
    begin match lookup_global_fn "program" c with
      | None -> ()  
      | Some([TInt; TArray TString], Some TInt) -> ()
      | Some(ts,ret) -> 
	  type_error ("'program' defined at the incorrect type: should be (int, string[]) -> int")
    end
  in
    tc_prog c p
