open Assert
open LibUtil
open Ast
open Range

(* Do NOT modify this file -- we will overwrite it with our *)
(* own version when we test your project.                   *)

(* These tests will be used to grade your assignment *)

let test_path = ref "tests/"

let assert_bool (s:string) (b:bool) : unit =
  if b then () else failwith s

let ast_test (s:string) (a:Range.t Ast.prog) () : unit =
  let ast = Astlib.parse "ast_test" (Lexing.from_string s) in
    if ast = a then () else failwithf  "bad parse of \"%s\"" s

let parse_error_test (s:string) (expected:exn) () : unit =
  try 
    let _ = Astlib.parse "stdin" (Lexing.from_string s) in
      failwithf  "String \"%s\" should not parse." s
  with
    | e -> if e = expected then () else
	failwithf  "Lexing/Parsing \"%s\" raised the wrong exception." s

let comp_test fn 
    (prog:Range.t Ast.prog) (args:string) (ans:string) () : unit =
  let _ = if (!Platform.verbose_on) then
    Printf.printf "compiling:\n%s\n" (Astlib.string_of_prog prog)
  else (print_char '.'; flush stdout) in
  let tmp_dot_ll =  Filename.temp_file ~temp_dir:!Platform.obj_path fn ".ll" in
  let tmp_dot_s = Filename.temp_file ~temp_dir:!Platform.obj_path fn ".s" in
  let tmp_dot_o = Filename.temp_file ~temp_dir:!Platform.obj_path fn ".o" in 
  let tmp_exe = Filename.temp_file ~temp_dir:!Platform.bin_path fn Platform.executable_exn in
  let tmp_out   = tmp_exe ^ ".out" in
  let _ = if (!Platform.verbose_on) then
    Printf.printf "* TMP FILES:\n*  %s\n*  %s\n*  %s\n" tmp_dot_s tmp_dot_o tmp_exe 
  else () in
  let _ = Tc.tc_toplevel prog in
  let prog_il = Phase1.cmp_toplevel prog in
  let fout = open_out tmp_dot_ll in
  let _ = Lllib.pp_prog (output_string fout) prog_il  in
  let _ = close_out fout in

  
  let module Backend =
    (val
        ( if !Occ.llvm_backend then (module Occ.LLVMBackend : Occ.BACKEND)
        else  (module Occ.DefaultBackend : Occ.BACKEND)) : Occ.BACKEND)
  in
  let cu = Backend.codegen prog_il in 
  let fout = open_out tmp_dot_s in
  Backend.write fout cu;
  begin
    (* Cunit.output_cunit cu fout; *)
    close_out fout;
    Platform.assemble tmp_dot_s tmp_dot_o;
    Platform.link [tmp_dot_o] tmp_exe;
    try
      let result = Platform.run_program args tmp_exe tmp_out in
      if result = ans then ()
      else failwithf  "Program output %s expected %s" result ans
    with | Platform.AsmLinkError(s1, s2) -> 
      failwithf  "%s\n%s" s1 s2
  end

let preprocess_file fn =
  let path = Filename.concat !test_path fn in
  let tmp_dot_i = Filename.temp_file ~temp_dir:!Platform.obj_path fn ".i.oat" in
  Platform.preprocess path tmp_dot_i;
  tmp_dot_i


let file_test (fn:string) (args:string) (ans:string) () : unit =
  let path = preprocess_file fn in
  let buffer = open_in path in
  let prog = Astlib.parse fn (Lexing.from_channel buffer) in
  let _ = close_in buffer in
    comp_test fn prog args ans ()

let file_error_test (fn:string) (args:string) (ans:string) () : unit =
  let path = preprocess_file fn in
  let buffer = open_in path in
  let prog = Astlib.parse fn (Lexing.from_channel buffer) in
  let _ = close_in buffer in
  try
    (comp_test fn prog args "" ());
    failwithf "File \"%s\" should have typecheck/runtime errors." fn
  with
    | _ -> ()

let file_parse_test (fn:string) (ans:Range.t Ast.prog) () : unit =
  let path = !test_path ^ fn in
  let buffer = open_in path in
  let prog = Astlib.parse fn (Lexing.from_channel buffer) in
  let _ = close_in buffer in
    if Astlib.eq_prog prog ans then () 
    (* else failwithf  "bad of \"%s\"" fn *)
    else failwith (Astlib.ml_string_of_prog prog)

let file_parse_error_test (fn:string) (_expected:exn) () : unit =
  let passed = 
    try 
      let path = !test_path ^ fn in
      let buffer = open_in path in
      let _ = Astlib.parse fn (Lexing.from_channel buffer) in
      true
    with
      | _ -> false 
  in 
    if passed then
      failwithf  "File \"%s\" should not parse." fn
    else ()

let file_tc_error_test (fn:string) e () : unit =
  let passed = 
    try 
      let path = !test_path ^ fn in
      let buffer = open_in path in
      let prog = Astlib.parse fn (Lexing.from_channel buffer) in
      let _ = Tc.tc_toplevel prog in
      true
    with
      | Tc.TypeError s -> false 
      | Failure s -> failwithf "Failed with: %s" s
  in 
    if passed then
      failwithf  "File \"%s\" should not typecheck." fn
    else ()

let file_tc_ok_test (fn:string) () : unit =
  try
    let path = !test_path ^ fn in
    let buffer = open_in path in
    let prog = Astlib.parse fn (Lexing.from_channel buffer) in
      Tc.tc_toplevel prog
  with
    | Tc.TypeError s -> failwithf "File \"%s\" gave TypeError: %s." fn s


(*** Parsing Tests ***)
let parsing_tests : suite = [
  GradedTest("Parse Tests", 0, [

    ("parse1_parse", file_parse_test "parse1.oat" ([Gcdecl(("A", None, [], ([], [], [], ([], [])), []));
Gcdecl(("B", (Some ("A")), [], ([], [], [], ([], [])), []));
Gcdecl(("C", (Some ("B")), [(TInt, (norange, "i"));
], ([], [], [], ([], [])), [((Some (TInt)), (norange, "f"), [], ([], []), (Some ((LhsOrCall (Lhs (Var (norange, "i")))))));
]));
]));

    ("parse2_parse", file_parse_test "parse2.oat" ([Gcdecl(("A", None, [], ([(TInt, (norange, "a"));
(TInt, (norange, "b"));
], [], [], ([], [])), []));
Gfdecl((None, (norange, "p"), [], ([{v_ty=(TRef ((RClass ("A")))); v_id=(norange, "a1"); v_init=(Iexp (Ctor((norange, "A"), [])))};
{v_ty=(TRef ((RArray ((TRef ((RClass ("A")))))))); v_id=(norange, "arr"); v_init=(Iexp ((New ((TRef ((RClass ("A")))), (Const (Cint (norange, 10l))), (norange, "i"), Ctor((norange, "A"), [])))))};
{v_ty=(TNullable ((RClass ("A")))); v_id=(norange, "a2"); v_init=(Iexp ((Const (Cnull (norange)))))};
], [IfNull((RClass ("A")), (norange, "x"), (LhsOrCall (Lhs (Var (norange, "a2")))), Block([], []), (Some (Block([], []))));
Cast("A", (norange, "v"), (LhsOrCall (Lhs (Var (norange, "a2")))), Block([], []), (Some (Block([], []))));
]), None));
]));

    ("parse3_parse", file_parse_test "parse3.oat" ([Gcdecl(("B", (Some ("A")), [((TRef ((RClass ("A")))), (norange, "a"));
((TRef ((RClass ("C")))), (norange, "c"));
], ([(TInt, (norange, "a"));
(TInt, (norange, "b"));
], [(LhsOrCall (Lhs (Var (norange, "a"))));
(LhsOrCall (Lhs (Var (norange, "b"))));
], [((norange, "a"), (Iexp (Ctor((norange, "A"), []))));
((norange, "c"), (Iexp (Ctor((norange, "C"), []))));
], ([], [Assign((Path (ThisId (norange, "i"))), (LhsOrCall (Call (SuperMethod ((norange, "f"), [])))));
])), []));
Gfdecl((None, (norange, "p"), [], ([{v_ty=(TRef ((RClass ("A")))); v_id=(norange, "a"); v_init=(Iexp (Ctor((norange, "A"), [])))};
{v_ty=TInt; v_id=(norange, "i"); v_init=(Iexp ((LhsOrCall (Lhs (Path (PathId ((Lhs (Var (norange, "a"))), (norange, "i"))))))))};
], [Assign((Var (norange, "i")), (LhsOrCall (Lhs (Path (PathId ((Lhs (Path (PathId ((Lhs (Var (norange, "b"))), (norange, "a"))))), (norange, "i")))))));
Assign((Var (norange, "i")), (LhsOrCall (Lhs (Path (PathId ((Lhs (Path (PathId ((Lhs (Path (PathId ((Lhs (Var (norange, "b"))), (norange, "c"))))), (norange, "a"))))), (norange, "i")))))));
Assign((Var (norange, "i")), (LhsOrCall (Call (PathMethod ((PathId ((Lhs (Var (norange, "a"))), (norange, "f"))), [])))));
Assign((Var (norange, "i")), (LhsOrCall (Call (PathMethod ((PathId ((Lhs (Path (PathId ((Lhs (Var (norange, "b"))), (norange, "a"))))), (norange, "f"))), [])))));
Assign((Var (norange, "i")), (LhsOrCall (Call (PathMethod ((PathId ((Lhs (Path (PathId ((Lhs (Path (PathId ((Lhs (Var (norange, "b"))), (norange, "c"))))), (norange, "a"))))), (norange, "f"))), [])))));
]), None));
]));

    ("parse4_parse", file_parse_test "parse4.oat" ([Gcdecl(("B", None, [], ([], [], [], ([], [Scall((PathMethod ((ThisId (norange, "f")), [])));
Scall((SuperMethod ((norange, "f"), [])));
Fail((Const (Cstring (norange, "abc"))));
Assign((Var (norange, "i")), (LhsOrCall (Call (PathMethod ((ThisId (norange, "f")), [])))));
Assign((Var (norange, "i")), (LhsOrCall (Call (SuperMethod ((norange, "f"), [])))));
])), []));
]));

    ("parse5_parse", file_parse_test "parse5.oat" ([Gcdecl(("Fields", None, [], ([], [], [], ([], [])), [((Some ((TRef ((RClass ("Fields")))))), (norange, "sumab"), [], ([], []), (Some ((This norange))));
]));
]));

    ("parse6_parse", file_parse_test "parse6.oat" ([Gvdecl({v_ty=(TRef ((RClass ("A")))); v_id=(norange, "a"); v_init=(Iexp ((LhsOrCall (Lhs (Path (PathId ((Call (PathMethod ((PathId ((Call (PathMethod ((PathId ((Lhs (Var (norange, "a"))), (norange, "f"))), []))), (norange, "g"))), []))), (norange, "d"))))))))});
Gfdecl(((Some (TInt)), (norange, "f"), [], ([], [Assign((Var (norange, "i")), (LhsOrCall (Lhs (Path (ThisId (norange, "a"))))));
Assign((Path (PathId ((Lhs (Path (ThisId (norange, "a")))), (norange, "b")))), (LhsOrCall (Call (PathMethod ((ThisId (norange, "f")), [])))));
Assign((Path (PathId ((Call (PathMethod ((PathId ((Lhs (Index ((Lhs (Path (ThisId (norange, "a")))), (Const (Cint (norange, 2l)))))), (norange, "f"))), []))), (norange, "b")))), (LhsOrCall (Call (PathMethod ((PathId ((Lhs (Index ((Call (PathMethod ((ThisId (norange, "f")), []))), (Const (Cint (norange, 6l)))))), (norange, "g"))), [])))));
Assign((Var (norange, "i")), (LhsOrCall (Call (SuperMethod ((norange, "f"), [])))));
Assign((Path (PathId ((Call (SuperMethod ((norange, "f"), []))), (norange, "a")))), (LhsOrCall (Lhs (Path (PathId ((Call (PathMethod ((PathId ((Call (SuperMethod ((norange, "f"), []))), (norange, "f"))), []))), (norange, "g")))))));
Assign((Path (PathId ((Lhs (Index ((Call (PathMethod ((PathId ((Lhs (Var (norange, "a"))), (norange, "f"))), []))), (Const (Cint (norange, 2l)))))), (norange, "b")))), (LhsOrCall (Call (PathMethod ((PathId ((Lhs (Var (norange, "a"))), (norange, "f"))), [])))));
]), (Some ((LhsOrCall (Lhs (Index ((Call (PathMethod ((PathId ((Call (PathMethod ((PathId ((Lhs (Var (norange, "a"))), (norange, "f"))), []))), (norange, "g"))), []))), (Const (Cint (norange, 3l)))))))))));
Gcdecl(("A", None, [(TInt, (norange, "a"));
], ([], [], [((norange, "a"), (Iexp ((Const (Cint (norange, 1l))))));
((norange, "b"), (Iexp ((Const (Cint (norange, 1l))))));
], ([], [])), []));
]));

  ]);

  GradedTest("Parse Error Tests", 0, [
    ("parse_err1_err", (file_parse_error_test "parse_err1.oat" (Failure "Parse error at parse_err1.oat:[1.6-1.7].")));
    ("parse_err2_err", (file_parse_error_test "parse_err2.oat" (Failure "Parse error at parse_err2.oat:[1.4-1.5].")));
    ("parse_err3_err", (file_parse_error_test "parse_err3.oat" (Failure "Parse error at parse_err3.oat:[2.0-2.1].")));
    ("parse_err4_err", (file_parse_error_test "parse_err4.oat" (Failure "Parse error at parse_err4.oat:[2.0-2.1].")));
    ("parse_err5_err", (file_parse_error_test "parse_err5.oat" (Failure "Parse error at parse_err5.oat:[2.10-2.11].")));
    ("parse_err6_err", (file_parse_error_test "parse_err6.oat" (Failure "Parse error at parse_err6.oat:[2.9-2.10].")));
    ("parse_err7_err", (file_parse_error_test "parse_err7.oat" (Failure "Parse error at parse_err7.oat:[2.2-2.5]."))); 
    ("parse_err8_err", (file_parse_error_test "parse_err8.oat" (Failure "Parse error at parse_err8.oat:[3.2-3.5].")));
    ("parse_err9_err", (file_parse_error_test "parse_err9.oat" (Failure "Parse error at parse_err9.oat:[2.13-2.14].")));
    ("parse_err10_err", (file_parse_error_test "parse_err10.oat" (Failure "Parse error at parse_err10.oat:[2.8-2.9].")));
    ("parse_err11_err", (file_parse_error_test "parse_err11.oat" (Failure "Parse error at parse_err11.oat:[2.2-2.5].")));
    ("parse_err12_err", (file_parse_error_test "parse_err12.oat" (Failure "Parse error at parse_err12.oat:[2.3-2.4].")));
    ("parse_err13_err", (file_parse_error_test "parse_err13.oat" (Failure "Parse error at parse_err13.oat:[2.2-2.3].")));
    ("tc24_err", (file_parse_error_test "tc24.oat" (Failure "Parse error at ./tests/tc24.oat:[2.8-2.14].")));
    ("tc25_err", (file_parse_error_test "tc25.oat" (Failure "Parse error at ./tests/tc25.oat:[2.8-2.11].")));
    ("tc28_err", (file_parse_error_test "tc28.oat" (Failure "Parse error at ./tests/tc28.oat:[2.9-2.10].")));
  ]);
]

let typechecking_tests : suite = [
  GradedTest("Typechecking tests", 20, [   
    ("tc5", (file_tc_ok_test "tc5.oat"));
    ("tc18", (file_tc_ok_test "tc18.oat"));
    ("tc29", (file_tc_ok_test "tc29.oat")); 
    ("tc30", (file_tc_ok_test "tc30.oat")); 
    ("tc32", (file_tc_ok_test "tc32.oat"));
    ("run45", (file_tc_ok_test "run45.oat"));
    ("tc_auto_upcast_args", (file_tc_ok_test "tc_auto_upcast_args.oat"));
    ("tc_auto_upcast_assignment", (file_tc_ok_test "tc_auto_upcast_assignment.oat"));
    ("tc_class_st_null_class", (file_tc_ok_test "tc_class_st_null_class.oat"));
    ("tc_class_st", (file_tc_ok_test "tc_class_st.oat"));
    ("tc_ifnull_array", (file_tc_ok_test "tc_ifnull_array.oat"));
    ("tc_ifnull_string", (file_tc_ok_test "tc_ifnull_string.oat"));
    ("tc_invoke_wider_child", (file_tc_ok_test "tc_invoke_wider_child.oat"));
    ("tc_join_classes_simple", (file_tc_ok_test "tc_join_classes_simple.oat"));
    ("tc_join_classes_tree", (file_tc_ok_test "tc_join_classes_tree.oat"));
    ("tc_join_null_simple", (file_tc_ok_test "tc_join_null_simple.oat"));
    ("tc_join_null_string", (file_tc_ok_test "tc_join_null_string.oat"));
    ("tc_join_null_tree", (file_tc_ok_test "tc_join_null_tree.oat"));
    ("tc_override_widen", (file_tc_ok_test "tc_override_widen.oat"));

    (* field *)
    ("tc7_err", (file_tc_error_test "tc7.oat" (Tc.TypeError "tc7.oat:[2.19-2.20]: i is not a field of this.")));
    ("tc8_err", (file_tc_error_test "tc8.oat" (Tc.TypeError "tc8.oat:[7.19-7.20]: i is not a field of this.")));
    ("tc9_err", (file_tc_error_test "tc9.oat" (Tc.TypeError "tc9.oat:[9.6-9.7]: i is not a field of A.")));
    ("tc10_err", (file_tc_error_test "tc10.oat" (Tc.TypeError "tc10.oat:[4.4-4.5]: This exp is not a class.")));
    ("tc16_err", (file_tc_error_test "tc16.oat" (Tc.TypeError "tc16.oat:[12.13-12.14]: This expression has type int but an expression was expected of type bool.")));
    (* method *)
    ("tc11_err", (file_tc_error_test "tc11.oat" (Tc.TypeError "tc11.oat:[4.4-4.5]: This exp is not a class.")));
    ("tc12_err", (file_tc_error_test "tc12.oat" (Tc.TypeError "tc12.oat:[5.6-5.7]: f is not a method of A.")));
    ("tc13_err", (file_tc_error_test "tc13.oat" (Tc.TypeError "tc13.oat:[3.9-3.10]: f is not a method of this.")));
    ("tc14_err", (file_tc_error_test "tc14.oat" (Tc.TypeError "tc14.oat:[3.18-3.19]: f is not a method of super.")));
    ("tc15_err", (file_tc_error_test "tc15.oat" (Tc.TypeError "tc15.oat:[12.10-12.11]: Smethod must return unit.")));
    (* subtyping *)
    ("tc17_err", (file_tc_error_test "tc17.oat" (Tc.TypeError "tc17.oat:[13.12-13.13]: This expression has type A but an expression was expected of type B.")));
    ("tc20_err", (file_tc_error_test "tc20.oat" (Tc.TypeError "tc20.oat:[9.10-9.11]: This expression has type A but an expression was expected of type B.")));
    ("tc21_err", (file_tc_error_test "tc21.oat" (Tc.TypeError "tc21.oat:[10.12-10.13]: This expression has type A but an expression was expected of type B.")));
    ("tc22_err", (file_tc_error_test "tc22.oat" (Tc.TypeError "tc22.oat:[11.10-11.11]: This expression has type A but an expression was expected of type B?.")));
    (* ctor *)
    ("tc19_err", (file_tc_error_test "tc19.oat" (Tc.TypeError "tc19.oat:[14.17-14.18]: This expression has type B but an expression was expected of type A.")));
    (* stmt *)
    ("tc23_err", (file_tc_error_test "tc23.oat" (Tc.TypeError "tc23.oat:[2.8-2.10]: Fail must be of type string.")));
    ("tc26_err", (file_tc_error_test "tc26.oat" (Tc.TypeError "tc26.oat:[5.18-5.19]: Cast exp must be a super type of A.")));
    ("tc27_err", (file_tc_error_test "tc27.oat" (Tc.TypeError "tc27.oat:[4.11-4.12]: x is not declared.")));
    (* wf types *)
    ("tc31_err", (file_tc_error_test "tc31.oat" (Tc.TypeError "tc31.oat:[3.4-3.5]: This expression has ill-formed type A.")));
    (* overload *)
    ("tc33_err", (file_tc_error_test "tc33.oat" (Tc.TypeError "tc33.oat:[10.7-10.8]: This expression has type (O1 )->unit but an expression was expected of type (O2 )->unit.")));
    ("tc34_err", (file_tc_error_test "tc34.oat" (Tc.TypeError "tc34.oat:[10.5-10.6]: This expression has type ()->O1 but an expression was expected of type ()->O2.")));
    ("tc35_err", (file_tc_error_test "tc35.oat" (Tc.TypeError "tc35.oat:[7.6-7.7]: Shadow parent class's variables.")));
    ("tc42_err", (file_tc_error_test "tc42.oat" (Tc.TypeError "tc42.oat:[18.6-18.7]: Shadow parent class's variables.")));
    (* cdecl *)
    ("tc36_err", (file_tc_error_test "tc36.oat" (Tc.TypeError "parent class is not defined: A")));
    ("tc37_err", (file_tc_error_test "tc37.oat" (Tc.TypeError "Super ctor has wrong number of args.")));
    ("tc38_err", (file_tc_error_test "tc38.oat" (Tc.TypeError "basic class should not call super ctor.")));
    ("tc39_err", (file_tc_error_test "tc39.oat" (Tc.TypeError "tc39.oat:[9.13-9.14]: This expression has type O1 but an expression was expected of type O2.")));
    ("tc40_err", (file_tc_error_test "tc40.oat" (Tc.TypeError "redeclaration of a class: A")));
    ("tc41_err", (file_tc_error_test "tc41.oat" (Tc.TypeError "parent class is not defined: A")));
    (* scope of this/super *)
    ("tc43_err", (file_tc_error_test "tc43.oat" (Tc.TypeError "tc43.oat:[7.15-7.16]: i is not in class.")));
    ("tc44_err", (file_tc_error_test "tc44.oat" (Tc.TypeError "tc44.oat:[3.24-3.25]: i is not in class.")));
    ("tc45_err", (file_tc_error_test "tc45.oat" (Tc.TypeError "tc45.oat:[8.25-8.26]: f is not in class.")));
    ("tc46_err", (file_tc_error_test "tc46.oat" (Tc.TypeError "tc46.oat:[7.16-7.17]: f is not in class.")));

    (* others *)
    ("tc_run44_err", file_tc_error_test "run44.oat" "run44.oat:[12.8-12.10]: == cannot take input type: (A?, bot).");
    ("tc1_err", (file_tc_error_test "tc1.oat" (Tc.TypeError "undeclared variable:i")));
    ("tc2_err", (file_tc_error_test "tc2.oat" (Tc.TypeError "Fdecl f is not defined.")));
    ("tc3_err", (file_tc_error_test "tc3.oat" (Tc.TypeError "tc3.oat:[14.12-14.39]: This expression has type A[] but an expression was expected of type B[].")));
    ("tc4_err", (file_tc_error_test "tc4.oat" (Tc.TypeError "tc4.oat:[10.12-10.30]: Types A and B cannot join.")));
    ("tc6_err", (file_tc_error_test "tc6.oat" (Tc.TypeError "tc6.oat:[12.8-12.10]: == cannot take input type: (A?, B).")));
    ("tc_bad_cast_string_object_err", (file_tc_error_test "tc_bad_cast_string_object.oat" (Tc.TypeError "tc_bad_cast_string_object.oat:[1.11-1.18]: This expression has type string but an expression was expected of type Object.")));
    ("tc_bad_downcast_args_err", (file_tc_error_test "tc_bad_downcast_args.oat" (Tc.TypeError "tc_bad_downcast_args.oat:[19.17-19.19]: This expression has type Aa but an expression was expected of type Aaa.")));
    ("tc_bad_downcast_assignment_err", (file_tc_error_test "tc_bad_downcast_assignment.oat" (Tc.TypeError "tc_bad_downcast_assignment.oat:[17.22-17.24]: This expression has type BB but an expression was expected of type BBB.")));
    ("tc_bad_join_arrays_err", (file_tc_error_test "tc_bad_join_arrays.oat" (Tc.TypeError "tc_bad_join_arrays.oat:[4.12-5.41]: Types B[] and A[] cannot join.")));
    ("tc_bad_join_string_object_err", (file_tc_error_test "tc_bad_join_string_object.oat" (Tc.TypeError "tc_bad_join_string_object.oat:[1.14-1.37]: Types string and Object cannot join.")));
    ("tc_bad_noninvariant_array_err", (file_tc_error_test "tc_bad_noninvariant_array.oat" (Tc.TypeError "tc_bad_noninvariant_array.oat:[18.18-18.36]: This expression has type Aa[] but an expression was expected of type Aaa[].")));
    ("tc_bad_null_class_st_class_err", (file_tc_error_test "tc_bad_null_class_st_class.oat" (Tc.TypeError "tc_bad_null_class_st_class.oat:[18.8-18.13]: This expression has type A? but an expression was expected of type A.")));
    ("tc_bad_override_arity_err", (file_tc_error_test "tc_bad_override_arity.oat" (Tc.TypeError "tc_bad_override_arity.oat:[7.6-7.9]: This expression has type (int )->int but an expression was expected of type (int , int )->int.")));
    ("tc_bad_override_narrow_err", (file_tc_error_test "tc_bad_override_narrow.oat" (Tc.TypeError "tc_bad_override_narrow.oat:[7.9-7.12]: This expression has type (string , int )->string but an expression was expected of type (string? , int )->string.")));
    ("tc_bad_override_return_err", (file_tc_error_test "tc_bad_override_return.oat" (Tc.TypeError "tc_bad_override_return.oat:[7.10-7.13]: This expression has type (int , int )->string? but an expression was expected of type (int , int )->string.")));
    ("tc_bad_parent_ctor_call_downcast_err", (file_tc_error_test "tc_bad_parent_ctor_call_downcast.oat" (Tc.TypeError "tc_bad_parent_ctor_call_downcast.oat:[6.24-6.25]: This expression has type string? but an expression was expected of type string.")));
    ("tc_bad_silly_cast_err", (file_tc_error_test "tc_bad_silly_cast.oat" (Tc.TypeError "tc_bad_silly_cast.oat:[17.19-17.21]: Cast exp must be a super type of BBB.")));

  ]);

]

(*** End-to-end tests ***)
let file_tests : suite = [
  GradedTest("Easy tests", 20, [  
    ("run1", file_test "run1.oat" "" "20");
    ("run2", file_test "run2.oat" "" "0");
    ("run3", file_test "run3.oat" "" "9");
    ("run42", file_test "run42.oat" "" "g0");
    ("run48", file_test "run48.oat" "" "0");
    (* ctor + field *)
      (* no args *)
    ("run4", file_test "run4.oat" "" "10");
    ("run5", file_test "run5.oat" "" "1");
    ("run6", file_test "run6.oat" "" "str0");
    ("run7", file_test "run7.oat" "" "nnnnnnnnnn0");
    ("simple", file_test "simple.oat" "" "A: x=30");
    ("thiscall", file_test "thiscall.oat" "" "3");
      (* with args *)
    ("run17", file_test "run17.oat" "" "10");
    ("run18", file_test "run18.oat" "" "cis3410");
    (* method *)
    ("run8", file_test "run8.oat" "" "1");
    ("run9", file_test "run9.oat" "" "hello0");
    ("run10", file_test "run10.oat" "" "nnnnn0");
    (* child reuses parent's ctor *)
      (* no args *)
    ("run13", file_test "run13.oat" "" "1");
    ("run14", file_test "run14.oat" "" "10");
    ("run15", file_test "run15.oat" "" "str0");
    ("run16", file_test "run16.oat" "" "nnnnnnnnnn0");
      (* with args *)
    ("run19", file_test "run19.oat" "" "cis3410");
    ("run20", file_test "run20.oat" "" "nnnnn0");
    (* child reuses parent's method *)
    ("run23", file_test "run23.oat" "" "A0");
    ("run24", file_test "run24.oat" "" "B0");
    (* override *)
    ("run25", file_test "run25.oat" "" "B0");
    (* super *)
    ("run26", file_test "run26.oat" "" "A0");
    (* if? *)
    ("run27", file_test "run27.oat" "" "null0");
    ("run28", file_test "run28.oat" "" "non-null0");
    (* cast *)
      (* in main *)
    ("run29", file_test "run29.oat" "" "no0");
    ("run30", file_test "run30.oat" "" "no1");
    ("run31", file_test "run31.oat" "" "yes2");
    ("run34", file_test "run34.oat" "" "no0");
    ("run33", file_test "run33.oat" "" "yes1");
    ("run32", file_test "run32.oat" "" "yes2");
    ("run35", file_test "run35.oat" "" "yes0");
    ("run36", file_test "run36.oat" "" "yes1");
    ("run37", file_test "run37.oat" "" "yes2");
      (* in function *)
    ("run39", file_test "run39.oat" "" "ABBCCC0");
    (* Fail *)
    ("run38", file_test "run38.oat" "" "failed");
    ("fail", file_test "fail.oat" "" "X is three!");
    (* accesing nested class *)
    ("run40", file_test "run40.oat" "" "CBA0");
    (* join *)
    ("run43", file_test "run43.oat" "" "0120");
    (* Class scope *)
    ("run45", file_test "run45.oat" "" "10");
    ("run49", file_test "run49.oat" "" "BA0");
    ("run51", file_test "run51.oat" "" "ABCC0");
    (* path *)
    ("run46", file_test "run46.oat" "" "205");
    (* header *)
    ("run47", file_test "run47.oat" "" "AAAA0"); 
    (* class name *)
    ("run50", file_test "run50.oat" "" "ObjectABCDEFG0")

  ]);

  GradedTest("Medium tests", 20, [

    ("cg_ctor_arguments_available_to_super", file_test "cg_ctor_arguments_available_to_super.oat" "" "12");
    ("cg_eval_cast_onestep_fail", file_test "cg_eval_cast_onestep_fail.oat" "" "21");
    ("cg_eval_cast_threestep_fail", file_test "cg_eval_cast_threestep_fail.oat" "" "21");
    ("cg_eval_cast_threestep_ok", file_test "cg_eval_cast_threestep_ok.oat" "" "12");
    ("cg_eval_ifnull_notnull_int", file_test "cg_eval_ifnull_notnull_int.oat" "" "11");
    ("cg_eval_ifnull_null_unit", file_test "cg_eval_ifnull_null_unit.oat" "" "12");
    ("cg_eval_imm_override_dispatch", file_test "cg_eval_imm_override_dispatch.oat" "" "5");
    ("cg_eval_mid_override_dispatch", file_test "cg_eval_mid_override_dispatch.oat" "" "5");
    ("cg_eval_nonoverride_dispatch", file_test "cg_eval_nonoverride_dispatch.oat" "" "11");
    ("cg_eval_super", file_test "cg_eval_super.oat" "" "9");
    ("cg_eval_this_imm_override_dispatch", file_test "cg_eval_this_imm_override_dispatch.oat" "" "5");
    ("cg_eval_this_mid_override_dispatch", file_test "cg_eval_this_mid_override_dispatch.oat" "" "5");
    ("cg_eval_this_nonoverride_dispatch", file_test "cg_eval_this_nonoverride_dispatch.oat" "" "11");
    ("dynamic", file_test "dynamic.oat" "" "hoot!42");
    ("fields", file_test "fields.oat" "" "13");
    ("inherit", file_test "inherit.oat" "" "A: x=3B: x=1B: y=2B: z=3C: x=1C: y=2C: z=3C: w=4C.foo: a=1C.foo: b=20");
    ("nullcheck", file_test "nullcheck.oat" "" "42");
    ("point", file_test "point.oat" "" "3");
    ("runtimecast", file_test "runtimecast.oat" "" "9");
    ("super", file_test "super.oat" "" "6");
    ("super2", file_test "super2.oat" "" "C6");
    ("provided_abc", file_test "provided_abc.oat" "" "0");
    ("provided_cast", file_test "provided_cast.oat" "" "BbBmakes sense.makes sense.3");
    ("provided_notnull", file_test "provided_notnull.oat" "" "hello40");

  ]);

  GradedTest("Hard tests", 10, [
    ("3d_array", file_test "3d_array.oat" "" "62");
    ("avltreetest", file_test "avltreetest.oat" "" "41");
    ("bsttest", file_test "bsttest.oat" "" "110");
    ("listtest", file_test "listtest.oat" "" "98765432109765432100");
    ("stacktest", file_test "stacktest.oat" "" "120");
    ("pokemon", file_test "pokemon.oat" "" "54232454232454232454232454260");
    ("provided_description_demo", file_test "provided_description_demo.oat" "" "arfmooThis dog is stray!0");
    ("selectionsort", file_test "selectionsort.oat" "" "0");
  ]);

  GradedTest("Runtime error tests", 10, [

    (* parent *)
    ("run11", file_error_test "run11.oat" "" "Uninitialized non-null vars.");
    ("run12", file_error_test "run12.oat" "" "Uninitialized non-null vars.");
    ("run41", file_error_test "run41.oat" "" "Uninitialized non-null vars.");
    (* child *)
    ("run21", file_error_test "run21.oat" "" "Uninitialized non-null vars.");
    ("run22", file_error_test "run22.oat" "" "Uninitialized non-null vars.");
    (* others *)
    ("cg_check_refs_all_nonnull", file_error_test "cg_check_refs_all_nonnull.oat" "" "Uninitialized non-null vars.");
    ("cg_check_refs_null_nonnull_mix", file_error_test "cg_check_refs_null_nonnull_mix.oat" "" "Uninitialized non-null vars.");

  ]);
 
  GradedTest("Stress tests (hidden)", 10, [
  
  ]);
 
]


let manual_tests : suite = [
  GradedTest ("StyleManual", 10, [
  
  ]);
]

let graded_tests : suite = 
  
  typechecking_tests @
  file_tests @
  manual_tests
