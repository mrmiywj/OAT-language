(* ast.ml *)

(* Abstract syntax of expressions. *)
(******************************************************************************)

open Format

(** Unary operators. *)
type unop =
| Neg    (* unary signed negation  *)
| Lognot (* unary logical negation *)
| Not    (* unary bitwise negation *)

let string_of_unop = function
| Neg -> "-"
| Lognot -> "!"
| Not -> "~"

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

(** Expressions. *)
type exp =
| Cint of int32
| Arg
| Binop of binop * exp * exp
| Unop of unop * exp

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
| Arg -> 130
| Binop (o,_,_) -> prec_of_binop o
| Unop (o,_) -> prec_of_unop o

let rec print_exp_aux fmt level e =
  let this_level = prec_of_exp e in
  (if this_level < level then fprintf fmt "(" else ());
  (match e with
  | Cint i -> pp_print_string fmt (Int32.to_string i)
  | Arg -> pp_print_string fmt "X"
  | Binop (o,l,r) ->
    pp_open_box fmt 0;
    print_exp_aux fmt this_level l;
    pp_print_space fmt ();
    pp_print_string fmt (string_of_binop o);
    pp_print_space fmt ();
    (let r_level = begin match o with
      | Times | Plus | And | Or  -> this_level 
      | _ -> this_level + 4 
     end in
       print_exp_aux fmt r_level r);
    pp_close_box fmt ()
  | Unop (o,v) ->
    pp_open_box fmt 0;
    pp_print_string fmt (string_of_unop o);
    print_exp_aux fmt this_level v;
    pp_close_box fmt ());
  (if this_level < level then fprintf fmt ")" else ())

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

let rec ml_string_of_exp (e:exp) : string = 
  begin match e with 
    | Cint i -> Printf.sprintf "(Cint %lil)" i
    | Arg -> "Arg"
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

let interpret_exp (e: exp) (x:int32) : int32 = 
  let (<@) a b = (Int32.compare a b) < 0 in
  let (>@) a b = (Int32.compare a b) > 0 in
  let (<=@) a b = (Int32.compare a b) <= 0 in
  let (>=@) a b = (Int32.compare a b) >= 0 in
  let rec eval (e:exp) = 
    begin match e with 
      | Cint i -> i
      | Arg    -> x
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
