open Driver

open Arg

(* @raise Failure
  The path is of the form ... "foo/bar/baz/<file>.e"
 *)    

(* Use the --test option to run unit tests and the quit the program. *)
let argspec = [
  ("--test", Unit exec_tests, "run the test suite, ignoring other inputs");
  ("-q", Clear Platform.verbose_on, "quiet mode -- turn off verbose output");
  ("-bin-path", Set_string Platform.bin_path, "set the output path for generated executable files, default c_bin");
  ("-obj-path", Set_string Platform.obj_path, "set the output path for generated .s  and .o files, default c_obj");
  ("-test-path", Set_string Gradedtests.test_path, "set the path to the test directory");
  ("-lib", String (fun p -> Platform.lib_paths := (p::(!Platform.lib_paths))), "add a library to the linked files");
  ("-runtime", Set_string Platform.runtime_path, "set the .c file to be used as the language runtime implementation");
  ("-I", String (fun p -> Platform.include_paths := (p::(!Platform.include_paths))), "add <directory> to the compiler's search paths");
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
    Platform.configure ();
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

