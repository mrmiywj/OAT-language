(* compiler.ml *)
(* A compiler for simple arithmetic expressions. *)

(******************************************************************************)

open Printf
open Ast
open X86   (* Note that Ast has similarly named constructors that must be 
              disambiguated.  For example: Ast.Shl vs. X86.Shl *)

(* Parse an AST from a preexisting lexbuf. 
 * The filename is used to generate error messages.
*)
let parse (filename : string) (buf : Lexing.lexbuf) : exp =
  try
    Lexer.reset_lexbuf filename buf;
    Parser.toplevel Lexer.token buf
  with Parsing.Parse_error ->
    failwith (sprintf "Parse error at %s."
        (Range.string_of_range (Lexer.lex_range buf)))

let (>::) x y = y :: x
let (>@) x y = y @ x


(* Builds a globally-visible X86 instruction block that acts like the C fuction:

   int program(int X) { return <expression>; }

   Follows cdecl calling conventions and platform-specific name mangling policy. *)
let compile_exp (ast:exp) : Cunit.cunit =
  let block_name = (Platform.decorate_cdecl "program") in
  let init_str = [Mov(edx, stack_offset(4l))] in
  let tmploc = stack_offset 0l in
  let rec emit_exp (e:exp) (str : insn list) : insn list =
    begin match e with
    | Cint i -> (Mov(eax, Imm i)) :: str
    | Arg -> (Mov (eax,edx)) :: str
    | Binop (b,e1,e2) -> (proc_binop b e1 e2 str)
    | Unop (u, e1) -> (proc_uop u e1 str)
    end


  and proc_binop(b : binop) (e1 : exp) (e2 : exp) (str : insn list) : insn list =
    let str_1 = (emit_exp e1 init_str) >:: (Push eax) in

    (emit_exp e2 str_1) >@
      begin match b with
      | Plus -> [] >:: (Add (eax, tmploc))
      | Times -> [] >:: (Imul (Eax, tmploc))
      | Minus -> [] >:: (Sub (eax, tmploc)) >:: (Neg (eax))
      | Ast.Eq -> [] >:: (Cmp (eax,tmploc)) >:: (Mov (eax, Imm 0l)) >:: (Setb (eax, Eq))
      | Neq -> [] >:: (Cmp (eax,tmploc)) >:: (Mov (eax, Imm 0l)) >:: (Setb (eax, NotEq))
      | Lt -> [] >:: (Cmp (tmploc,eax)) >:: (Mov (eax, Imm 0l)) >:: (Setb (eax, Slt))
      | Gte -> [] >:: (Cmp (tmploc, eax )) >:: (Mov (eax, Imm 0l)) >:: (Setb (eax, Sge))
      | Lte -> [] >:: (Cmp (tmploc, eax)) >:: (Mov (eax, Imm 0l)) >:: (Setb (eax, Sle))
      | Gt -> [] >:: (Cmp (tmploc, eax)) >:: (Mov (eax, Imm 0l)) >:: (Setb (eax, Sgt))
      | Ast.And -> [] >:: (And (eax, tmploc))
      | Ast.Or -> [] >:: (Or (eax, tmploc))
      | Ast.Shl -> [] >:: (Mov (ecx, eax)) >:: (Shl (tmploc, ecx)) >:: (Mov (eax, tmploc))
      | Ast.Shr -> [] >:: (Mov (ecx, eax)) >:: (Shr (tmploc, ecx)) >:: (Mov (eax, tmploc))
      | Ast.Sar -> [] >:: (Mov (ecx, eax)) >:: (Sar (tmploc, ecx)) >:: (Mov (eax, tmploc))
      end
    >@ [(Add (esp, Imm 4l))]

  and proc_uop (u : unop) (e1 : exp) (str : insn list) : insn list =
    (emit_exp e1 str) >@
      begin match u with
      | Ast.Neg -> [] >:: (Neg eax)
      | Ast.Lognot -> [] >:: (Cmp (eax, Imm 0l)) >:: (Mov (eax, Imm 0l)) >:: (Setb (eax, Eq))
      | Ast.Not -> [] >:: (Not eax)
      end
  in
  let instructions = List.rev ((emit_exp ast init_str) >:: Ret) in
  let main_bk = {
    global = true;
    label = mk_lbl_named block_name;
    insns = instructions;
  } in [Cunit.Code main_bk]
