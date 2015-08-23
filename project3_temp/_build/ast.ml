(* ast.ml *)

(* Abstract syntax of expressions. *)
(******************************************************************************)

open Format

(** Unary operators. *)
type unop =
| Neg    (* unary signed negation  *)
| Lognot (* unary logical negation *)
| Not    (* unary bitwise negation *)


(** Binary operators. *)
type binop =
| Plus  (* binary signed addition *)
| Times (* binary signed multiplication *)
| Minus (* binary signed subtraction *)
| Eq    (* binary equality *)
| Neq   (* binary inequality *)
| Lt    (* binary signed less-than *)
| Lte   (* binary signed less-than or equals *)
| Gt    (* binary signed greater-than *)
| Gte   (* binary signed greater-than or equals *)
| And   (* binary bitwise and *)
| Or    (* binary bitwise or *)
| Shl   (* binary shift left *)
| Shr   (* binary logical shift right *)
| Sar   (* binary arithmetic shift right *)
(** Expressions. *)
type exp =
| Cint of int32
| Id of string
| Binop of binop * exp * exp
| Unop of unop * exp

(** Types *)
type typ = 
  | TInt

(** Variable declarations *)
type var_decl = {
  v_ty : typ;
  v_id : string;
  v_init : exp;
}

(** "Left-hand-sides" of assignments *)
type lhs =
  | Var of string

(** Blocks and Statements. *)
type block = var_decl list * stmt list

and stmt =
  | Assign of lhs * exp
  | If of exp * stmt * stmt option
  | While of exp * stmt
  | For of (var_decl list) * exp option * stmt option * stmt
  | Block of block

(** Programs *)
type prog = block * exp





(** Precedence of binary operators. Higher precedences bind more tightly. *)
let prec_of_binop = function
| Times -> 100
| Plus | Minus -> 90
| Shl | Shr | Sar -> 80
| Lt | Lte | Gt | Gte -> 70
| Eq | Neq -> 60
| And -> 50
| Or -> 40

(** Precedence of unary operators. *)
let prec_of_unop = function
| Neg | Lognot | Not -> 110

(** Precedence of expression nodes. *)
let prec_of_exp = function
| Cint _ -> 130
| Id _ -> 130
| Binop (o,_,_) -> prec_of_binop o
| Unop (o,_) -> prec_of_unop o


let string_of_unop = function
| Neg -> "-"
| Lognot -> "!"
| Not -> "~"

let string_of_binop = function
| Times -> "*"
| Plus  -> "+"
| Minus -> "-"
| Shl   -> "<<"
| Shr   -> ">>>"
| Sar   -> ">>"
| Lt    -> "<"
| Lte   -> "<="
| Gt    -> ">"
| Gte   -> ">="
| Eq    -> "=="
| Neq   -> "!="
| And   -> "&"
| Or    -> "|"

let rec print_exp_aux fmt level e =
  let this_level = prec_of_exp e in
  (if this_level < level then fprintf fmt "(" else ());
  (match e with
  | Cint i -> pp_print_string fmt (Int32.to_string i)
  | Id s -> pp_print_string fmt s
  | Binop (o,l,r) ->
    pp_open_box fmt 0;
    print_exp_aux fmt this_level l;
    pp_print_space fmt ();
    pp_print_string fmt (string_of_binop o);
    pp_print_space fmt ();
    (let r_level = begin match o with
      | Times | Plus | And | Or  -> this_level 
      | _ -> this_level + 1 
     end in
       print_exp_aux fmt r_level r);
    pp_close_box fmt ()
  | Unop (o,v) ->
    pp_open_box fmt 0;
    pp_print_string fmt (string_of_unop o);
    print_exp_aux fmt this_level v;
    pp_close_box fmt ());
  (if this_level < level then fprintf fmt ")" else ())


let  print_typ_aux fmt t =
  match t with
  | TInt -> pp_print_string fmt "int"
  

let print_decl_aux fmt {v_ty = t; v_id = id; v_init = e} =
  pp_open_hbox fmt ();
  print_typ_aux fmt t;
  pp_print_space fmt ();
  pp_print_string fmt id;
  pp_print_string fmt " =";
  pp_print_space fmt ();
  print_exp_aux fmt 0 e;
  pp_close_box fmt ()

let print_lhs_aux fmt l =
   match l with
   | Var s -> pp_print_string fmt s


let rec print_list_aux fmt sep pp l =
  begin match l with
    | [] -> ()
    | h::[] -> pp fmt h
    | h::tl -> 
	pp fmt h;
	sep ();
	print_list_aux fmt sep pp tl
  end

let rec print_block_aux fmt (decls, stmts) =
  if ((List.length stmts) > 0) then begin
    pp_open_vbox fmt 0;
    List.iter (fun d -> print_decl_aux fmt d; pp_print_string fmt ";"; pp_print_space fmt()) decls;
    pp_close_box fmt ();
    print_list_aux fmt (fun () -> pp_print_space fmt ()) print_stmt_aux stmts
  end else begin
  if ((List.length decls) > 0) then begin
    pp_open_vbox fmt 0;
    print_list_aux fmt (fun () -> pp_print_string fmt ";"; pp_print_space fmt()) print_decl_aux decls;
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
    | For(decls, eo, so, body) ->
	pps "for (";
  	  print_list_aux fmt (fun () -> pps ","; ppsp ()) print_decl_aux decls; 
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

let print_prog_aux fmt (b,e) =
  print_block_aux fmt b;
  pp_force_newline fmt ();
  pp_print_string fmt "return "; 
  print_exp_aux fmt 0 e;
  pp_print_string fmt ";"

let print_prog (p:prog) : unit =
  pp_open_hvbox std_formatter 0;
  print_prog_aux std_formatter p;
  pp_close_box std_formatter ();
  pp_print_newline std_formatter ()

let string_of_prog (p:prog) : string =
  pp_open_hvbox str_formatter 0;
  print_prog_aux str_formatter p;
  pp_close_box str_formatter ();
  flush_str_formatter ()

let print_stmt (s:stmt) : unit =
  pp_open_hvbox std_formatter 0;
  print_stmt_aux std_formatter s;
  pp_close_box std_formatter ();
  pp_print_newline std_formatter ()

let string_of_stmt (s:stmt) : string =
  pp_open_hvbox str_formatter 0;
  print_stmt_aux str_formatter s;
  pp_close_box str_formatter ();
  flush_str_formatter ()

let print_block (b:block) : unit =
  pp_open_hvbox std_formatter 0;
  print_block_aux std_formatter b;
  pp_close_box std_formatter ();
  pp_print_newline std_formatter ()
  
let string_of_block (b:block) : string =
  pp_open_hvbox str_formatter 0;
  print_block_aux str_formatter b;
  pp_close_box str_formatter ();
  flush_str_formatter ()

let print_exp (e:exp) : unit =
  pp_open_hvbox std_formatter 0;
  print_exp_aux std_formatter 0 e;
  pp_close_box std_formatter ();
  pp_print_newline std_formatter ()

let string_of_exp (e:exp) : string =
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


let rec ml_string_of_exp (e:exp) : string = 
  begin match e with 
    | Cint i -> Printf.sprintf "(Cint %lil)" i
    | Id s -> Printf.sprintf "(Id \"%s\")" s
    | Binop (o,l,r) -> (
	let binop_str = match o with
	  | Plus -> "Plus" | Times -> "Times" | Minus -> "Minus"
	  | Eq -> "Eq" | Neq -> "Neq" | Lt -> "Lt" | Lte -> "Lte"
	  | Gt -> "Gt" | Gte -> "Gte" | And -> "And" | Or -> "Or"
	  | Shr -> "Shr" | Sar -> "Sar" | Shl -> "Shl" in
	  Printf.sprintf "(Binop (%s,%s,%s))" binop_str
	    (ml_string_of_exp l) (ml_string_of_exp r)
      )
    | Unop (o,l) -> (
	let unop_str = match o with
	  | Neg -> "Neg" | Lognot -> "Lognot" | Not -> "Not" in
	  Printf.sprintf "(Unop (%s,%s))" unop_str (ml_string_of_exp l)
      )
  end

let rec ml_string_of_typ (t:typ) : string =
  begin match t with
    | TInt -> "TInt"
  end

let ml_string_of_var_decl {v_ty = vt; v_id=id; v_init=vini} =
  Printf.sprintf "{v_ty=%s; v_id=\"%s\"; v_init=%s}" 
    (ml_string_of_typ vt) id (ml_string_of_exp vini)

let ml_string_of_lhs (Var s) : string = "(Var \"" ^ s ^ "\")"

let ml_string_of_option (str: 'a -> string) (o:'a option) : string =
  begin match o with
    | None -> "None"
    | Some s -> ("(Some (" ^ (str s) ^ "))")
  end

let rec ml_string_of_block (vdls, stmts) =
  Printf.sprintf "([%s], [%s])"
    (List.fold_left (fun s d -> s ^ (ml_string_of_var_decl d) ^ ";\n") "" vdls)
    (List.fold_left (fun s d -> s ^ (ml_string_of_stmt d) ^ ";\n") "" stmts)

and ml_string_of_stmt (s:stmt) : string =
  begin match s with
    | Assign (l, e) -> Printf.sprintf "Assign(%s, %s)" (ml_string_of_lhs l)
	(ml_string_of_exp e)
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
	  (List.fold_left (fun s d -> s ^ (ml_string_of_var_decl d) ^ ";\n") "" vdl)
	  (ml_string_of_option ml_string_of_exp eopt)
	  (ml_string_of_option ml_string_of_stmt sopt)
	  (ml_string_of_stmt s)
    | Block b ->
	Printf.sprintf "Block%s" (ml_string_of_block b)
  end
	
let ml_string_of_prog ((b,e):prog) : string =
  Printf.sprintf "(%s,%s)" (ml_string_of_block b) (ml_string_of_exp e)

let interpret_exp (e: exp) (env:(string * int32) list) : int32 = 
  let (<@) a b = (Int32.compare a b) < 0 in
  let (>@) a b = (Int32.compare a b) > 0 in
  let (<=@) a b = (Int32.compare a b) <= 0 in
  let (>=@) a b = (Int32.compare a b) >= 0 in
  let rec eval (e:exp) = 
    begin match e with 
      | Cint i -> i
      | Id x   -> List.assoc x env
      | Unop (Neg, e)    -> Int32.neg (eval e)
      | Unop (Lognot, e) -> if (eval e) = 0l then 1l else 0l
      | Unop (Not, e)    -> Int32.lognot (eval e)
      | Binop (Plus, l, r)  -> Int32.add (eval l) (eval r)
      | Binop (Times, l, r) -> Int32.mul (eval l) (eval r)
      | Binop (Minus, l, r) -> Int32.sub (eval l) (eval r)
      | Binop (Or, l, r)  -> Int32.logor (eval l) (eval r)
      | Binop (And, l, r) -> Int32.logand (eval l) (eval r)
      | Binop (Shr, l, r) -> Int32.shift_right_logical (eval l)
	  (Int32.to_int (eval r))
      | Binop (Sar, l, r) -> Int32.shift_right (eval l)
	  (Int32.to_int (eval r))
      | Binop (Shl, l, r) -> Int32.shift_left (eval l)
	  (Int32.to_int (eval r))
      | Binop (Eq, l, r)  -> if (eval l) = (eval r) then 1l else 0l
      | Binop (Neq, l, r) -> if (eval l) <> (eval r) then 1l else 0l
      | Binop (Lt, l, r)  -> if (eval l) <@ (eval r) then 1l else 0l
      | Binop (Lte, l, r) -> if (eval l) <=@ (eval r) then 1l else 0l
      | Binop (Gt, l, r)  -> if (eval l) >@ (eval r) then 1l else 0l
      | Binop (Gte, l, r) -> if (eval l) >=@ (eval r) then 1l else 0l
    end
  in
    eval e
    

