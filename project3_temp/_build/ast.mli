(* ast.mli *)

(* Abstract syntax of expressions. *)
(******************************************************************************)

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

type typ = 
  | TInt

type var_decl = {
  v_ty : typ;
  v_id : string;
  v_init : exp;
}

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

type prog = block * exp

val print_typ : typ -> unit
val string_of_typ : typ -> string
val ml_string_of_typ : typ -> string

val print_exp : exp -> unit
val string_of_exp : exp -> string
val ml_string_of_exp : exp -> string

val print_stmt : stmt -> unit
val string_of_stmt : stmt -> string
val ml_string_of_stmt : stmt -> string

val print_prog : prog -> unit
val string_of_prog : prog -> string
val ml_string_of_prog : prog -> string

val interpret_exp : exp -> (string * int32) list -> int32
