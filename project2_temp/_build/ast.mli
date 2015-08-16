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
| Arg
| Binop of binop * exp * exp
| Unop of unop * exp

val print_exp : exp -> unit
val string_of_exp : exp -> string
val ml_string_of_exp : exp -> string
val interpret_exp : exp -> int32 -> int32
