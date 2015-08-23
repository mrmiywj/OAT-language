open Assert
open X86
open Ast

(* Do NOT modify this file -- we will overwrite it with our *)
(* own version when we test your project.                   *)

(* These tests will be used to grade your assignment *)

let test_path = ref "tests/"

let assert_bool (s:string) (b:bool) : unit =
  if b then () else failwith s

let ast_test (s:string) (a:Ast.prog) () : unit =
  let ast = Phase1.parse "ast_test" (Lexing.from_string s) in
    if ast = a then () else failwith (Printf.sprintf "bad parse of \"%s\"" s)

let parse_error_test (s:string) (expected:exn) () : unit =
  try 
    let _ = Phase1.parse "stdin" (Lexing.from_string s) in
      failwith (Printf.sprintf "String \"%s\" should not parse." s)
  with
    | e -> if e = expected then () else
	failwith (Printf.sprintf "Lexing/Parsing \"%s\" raised the wrong exception." s)

let run_program (tmp_exe:string) (tmp_out:string) : int =
    let _ = Platform.run_executable_to_tmpfile 0 tmp_exe tmp_out in
    let fi = open_in tmp_out in
    let result = int_of_string (input_line fi) in
    let _ = close_in fi in
      result

let comp_test (prog:Ast.prog) (ans:int) () : unit =
  let _ = if (!Platform.verbose_on) then
    Printf.printf "compiling:\n%s\n" (Ast.string_of_prog prog)
  else (print_char '.'; flush stdout) in
  let tmp_dot_s = Platform.gen_name (!Platform.obj_path) "tmp" ".s" in
  let tmp_dot_o = Platform.gen_name (!Platform.obj_path) "tmp" ".o" in
  let tmp_exe   = Platform.gen_name (!Platform.bin_path) "tmp" (Platform.executable_exn) in
  let tmp_out   = tmp_exe ^ ".out" in
  let _ = if (!Platform.verbose_on) then
    Printf.printf "* TMP FILES:\n*  %s\n*  %s\n*  %s\n" tmp_dot_s tmp_dot_o tmp_exe 
  else () in

  let module Backend = (val (if !Occ.llvm_backend
    then (module Occ.LLVMBackend    : Occ.BACKEND)
    else (module Occ.DefaultBackend : Occ.BACKEND)) : Occ.BACKEND) in
  let prog_il = Phase1.compile_prog prog in
  let cunit = Backend.codegen prog_il in
  let fout = open_out tmp_dot_s in
  Backend.write fout cunit;
  close_out fout;
    try begin
      Platform.assemble tmp_dot_s tmp_dot_o;
      Platform.link [tmp_dot_o] tmp_exe;
      let _ = Platform.run_executable_to_tmpfile 42 tmp_exe tmp_out in
      let fi = open_in tmp_out in
      let result = int_of_string (input_line fi) in
      let _ = close_in fi in
        if result = ans then ()
	else failwith (Printf.sprintf "Program output %d expected %d" result ans)
    end with
    | Platform.AsmLinkError(s1, s2) -> failwith (Printf.sprintf "%s\n%s" s1 s2)

let file_test (fn:string) (ans:int) () : unit =
  let path = !test_path ^ fn in
  let buffer = open_in path in
  let prog = Phase1.parse fn (Lexing.from_channel buffer) in
  let _ = close_in buffer in
    comp_test prog ans ()


let file_parse_test (fn:string) (ans:Ast.prog) () : unit =
  let path = !test_path ^ fn in
  let buffer = open_in path in
  let prog = Phase1.parse fn (Lexing.from_channel buffer) in
  let _ = close_in buffer in
    if prog = ans then () else failwith (Printf.sprintf "bad of \"%s\"" fn)

let file_parse_error_test (fn:string) (_expected:exn) () : unit =
  let passed =
    try 
      let path = !test_path ^ fn in
      let buffer = open_in path in
      let _ = Phase1.parse fn (Lexing.from_channel buffer) in
      false
    with
      | _ -> true
  in 
    if passed then () else
     failwith (Printf.sprintf "File \"%s\" should not parse." fn)

let file_scope_error_test (fn:string) (_expected:string) () : unit =
  let passed =
    try 
      let path = !test_path ^ fn in
      let buffer = open_in path in
      let ast = Phase1.parse fn (Lexing.from_channel buffer) in
	try 
	  ignore (Phase1.compile_prog ast) ; false
	with
	  | Ctxt.Scope_error s -> s = _expected
	  | _ -> false
    with
      | _ -> false
  in 
    if passed then () else
     failwith (Printf.sprintf "File \"%s\" should not compile: variable %s is not in scope." fn _expected)
  

(*** Parsing Tests ***)
let parsing_tests : suite = [
  GradedTest("Easy Parse Tests", 20, [
  ("test1_parse", file_parse_test "test1.oat" (([], []),(Cint 4l)));

  ("test2_parse", file_parse_test "test2.oat" (([{v_ty=TInt; v_id="x"; v_init=(Cint 3l)};
], []),(Id "x")));

  ("test3_parse", file_parse_test "test3.oat" (([{v_ty=TInt; v_id="x"; v_init=(Cint 3l)};
{v_ty=TInt; v_id="y"; v_init=(Cint 4l)};
], []),(Binop (Plus,(Id "x"),(Id "y")))));

  ("test4_parse", file_parse_test "test4.oat" (([{v_ty=TInt; v_id="x"; v_init=(Cint 3l)};
], [If((Binop (Eq,(Id "x"),(Cint 0l))), Assign((Var "x"), (Binop (Plus,(Id "x"),(Cint 1l)))), None);
]),(Id "x")));

  ("test6_parse", file_parse_test "test6.oat" (([{v_ty=TInt; v_id="x"; v_init=(Cint 3l)};
], [If((Binop (Eq,(Id "x"),(Cint 0l))), Block([], [Assign((Var "x"), (Binop (Plus,(Id "x"),(Cint 1l))));
]), None);
]),(Id "x")));

  ("test7_parse", file_parse_test "test7.oat" (([{v_ty=TInt; v_id="x"; v_init=(Cint 1l)};
], [Block([{v_ty=TInt; v_id="x"; v_init=(Cint 2l)};
], []);
]),(Id "x")));

  ("test8_parse", file_parse_test "test8.oat" (([{v_ty=TInt; v_id="x"; v_init=(Cint 1l)};
{v_ty=TInt; v_id="y"; v_init=(Cint 0l)};
], [Block([{v_ty=TInt; v_id="x"; v_init=(Cint 4l)};
], [Assign((Var "y"), (Binop (Plus,(Id "y"),(Id "x"))));
]);
Assign((Var "y"), (Binop (Plus,(Id "y"),(Id "x"))));
]),(Id "y")));

  ("test9_parse", file_parse_test "test9.oat" (([{v_ty=TInt; v_id="x"; v_init=(Cint 0l)};
{v_ty=TInt; v_id="y"; v_init=(Cint 1l)};
], [If((Binop (Eq,(Id "x"),(Cint 0l))), If((Binop (Eq,(Id "y"),(Cint 1l))), Assign((Var "x"), (Cint 1l)), (Some (Assign((Var "x"), (Cint 2l))))), None);
]),(Id "x")));

  ("test11_parse", file_parse_test "test11.oat" (([{v_ty=TInt; v_id="x"; v_init=(Cint 6l)};
{v_ty=TInt; v_id="acc"; v_init=(Cint 1l)};
], [While((Binop (Gt,(Id "x"),(Cint 0l))), Block([], [Assign((Var "acc"), (Binop (Times,(Id "acc"),(Id "x"))));
Assign((Var "x"), (Binop (Minus,(Id "x"),(Cint 1l))));
]));
]),(Id "acc")));

  ("easy_uu1_parse", file_parse_test "easy_uu1.oat" (([{v_ty=TInt; v_id="x"; v_init=(Cint 0l)};
{v_ty=TInt; v_id="y"; v_init=(Cint 1l)};
], [If((Binop (Eq,(Id "x"),(Cint 0l))), If((Binop (Eq,(Id "y"),(Cint 1l))), Assign((Var "x"), (Cint 1l)), None), None);
]),(Id "x")));

  ("easy_mu1_parse", file_parse_test "easy_mu1.oat" (([{v_ty=TInt; v_id="x"; v_init=(Cint 0l)};
{v_ty=TInt; v_id="y"; v_init=(Cint 1l)};
], [If((Binop (Eq,(Id "x"),(Cint 1l))), Assign((Var "x"), (Cint 2l)), (Some (If((Binop (Eq,(Id "y"),(Cint 1l))), Assign((Var "x"), (Cint 1l)), None))));
]),(Id "x")));

  ("easy_mm1_parse", file_parse_test "easy_mm1.oat" (([{v_ty=TInt; v_id="x"; v_init=(Cint 0l)};
{v_ty=TInt; v_id="y"; v_init=(Cint 1l)};
], [If((Binop (Eq,(Id "x"),(Cint 1l))), If((Binop (Eq,(Id "y"),(Cint 1l))), Assign((Var "x"), (Cint 1l)), (Some (Assign((Var "x"), (Cint 2l))))), (Some (If((Binop (Eq,(Id "y"),(Cint 1l))), Assign((Var "x"), (Cint 3l)), (Some (Assign((Var "x"), (Cint 4l))))))));
]),(Id "x")));

  ("easy_ub1_parse", file_parse_test "easy_ub1.oat" (([{v_ty=TInt; v_id="x"; v_init=(Cint 3l)};
], [If((Binop (Lte,(Id "x"),(Cint 3l))), Block([], [Assign((Var "x"), (Binop (Plus,(Id "x"),(Cint 1l))));
If((Binop (Gt,(Id "x"),(Cint 1l))), Assign((Var "x"), (Binop (Plus,(Id "x"),(Cint 1l)))), None);
]), None);
]),(Id "x")));

  ("easy_mb1_parse", file_parse_test "easy_mb1.oat" (([{v_ty=TInt; v_id="x"; v_init=(Cint 3l)};
], [If((Binop (Lt,(Id "x"),(Cint 3l))), Block([], [Assign((Var "x"), (Binop (Plus,(Id "x"),(Cint 1l))));
If((Binop (Gt,(Id "x"),(Cint 1l))), Assign((Var "x"), (Binop (Plus,(Id "x"),(Cint 1l)))), None);
]), (Some (Block([], [Assign((Var "x"), (Binop (Plus,(Id "x"),(Cint 3l))));
If((Binop (Gt,(Id "x"),(Cint 1l))), Assign((Var "x"), (Binop (Plus,(Id "x"),(Cint 1l)))), None);
]))));
]),(Id "x")));

  ("parse_f1_parse", file_parse_test "parse_f1.oat" (([], [For([], None, None, Block([], []));
]),(Cint 0l)));
  ]);

  GradedTest("Medium Parse Tests", 10, [
  ("medium_mw2_parse", file_parse_test "medium_mw2.oat" (([{v_ty=TInt; v_id="x"; v_init=(Cint 1l)};
], [While((Binop (Gt,(Id "x"),(Cint 100l))), Block([], []));
]),(Id "x")));

  ("medium_mw3_parse", file_parse_test "medium_mw3.oat" (([{v_ty=TInt; v_id="z"; v_init=(Cint 0l)};
{v_ty=TInt; v_id="x"; v_init=(Id "z")};
], [While((Binop (Gte,(Id "z"),(Binop (Times,(Cint 1024l),(Id "x"))))), Block([], [If((Binop (Eq,(Id "x"),(Id "z"))), Assign((Var "z"), (Unop (Neg,(Cint 1l)))), None);
]));
]),(Id "z")));

  ("medium_mf1_parse", file_parse_test "medium_mf1.oat" (([{v_ty=TInt; v_id="x"; v_init=(Cint 0l)};
], [For([{v_ty=TInt; v_id="i"; v_init=(Cint 0l)};
], (Some ((Binop (Lt,(Id "i"),(Cint 100l))))), (Some (Assign((Var "i"), (Binop (Plus,(Id "i"),(Cint 1l)))))), Assign((Var "x"), (Binop (Plus,(Id "x"),(Cint 1l)))));
]),(Id "x")));

  ("medium_mf2_parse", file_parse_test "medium_mf2.oat" (([{v_ty=TInt; v_id="x"; v_init=(Cint 0l)};
], [For([{v_ty=TInt; v_id="x"; v_init=(Cint 1l)};
], (Some ((Cint 0l))), None, Block([], []));
]),(Id "x")));

  ("medium_mw4_parse", file_parse_test "medium_mw4.oat" (([{v_ty=TInt; v_id="x"; v_init=(Binop (Minus,(Cint 19l),(Cint 18l)))};
{v_ty=TInt; v_id="y"; v_init=(Cint 0l)};
], [While((Binop (Lte,(Id "x"),(Cint 19l))), If((Binop (Lte,(Id "y"),(Cint 0l))), Assign((Var "x"), (Binop (Plus,(Id "x"),(Cint 1l)))), (Some (Assign((Var "x"), (Cint 100l))))));
]),(Id "x")));

  ("medium_mf3_parse", file_parse_test "medium_mf3.oat" (([{v_ty=TInt; v_id="z"; v_init=(Cint 0l)};
{v_ty=TInt; v_id="y"; v_init=(Binop (Plus,(Binop (Times,(Id "z"),(Id "z"))),(Cint 98l)))};
], [For([], (Some ((Binop (Lt,(Id "z"),(Cint 100l))))), None, If((Binop (Lt,(Id "y"),(Cint 100l))), Assign((Var "z"), (Binop (Plus,(Id "z"),(Cint 1l)))), (Some (Assign((Var "z"), (Cint 1000l))))));
]),(Id "z")));

  ("medium_uw1_parse", file_parse_test "medium_uw1.oat" (([{v_ty=TInt; v_id="x"; v_init=(Cint 1l)};
], [While((Binop (Lt,(Id "x"),(Cint 10l))), If((Binop (Lt,(Id "x"),(Cint 2l))), Assign((Var "x"), (Binop (Or,(Cint 100l),(Cint 1l)))), None));
]),(Id "x")));

  ("medium_uf1_parse", file_parse_test "medium_uf1.oat" (([{v_ty=TInt; v_id="x"; v_init=(Binop (Gt,(Cint 1l),(Cint 0l)))};
], [For([{v_ty=TInt; v_id="abcd"; v_init=(Id "x")};
], (Some ((Binop (Eq,(Id "x"),(Id "abcd"))))), (Some (Assign((Var "x"), (Binop (Minus,(Id "abcd"),(Cint 1l)))))), If((Binop (Eq,(Id "x"),(Id "abcd"))), Assign((Var "abcd"), (Cint 42l)), None));
]),(Id "x")));

  ("medium_uf2_parse", file_parse_test "medium_uf2.oat" (([{v_ty=TInt; v_id="x"; v_init=(Binop (Gt,(Cint 1l),(Cint 0l)))};
], [For([{v_ty=TInt; v_id="abcd"; v_init=(Id "x")};
], (Some ((Binop (Eq,(Id "x"),(Id "abcd"))))), (Some (Block([], [If((Binop (Eq,(Id "x"),(Id "abcd"))), Assign((Var "abcd"), (Cint 42l)), None);
Assign((Var "x"), (Binop (Minus,(Id "abcd"),(Cint 1l))));
]))), Block([], []));
]),(Id "x")));

  ("medium_uimw2_parse", file_parse_test "medium_uimw2.oat" (([{v_ty=TInt; v_id="x"; v_init=(Cint 0l)};
{v_ty=TInt; v_id="y"; v_init=(Binop (Sar,(Cint 5l),(Cint 100l)))};
], [If((Binop (Eq,(Id "x"),(Cint 0l))), While((Binop (Lt,(Id "x"),(Cint 10l))), If((Binop (Eq,(Id "y"),(Cint 5l))), Assign((Var "x"), (Binop (Plus,(Id "x"),(Cint 1l)))), (Some (Assign((Var "x"), (Binop (Plus,(Id "x"),(Cint 3l)))))))), None);
]),(Id "x")));

  ("medium_uimf2_parse", file_parse_test "medium_uimf2.oat" (([{v_ty=TInt; v_id="x"; v_init=(Binop (Plus,(Cint 0l),(Cint 1l)))};
{v_ty=TInt; v_id="z"; v_init=(Binop (Plus,(Id "x"),(Cint 1l)))};
{v_ty=TInt; v_id="y"; v_init=(Cint 0l)};
], [If((Binop (Gt,(Id "x"),(Cint 0l))), For([{v_ty=TInt; v_id="i"; v_init=(Cint 0l)};
], (Some ((Binop (Lt,(Id "i"),(Cint 100l))))), (Some (Assign((Var "i"), (Binop (Plus,(Id "i"),(Cint 1l)))))), If((Binop (Eq,(Id "z"),(Binop (Minus,(Id "x"),(Cint 1l))))), Assign((Var "y"), (Binop (Minus,(Id "y"),(Cint 1l)))), (Some (Assign((Var "y"), (Binop (Plus,(Id "y"),(Cint 1l)))))))), None);
]),(Id "y")));

  ("medium_uwmw1_parse", file_parse_test "medium_uwmw1.oat" (([{v_ty=TInt; v_id="i"; v_init=(Cint 0l)};
{v_ty=TInt; v_id="j"; v_init=(Cint 0l)};
], [While((Binop (Eq,(Id "i"),(Id "j"))), If((Binop (Eq,(Id "i"),(Cint 0l))), While((Binop (Lte,(Id "j"),(Id "i"))), If((Binop (Eq,(Id "j"),(Cint 0l))), Assign((Var "j"), (Cint 1l)), None)), None));
]),(Id "j")));

  ("medium_ufmf1_parse", file_parse_test "medium_ufmf1.oat" (([{v_ty=TInt; v_id="i"; v_init=(Cint 0l)};
{v_ty=TInt; v_id="j"; v_init=(Cint 0l)};
], [For([{v_ty=TInt; v_id="x"; v_init=(Cint 0l)};
{v_ty=TInt; v_id="y"; v_init=(Cint 0l)};
], (Some ((Binop (Eq,(Id "i"),(Id "j"))))), None, If((Binop (Eq,(Id "i"),(Cint 0l))), For([{v_ty=TInt; v_id="z"; v_init=(Cint 0l)};
{v_ty=TInt; v_id="u"; v_init=(Cint 0l)};
], (Some ((Binop (Lte,(Id "j"),(Id "i"))))), None, If((Binop (Eq,(Id "j"),(Cint 0l))), Assign((Var "j"), (Cint 1l)), None)), None));
]),(Id "j")));

  ("medium_mwmw1_parse", file_parse_test "medium_mwmw1.oat" (([{v_ty=TInt; v_id="x"; v_init=(Cint 10l)};
{v_ty=TInt; v_id="y"; v_init=(Cint 0l)};
], [While((Binop (Lte,(Id "x"),(Cint 40l))), If((Binop (Lte,(Id "x"),(Cint 20l))), While((Binop (Lte,(Id "x"),(Cint 20l))), If((Binop (Gt,(Id "x"),(Cint 0l))), Assign((Var "x"), (Binop (Plus,(Id "x"),(Cint 1l)))), (Some (Assign((Var "x"), (Binop (Plus,(Id "x"),(Cint 2l)))))))), (Some (While((Binop (Lte,(Id "x"),(Cint 40l))), If((Binop (Gt,(Id "x"),(Cint 0l))), Assign((Var "x"), (Binop (Plus,(Id "x"),(Cint 3l)))), (Some (Assign((Var "x"), (Binop (Plus,(Id "x"),(Cint 4l))))))))))));
]),(Id "x")));

  ("medium_mfmf1_parse", file_parse_test "medium_mfmf1.oat" (([{v_ty=TInt; v_id="x"; v_init=(Cint 31l)};
{v_ty=TInt; v_id="y"; v_init=(Cint 0l)};
], [For([], (Some ((Binop (Lte,(Id "x"),(Cint 40l))))), None, If((Binop (Lte,(Id "x"),(Cint 20l))), For([], (Some ((Binop (Lte,(Id "x"),(Cint 20l))))), None, If((Binop (Gt,(Id "x"),(Cint 0l))), Assign((Var "x"), (Binop (Plus,(Id "x"),(Cint 1l)))), (Some (Assign((Var "x"), (Binop (Plus,(Id "x"),(Cint 2l)))))))), (Some (For([], (Some ((Binop (Lte,(Id "x"),(Cint 40l))))), None, If((Binop (Gt,(Id "x"),(Cint 0l))), Assign((Var "x"), (Binop (Plus,(Id "x"),(Cint 3l)))), (Some (Assign((Var "x"), (Binop (Plus,(Id "x"),(Cint 4l))))))))))));
]),(Id "x")));

  ("medium_seq1_parse", file_parse_test "medium_seq1.oat" (([{v_ty=TInt; v_id="x"; v_init=(Cint 0l)};
{v_ty=TInt; v_id="y"; v_init=(Cint 0l)};
], [If((Binop (Neq,(Binop (Times,(Binop (Times,(Binop (Times,(Binop (Times,(Binop (Times,(Binop (Times,(Binop (Times,(Binop (Times,(Binop (Times,(Id "x"),(Id "x"))),(Id "x"))),(Id "x"))),(Id "x"))),(Id "x"))),(Id "x"))),(Id "x"))),(Id "x"))),(Id "x"))),(Cint 0l))), Assign((Var "x"), (Cint 1l)), None);
Assign((Var "y"), (Cint 1l));
]),(Binop (Plus,(Id "x"),(Id "y")))));

  ("medium_seq3_parse", file_parse_test "medium_seq3.oat" (([{v_ty=TInt; v_id="x"; v_init=(Cint 0l)};
{v_ty=TInt; v_id="y"; v_init=(Cint 0l)};
], [While((Binop (Lt,(Id "x"),(Cint 10l))), Assign((Var "x"), (Binop (Plus,(Id "x"),(Cint 1l)))));
Assign((Var "y"), (Binop (Plus,(Id "y"),(Cint 1l))));
]),(Id "y")));

   ("medium_seq4_parse", file_parse_test "medium_seq4.oat" (([{v_ty=TInt; v_id="x"; v_init=(Cint 0l)};
{v_ty=TInt; v_id="y"; v_init=(Cint 0l)};
], [For([], (Some ((Binop (Lt,(Id "x"),(Cint 10l))))), (Some (Block([], [Assign((Var "y"), (Binop (Plus,(Id "y"),(Cint 1l))));
]))), Assign((Var "x"), (Binop (Plus,(Id "x"),(Cint 1l)))));
Assign((Var "y"), (Binop (Plus,(Id "y"),(Cint 1l))));
]),(Id "y")));

  ]);

  GradedTest("Parse Error Tests", 10, [
    ("bad1_err", (file_parse_error_test "bad1.oat" (Failure "Parse error at bad1.oat:[1.8-1.9].")));
    ("bad2_err", (file_parse_error_test "bad2.oat" (Failure "Parse error at bad2.oat:[2.0-2.0].")));
     ("bad3_err", (file_parse_error_test "bad3.oat" (Failure "Parse error at bad3.oat:[2.17-2.18].")));
    ("bad_f1_err", (file_parse_error_test "bad_f1.oat" (Failure "Parse error at bad_f1.oat:[2.5-2.6].")));
    ("bad_f2_err", (file_parse_error_test "bad_f2.oat" (Failure "Parse error at bad_f2.oat:[2.26-2.27].")));
    ("bad4_err", (file_parse_error_test "bad4.oat" (Failure "Parse error at bad4.oat:[2.0-2.0].")));
    ("bad5_err", (file_parse_error_test "bad5.oat" (Failure "Variable x not bound")));
    ("bad6_err", (file_parse_error_test "bad6.oat" (Failure "Parse error at bad6.oat:[2.9-2.10].")));
    ("bad7_err", (file_parse_error_test "bad7.oat" (Failure "Parse error at bad7.oat:[1.0-1.1].")));
    ("bad8_err", (file_parse_error_test "bad8.oat" (Lexer.Lexer_error ((Range.mk_range "bad8.oat" (Range.mk_pos 1 4) (Range.mk_pos 1 5)), "Unexpected character: '_'"))));
    ("bad9_err", (file_parse_error_test "bad9.oat" (Failure "Parse error at bad9.oat:[1.8-1.9].")));
    ("bad10_err", (file_parse_error_test "bad10.oat" (Failure "Parse error at bad10.oat:[1.14-1.17].")));
    ("bad11_err", (file_parse_error_test "bad11.oat" (Failure "Parse error at bad11.oat:[1.7-1.13].")));
    ("bad12_err", (file_parse_error_test "bad12.oat" (Failure "Parse error at bad12.oat:[1.10-1.16].")));
    ("bad13_err", (file_parse_error_test "bad13.oat" (Failure "Parse error at bad13.oat:[1.17-1.20].")));
    ("bad14_err", (file_parse_error_test "bad14.oat" (Failure "Parse error at bad14.oat:[3.0-3.3].")));
  ]);
]

(*** End-to-end tests ***)
let file_tests : suite = [
  GradedTest("Scope tests", 5, [
    ("scope1", file_scope_error_test "scope1.oat" "x");
    ("scope2", file_scope_error_test "scope2.oat" "x");
    ("scope3", file_scope_error_test "scope3.oat" "x");
    ("scope4", file_scope_error_test "scope4.oat" "x");
  ]);

  GradedTest("Easy tests", 15, [ 
    ("test1", file_test "test1.oat" 4); 
    ("test2", file_test "test2.oat" 3);
    ("test3", file_test "test3.oat" 7);
    ("test4", file_test "test4.oat" 3);
    ("test5", file_test "test5.oat" 4);
    ("test6", file_test "test6.oat" 3);
    ("test7", file_test "test7.oat" 1);
    ("test8", file_test "test8.oat" 5);
    ("test9", file_test "test9.oat" 1);
    ("test10", file_test "test10.oat" 0);
    ("test12", file_test "test12.oat" 4);
    ("easy_um1", file_test "easy_um1.oat" 2);
    ("easy_uu1", file_test "easy_uu1.oat" 1);
    ("easy_uu2", file_test "easy_uu2.oat" 0);
    ("easy_uu3", file_test "easy_uu3.oat" 0);
    ("easy_mu1", file_test "easy_mu1.oat" 1);
    ("easy_mu2", file_test "easy_mu2.oat" 2);
    ("easy_mu3", file_test "easy_mu3.oat" 0);
    ("easy_mm1", file_test "easy_mm1.oat" 3);
    ("easy_mm2", file_test "easy_mm2.oat" 1);
    ("easy_mm3", file_test "easy_mm3.oat" 2);
    ("easy_mm4", file_test "easy_mm4.oat" 4);
    ("easy_ub1", file_test "easy_ub1.oat" 5);
    ("easy_ub2", file_test "easy_ub2.oat" 3);
    ("easy_mb1", file_test "easy_mb1.oat" 7);
    ("easy_mb2", file_test "easy_mb2.oat" 2);
    ("easy_mb3", file_test "easy_mb3.oat" 9);
    ("easy_mb4", file_test "easy_mb4.oat" 3);
  ]);
 
  GradedTest("Medium tests", 10, [
    ("test11", file_test "test11.oat" 720);	       
    ("medium_mw1", file_test "medium_mw1.oat" 10);
    ("medium_mw3", file_test "medium_mw3.oat" (-1));
    ("medium_mw4", file_test "medium_mw4.oat" 20);
    ("medium_mw5", file_test "medium_mw5.oat" 100);
    ("medium_mf1", file_test "medium_mf1.oat" 100);
    ("medium_mf2", file_test "medium_mf2.oat" 0);
    ("medium_mf3", file_test "medium_mf3.oat" 100);
    ("medium_mf4", file_test "medium_mf4.oat" 1000);
    ("medium_uw1", file_test "medium_uw1.oat" 101);
    ("medium_uf1", file_test "medium_uf1.oat" 41);
    ("medium_uf2", file_test "medium_uf2.oat" 41);
    ("medium_uimw1", file_test "medium_uimw1.oat" 10);
    ("medium_uimw2", file_test "medium_uimw2.oat" 12);
    ("medium_uimf1", file_test "medium_uimf1.oat" (-100));
    ("medium_uimf2", file_test "medium_uimf2.oat" 100);
    ("medium_uwmw1", file_test "medium_uwmw1.oat" 1);
    ("medium_ufmf1", file_test "medium_ufmf1.oat" 1);
    ("medium_mwmw1", file_test "medium_mwmw1.oat" 42);
    ("medium_mwmw2", file_test "medium_mwmw2.oat" 43);
    ("medium_mfmf1", file_test "medium_mfmf1.oat" 43);
    ("medium_mfmf2", file_test "medium_mfmf2.oat" 42);
    ("medium_seq1", file_test "medium_seq1.oat" 1);
    ("medium_seq2", file_test "medium_seq2.oat" 2);
    ("medium_seq3", file_test "medium_seq3.oat" 1);
    ("medium_seq4", file_test "medium_seq4.oat" 11);
    ("medium_seq5", file_test "medium_seq5.oat" 101);
    ("medium_seq6", file_test "medium_seq6.oat" 101);
    ("medium_seq7", file_test "medium_seq7.oat" 2);
    ("medium_seq8", file_test "medium_seq8.oat" 3104);
    ("medium_seq9", file_test "medium_seq9.oat" 37616);
    ("medium_ctx1", file_test "medium_ctx1.oat" 6);
    ("medium_ctx2", file_test "medium_ctx2.oat" 24);
    ("medium_ctx3", file_test "medium_ctx3.oat" 306);
    ("medium_ctx4", file_test "medium_ctx4.oat" 0);
    ("medium_ctx5", file_test "medium_ctx5.oat" 1);
    ("medium_nest1", file_test "medium_nest1.oat" 100);
    ("medium_nest2", file_test "medium_nest2.oat" 100);
    ("medium_nest3", file_test "medium_nest3.oat" 100);
    ("medium_nest4", file_test "medium_nest4.oat" 1);
  ]);

  GradedTest("Hard tests", 10, [
    ("bsort", file_test "bsort.oat" 1);
    ("msort", file_test "msort.oat" 1);
    ("hsort", file_test "hsort.oat" 1);
  ]);
  GradedTest("Stress tests (hidden)", 10, [
  
  ]);
]

let manual_tests : suite = [
  GradedTest ("StyleManual", 10, [
  
  ]);
]

let graded_tests : suite = 
  parsing_tests @
  file_tests @
  manual_tests
