open Assert
open X86
open Ast

(* Do NOT modify this file -- we will overwrite it with our *)
(* own version when we test your project.                   *)

let test_path = ref "tests/"

(* These tests will be used to grade your assignment *)

let assert_bool (s:string) (b:bool) : unit =
  if b then () else failwith s

let ast_test (s:string) (a:Ast.exp) () : unit =
  let ast = Compiler.parse "ast_test" (Lexing.from_string s) in
    if ast = a then () else failwith (Printf.sprintf "bad parse of \"%s\"" s)

let parse_error_test (s:string) (expected:exn) () : unit =
  try 
    let _ = Compiler.parse "stdin" (Lexing.from_string s) in
      failwith (Printf.sprintf "String \"%s\" should not parse." s)
  with
    | e -> if e = expected then () else
	failwith (Printf.sprintf "Lexing/Parsing \"%s\" raised the wrong exception." s)

let comp_test (arg:int) (e:Ast.exp) (ans:int) () : unit =
  let _ = if (!Platform.verbose_on) then
    Printf.printf "compiling: %s\n" (Ast.string_of_exp e)
  else (print_char '.'; flush stdout) in
  let tmp_dot_s = Platform.gen_name (!Platform.obj_path) "tmp" ".s" in
  let tmp_dot_o = Platform.gen_name (!Platform.obj_path) "tmp" ".o" in
  let tmp_exe   = Platform.gen_name (!Platform.bin_path) "tmp" (Platform.executable_exn) in
  let tmp_out   = tmp_exe ^ ".out" in
  let _ = if (!Platform.verbose_on) then
    Printf.printf "* TMP FILES:\n*  %s\n*  %s\n*  %s\n" tmp_dot_s tmp_dot_o tmp_exe 
  else () in
  let cu = Compiler.compile_exp e in
  let fout = open_out tmp_dot_s in
    begin
      Cunit.output_cunit cu fout;
      close_out fout;
      Platform.assemble tmp_dot_s tmp_dot_o;
      Platform.link [tmp_dot_o] tmp_exe;
      try 
	let _ = Platform.run_executable_to_tmpfile arg tmp_exe tmp_out in
	let fi = open_in tmp_out in
	let result = int_of_string (input_line fi) in
	let _ = close_in fi in
	  if result = ans then ()
	  else failwith (Printf.sprintf "Program output %d expected %d" result ans)
      with
	| Platform.AsmLinkError(s1, s2) -> failwith (Printf.sprintf "%s\n%s" s1 s2)
    end


(*** Parsing Tests ***)
let easy_parsing_tests : suite = [
GradedTest("EasyParsing", 15, [
(* X *)
("easy_parse0", (ast_test "X" Arg));

(* X + 1 *)
("easy_parse1", (ast_test "X + 1" (Binop (Plus,Arg,(Cint 1l)))));

(* X + X *)
("easy_parse2", (ast_test "X + X" (Binop (Plus,Arg,Arg))));

(* X * 27 *)
("easy_parse3", (ast_test "X * 27" (Binop (Times,Arg,(Cint 27l)))));

(* 27 * X *)
("easy_parse4", (ast_test "27 * X" (Binop (Times,(Cint 27l),Arg))));

(* X | X *)
("easy_parse5", (ast_test "X | X" (Binop (Or,Arg,Arg))));

(* 341 *)
("easy_parse6", (ast_test "341" (Cint 341l)));

(* 17 >> X *)
("easy_parse7", (ast_test "17 >> X" (Binop (Sar,(Cint 17l),Arg))));

(* 17 << X *)
("easy_parse8", (ast_test "17 << X" (Binop (Shl,(Cint 17l),Arg))));

(* 17 & X *)
("easy_parse9", (ast_test "17 & X" (Binop (And,(Cint 17l),Arg))));

(* 17 | X *)
("easy_parse10", (ast_test "17 | X" (Binop (Or,(Cint 17l),Arg))));

(* 17 & !X *)
("easy_parse11", (ast_test "17 & !X" (Binop (And,(Cint 17l),(Unop (Lognot,Arg))))));

(* 17 | !X *)
("easy_parse12", (ast_test "17 | !X" (Binop (Or,(Cint 17l),(Unop (Lognot,Arg))))));

(* 17 - X *)
("easy_parse13", (ast_test "17 - X" (Binop (Minus,(Cint 17l),Arg))));

(* -17 *)
("easy_parse14", (ast_test "-17" (Unop (Neg,(Cint 17l)))));

(* X > 4 *)
("easy_parse16", (ast_test "X > 4" (Binop (Gt,Arg,(Cint 4l)))));

(* X < 4 *)
("easy_parse17", (ast_test "X < 4" (Binop (Lt,Arg,(Cint 4l)))));

(* X <= 4 *)
("easy_parse18", (ast_test "X <= 4" (Binop (Lte,Arg,(Cint 4l)))));

(* X >= 4 *)
("easy_parse19", (ast_test "X >= 4" (Binop (Gte,Arg,(Cint 4l)))));

(* X == X *)
("easy_parse20", (ast_test "X == X" (Binop (Eq,Arg,Arg))));

(* X != X *)
("easy_parse21", (ast_test "X != X" (Binop (Neq,Arg,Arg))));

(* ~X *)
("easy_parse22", (ast_test "~X" (Unop (Not,Arg))));

(* !X *)
("easy_parse23", (ast_test "!X" (Unop (Lognot,Arg))));

(* 341 >>> X *)
("easy_parse25", (ast_test "341 >>> X" (Binop (Shr,(Cint 341l),Arg))));

]);
]

(*** Compiling Tests ***)
let easy_compiling_tests : suite = [
GradedTest("EasyCompiling", 15, [
(* X *)
("easy_compile0", (comp_test 3 Arg 3));

(* X + 1 *)
("easy_compile1", (comp_test 3 (Binop (Plus,Arg,(Cint 1l))) 4));

(* X + X *)
("easy_compile2", (comp_test 3 (Binop (Plus,Arg,Arg)) 6));

(* X * 27 *)
("easy_compile3", (comp_test 3 (Binop (Times,Arg,(Cint 27l))) 81));

(* 27 * X *)
("easy_compile4", (comp_test 3 (Binop (Times,(Cint 27l),Arg)) 81));

(* X | X *)
("easy_compile5", (comp_test 3 (Binop (Or,Arg,Arg)) 3));

(* 341 *)
("easy_compile6", (comp_test 3 (Cint 341l) 341));

(* 17 >> X *)
("easy_compile7", (comp_test 3 (Binop (Sar,(Cint 17l),Arg)) 2));

(* 17 << X *)
("easy_compile8", (comp_test 3 (Binop (Shl,(Cint 17l),Arg)) 136));

(* 17 & X *)
("easy_compile9", (comp_test 3 (Binop (And,(Cint 17l),Arg)) 1));

(* 17 | X *)
("easy_compile10", (comp_test 3 (Binop (Or,(Cint 17l),Arg)) 19));

(* 17 & !X *)
("easy_compile11", (comp_test 3 (Binop (And,(Cint 17l),(Unop (Lognot,Arg)))) 0));

(* 17 | !X *)
("easy_compile12", (comp_test 3 (Binop (Or,(Cint 17l),(Unop (Lognot,Arg)))) 17));

(* 17 - X *)
("easy_compile13", (comp_test 3 (Binop (Minus,(Cint 17l),Arg)) 14));

(* -17 *)
("easy_compile14", (comp_test 3 (Unop (Neg,(Cint 17l))) (-17)));

(* X > 4 *)
("easy_compile16", (comp_test 3 (Binop (Gt,Arg,(Cint 4l))) 0));

(* X < 4 *)
("easy_compile17", (comp_test 3 (Binop (Lt,Arg,(Cint 4l))) 1));

(* X <= 4 *)
("easy_compile18", (comp_test 3 (Binop (Lte,Arg,(Cint 4l))) 1));

(* X >= 4 *)
("easy_compile19", (comp_test 3 (Binop (Gte,Arg,(Cint 4l))) 0));

(* X == X *)
("easy_compile20", (comp_test 3 (Binop (Eq,Arg,Arg)) 1));

(* X != X *)
("easy_compile21", (comp_test 3 (Binop (Neq,Arg,Arg)) 0));

(* ~X *)
("easy_compile22", (comp_test 3 (Unop (Not,Arg)) (-4)));

(* !X *)
("easy_compile23", (comp_test 3 (Unop (Lognot,Arg)) 0));

(* 341 >>> X *)
("easy_compile25", (comp_test 3 (Binop (Shr,(Cint 341l),Arg)) 42));

]);
]

let med_parsing_tests : suite = [
GradedTest("MediumParsing", 7, [
(* X + X + X *)
("med_parse0", (ast_test "X + X + X" (Binop (Plus,(Binop (Plus,Arg,Arg)),Arg))));

(* X * X * X *)
("med_parse1", (ast_test "X * X * X" (Binop (Times,(Binop (Times,Arg,Arg)),Arg))));

(* X + X * X *)
("med_parse2", (ast_test "X + X * X" (Binop (Plus,Arg,(Binop (Times,Arg,Arg))))));

(* X * X + X *)
("med_parse3", (ast_test "X * X + X" (Binop (Plus,(Binop (Times,Arg,Arg)),Arg))));

(* X * (X + X) *)
("med_parse4", (ast_test "X * (X + X)" (Binop (Times,Arg,(Binop (Plus,Arg,Arg))))));

(* (X + X) * X *)
("med_parse5", (ast_test "(X + X) * X" (Binop (Times,(Binop (Plus,Arg,Arg)),Arg))));

(* (X) *)
("med_parse6", (ast_test "(X)" Arg));

(* ((X)) *)
("med_parse7", (ast_test "((X))" Arg));

(* X + 17 & X *)
("med_parse8", (ast_test "X + 17 & X" (Binop (And,(Binop (Plus,Arg,(Cint 17l))),Arg))));

(* X & 17 | 42 *)
("med_parse9", (ast_test "X & 17 | 42" (Binop (Or,(Binop (And,Arg,(Cint 17l))),(Cint 42l)))));

(* (X & 17) | 42 *)
("med_parse10", (ast_test "(X & 17) | 42" (Binop (Or,(Binop (And,Arg,(Cint 17l))),(Cint 42l)))));
	   ]);
GradedTest("MediumParsing2", 8, [

]);]


let med_compiling_tests : suite = [
GradedTest("MediumCompiling", 7, [
(* X + X + X *)
("med_compile0", (comp_test 341 (Binop (Plus,(Binop (Plus,Arg,Arg)),Arg)) 1023));

(* X * X * X *)
("med_compile1", (comp_test 341 (Binop (Times,(Binop (Times,Arg,Arg)),Arg)) 39651821));

(* X + X * X *)
("med_compile2", (comp_test 341 (Binop (Plus,Arg,(Binop (Times,Arg,Arg)))) 116622));

(* X * X + X *)
("med_compile3", (comp_test 341 (Binop (Plus,(Binop (Times,Arg,Arg)),Arg)) 116622));

(* X * (X + X) *)
("med_compile4", (comp_test 341 (Binop (Times,Arg,(Binop (Plus,Arg,Arg)))) 232562));

(* (X + X) * X *)
("med_compile5", (comp_test 341 (Binop (Times,(Binop (Plus,Arg,Arg)),Arg)) 232562));

(* (X) *)
("med_compile6", (comp_test 341 Arg 341));

(* ((X)) *)
("med_compile7", (comp_test 341 Arg 341));

(* X + 17 & X *)
("med_compile8", (comp_test 341 (Binop (And,(Binop (Plus,Arg,(Cint 17l))),Arg)) 324));

(* X & 17 | 42 *)
("med_compile9", (comp_test 341 (Binop (Or,(Binop (And,Arg,(Cint 17l))),(Cint 42l))) 59));

(* (X & 17) | 42 *)
("med_compile10", (comp_test 341 (Binop (Or,(Binop (And,Arg,(Cint 17l))),(Cint 42l))) 59));
	   ]);
GradedTest("MediumCompiling2", 8, [

]);]



(*** Lexing/Parsing Error Tests ***)
let error_tests : suite = [
  GradedTest("ErrorTests", 5, [
("err0", (parse_error_test "Y" (Lexer.Lexer_error ((Range.mk_range "stdin" (Range.mk_pos 1 0) (Range.mk_pos 1 1)), "Unexpected character: 'Y'"))));

("err1", (parse_error_test "X -" (Failure "Parse error at stdin:[1.3-1.3].")));

("err2", (parse_error_test "X - Y" (Lexer.Lexer_error ((Range.mk_range "stdin" (Range.mk_pos 1 4) (Range.mk_pos 1 5)), "Unexpected character: 'Y'"))));

("err3", (parse_error_test "X % X" (Lexer.Lexer_error ((Range.mk_range "stdin" (Range.mk_pos 1 2) (Range.mk_pos 1 3)), "Unexpected character: '%'"))));
	     ]);
  GradedTest("ErrorTests2", 5, [

]);]

let hard_tests : suite = [
  GradedTest ("HardTests", 20, [ 
])]

let manual_tests : suite = [
  GradedTest ("StyleManual", 10, [
  
  ]);
]

let graded_tests : suite = 
  easy_parsing_tests @
  easy_compiling_tests @
  med_parsing_tests @
  med_compiling_tests @
  hard_tests @
  error_tests @
  manual_tests
