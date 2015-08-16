%{
open Ast;;
%}

/* Declare your tokens here. */
%token EOF
%token <Range.t * int32> INT
%token <Range.t> X        /* X */
%token <Range.t> PLUS
%token <Range.t> TIMES    /* '*' */
%token <Range.t> DIGIT
%token <Range.t> MINUS
%token <Range.t> OR
%token <Range.t> SHL
%token <Range.t> SHR
%token <Range.t> SAR
%token <Range.t> LT
%token <Range.t> LTE
%token <Range.t> GT
%token <Range.t> GTE
%token <Range.t> EQ
%token <Range.t> NEQ
%token <Range.t> AND
%token <Range.t> NEG
%token <Range.t> LOGNOT
%token <Range.t> NOT
%token <Range.t> LPAREN
%token <Range.t> RPAREN
%token <Range.t> SPACE


/* ---------------------------------------------------------------------- */
%start toplevel
%type <Ast.exp> toplevel
%type <Ast.exp> exp
%%

toplevel:
  | exp EOF { $1 }

/* Declare your productions here, starting with 'exp'. */

exp:
  | A1 { $1 }

A1:
  | A1 OR A2 {Binop (Or, $1, $3)}
  | A2 { $1 }
A2:
  | A2 AND A3 {Binop (And, $1, $3)}
  | A3 { $1 }
A3:
  | A3 NEQ A4 {Binop (Neq, $1, $3)}
  | A3 EQ A4 {Binop (Eq, $1, $3) }
  | A4 { $1 }
A4:
  | A4 LT A5 {Binop (Lt, $1, $3) }
  | A4 LTE A5 {Binop (Lte, $1, $3) }
  | A4 GT A5 {Binop (Gt, $1, $3) }
  | A4 GTE A5 {Binop (Gte, $1, $3) }
  | A5 { $1 }
A5:
  | A5 SHL A6 {Binop (Shl, $1, $3) }
  | A5 SHR A6 {Binop (Shr, $1, $3) }
  | A5 SAR A6 {Binop (Sar, $1, $3) }
  | A6 { $1 }
A6:
  | A6 PLUS A7 {Binop (Plus, $1, $3) }
  | A6 MINUS A7 {Binop (Minus, $1, $3) }
  | A7 { $1 }
A7:
  | A7 TIMES A8 {Binop (Times, $1, $3) }
  | A8 { $1 }
A8:
  | NEG A8 {Unop (Neg, $2) }
  | LOGNOT A8 {Unop (Lognot, $2) }
  | NOT A8 {Unop (Not, $2) }
  | A9 { $1 }
A9:
  | INT {Cint (snd $1) }
  | X   { Arg }
  | LPAREN A1 RPAREN { $2 }
