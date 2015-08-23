(* CIS341 main test harness *)
(* Author: Steve Zdancewic  *)

(* Do NOT modify this file -- we will overwrite it with our *)
(* own version when we test your homework.                  *)

open Assert
open Arg

let path_to_root_source (path:string) =
  (* The path is of the form ... "foo/bar/baz/<file>.e" *)
  let paths = Str.split (Str.regexp_string Platform.path_sep) path in
  let _ = if (List.length paths) = 0 then failwith "bad path" else () in
  let filename = List.hd (List.rev paths) in
  let len = String.length filename in
  let elen = String.length Oconfig.lang_file_exn in
  let exn = String.sub filename (len - elen) elen in
    if exn = Oconfig.lang_file_exn then 
      String.sub filename 0 (len - elen) 
    else
      failwith "Expected the file to end with .e"
let path_to_root_source (path:string) =
  (* The path is of the form ... "foo/bar/baz/<file>.e" *)
  let paths = Str.split (Str.regexp_string Platform.path_sep) path in
  let _ = if (List.length paths) = 0 then failwith "bad path" else () in
  let filename = List.hd (List.rev paths) in
  let len = String.length filename in
  let elen = String.length Oconfig.lang_file_exn in
  let exn = String.sub filename (len - elen) elen in
    if exn = Oconfig.lang_file_exn then 
      String.sub filename 0 (len - elen) 
    else
      failwith "Expected the file to end with .e"

let root_to_dot_s (root:string) =
  Filename.concat !Platform.obj_path (root ^ ".s")

let root_to_dot_o (root:string) =
  Filename.concat !Platform.obj_path (root ^ ".o")

let write_asm_cunit (cu:Cunit.cunit) (dot_s:string) : unit =
  let fout = open_out dot_s in
    Cunit.output_cunit cu fout;
    close_out fout

let do_one_file (path:string) : unit =
  let _ = Printf.printf "Processing: %s\n" path in
  let root = path_to_root_source path in
  let _ = if !Platform.verbose_on then Printf.printf "root name: %s\n" root else () in

  try
  (* Parse the file *)
  let buffer = open_in path in
  let prog = Phase1.parse (root ^ Oconfig.lang_file_exn) (Lexing.from_channel buffer) in
  let _ = close_in buffer in
  let _ = if !Oconfig.show_ast then Ast.print_prog prog else () in
  
  (* Translate to LLVM IR *)
  let prog_ll = Phase1.compile_prog prog in
  let _ = if !Oconfig.show_il then Printf.printf "%s\n" (Ll.string_of_prog prog_ll) in

  (* Compile it to a .s file *)
  let module Backend = (val (if !Occ.llvm_backend
    then (module Occ.LLVMBackend    : Occ.BACKEND)
    else (module Occ.DefaultBackend : Occ.BACKEND)) : Occ.BACKEND) in

  let dot_s = root_to_dot_s root in
  let cu = Backend.codegen prog_ll in
  let fout = open_out dot_s in
  Backend.write fout cu;
  close_out fout;

  if (!Oconfig.compile_only) then () else 
    (* Assemble it to a .o file *)
    let dot_o = root_to_dot_o root in
    Platform.assemble dot_s dot_o
  with
| Failure f -> Printf.printf "Failed: %s" f 
| Lexer.Lexer_error (r,m) -> Printf.printf "Lexing error: %s %s\n" (Range.string_of_range r) m


let parse_stdin (_arg:int) =
  let rec loop (i:int) = 
    let st = read_line () in 
    begin try
      let prog = Phase1.parse "stdin" (Lexing.from_string st) in
      Ast.print_prog prog; ()
    with
| Failure f -> Printf.printf "Failed: %s" f 
| Lexer.Lexer_error (r,m) -> Printf.printf "Lexing error: %s %s\n" (Range.string_of_range r) m
   
    end; loop (i+1)
  in
    loop 0



exception Ran_tests
let worklist = ref []
let suite = ref (Providedtests.provided_tests @ Gradedtests.graded_tests)

let exec_tests () =
  let o = run_suite !suite in
  Printf.printf "%s\n" (outcome_to_string o);
  raise Ran_tests



(* Use the --test option to run unit tests and the quit the program. *)
let argspec = [
  ("--test", Unit exec_tests, "run the test suite, ignoring other inputs");
  ("-q", Clear Platform.verbose_on, "quiet mode -- turn off verbose output");
  ("-bin-path", Set_string Platform.bin_path, "set the output path for generated executable files, default c_bin");
  ("-obj-path", Set_string Platform.obj_path, "set the output path for generated .s  and .o files, default c_obj");
  ("-test-path", Set_string Gradedtests.test_path, "set the path to the test directory");
  ("-lib", String (fun p -> Platform.lib_paths := (p::(!Platform.lib_paths))), "add a library to the linked files");
  ("-runtime", Set_string Platform.runtime_path, "set the .c file to be used as the language runtime implementation");
  ("-o", Set_string Platform.executable_name, "set the output executable's name");
  ("-S", Set Oconfig.compile_only, "compile only, creating .s files from the source");
  ("-linux", Set Platform.linux, "use linux-style name mangling");
  ("--stdin", Int parse_stdin, "parse and interpret inputs from the command line, where X = <arg>");
  ("--clean", Unit (Platform.clean_paths), "clean the output directories, removing all files");
  ("--show-ast", Set Oconfig.show_ast, "print the abstract syntax tree after parsing");
  ("--show-il", Set Oconfig.show_il, "print the il representation");
  ("--llvm-backend", Set Occ.llvm_backend, "use llvm to compile IR");
] 

let _ =
  try
    Arg.parse argspec (fun f -> worklist := f :: !worklist)
        "CIS341 main test harness \n";
    match !worklist with
    | [] -> print_endline "* Nothing to do"
    | _ -> (* assemble the files *)
	   List.iter do_one_file !worklist;
	   (* link the files if necessary *)
	   if !Oconfig.compile_only then () 
	   else
	     let dot_o_files = List.map (fun p -> root_to_dot_o (path_to_root_source p)) !worklist in
	       Platform.link dot_o_files !Platform.executable_name
  with Ran_tests -> ()


