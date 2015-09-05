type n = int32
type b = bool
type cstr = string
type 'a id = 'a * string
type typ = TBool | TInt | TString | TArray of typ
type 'a unop = Neg of 'a | Lognot of 'a | Not of 'a
type 'a binop =
    Plus of 'a
  | Times of 'a
  | Minus of 'a
  | Eq of 'a
  | Neq of 'a
  | Lt of 'a
  | Lte of 'a
  | Gt of 'a
  | Gte of 'a
  | And of 'a
  | Or of 'a
  | IAnd of 'a
  | IOr of 'a
  | Shl of 'a
  | Shr of 'a
  | Sar of 'a
type 'a const = Cbool of 'a * b | Cint of 'a * n | Cstring of 'a * cstr
type 'a exp =
    Const of 'a const
  | Lhs of 'a lhs
  | New of typ * 'a exp * 'a id * 'a exp
  | Binop of 'a binop * 'a exp * 'a exp
  | Unop of 'a unop * 'a exp
  | Ecall of 'a id * 'a exp list
and 'a lhs = Var of 'a id | Index of 'a lhs * 'a exp
type 'a init = Iexp of 'a exp | Iarray of 'a * 'a init list
type 'a vdecl = { v_ty : typ; v_id : 'a id; v_init : 'a init; }
type 'a opt_exp = 'a exp option
type 'a vdecls = 'a vdecl list
type rtyp = typ option
type 'a stmt =
    Assign of 'a lhs * 'a exp
  | Scall of 'a id * 'a exp list
  | If of 'a exp * 'a stmt * 'a stmt option
  | While of 'a exp * 'a stmt
  | For of 'a vdecls * 'a opt_exp * 'a stmt option * 'a stmt
  | Block of 'a block
and 'a stmts = 'a stmt list
and 'a block = 'a vdecls * 'a stmts
type 'a args = (typ * 'a id) list
type ftyp = typ list * rtyp
type 'a fdecl = rtyp * 'a id * 'a args * 'a block * 'a exp option
type gtyp = GFn of ftyp | GVal of typ
type 'a gdecl = Gvdecl of 'a vdecl | Gfdecl of 'a fdecl
type 'a lcontext = (string * typ) list
type 'a gcontext = (string * gtyp) list
type 'a prog = 'a gdecl list
