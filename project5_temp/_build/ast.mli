type n = int32
type b = bool
type cstr = string
type 'a id = 'a * string
type cid = string
type typ = TBot | TBool | TInt | TRef of ref | TNullable of ref
and ref = RString | RClass of cid | RArray of typ
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
type 'a const =
    Cnull of 'a
  | Cbool of 'a * b
  | Cint of 'a * n
  | Cstring of 'a * cstr
type 'a path = ThisId of 'a id | PathId of 'a lhs_or_call * 'a id
and 'a call =
    Func of 'a id * 'a exp list
  | SuperMethod of 'a id * 'a exp list
  | PathMethod of 'a path * 'a exp list
and 'a lhs_or_call = Lhs of 'a lhs | Call of 'a call
and 'a lhs =
    Var of 'a id
  | Path of 'a path
  | Index of 'a lhs_or_call * 'a exp
and 'a exp =
    Const of 'a const
  | This of 'a
  | LhsOrCall of 'a lhs_or_call
  | New of typ * 'a exp * 'a id * 'a exp
  | Ctor of ('a * cid) * 'a exp list
  | Binop of 'a binop * 'a exp * 'a exp
  | Unop of 'a unop * 'a exp
type 'a init = Iexp of 'a exp | Iarray of 'a * 'a init list
type 'a vdecl = { v_ty : typ; v_id : 'a id; v_init : 'a init; }
type 'a opt_exp = 'a exp option
type 'a vdecls = 'a vdecl list
type 'a stmt =
    Assign of 'a lhs * 'a exp
  | Scall of 'a call
  | Fail of 'a exp
  | If of 'a exp * 'a stmt * 'a stmt option
  | IfNull of ref * 'a id * 'a exp * 'a stmt * 'a stmt option
  | Cast of cid * 'a id * 'a exp * 'a stmt * 'a stmt option
  | While of 'a exp * 'a stmt
  | For of 'a vdecls * 'a opt_exp * 'a stmt option * 'a stmt
  | Block of 'a block
and 'a stmts = 'a stmt list
and 'a block = 'a vdecls * 'a stmts
type 'a args = (typ * 'a id) list
type rtyp = typ option
type 'a fdecl = typ option * 'a id * 'a args * 'a block * 'a exp option
type 'a cinits = ('a id * 'a init) list
type ftyp = typ list * rtyp
type 'a fdecls = 'a fdecl list
type 'a ctor = 'a args * 'a exp list * 'a cinits * 'a block
type ext_cid = cid option
type 'a fields = (typ * 'a id) list
type gtyp = GFn of ftyp | GVal of typ
type mcontext = (string * ftyp) list
type fcontext = (string * typ) list
type 'a efdecl = rtyp * 'a id * 'a args
type 'a cdecl = cid * cid option * 'a fields * 'a ctor * 'a fdecl list
type 'a lcontext = (string * typ) list
type 'a gcontext = (string * gtyp) list
type signature =
    (string * (string option * fcontext * typ list * mcontext)) list
type opt_cid = cid option
type 'a gdecl =
    Gvdecl of 'a vdecl
  | Gfdecl of 'a fdecl
  | Gefdecl of 'a efdecl
  | Gcdecl of 'a cdecl
type opt_typ = typ option
type opt_ftyp = ftyp option
type ctxt = unit
type 'a prog = 'a gdecl list
