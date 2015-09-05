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

let file_test 
  (fn:string) (args:string) (ans:string) () : unit =
  let path = !test_path ^ fn in
  let buffer = open_in path in
  let prog = Astlib.parse fn (Lexing.from_channel buffer) in
  let _ = close_in buffer in
    comp_test fn prog args ans ()

let file_error_test 
  (fn:string) (args:string) () : unit =
  let path = !test_path ^ fn in
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
    else failwithf  "bad of \"%s\"" fn

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

let file_tc_error_test (fn:string) () : unit =
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
  Test("Parse Tests", [

    ("easy_p1_parse", file_parse_test "easy_p1.oat" ([Gfdecl(((Some (TInt)), (norange, "f"), [], ([], []), (Some ((Const (Cint (norange, 0l)))))));
    ]));

    ("easy_p2_parse", file_parse_test "easy_p2.oat" ([Gfdecl(((Some (TInt)), (norange, "f"), [(TInt, (norange, "x"));
    ], ([{v_ty=TInt; v_id=(norange, "x"); v_init=(Iexp ((Const (Cint (norange, 0l)))))};
    ], [Assign((Var (norange, "x")), (Binop (IOr norange,(Binop (Shl norange,(Binop (Sar norange,(Binop (Minus norange,(Binop (Plus norange,(Lhs (Var (norange, "x"))),(Lhs (Var (norange, "x"))))),(Binop (Times norange,(Lhs (Var (norange, "x"))),(Lhs (Var (norange, "x"))))))),(Lhs (Var (norange, "x"))))),(Lhs (Var (norange, "x"))))),(Binop (IAnd norange,(Lhs (Var (norange, "x"))),(Binop (Shr norange,(Unop (Neg norange,(Unop (Not norange,(Lhs (Var (norange, "x"))))))),(Lhs (Var (norange, "x"))))))))));
    ]), (Some ((Lhs (Var (norange, "x")))))));
    ]));

    ("easy_p3_parse", file_parse_test "easy_p3.oat" ([Gfdecl(((Some (TString)), (norange, "bar"), [(TInt, (norange, "x"));
    (TString, (norange, "y"));
    ], ([{v_ty=TString; v_id=(norange, "s"); v_init=(Iexp ((Const (Cstring (norange, "This is a string")))))};
    {v_ty=(TArray (TInt)); v_id=(norange, "array"); v_init=(Iarray (norange, [(Iexp ((Const (Cint (norange, 1l))))); (Iexp ((Const (Cint (norange, 3l))))); ]))};
    {v_ty=TInt; v_id=(norange, "y"); v_init=(Iexp ((Lhs (Index ((Var (norange, "array")), (Const (Cint (norange, 0l))))))))};
    ], []), (Some ((Lhs (Var (norange, "s")))))));
    Gfdecl((None, (norange, "proc1"), [], ([], [Scall((norange, "proc2"), []);
    ]), None));
    Gfdecl((None, (norange, "proc2"), [], ([], [Scall((norange, "proc1"), []);
    ]), None));
    Gfdecl(((Some (TBool)), (norange, "foo"), [(TInt, (norange, "x"));
    ((TArray (TInt)), (norange, "y"));
    ], ([{v_ty=TString; v_id=(norange, "s"); v_init=(Iexp (Ecall((norange, "bar"), [(Lhs (Var (norange, "x"))); (Const (Cstring (norange, "cis341"))); ])))};
    ], [Scall((norange, "proc1"), []);
    ]), (Some ((Const (Cbool (norange, true)))))));
    ]));

    ("easy_p4_parse", file_parse_test "easy_p4.oat" ([Gfdecl(((Some (TString)), (norange, "f"), [], ([{v_ty=(TArray ((TArray (TString)))); v_id=(norange, "s"); v_init=(Iarray (norange, [(Iarray (norange, [(Iexp ((Const (Cstring (norange, "s00:\n+\n=2*\n"))))); (Iexp ((Const (Cstring (norange, "s01:this is not a comment in string.*"))))); (Iexp ((Const (Cstring (norange, "s02:\"\\t\\n\\\\?\""))))); ])); (Iarray (norange, [(Iexp ((Const (Cstring (norange, "s10:\133\134"))))); (Iexp ((Const (Cstring (norange, "s11"))))); (Iexp ((Const (Cstring (norange, "s12"))))); ])); ]))};
    ], []), (Some ((Lhs (Index ((Index ((Var (norange, "s")), (Const (Cint (norange, 0l))))), (Const (Cint (norange, 1l))))))))));
    Gfdecl(((Some ((TArray ((TArray (TInt)))))), (norange, "g"), [((TArray ((TArray (TInt)))), (norange, "x"));
    ], ([{v_ty=(TArray ((TArray (TInt)))); v_id=(norange, "y"); v_init=(Iarray (norange, [(Iarray (norange, [(Iexp ((Const (Cint (norange, 0l))))); (Iexp ((Const (Cint (norange, 1l))))); ])); (Iarray (norange, [(Iexp ((Const (Cint (norange, 2l))))); (Iexp ((Const (Cint (norange, 3l))))); ])); ]))};
    {v_ty=TInt; v_id=(norange, "i"); v_init=(Iexp ((Const (Cint (norange, 0l)))))};
    ], [Assign((Index ((Index ((Var (norange, "x")), (Const (Cint (norange, 0l))))), (Const (Cint (norange, 0l))))), (Binop (Plus norange,(Lhs (Var (norange, "i"))),(Lhs (Index ((Index ((Var (norange, "y")), (Const (Cint (norange, 1l))))), (Const (Cint (norange, 1l)))))))));
    Assign((Var (norange, "i")), (Unop (Neg norange,(Unop (Lognot norange,(Unop (Not norange,(Lhs (Index ((Index ((Var (norange, "x")), (Const (Cint (norange, 0l))))), (Const (Cint (norange, 0l)))))))))))));
    ]), (Some ((Lhs (Var (norange, "x")))))));
    ]));

    ("easy_p5_parse", file_parse_test "easy_p5.oat" ([Gvdecl({v_ty=TInt; v_id=(norange, "i"); v_init=(Iexp ((Const (Cint (norange, 19l)))))});
    Gvdecl({v_ty=TBool; v_id=(norange, "b1"); v_init=(Iexp ((Const (Cbool (norange, true)))))});
    Gvdecl({v_ty=TBool; v_id=(norange, "b2"); v_init=(Iexp ((Const (Cbool (norange, false)))))});
    Gvdecl({v_ty=TString; v_id=(norange, "str"); v_init=(Iexp ((Const (Cstring (norange, "This is a string!")))))});
    Gvdecl({v_ty=(TArray (TInt)); v_id=(norange, "arr1"); v_init=(Iarray (norange, [(Iexp ((Const (Cint (norange, 0l))))); (Iexp ((Const (Cint (norange, 1l))))); (Iexp ((Const (Cint (norange, 2l))))); ]))});
    Gvdecl({v_ty=(TArray ((TArray (TInt)))); v_id=(norange, "arr2"); v_init=(Iarray (norange, [(Iarray (norange, [(Iexp ((Const (Cint (norange, 10l))))); (Iexp ((Const (Cint (norange, 11l))))); ])); (Iarray (norange, [(Iexp ((Const (Cint (norange, 20l))))); (Iexp ((Const (Cint (norange, 21l))))); ])); (Iarray (norange, [(Iexp ((Const (Cint (norange, 30l))))); (Iexp ((Const (Cint (norange, 31l))))); ])); ]))});
    Gvdecl({v_ty=(TArray (TString)); v_id=(norange, "arr3"); v_init=(Iarray (norange, [(Iexp ((Const (Cstring (norange, "String1"))))); (Iexp ((Const (Cstring (norange, "String2"))))); (Iexp ((Const (Cstring (norange, "String3"))))); ]))});
    Gvdecl({v_ty=(TArray ((TArray (TString)))); v_id=(norange, "arr4"); v_init=(Iarray (norange, [(Iarray (norange, [(Iexp ((Const (Cstring (norange, "String00"))))); (Iexp ((Const (Cstring (norange, "String01"))))); ])); (Iarray (norange, [(Iexp ((Const (Cstring (norange, "String10"))))); (Iexp ((Const (Cstring (norange, "String11"))))); ])); (Iarray (norange, [(Iexp ((Const (Cstring (norange, "String20"))))); (Iexp ((Const (Cstring (norange, "String21"))))); ])); ]))});
    ]));

    ("easy_p6_parse", file_parse_test "easy_p6.oat" ([Gvdecl({v_ty=TInt; v_id=(norange, "y"); v_init=(Iexp ((Const (Cint (norange, 0l)))))});
    Gvdecl({v_ty=TInt; v_id=(norange, "z"); v_init=(Iexp ((Const (Cint (norange, 0l)))))});
    Gfdecl((None, (norange, "f"), [(TInt, (norange, "x"));
    (TInt, (norange, "y"));
    ], ([{v_ty=TInt; v_id=(norange, "x"); v_init=(Iexp ((Const (Cint (norange, 0l)))))};
    ], []), None));
    Gfdecl((None, (norange, "g"), [(TInt, (norange, "x"));
    (TInt, (norange, "y"));
    ], ([{v_ty=TInt; v_id=(norange, "z"); v_init=(Iexp ((Const (Cint (norange, 0l)))))};
    ], []), None));
    ]));

    ("easy_p7_parse", file_parse_test "easy_p7.oat" ([Gvdecl({v_ty=(TArray (TInt)); v_id=(norange, "i"); v_init=(Iexp ((New (TInt,(Const (Cint (norange, 4l))), (norange, "i"), (Const (Cint (norange, 0l)))))))});
Gvdecl({v_ty=(TArray (TInt)); v_id=(norange, "j"); v_init=(Iarray (norange, [(Iexp ((Unop (Neg norange,(Const (Cint (norange, 1l))))))); (Iexp ((Const (Cint (norange, 2l))))); (Iexp ((Binop (Plus norange,(Const (Cint (norange, 3l))),(Const (Cint (norange, 4l))))))); ]))});
Gfdecl(((Some ((TArray (TInt)))), (norange, "f"), [], ([{v_ty=(TArray ((TArray (TInt)))); v_id=(norange, "a"); v_init=(Iarray (norange, [(Iexp (Ecall((norange, "f"), []))); (Iexp (Ecall((norange, "f"), []))); ]))};
{v_ty=(TArray (TInt)); v_id=(norange, "arr1"); v_init=(Iexp ((New (TInt,(Const (Cint (norange, 3l))), (norange, "i"), (Const (Cint (norange, 0l)))))))};
{v_ty=(TArray ((TArray (TInt)))); v_id=(norange, "arr2"); v_init=(Iexp ((New (TArray TInt, (Const (Cint (norange, 3l))), (norange, "i"), (New (TInt,(Const (Cint (norange, 2l))), (norange, "i"), (Const (Cint (norange, 0l)))))))))};
], []), (Some ((New (TInt,(Const (Cint (norange, 2l))), (norange, "i"), (Const (Cint (norange, 0l)))))))));
]));

    ("run18_parse", file_parse_test "run18.oat" ([Gfdecl(((Some (TInt)), (norange, "program"), [(TInt, (norange, "argc"));
    ((TArray (TString)), (norange, "argv"));
    ], ([{v_ty=(TArray (TInt)); v_id=(norange, "a"); v_init=(Iarray (norange, [(Iexp ((Unop (Neg norange,(Const (Cint (norange, 1l))))))); (Iexp ((Unop (Neg norange,(Const (Cint (norange, 100l))))))); (Iexp ((Unop (Neg norange,(Const (Cint (norange, 999l))))))); ]))};
    ], []), (Some ((Lhs (Index ((Var (norange, "a")), (Const (Cint (norange, 2l))))))))));
    ]));

    ("run19_parse", file_parse_test "run19.oat" ([Gfdecl(((Some (TInt)), (norange, "program"), [(TInt, (norange, "argc"));
    ((TArray (TString)), (norange, "argv"));
    ], ([{v_ty=TInt; v_id=(norange, "i"); v_init=(Iexp ((Const (Cint (norange, 999l)))))};
    {v_ty=(TArray (TInt)); v_id=(norange, "a"); v_init=(Iarray (norange, [(Iexp ((Unop (Neg norange,(Const (Cint (norange, 1l))))))); (Iexp ((Unop (Neg norange,(Const (Cint (norange, 100l))))))); (Iexp ((Lhs (Var (norange, "i"))))); ]))};
    ], []), (Some ((Lhs (Index ((Var (norange, "a")), (Const (Cint (norange, 2l))))))))));
    ]));

    ("run20_parse", file_parse_test "run20.oat" ([Gfdecl(((Some (TInt)), (norange, "f"), [], ([], []), (Some ((Const (Cint (norange, 19l)))))));
    Gfdecl(((Some (TInt)), (norange, "program"), [(TInt, (norange, "argc"));
    ((TArray (TString)), (norange, "argv"));
    ], ([{v_ty=(TArray (TInt)); v_id=(norange, "a"); v_init=(Iarray (norange, [(Iexp ((Unop (Neg norange,(Const (Cint (norange, 1l))))))); (Iexp ((Unop (Neg norange,(Const (Cint (norange, 100l))))))); (Iexp (Ecall((norange, "f"), []))); ]))};
    ], []), (Some ((Lhs (Index ((Var (norange, "a")), (Const (Cint (norange, 2l))))))))));
    ]));

  ]);

  Test("Parse Error Tests", [

    ("error6_err", (file_parse_error_test "error6.oat" (Failure "Parse error at error6.oat:[3.0-3.5].")));
    ("error10_err", (file_parse_error_test "error10.oat" (Failure "Parse error at error10.oat:[2.16-2.17].")));

  ]);
]

let typechecking_tests : suite = [
  GradedTest("Typechecking error tests", 15, 
	     List.map (fun name -> (name, (file_tc_error_test (name^".oat"))))
	       [   
		 "error1";
		 "error2";
		 "error3";
		 "error4";
		 "error5";
		 "error7";
		 "error11";
		 "tc1";
		 "tc2";
		 "tc3";
		 "tc4";
		 "tc5";
		 "tc6";
		 "tc7";
		 "tc8";
		 "tc9";
		 "tc10";
		 "tc11";
		 "tc12";
		 "tc13";
		 "tc14";
		 "tc15";
		 "tc17";
		 "tc18";
		 "tc19";
		 "tc20";
		 "tc_ok3";	       
		 "run51";
	       ]);

  GradedTest("Typechecking correctness tests", 15, 
	     List.map (fun name -> (name, file_tc_ok_test (name^".oat")))
	       [
		 "tc_ok1";	       
		 "tc_ok2";	       
		 "tc_ok4";	       
		 "tc_ok5";	       
		 "tc_ok6";	       
		 "tc_ok7";	       
		 "tc_ok8";	       
	       ]);
]

(*** End-to-end tests ***)
let file_tests : suite = [
  GradedTest("Easy tests", 10, [  
    ("run26", file_test "run26.oat" "" "0");
    ("run27", file_test "run27.oat" "" "99");
    ("run28", file_test "run28.oat" "" "18");
    ("run29", file_test "run29.oat" "" "1");
    ("run30", file_test "run30.oat" "" "9");
    ("run31", file_test "run31.oat" "" "9");
    ("run13", file_test "run13.oat" "" "1");
    ("run32", file_test "run32.oat" "" "34");
    ("run18", file_test "run18.oat" "" "-999");
    ("run19", file_test "run19.oat" "" "999");
    ("run20", file_test "run20.oat" "" "19");
    ("run21", file_test "run21.oat" "" "99");
    ("run24", file_test "run24.oat" "" "24");
    ("run33", file_test "run33.oat" "" "1");
    ("run34", file_test "run34.oat" "" "66");
    ("run35", file_test "run35.oat" "" "66");
    ("run38", file_test "run38.oat" "" "31");
    ("run39", file_test "run39.oat" "a" "2");
    ("run40", file_test "run40.oat" "" "8");
    ("run41", file_test "run41.oat" "" "3");
    ("run42", file_test "run42.oat" "" "2");
    ("run49", file_test "run49.oat" "" "abc0");
    ("run50", file_test "run50.oat" "" "abcde0");
    ("run52", file_test "run52.oat" "" "11");
    ("run60", file_test "run60.oat" "" "341");
    ("run61", file_test "run61.oat" "" "3410");

  ]);

  GradedTest("Medium tests", 10, [
    ("run1", file_test "run1.oat" "" "153");
    ("run2", file_test "run2.oat" "" "6");
    ("run3", file_test "run3.oat" "" "2");
    ("run5", file_test "run5.oat" "" "4");
    ("run8", file_test "run8.oat" "" "2");
    ("run9", file_test "run9.oat" "" "4");
    ("run10", file_test "run10.oat" "" "5");
    ("run11", file_test "run11.oat" "" "7");
    ("run14", file_test "run14.oat" "" "16");
    ("run15", file_test "run15.oat" "" "19");
    ("run16", file_test "run16.oat" "" "13");
    ("run22", file_test "run22.oat" "" "abc0");
    ("run23", file_test "run23.oat" "" "1230");
    ("run25", file_test "run25.oat" "" "nnn0");
    ("run43", file_test "run43.oat" "" "42");
    ("run44", file_test "run44.oat" "" "hello0");
    ("run45", file_test "run45.oat" "" "420");
    ("run46", file_test "run46.oat" "" "420");
    ("run47", file_test "run47.oat" "" "3");
    ("run48", file_test "run48.oat" "" "11");
    ("lib1", file_test "lib1.oat" "" "3");
    ("lib2", file_test "lib2.oat" "" "2");
    ("lib3", file_test "lib3.oat" "" "4");
    ("lib4", file_test "lib4.oat" "" "532");
    ("lib5", file_test "lib5.oat" "" "532");
    ("lib6", file_test "lib6.oat" "" "565");
    ("lib7", file_test "lib7.oat" "" "565");
    ("lib8", file_test "lib8.oat" "" "Hello world!\n0");
    ("lib9", file_test "lib9.oat" "a b c d" "abcd5");
    ("lib10", file_test "lib10.oat" "" "6");
    ("lib11", file_test "lib11.oat" "" "45");
    ("lib14", file_test "lib14.oat" "" "~}|{zyxwvu0");
    ("lib15", file_test "lib15.oat" "123456789" "456780");
  ]);

  GradedTest("Hard tests", 10, [
    ("fac", file_test "fac.oat" "" "120");
    ("qsort", file_test "qsort.oat" "" "\nkpyf{shom\nfhkmopsy{\n255");
    ("bsort", file_test "bsort.oat" "" "y}xotnuw notuwxy}-1");
    ("msort", file_test "msort.oat" "" "~}|{zyxwvu uvwxyz{|}~ 0");
    ("msort2", file_test "msort2.oat" "" "~}|{zyxwvu uvwxyz{|}~ 0");
    ("hsort", file_test "hsort.oat" "" "0");
    ("stoogesort", file_test "stoogesort.oat" "" "-2435-63177-5759-3100");
    ("selectionsort", file_test "selectionsort.oat" "" "01253065992000");
    ("matrixmult", file_test "matrixmult.oat" "" 
       "19 16 13 23 \n5 6 7 6 \n19 16 13 23 \n5 6 7 6 \n0");

  ]);

  GradedTest("Runtime error tests", 20, [
    ("run4", file_test  "run4.oat" "" "Array bounds violation: bound = 2 index = 2.");
    ("run6", file_test  "run6.oat" "" "Array bounds violation: bound = 2 index = 3.");
    ("run7", file_test  "run7.oat" "" "Array bounds violation: bound = 2 index = 3.");
    ("run17", file_test "run17.oat" "" "Array bounds violation: bound = 3 index = 3.");
    ("run36", file_test "run36.oat" "" "Array bounds violation: bound = 2 index = -1.");
    ("run37", file_test "run37.oat" "" "Array bounds violation: bound = 2 index = 3.");
    ("lib15", file_test "lib15.oat" "" "Array bounds violation: bound = 1 index = 1.");
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
