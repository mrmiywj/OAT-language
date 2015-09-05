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
    Lexer.reset_lexbuf filename buf;
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

let  print_const_aux fmt c =
  begin match c with
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
| Lhs _ -> 130
| New _ -> 130
| Binop (o,_,_) -> prec_of_binop o
| Unop (o,_) -> prec_of_unop o
| Ecall (_,_) -> 120

let rec print_typ_aux fmt t =
  let pps = pp_print_string fmt in
  begin match t with
    | TBool -> pp_print_string fmt "bool"
    | TInt -> pp_print_string fmt "int"
    | TString -> pp_print_string fmt "string"
    | TArray (t) ->
      print_typ_aux fmt t;
      pps "[";
      pps "]"
  end
      
let rec print_exp_aux fmt level e =
  let pps = pp_print_string fmt in
  let this_level = prec_of_exp e in
  (if this_level < level then fprintf fmt "(" else ());
  (match e with
  | Const  c -> print_const_aux fmt c
  | Lhs l -> print_lhs_aux fmt l
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
  | Ecall (fid, es) ->
      print_id_aux fmt fid;
      pps "(";
      print_list_aux fmt
        (fun () -> pp_print_string fmt ","; pp_print_space fmt())
        (fun fmt -> fun e -> print_exp_aux fmt 0 e) es;
      pps ")"
  );
  (if this_level < level then fprintf fmt ")" else ())

and print_lhs_aux fmt l =
  let pps = pp_print_string fmt in
  begin match l with
  | Var s -> print_id_aux fmt s
  | Index (l, e) ->
      print_lhs_aux fmt l;
      pps "[";
      print_exp_aux fmt 0 e;
      pps "]"
  end


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
    | Scall (fid, es) ->
      print_id_aux fmt fid;
      pps "(";
      print_list_aux fmt (fun () -> pp_print_string fmt ","; pp_print_space fmt())
        (fun fmt -> fun e -> print_exp_aux fmt 0 e) es;
      pps ");"
    | If(e, s1, os2) ->
	pps "if ("; print_exp_aux fmt 0 e; pps ") ";
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

let print_prog_aux fmt p =
  pp_open_vbox fmt 0;
  List.iter
    (fun g ->
      (match g with
	| Gvdecl d -> print_vdecl_aux fmt d; pp_print_string fmt ";"
        | Gfdecl f -> print_fdecl_aux fmt f);
      pp_print_space fmt()
    )
    p;
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
let  ml_string_of_const (c:Range.t const) : string =
  begin match c with
    | Cbool (_,b) -> Printf.sprintf "(Cbool (norange, %b))" b
    | Cint (_,i) -> Printf.sprintf "(Cint (norange, %lil))" i
    | Cstring (_,s) -> Printf.sprintf "(Cstring (norange, %S))" s
 end

let rec ml_string_of_init (i:Range.t init) : string =
  begin match i with
    | Iexp e -> Printf.sprintf "(Iexp (%s))" (ml_string_of_exp e)
    | Iarray (_,is) -> Printf.sprintf "(Iarray (norange, [%s]))"
        (List.fold_left (fun s i -> s ^ (ml_string_of_init i) ^ "; ") "" is)
 end

    
and ml_string_of_exp (e:Range.t exp) : string = 
  begin match e with 
    | Const c -> Printf.sprintf "(Const %s)" (ml_string_of_const c)
    | Lhs l -> Printf.sprintf "(Lhs %s)" (ml_string_of_lhs l)
    | New (ty,e1, (_,id), e2) -> 
        Printf.sprintf "(New (%s, %s, (norange, \"%s\"), %s))"
          (ml_string_of_typ ty)
          (ml_string_of_exp e1) id (ml_string_of_exp e2)
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
    | Ecall ((_,fid), es) -> Printf.sprintf "Ecall((norange, \"%s\"), [%s])" fid
        (List.fold_left (fun s e -> s ^ (ml_string_of_exp e) ^ "; " ) "" es)
  end

and ml_string_of_lhs l : string = 
  begin match l with
    | Var (_,s) -> "(Var (norange, \"" ^ s ^ "\"))"
    | Index (l, e) -> Printf.sprintf "(Index (%s, %s))" (ml_string_of_lhs l) (ml_string_of_exp e)
  end

and ml_string_of_typ (t:typ) : string =
  begin match t with
    | TBool -> "TBool"
    | TInt -> "TInt"
    | TString -> "TString"
    | TArray (t) -> Printf.sprintf "(TArray (%s))" (ml_string_of_typ t)
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
    | Scall ((_,fid), es) -> Printf.sprintf "Scall((norange, \"%s\"), [%s])" fid
        (List.fold_left (fun s e -> s ^ (ml_string_of_exp e) ^ "; " ) "" es)
    | If(e, s, sopt) ->
	Printf.sprintf "If(%s, %s, %s)"
	  (ml_string_of_exp e)
	  (ml_string_of_stmt s)
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

let ml_string_of_prog (p :Range.t prog) : string =
  Printf.sprintf "([%s])" 
    (List.fold_left 
      (fun s g -> 
        match g with
	  | Gvdecl d -> s ^ "Gvdecl(" ^ (ml_string_of_vdecl d) ^ ");\n"
          | Gfdecl f -> s ^ "Gfdecl(" ^ (ml_string_of_fdecl f) ^ ");\n"
      ) "" p)

(* Checking AST equivalence *)
let  eq_const c c' : bool =
  begin match (c, c') with
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

let rec eq_exp e e' : bool = 
  begin match (e, e') with 
    | (Const c, Const c') -> eq_const c c'
    | (Lhs l, Lhs l') -> eq_lhs l l'
    | (New (ty1,e1, (_,id), e2), New (ty1',e1', (_,id'), e2')) ->
        eq_typ ty1 ty1' &&
        eq_exp e1 e1' && id = id' && eq_exp e2 e2' 
    | (Binop (o,l,r), Binop (o',l',r')) -> 
        eq_binop o o' && eq_exp l l' && eq_exp r r'
    | (Unop (o,l), Unop (o',l')) ->
        eq_unop o o' && eq_exp l l'
    | (Ecall ((_,fid), es), Ecall ((_,fid'), es')) ->
        begin try 
            List.iter2 
              (fun e -> fun e' -> 
                 if eq_exp e e' then ()
                 else failwith "not eq"
              ) es es';
            fid = fid'
          with
 	    | _ -> false
        end
    | _ -> false
  end

and eq_lhs l l' : bool = 
  begin match (l, l') with
    | (Var (_,s), Var (_, s')) -> s = s' 
    | (Index (l, e), Index (l', e')) ->
        eq_lhs l l' && eq_exp e e'
    | _ -> false
  end

and eq_typ t t' : bool =
  begin match (t, t') with
    | (TBool, TBool) -> true
    | (TInt, TInt) -> true
    | (TString, TString) -> true
    | (TArray (t), TArray (t')) -> eq_typ t t'
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
 
and eq_stmt  s s' : bool =
  begin match (s, s') with
    | (Assign (l, e), Assign (l', e')) -> eq_lhs l l' && eq_exp e e'
    | (Scall ((_,fid), es), Scall ((_,fid'), es')) -> 
        begin try 
            List.iter2 
              (fun e -> fun e' -> 
                 if eq_exp e e' then ()
                 else failwith "not eq"
              ) es es';
            fid = fid'
          with
 	    | _ -> false
        end       
    | (If(e, s, sopt), If(e', s', sopt')) ->
        eq_exp e e' && eq_stmt s s' && eq_option eq_stmt sopt sopt'
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

let eq_prog p p' : bool =
  try
    List.iter2 
      (fun g -> fun g' -> 
        match (g, g') with
	  | (Gvdecl d, Gvdecl d') -> 
              if (eq_vdecl d d') then () else failwith "not eq" 
          | (Gfdecl f, Gfdecl f') ->
              if (eq_fdecl f f') then () else failwith "not eq" 
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

let  const_info (c: 'a const) : 'a =
  match c with
    Cbool (i, _) -> i
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
    | Lhs l -> lhs_info l
    | New (_ty,e1, _, e2) -> mk_parse_range (exp_info e1) (exp_info e2)
    | Binop (bop, _e1, e2) -> mk_parse_range (binop_info bop) (exp_info e2) 
    | Unop (uop, e1) -> mk_parse_range (unop_info uop) (exp_info e1) 
    | Ecall (fid, es) -> 
        match (get_last_exp_info es) with
	  | None -> fst fid
	  | Some i -> i

and lhs_info (l: Range.t lhs) : Range.t =
  match l with
      Var i -> fst i
    | Index (l, e) -> mk_parse_range (lhs_info l) (exp_info e)


let init_info (i: Range.t init) : Range.t =
  match i with
    | Iexp e -> exp_info e
    | Iarray (r, _) -> r

let ast_of_int32 i : Range.t Ast.exp =
  Ast.Const ((Ast.Cint (Range.ghost, i) ))

let ast_of_int i   =
  Ast.Const ((Ast.Cint (Range.ghost, Int32.of_int i) ))

let ast_of_bool b = 
  Ast.Const (Ast.Cbool (Range.norange, b))


    
