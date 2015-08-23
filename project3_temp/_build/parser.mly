%{
open Ast;;
%}

/* Declare your tokens here. */
%token EOF
%token <Range.t * int32> INT
%token <Range.t * string> IDENT
%token <Range.t> SEMI     /* ; */
%token <Range.t> COMMA    /* , */
%token <Range.t> LBRACE   /* { */
%token <Range.t> RBRACE   /* } */
%token <Range.t> IF       /* if */
%token <Range.t> ELSE     /* else */
%token <Range.t> WHILE    /* while */
%token <Range.t> FOR      /* for */
%token <Range.t> RETURN   /* return */
%token <Range.t> TINT     /* int */
%token <Range.t> PLUS     /* + */
%token <Range.t> DASH     /* - */
%token <Range.t> STAR     /* * */
%token <Range.t> SLASH    /* / */
%token <Range.t> PERCENT  /* % */
%token <Range.t> GT       /* > */
%token <Range.t> GTEQ     /* >= */
%token <Range.t> LT       /* < */
%token <Range.t> LTEQ     /* <= */
%token <Range.t> EQEQ     /* == */
%token <Range.t> EQ       /* = */
%token <Range.t> BANG     /* ! */
%token <Range.t> BANGEQ   /* != */
%token <Range.t> BAR      /* | */
%token <Range.t> AMPER    /* & */
%token <Range.t> LPAREN   /* ( */
%token <Range.t> RPAREN   /* ) */
%token <Range.t> TILDE    /* ~ */
%token <Range.t> LTLT     /* << */
%token <Range.t> GTGT     /* >> */
%token <Range.t> GTGTGT   /* >>> */

/* ---------------------------------------------------------------------- */
%start toplevel
%type <Ast.prog> toplevel
%type <Ast.exp> exp
%type <Ast.block> block
%type <Ast.typ> typ
%type <Ast.stmt> stmt
%%

toplevel:
  | prog EOF { $1 }


prog:
  | block RETURN exp SEMI { ($1, $3) }

block:
  | vdecls stmts { ($1, $2) }

vdecls:
  | vdecl SEMI vdecls { $1::$3 }
  | /* empty */ { [] }

vdecl:
  | typ IDENT EQ exp  { {v_ty=$1; v_id=snd($2); v_init=$4 } }

typ:
  | TINT { TInt }

/* int x = 3, int y = 4, int z = 5 */
vdecllist:
  | /* empty */ { [] }
  | vdeclplus { $1 }

vdeclplus:
  | vdecl   { [$1] }
  | vdecl COMMA vdeclplus { $1::$3 }

lhs:
  | IDENT { $1 }

stmts:
  | stmt stmts { $1::$2 }
  | /* empty */  { [] }

stmtOPT:
  | /* empty */  { None }
  | stmt         { Some $1 }

expOPT:
  | /* empty */  { None }
  | exp          { Some $1 }

exp:
  | E4 { $1 }

E4:
  | E4 BAR E5 { Binop (Or, $1, $3) }
  | E5 { $1 }

E5:
  | E5 AMPER E6 { Binop (And, $1, $3) }
  | E6 { $1 }

E6:
  | E6 EQEQ E7 { Binop (Eq, $1, $3) }
  | E6 BANGEQ E7 { Binop (Neq, $1, $3) }
  | E7 { $1 }

E7:
  | E7 LT E8 { Binop (Lt, $1, $3) }
  | E7 LTEQ E8 { Binop (Lte, $1, $3) }
  | E7 GT E8 { Binop (Gt, $1, $3) }
  | E7 GTEQ E8 { Binop (Gte, $1, $3) }
  | E8 { $1 }

E8:
  | E8 LTLT E9 { Binop (Shl, $1, $3) }
  | E8 GTGTGT E9 { Binop (Shr, $1, $3) }
  | E8 GTGT E9 { Binop (Sar, $1, $3) }
  | E9 { $1 }

E9:
  | E9 PLUS E10 { Binop (Plus, $1, $3) }
  | E9 DASH E10 { Binop (Minus, $1, $3) }
  | E10 { $1 }

E10:
  | E10 STAR E11 { Binop (Times, $1, $3) }
  | E11 { $1 }

E11:
  | DASH E11 { Unop (Neg, $2) }
  | BANG E11 { Unop (Lognot, $2) }
  | TILDE E11 { Unop (Not, $2) }
  | E12 { $1 }

E12:
  | INT { Cint (snd $1) }
  | LPAREN exp RPAREN { $2 }
  | IDENT   { Id (snd $1) }


stmt: 
/* Complete this definition: */
  | lhs EQ exp SEMI { Assign(Var(snd($1)), $3) }
  | IF LPAREN exp RPAREN stmt ELSE stmt {If($3,$5, Some $7)}
  | IF LPAREN exp RPAREN stmt  {If($3, $5, None)}
  | WHILE LPAREN exp RPAREN stmt {While ($3, $5)}
  | FOR LPAREN vdecllist SEMI expOPT SEMI stmtOPT RPAREN stmt {For (($3), $5,$7,$9)}
  | LBRACE block RBRACE {Block ($2)}

