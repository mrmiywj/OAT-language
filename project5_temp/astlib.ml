(* astlib.ml *)

(* Helper functions of abstract syntax of trees. *)
(******************************************************************************)

open Format
open Ast
open LibUtil
open Range  

(* 
 * Parse an AST from a lexbuf 
 * - the filename is used to generate error messages
 *)
let parse (filename : string) (buf : Lexing.lexbuf) : Range.t Ast.prog =
  try
    Lexer.reset_lexbuf filename 1 buf;
    Parser.toplevel Lexer.token buf
  with Parsing.Parse_error ->
    failwith (Printf.sprintf "Parse error at %s." (Range.string_of_range (Lexer.lex_range buf)))



(* Printer of AST. *)
let string_of_unop = function
| Neg _ -> "-"
| Lognot _ -> "!"
| Not _ -> "~"

let string_of_binop = function
| Times _ -> "*"
| Plus  _ -> "+"
| Minus _ -> "-"
| Shl   _ -> "<<"
| Shr   _ -> ">>>"
| Sar   _ -> ">>"
| Lt    _ -> "<"
| Lte   _ -> "<="
| Gt    _ -> ">"
| Gte   _ -> ">="
| Eq    _ -> "=="
| Neq   _ -> "!="
| And   _ -> "&"
| Or    _ -> "|"
| IAnd  _ -> "[&]"
| IOr   _ -> "[|]"

let print_id_aux fmt (_,id) =
  pp_print_string fmt id

let rec print_list_aux fmt sep pp l =
  begin match l with
    | [] -> ()
    | h::[] -> pp fmt h
    | h::tl -> 
	pp fmt h;
	sep ();
	print_list_aux fmt sep pp tl
  end

let print_const_aux fmt c =
  begin match c with
    | Cnull _ -> pp_print_string fmt "null"
    | Cbool (_, v) -> pp_print_string fmt (if v then "true" else "false")
    | Cint (_, v) -> pp_print_string fmt (Int32.to_string v)
    | Cstring (_, v) -> pp_print_string fmt (Printf.sprintf "%S" v)
  end

(** Precedence of binary operators. Higher precedences bind more tightly. *)
let prec_of_binop = function
| Times _ -> 100
| Plus _ | Minus _ -> 90
| Shl _ | Shr _ | Sar _ -> 80
| Lt _ | Lte _ | Gt _ | Gte _ -> 70
| Eq _ | Neq _ -> 60
| And _ -> 50
| Or _ -> 40
| IAnd _ -> 30
| IOr _ -> 20

(** Precedence of unary operators. *)
let prec_of_unop = function
| Neg _ | Lognot _ | Not _ -> 110

(** Precedence of expression nodes. *)
let prec_of_exp = function
| Const _ -> 130
| This _ -> 130
| New _ -> 130
| Ctor _ -> 130
| LhsOrCall _ -> 130
| Binop (o,_,_) -> prec_of_binop o
| Unop (o,_) -> prec_of_unop o

let rec print_typ_aux fmt t =
  let pps = pp_print_string fmt in
  match t with
    | TBot -> pps "bot"
    | TBool -> pps "bool"
    | TInt -> pps "int"
    | TRef r -> print_ref_aux fmt r
    | TNullable r -> print_ref_aux fmt r; pps "?"

and print_ref_aux fmt r =
  let pps = pp_print_string fmt in
  match r with
    | RString -> pps "string"
    | RClass cid -> pps cid
    | RArray (t) -> print_typ_aux fmt t; pps "[]"
      
let rec print_exp_aux fmt level e =
  let pps = pp_print_string fmt in
  let this_level = prec_of_exp e in
  (if this_level < level then fprintf fmt "(" else ());
  (match e with
  | Const  c -> print_const_aux fmt c
  | This _ -> pps "this"
  | New (ty, e1, id, e2) -> (* FIXME -- add types*)
      pps "new ";
      print_typ_aux fmt ty ;
      pps "[ ";
      print_exp_aux fmt 0 e1;
      pps " ] ( fun "; 
      print_id_aux fmt id;
      pps " -> ";
      print_exp_aux fmt 0 e2;
      pps " )"
  | Ctor (cid, es) -> pps "new "; print_id_aux fmt cid; print_exps_aux fmt es
  | LhsOrCall lc -> print_lhs_or_call_aux fmt lc
  | Binop (o,l,r) ->
      pp_open_box fmt 0;
      print_exp_aux fmt this_level l;
      pp_print_space fmt ();
      pp_print_string fmt (string_of_binop o);
      pp_print_space fmt ();
      (let r_level = begin match o with
      | Times _ | Plus _ | And _ | Or _ -> this_level
      | _ -> this_level + 1
      end in
      print_exp_aux fmt r_level r);
      pp_close_box fmt ()
  | Unop (o,v) ->
      pp_open_box fmt 0;
      pp_print_string fmt (string_of_unop o);
      print_exp_aux fmt this_level v;
      pp_close_box fmt ()
  );
  (if this_level < level then fprintf fmt ")" else ())

and print_exps_aux fmt es =
  let pps = pp_print_string fmt in
  pps "(";
  print_list_aux fmt
    (fun () -> pps ","; pp_print_space fmt())
    (fun fmt -> fun e -> print_exp_aux fmt 0 e) es;
  pps ")"

and print_lhs_or_call_aux fmt lc =
  match lc with
    | Lhs l -> print_lhs_aux fmt l
    | Call c -> print_call_aux fmt c

and print_lhs_aux fmt l =
  let pps = pp_print_string fmt in
  match l with
    | Var id -> print_id_aux fmt id
    | Path p -> print_path_aux fmt p
    | Index (lc, e) ->
      print_lhs_or_call_aux fmt lc;
      pps "[";
      print_exp_aux fmt 0 e;
      pps "]"

and print_call_aux fmt c =
  let pps = pp_print_string fmt in
  match c with
    | Func (fid, es) -> print_id_aux fmt fid; print_exps_aux fmt es
    | SuperMethod (id, es) -> 
        pps "super."; print_id_aux fmt id; print_exps_aux fmt es
    | PathMethod (p, es) -> print_path_aux fmt p; print_exps_aux fmt es

and print_path_aux fmt p =
  let pps = pp_print_string fmt in
  match p with
    | ThisId id -> pps "this."; print_id_aux fmt id
    | PathId (lc, id) -> 
        print_lhs_or_call_aux fmt lc; pps "."; print_id_aux fmt id


let rec print_init_aux fmt i =
  let pps = pp_print_string fmt in
  begin match i with
    | Iexp e -> print_exp_aux fmt 0 e
    | Iarray (_,is) ->
      pps "{";
      print_list_aux fmt
        (fun () -> pp_print_string fmt ","; pp_print_space fmt())
        print_init_aux is;
      pps "}"
  end

let print_vdecl_aux fmt {v_ty = t; v_id = id; v_init = i} =
  pp_open_hbox fmt ();
  print_typ_aux fmt t;
  pp_print_space fmt ();
  print_id_aux fmt id;
  pp_print_space fmt ();
  pp_print_string fmt " =";
  pp_print_space fmt ();
  print_init_aux fmt i;
  pp_close_box fmt ()

let rec print_block_aux fmt (vdecls, stmts) =
  if ((List.length stmts) > 0) then begin
    pp_open_vbox fmt 0;
    List.iter 
      (fun d -> 
        print_vdecl_aux fmt d; pp_print_string fmt ";"; pp_print_space fmt())
      vdecls;
    pp_close_box fmt ();
    print_list_aux fmt (fun () -> pp_print_space fmt ()) print_stmt_aux stmts
  end else begin
  if ((List.length vdecls) > 0) then begin
    pp_open_vbox fmt 0;
    print_list_aux fmt 
      (fun () -> pp_print_string fmt ";"; pp_print_space fmt()) 
      print_vdecl_aux vdecls;
    pp_print_string fmt ";";
    pp_close_box fmt ()
  end else ()
  end

and print_stmt_aux fmt s =
  let pps = pp_print_string fmt in
  let ppsp = pp_print_space fmt in
  begin match s with
    | Assign(l,e) ->
	pp_open_box fmt 0;
	print_lhs_aux fmt l;
	pps " =";
	ppsp ();
	print_exp_aux fmt 0 e;
	pps ";";
	pp_close_box fmt ()
    | Scall c ->
      print_call_aux fmt c;
    | Fail (e) -> 
        pps "fail "; pps " ("; print_exp_aux fmt 0 e; pps ")"
    | If(e, s1, os2) ->
	pps "if ("; print_exp_aux fmt 0 e; pps ") ";
	print_stmt_aux fmt s1;
	begin match os2 with
	  | None -> ()
	  | Some s2 ->
	      pps " else ";
	      print_stmt_aux fmt s2
	end
| IfNull(r, id, e, s1, os2) ->
	pps "if? ("; print_ref_aux fmt r; pps " ";
        print_id_aux fmt id; pps " = "; print_exp_aux fmt 0 e; pps ") ";
	print_stmt_aux fmt s1;
	begin match os2 with
	  | None -> ()
	  | Some s2 ->
	      pps " else ";
	      print_stmt_aux fmt s2
	end
    | Cast(cid, id, e, s1, os2) ->
	pps "cast ("; pps cid; pps " "; 
        print_id_aux fmt id; pps " = "; print_exp_aux fmt 0 e; pps ") ";
	print_stmt_aux fmt s1;
	begin match os2 with
	  | None -> ()
	  | Some s2 ->
	      pps " else ";
	      print_stmt_aux fmt s2
	end
    | While(e, s) ->
	pps "while ("; print_exp_aux fmt 0 e; pps ") ";
	print_stmt_aux fmt s
    | For(vdecls, eo, so, body) ->
	pps "for (";
  	  print_list_aux fmt (fun () -> pps ","; ppsp ()) print_vdecl_aux vdecls;
	  pps ";"; ppsp ();
	  begin match eo with
	    | None -> ();
	    | Some e -> print_exp_aux fmt 0 e;
	  end;
	  pps ";"; ppsp ();
	  begin match so with
	    | None -> ()
	    | Some s -> print_stmt_aux fmt s
	  end;
	pps ") ";
	print_stmt_aux fmt body
    | Block b ->
	  pps "{"; pp_force_newline fmt ();
	  pps "  "; pp_open_vbox fmt 0;
	  print_block_aux fmt b;
	  pp_close_box fmt (); pp_force_newline fmt ();
	  pps "}"
  end

let print_efdecl_aux fmt (topt,(_,fid),args) =
  let pps = pp_print_string fmt in
  let ppsp = pp_print_space fmt in
  (match topt with
    | Some t -> print_typ_aux fmt t
    | None -> ());
  pp_print_string fmt (Printf.sprintf (" %s ( ") fid);
  print_list_aux fmt (fun () -> pps ","; ppsp ())
    (fun fmt -> fun (t, id) ->
      print_typ_aux fmt t;
      pps " ";
      print_id_aux fmt id;
    )
    args;
  pps " ) extern"

let print_fdecl_aux fmt (topt,(_,fid),args,b,eo) =
  let pps = pp_print_string fmt in
  let ppsp = pp_print_space fmt in
  (match topt with
    | Some t -> print_typ_aux fmt t
    | None -> ());
  pp_print_string fmt (Printf.sprintf (" %s ( ") fid);
  print_list_aux fmt (fun () -> pps ","; ppsp ())
    (fun fmt -> fun (t, id) ->
      print_typ_aux fmt t;
      pps " ";
      print_id_aux fmt id;
    )
    args;
  pps " ) { "; pp_force_newline fmt ();
  pps "  "; pp_open_vbox fmt 0;
  print_block_aux fmt b;
  pp_force_newline fmt ();
  pps "return ";
  (match eo with
     | Some e -> print_exp_aux fmt 0 e
     | None -> ());
  pps ";";
  pp_close_box fmt (); pp_force_newline fmt ();
  pps "}"

let print_ctor_aux fmt (args, es, cinits, b) =
  let pps = pp_print_string fmt in
  let ppsp = pp_print_space fmt in
  pps "new (";
  print_list_aux fmt (fun () -> pps ","; ppsp ())
    (fun fmt -> fun (t, id) ->
      print_typ_aux fmt t;
      pps " ";
      print_id_aux fmt id;
    )
    args;
  pps " ) "; print_exps_aux fmt es;
  List.iter 
    (fun (id,i) -> 
      pps "this."; print_id_aux fmt id; pps " = "; print_init_aux fmt i; 
      pps ";"; pp_print_space fmt()) cinits;
  pps "{"; pp_force_newline fmt ();
  pps "  "; pp_open_vbox fmt 0;
  print_block_aux fmt b;
  pp_close_box fmt (); pp_force_newline fmt ();
  pps "}"

let print_cdecl_aux fmt (cid, extopt, fields, ctor, fdecls) =
  let pps = pp_print_string fmt in
  pps "class "; pps cid; pps " " ;
  (match extopt with
     | None -> ()
     | Some tid -> pps "<: "; pps tid
  );
  pps " {"; pp_force_newline fmt ();
  pps "  "; pp_open_vbox fmt 0;
  List.iter 
    (fun (t,id) -> 
      print_typ_aux fmt t; pps " "; print_id_aux fmt id; pps ";"; 
      pp_print_space fmt()) fields;
  print_ctor_aux fmt ctor; pp_print_space fmt();
  List.iter (fun fd -> print_fdecl_aux fmt fd; pp_print_space fmt()) fdecls;  
  pp_close_box fmt (); pp_force_newline fmt ();
  pps "};"

let print_prog_aux fmt p =
  pp_open_vbox fmt 0;
  List.iter (fun g -> (match g with
	| Gvdecl d -> print_vdecl_aux fmt d; pp_print_string fmt ";"
    | Gefdecl f -> print_efdecl_aux fmt f
    | Gfdecl f -> print_fdecl_aux fmt f
    | Gcdecl c -> print_cdecl_aux fmt c);
    pp_print_space fmt()
  ) p;
  pp_close_box fmt ()

let print_prog (p:Range.t prog) : unit =
  pp_open_hvbox std_formatter 0;
  print_prog_aux std_formatter p;
  pp_close_box std_formatter ();
  pp_print_newline std_formatter ()

let string_of_prog (p:Range.t prog) : string =
  pp_open_hvbox str_formatter 0;
  print_prog_aux str_formatter p;
  pp_close_box str_formatter ();
  flush_str_formatter ()

let print_stmt (s:Range.t stmt) : unit =
  pp_open_hvbox std_formatter 0;
  print_stmt_aux std_formatter s;
  pp_close_box std_formatter ();
  pp_print_newline std_formatter ()

let string_of_stmt (s:Range.t stmt) : string =
  pp_open_hvbox str_formatter 0;
  print_stmt_aux str_formatter s;
  pp_close_box str_formatter ();
  flush_str_formatter ()

let print_block (b:Range.t block) : unit =
  pp_open_hvbox std_formatter 0;
  print_block_aux std_formatter b;
  pp_close_box std_formatter ();
  pp_print_newline std_formatter ()
  
let string_of_block (b:Range.t block) : string =
  pp_open_hvbox str_formatter 0;
  print_block_aux str_formatter b;
  pp_close_box str_formatter ();
  flush_str_formatter ()

let print_exp (e:Range.t exp) : unit =
  pp_open_hvbox std_formatter 0;
  print_exp_aux std_formatter 0 e;
  pp_close_box std_formatter ();
  pp_print_newline std_formatter ()

let string_of_exp (e:Range.t exp) : string =
  pp_open_hvbox str_formatter 0;
  print_exp_aux str_formatter 0 e;
  pp_close_box str_formatter ();
  flush_str_formatter ()

let print_typ (t:typ) : unit =
  pp_open_hvbox std_formatter 0;
  print_typ_aux std_formatter t;
  pp_close_box std_formatter ();
  pp_print_newline std_formatter ()

let string_of_typ (t:typ) : string =
  pp_open_hvbox str_formatter 0;
  print_typ_aux str_formatter t;
  pp_close_box str_formatter ();
  flush_str_formatter ()


(* AST to ML *)
let ml_string_of_const (c:Range.t const) : string =
  match c with
    | Cnull _ -> Printf.sprintf "(Cnull (norange))"
    | Cbool (_,b) -> Printf.sprintf "(Cbool (norange, %b))" b
    | Cint (_,i) -> Printf.sprintf "(Cint (norange, %lil))" i
    | Cstring (_,s) -> Printf.sprintf "(Cstring (norange, %S))" s
    
let rec ml_string_of_typ (t:typ) : string =
  begin match t with
    | TBot -> failwith "Internal err (ast2ml): not accessible to users."
    | TBool -> "TBool"
    | TInt -> "TInt"
    | TRef r -> Printf.sprintf "(TRef (%s))" (ml_string_of_ref r)
    | TNullable r -> Printf.sprintf "(TNullable (%s))" (ml_string_of_ref r)
  end

and ml_string_of_ref (r:ref) : string =
  begin match r with    
    | RString -> "RString"
    | RClass cid -> Printf.sprintf "(RClass (\"%s\"))" cid
    | RArray (t) -> Printf.sprintf "(RArray (%s))" (ml_string_of_typ t)
  end

let ml_string_of_id ((_, id):Range.t*string) : string =
  Printf.sprintf "(norange, \"%s\")" id

let rec ml_string_of_exp (e:Range.t exp) : string = 
  begin match e with 
    | Const c -> Printf.sprintf "(Const %s)" (ml_string_of_const c)
    | This _ -> Printf.sprintf "(This norange)"
    | New (ty, e1, (_,id), e2) -> 
        Printf.sprintf "(New (%s, %s, (norange, \"%s\"), %s))"
          (ml_string_of_typ ty)
          (ml_string_of_exp e1) id (ml_string_of_exp e2)
    | Ctor (cid, es) -> Printf.sprintf "Ctor(%s, [%s])" (ml_string_of_id cid) 
        (ml_string_of_exps es)
    | LhsOrCall lc -> Printf.sprintf "(LhsOrCall %s)" 
        (ml_string_of_lhs_or_call lc)
    | Binop (o,l,r) -> (
	let binop_str = match o with
	  | Plus _ -> "Plus" | Times _ -> "Times" | Minus _ -> "Minus"
	  | Eq _ -> "Eq" | Neq _ -> "Neq" 
          | Lt _ -> "Lt" | Lte _ -> "Lte" | Gt _ -> "Gt" | Gte _ -> "Gte" 
          | And _ -> "And" | Or _ -> "Or"  | IAnd _ -> "IAnd" | IOr _ -> "IOr" 
	  | Shr _ -> "Shr" | Sar _ -> "Sar" | Shl _ -> "Shl" in
	  Printf.sprintf "(Binop (%s norange,%s,%s))" binop_str 
	    (ml_string_of_exp l) (ml_string_of_exp r)
      )
    | Unop (o,l) -> (
	let unop_str = match o with
	  | Neg _ -> "Neg" | Lognot _ -> "Lognot" | Not _ -> "Not" in
	  Printf.sprintf "(Unop (%s norange,%s))" unop_str (ml_string_of_exp l)
      )
  end


and ml_string_of_exps es : string =
  (List.fold_left (fun s e -> s ^ (ml_string_of_exp e) ^ "; " ) "" es)

and ml_string_of_lhs_or_call lc : string =
  match lc with
    | Lhs l -> Printf.sprintf "(Lhs %s)" (ml_string_of_lhs l)
    | Call c -> Printf.sprintf "(Call %s)" (ml_string_of_call c)

and ml_string_of_call c : string =
  match c with
    | Func (fid, es) -> Printf.sprintf "(Func (%s, [%s]))" (ml_string_of_id fid)
        (ml_string_of_exps es)
    | SuperMethod (id, es) -> Printf.sprintf "(SuperMethod (%s, [%s]))" 
        (ml_string_of_id id) (ml_string_of_exps es)
    | PathMethod (p, es) -> Printf.sprintf "(PathMethod (%s, [%s]))" 
        (ml_string_of_path p) (ml_string_of_exps es)

and ml_string_of_path p : string =
  match p with
    | ThisId id -> Printf.sprintf "(ThisId %s)" (ml_string_of_id id)
    | PathId (lc, id) -> Printf.sprintf "(PathId (%s, %s))" 
        (ml_string_of_lhs_or_call lc) (ml_string_of_id id)

and ml_string_of_lhs l : string = 
  begin match l with
    | Var id -> Printf.sprintf "(Var %s)" (ml_string_of_id id)
    | Path p -> Printf.sprintf "(Path %s)" (ml_string_of_path p)
    | Index (lc, e) -> Printf.sprintf "(Index (%s, %s))" 
        (ml_string_of_lhs_or_call lc) (ml_string_of_exp e)
  end

let rec ml_string_of_init (i:Range.t init) : string =
  begin match i with
    | Iexp e -> Printf.sprintf "(Iexp (%s))" (ml_string_of_exp e)
    | Iarray (_,is) -> Printf.sprintf "(Iarray (norange, [%s]))"
        (List.fold_left (fun s i -> s ^ (ml_string_of_init i) ^ "; ") "" is)
 end

let ml_string_of_vdecl {v_ty = vt; v_id=(_,id); v_init=vini} =
  Printf.sprintf "{v_ty=%s; v_id=(norange, \"%s\"); v_init=%s}" 
    (ml_string_of_typ vt) id (ml_string_of_init vini)

let ml_string_of_option (str: 'a -> string) (o:'a option) : string =
  begin match o with
    | None -> "None"
    | Some s -> ("(Some (" ^ (str s) ^ "))")
  end

let rec ml_string_of_block (vdls, stmts) =
  Printf.sprintf "([%s], [%s])"
    (List.fold_left (fun s d -> s ^ (ml_string_of_vdecl d) ^ ";\n") "" vdls)
    (List.fold_left (fun s d -> s ^ (ml_string_of_stmt d) ^ ";\n") "" stmts)

and ml_string_of_stmt (s:Range.t stmt) : string =
  begin match s with
    | Assign (l, e) -> Printf.sprintf "Assign(%s, %s)" (ml_string_of_lhs l)
	(ml_string_of_exp e)
    | Scall c -> Printf.sprintf "Scall(%s)" (ml_string_of_call c)
    | Fail (e) -> Printf.sprintf "Fail(%s)" (ml_string_of_exp e)
    | If(e, s, sopt) ->
	Printf.sprintf "If(%s, %s, %s)"
	  (ml_string_of_exp e)
	  (ml_string_of_stmt s)
	  (ml_string_of_option ml_string_of_stmt sopt)
    | IfNull(r, id, e, s, sopt) ->
	Printf.sprintf "IfNull(%s, %s, %s, %s, %s)"
          (ml_string_of_ref r) (ml_string_of_id id)
	  (ml_string_of_exp e) (ml_string_of_stmt s)
	  (ml_string_of_option ml_string_of_stmt sopt)
    | Cast(cid, id, e, s, sopt) ->
	Printf.sprintf "Cast(\"%s\", %s, %s, %s, %s)"
	  cid (ml_string_of_id id) 
          (ml_string_of_exp e) (ml_string_of_stmt s)
	  (ml_string_of_option ml_string_of_stmt sopt)
    | While(e, s) ->
	Printf.sprintf "While(%s, %s)"
	  (ml_string_of_exp e)
	  (ml_string_of_stmt s)
    | For(vdl, eopt, sopt, s) ->
	Printf.sprintf "For([%s], %s, %s, %s)"
	  (List.fold_left (fun s d -> s ^ (ml_string_of_vdecl d) ^ ";\n") "" vdl)
	  (ml_string_of_option ml_string_of_exp eopt)
	  (ml_string_of_option ml_string_of_stmt sopt)
	  (ml_string_of_stmt s)
    | Block b ->
	Printf.sprintf "Block%s" (ml_string_of_block b)
  end
	
let ml_string_of_fdecl ((topt, (_,fid), args, b, eopt):Range.t fdecl) : string =
  Printf.sprintf "(%s, (norange, \"%s\"), [%s], %s, %s)" 
    (ml_string_of_option ml_string_of_typ topt) fid 
    (List.fold_left (fun s (t, (_,id)) -> s ^ Printf.sprintf "(%s, (norange, \"%s\"))" (ml_string_of_typ t) id ^ ";\n") "" args)
    (ml_string_of_block b) (ml_string_of_option ml_string_of_exp eopt)

let ml_string_of_efdecl ((topt, (_,fid), args):Range.t efdecl) : string =
  Printf.sprintf "(%s, (norange, \"%s\"), [%s])" 
    (ml_string_of_option ml_string_of_typ topt) fid 
    (List.fold_left 
      (fun s (t, id) -> s ^ Printf.sprintf "(%s, %s)" (ml_string_of_typ t) 
        (ml_string_of_id id) ^ ";\n") "" args)

let ml_string_of_ctor ((args, es, cinits, b):Range.t ctor) : string =
  Printf.sprintf "([%s], [%s], [%s], %s)" 
    (List.fold_left 
      (fun s (t, id) -> s ^ Printf.sprintf "(%s, %s)" (ml_string_of_typ t) 
        (ml_string_of_id id) ^ ";\n") "" args)
    (List.fold_left (fun s e -> s ^ (ml_string_of_exp e) ^ ";\n") "" es)
    (List.fold_left (fun s (id,i) -> s ^ Printf.sprintf "(%s, %s)" 
      (ml_string_of_id id) (ml_string_of_init i) ^ ";\n") "" cinits)
    (ml_string_of_block b)

let ml_string_of_cdecl ((cid, extopt, fields, ctor, fds):Range.t cdecl) : string =
  Printf.sprintf "(\"%s\", %s, [%s], %s, [%s])" 
    cid
    (ml_string_of_option (Printf.sprintf "\"%s\"") extopt) 
    (List.fold_left 
      (fun s (t, id) -> s ^ Printf.sprintf "(%s, %s)" (ml_string_of_typ t) 
        (ml_string_of_id id) ^ ";\n") "" fields)
    (ml_string_of_ctor ctor)
    (List.fold_left (fun s f -> s ^ (ml_string_of_fdecl f) ^ ";\n") "" fds)

let ml_string_of_prog (p :Range.t prog) : string =
  Printf.sprintf "([%s])" 
    (List.fold_left 
      (fun s g -> 
        match g with
	  | Gvdecl d -> s ^ "Gvdecl(" ^ (ml_string_of_vdecl d) ^ ");\n"
          | Gefdecl f -> s ^ "Gefdecl(" ^ (ml_string_of_efdecl f) ^ ");\n"
          | Gfdecl f -> s ^ "Gfdecl(" ^ (ml_string_of_fdecl f) ^ ");\n"
          | Gcdecl c -> s ^ "Gcdecl(" ^ (ml_string_of_cdecl c) ^ ");\n"
      ) "" p)

(* Checking AST equivalence *)
let  eq_const c c' : bool =
  begin match (c, c') with
    | (Cnull _, Cnull _) -> true
    | (Cbool (_,b), Cbool (_, b')) -> b = b'
    | (Cint (_,i), Cint (_, i')) -> i = i'
    | (Cstring (_,s), Cstring (_, s')) -> s = s'
    | _ -> false
 end

let eq_binop o o' : bool =
  match (o, o') with
    | (Plus _, Plus _) -> true
    | (Times _, Times _) -> true
    | (Minus _, Minus _) -> true
    | (Eq _, Eq _) -> true
    | (Neq _, Neq _) -> true
    | (Lt _, Lt _) -> true
    | (Lte _, Lte _) -> true
    | (Gt _, Gt _) -> true
    | (Gte _, Gte _) -> true
    | (And _, And _) -> true
    | (Or _, Or _) -> true
    | (IAnd _, IAnd _) -> true
    | (IOr _, IOr _) -> true
    | (Shr _, Shr _) -> true
    | (Sar _, Sar _) -> true
    | (Shl _, Shl _) -> true
    | _ -> false

let eq_unop o o' : bool =
  match (o, o') with
    | (Neg _, Neg _) -> true
    | (Lognot _, Lognot _) -> true
    | (Not _, Not _) -> true
    | _ -> false

let eq_id (_,id) (_,id') : bool =
  id = id'

let rec eq_exp e e' : bool = 
  begin match (e, e') with 
    | (Const c, Const c') -> eq_const c c'
    | (This _, This _) -> true
    | (New (t1, e1, (_,id), e2), New (t2, e1', (_,id'), e2')) ->
        eq_typ t1 t2 && eq_exp e1 e1' && id = id' && eq_exp e2 e2'
    | (Ctor (cid, es), Ctor (cid', es')) ->
        begin try 
            List.iter2 
              (fun e -> fun e' -> if eq_exp e e' then () else failwith "not eq"
              ) es es';
            eq_id cid cid'
          with
 	    | _ -> false
        end
    | (LhsOrCall lc, LhsOrCall lc') -> eq_lhs_or_call lc lc'
    | (Binop (o,l,r), Binop (o',l',r')) -> 
        eq_binop o o' && eq_exp l l' && eq_exp r r'
    | (Unop (o,l), Unop (o',l')) ->
        eq_unop o o' && eq_exp l l'
    | _ -> false
  end

and eq_lhs_or_call lc lc' : bool =
  match (lc, lc') with
    | (Lhs l, Lhs l') -> eq_lhs l l'
    | (Call c, Call c') -> eq_call c c'
    | _ -> false

and eq_exps es es' : bool =
  try 
    List.iter2 
      (fun e -> fun e' -> if eq_exp e e' then () else failwith "not eq"
      ) es es';
    true
  with
    | _ -> false

and eq_call c c' : bool =
  match (c, c') with
    | (Func (fid, es), Func (fid', es')) -> eq_id fid fid' && eq_exps es es' 
    | (SuperMethod (id, es), SuperMethod (id', es')) ->
        eq_id id id' && eq_exps es es' 
    | (PathMethod (p, es), PathMethod (p', es')) ->
        eq_path p p' && eq_exps es es' 
    | _ -> false

and eq_path p p' : bool =
  match (p, p') with
    | (ThisId id, ThisId id') -> eq_id id id'
    | (PathId (lc, id), PathId (lc', id')) -> 
        eq_lhs_or_call lc lc' && eq_id id id'
    | _ -> false

and eq_lhs l l' : bool = 
  begin match (l, l') with
    | (Var id, Var id') -> eq_id id id' 
    | (Path p, Path p') -> eq_path p p'
    | (Index (lc, e), Index (lc', e')) -> eq_lhs_or_call lc lc' && eq_exp e e'
    | _ -> false
  end

and eq_typ t t' : bool =
  begin match (t, t') with
    | (TBot, TBot) -> true
    | (TBool, TBool) -> true
    | (TInt, TInt) -> true
    | (TRef r, TRef r') -> eq_ref r r'
    | (TNullable r, TNullable r') -> eq_ref r r'
    | _ -> false
  end

and eq_ref r r' : bool =
  begin match (r, r') with
    | (RString, RString) -> true
    | (RClass tid, RClass tid') -> tid = tid'
    | (RArray (t), RArray (t')) -> eq_typ t t'
    | _ -> false 
  end

let rec eq_init i i' : bool =
  begin match (i, i') with
    | (Iexp e, Iexp e') -> eq_exp e e'
    | (Iarray (_,is), Iarray (_,is')) -> 
        begin try 
            List.iter2 
              (fun i -> fun i' -> 
                 if eq_init i i' then ()
                 else failwith "not eq"
              ) is is';
            true
        with
          | _ -> false
        end
    | _ -> false
 end

let eq_vdecl {v_ty = vt; v_id=(_,id); v_init=vini}  
  {v_ty = vt'; v_id=(_,id'); v_init=vini'} : bool =
  eq_typ vt vt' && id = id' && eq_init vini vini'

let eq_option (eq: 'a -> 'a -> bool) (o:'a option) (o':'a option) : bool =
  begin match (o, o') with
    | (None, None) -> true
    | (Some s, Some s') -> eq s s'
    | _ -> false
  end

let rec eq_block (vdls, stmts) (vdls', stmts') : bool =
  try 
    List.iter2 
      (fun vdl -> fun vdl' -> 
        if eq_vdecl vdl vdl' then ()
        else failwith "not eq"
       ) vdls vdls';
    List.iter2 
      (fun st -> fun st' -> 
        if eq_stmt st st' then ()
        else failwith "not eq"
       ) stmts stmts';
    true         
  with
    | _ -> false
 
and eq_stmt s s' : bool =
  begin match (s, s') with
    | (Assign (l, e), Assign (l', e')) -> eq_lhs l l' && eq_exp e e'
    | (Scall c, Scall c') -> eq_call c c'
    | (Fail(e), Fail(e')) -> eq_exp e e'
    | (If(e, s, sopt), If(e', s', sopt')) ->
        eq_exp e e' && eq_stmt s s' && eq_option eq_stmt sopt sopt'
    | (IfNull(r, id, e, s, sopt), IfNull(r', id', e', s', sopt')) ->
        eq_ref r r' && eq_id id id' && eq_exp e e' && eq_stmt s s' && 
        eq_option eq_stmt sopt sopt'
    | (Cast(cid, id, e, s, sopt), Cast(cid', id', e', s', sopt')) ->
        cid = cid' && eq_id id id' && eq_exp e e' && 
        eq_stmt s s' && eq_option eq_stmt sopt sopt'
    | (While(e, s), While(e', s')) -> eq_exp e e' && eq_stmt s s' 
    | (For(vdls, eopt, sopt, s), For(vdls', eopt', sopt', s')) ->
         begin try 
           List.iter2 
             (fun vdl -> fun vdl' -> 
               if eq_vdecl vdl vdl' then ()
               else failwith "not eq"
             ) vdls vdls';
           eq_option eq_exp eopt eopt' &&
           eq_option eq_stmt sopt sopt' &&
           eq_stmt s s'
         with
           | _ -> false
 	 end
    | (Block b, Block b') -> eq_block b b'
    | _ -> false
  end
	
let eq_efdecl (topt, fid, args) (topt', fid', args') 
  : bool =
  eq_option eq_typ topt topt' &&
  eq_id fid fid' &&
  begin try 
    List.iter2 
      (fun (t, id) -> fun (t', id') -> 
         if (eq_typ t t' && eq_id id id') then () else failwith "not eq"
      ) args args';
    true
  with
    | _ -> false
  end


let eq_fdecl (topt, (_,fid), args, b, eopt) (topt', (_,fid'), args', b', eopt') 
  : bool =
  eq_option eq_typ topt topt' &&
  fid = fid' &&
  begin try 
    List.iter2 
      (fun (t, (_, id)) -> fun (t', (_, id')) -> 
         if (eq_typ t t' && id = id') then ()
         else failwith "not eq"
      ) args args';
    eq_block b b' &&
    eq_option eq_exp eopt eopt'
  with
    | _ -> false
  end

let eq_ctor (args, es, is, b) (args', es', is', b') 
  : bool =
  begin try 
    List.iter2 
      (fun (t, id) -> fun (t', id') -> 
         if (eq_typ t t' && eq_id id id') then () else failwith "not eq"
      ) args args';
    List.iter2 
      (fun e -> fun e' -> if (eq_exp e e') then () else failwith "not eq") 
      es es';
    List.iter2 
      (fun (id, i) -> fun (id', i') -> 
        if (eq_id id id' && eq_init i i') then () else failwith "not eq") 
      is is';
    eq_block b b'
  with
    | _ -> false
  end

let eq_cdecl (cid, extopt, fields, ctor, fs) (cid', extopt', fields', ctor', fs') 
  : bool =
  cid = cid' &&
  eq_option (=) extopt extopt' &&
  eq_ctor ctor ctor' &&
  try 
    List.iter2 
      (fun (t,id) -> fun (t',id') -> 
        if eq_typ t t' && eq_id id id' then () else failwith "not eq") 
      fields fields';
    List.iter2 
      (fun f -> fun f' -> if eq_fdecl f f' then () else failwith "not eq") 
      fs fs';
    true         
  with
    | _ -> false


let eq_prog p p' : bool =
  try
    List.iter2 
      (fun g -> fun g' -> 
        match (g, g') with
	  | (Gvdecl d, Gvdecl d') -> 
        if (eq_vdecl d d') then () else failwith "not eq"
      | (Gefdecl f, Gefdecl f') ->
        if (eq_efdecl f f') then () else failwith "not eq"
      | (Gfdecl f, Gfdecl f') ->
        if (eq_fdecl f f') then () else failwith "not eq"
      | (Gcdecl c, Gcdecl c') ->
        if (eq_cdecl c c') then () else failwith "not eq"
	  | _ -> failwith "not eq"
      ) p p';
    true
  with
    | _ -> false

let unop_info (uop: 'a unop) : 'a =
  match uop with
    | Neg i -> i
    | Lognot i -> i
    | Not i -> i

let binop_info (bop: 'a binop) : 'a =
  match bop with
      Plus i -> i
    | Times i -> i
    | Minus i -> i
    | Eq i -> i
    | Neq i -> i
    | Lt i -> i
    | Lte i -> i
    | Gt i -> i
    | Gte i -> i
    | And i -> i
    | Or i -> i
    | IAnd i -> i
    | IOr i -> i
    | Shl i -> i
    | Shr i -> i
    | Sar i -> i

let const_info (c: 'a const) : 'a =
  match c with
    | Cnull i -> i
    | Cbool (i, _) -> i
    | Cint (i, _) -> i
    | Cstring (i, _) -> i

let rec exp_info (e: Range.t exp) : Range.t =
  let get_last_exp_info es : Range.t option =
    match (List.rev es) with
      | [] -> None
      | e::_ -> Some (exp_info e)
  in
  match e with
      Const c -> const_info c
    | This i -> mk_parse_range i i
    | New (_ty,e1, _, e2) -> mk_parse_range (exp_info e1) (exp_info e2)
    | Ctor ((i, _), es) -> 
      begin match (get_last_exp_info es) with
	    | None -> i
	    | Some i' -> mk_parse_range i i'
      end
    | LhsOrCall lc -> lhs_or_call_info lc
    | Binop (bop, _e1, e2) -> mk_parse_range (binop_info bop) (exp_info e2) 
    | Unop (uop, e1) -> mk_parse_range (unop_info uop) (exp_info e1) 

and get_last_exp_info es : Range.t option =
    match (List.rev es) with
      | [] -> None
      | e::_ -> Some (exp_info e)

and path_info p : Range.t =
  match p with
    | ThisId (i, _) -> i
    | PathId (lc, (i, _)) -> mk_parse_range (lhs_or_call_info lc) i

and lhs_info (l: Range.t lhs) : Range.t =
  match l with
      Var (i, _) -> i
    | Path p -> path_info p
    | Index (lc, e) -> mk_parse_range (lhs_or_call_info lc) (exp_info e)

and lhs_or_call_info lc : Range.t =
  match lc with
    | Lhs l -> lhs_info l
    | Call c -> call_info c

and call_info c : Range.t =
  match c with
    | Func ((i, _), es) -> 
        begin match (get_last_exp_info es) with
	  | None -> i
	  | Some i' -> mk_parse_range i i'
        end
    | SuperMethod ((i, _), es) -> 
        begin match (get_last_exp_info es) with
	  | None -> i
	  | Some i' -> mk_parse_range i i'
        end
    | PathMethod (p, es) -> 
        let i = path_info p in
        begin match (get_last_exp_info es) with
	  | None -> i
	  | Some i' -> mk_parse_range i i'
        end

let init_info (i: Range.t init) : Range.t =
  match i with
    | Iexp e -> exp_info e
    | Iarray (r, _) -> r

let cinits_info (is: Range.t cinits) : Range.t =
  match is with
    | [] -> Range.ghost
    | ((r, _), i)::_ -> mk_parse_range r (init_info i)

let ast_of_int32 i : Range.t Ast.exp =
  Ast.Const ((Ast.Cint (Range.ghost, i) ))

let ast_of_int i   =
  Ast.Const ((Ast.Cint (Range.ghost, Int32.of_int i) ))

let ast_of_bool b = 
  Ast.Const (Ast.Cbool (Range.norange, b))


    
