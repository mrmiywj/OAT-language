(* CIS341 main test harness *)
(* Author: Steve Zdancewic  *)

(* Do NOT modify this file -- we will overwrite it with our *)
(* own version when we test your homework.                  *)

open Assert
open LibUtil
  
(* (\* @raise Failure *)
(*   The path is of the form ... "foo/bar/baz/<file>.<Oconfig.lang_file_exn>" *)
(*  *\)     *)
let path_to_root_source (path:string) =
  if Filename.check_suffix path Oconfig.lang_file_exn then 
    Filename.(chop_extension (basename path))
  else failwith ("Expected the file to end with: " ^ Oconfig.lang_file_exn)

(* Parse an AST from a preexisting lexbuf. 
 * The filename is used to generate error messages.
*)
let parse (filename : string) (buf : Lexing.lexbuf) : Range.t Ast.prog =
  try
    Lexer.reset_lexbuf filename 1 buf;
    Parser.toplevel Lexer.token buf
  with Parsing.Parse_error ->
    failwithf  "Parse error at %s."
        (Range.string_of_range (Lexer.lex_range buf))

let of_string s =
  parse "<string>" (Lexing.from_string s)
      
let of_file path =
  let root = path_to_root_source path in
  let buffer = open_in path in
  let prog = parse (root ^ Oconfig.lang_file_exn) (Lexing.from_channel buffer) in
  let _ = close_in buffer in
  let _ = if !Oconfig.show_ast then Astlib.print_prog prog in
  (* let _ = if !Oconfig.ast2c then *)
  (*   let result = Astlib.c_run_prog prog "" in *)
  (*   Printf.printf "AST2C Program output %s\n" result in *)
  prog ;;

let root_to_dot_i (root:string) =
  Filename.concat !Platform.obj_path (root ^ ".i.oat")

let root_to_dot_ll (root:string) =
  Filename.concat !Platform.obj_path (root ^ ".ll")

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
    (* Preprocess file *)
    let dot_i = root_to_dot_i root in
    Platform.preprocess path dot_i;

    (* Parse the file *)
    let prog = of_file dot_i in
    
    (* Typechecking *)
    (try 
      ignore (Tc.tc_toplevel prog)
    with  
| Failure f -> Printf.printf "Failed: %s" f
    );

    (* Translate to IL form *)
    let prog_il = Phase1.cmp_toplevel prog in
    let _ = if !Oconfig.show_il then Printf.printf "%s\n" (Lllib.string_of_prog prog_il) in
    let dot_ll = root_to_dot_ll root in
    let _ = Lllib.write_prog_to_file dot_ll prog_il in

    let module Backend =
      (val
          ( if !Occ.llvm_backend then (module Occ.LLVMBackend : Occ.BACKEND)
          else  (module Occ.DefaultBackend : Occ.BACKEND)) : Occ.BACKEND)
    in


    
    let dot_s = root_to_dot_s root in
    let cu = Backend.codegen prog_il in
    let fout = open_out dot_s in
    Backend.write fout cu;
    close_out fout;
    
    (* let _ = write_asm_cunit cu dot_s in *)
    if !Oconfig.compile_only then () else
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
      let prog = parse "stdin" (Lexing.from_string st) in
      Astlib.print_prog prog; ()
    with
| Failure f -> Printf.printf "Failed: %s" f 
| Lexer.Lexer_error (r,m) -> Printf.printf "Lexing error: %s %s\n" (Range.string_of_range r) m
   
    end; loop (i+1)
  in
    loop 0


exception Ran_tests
let worklist : string list ref = ref []
let suite = ref (Providedtests.provided_tests @ Gradedtests.graded_tests)

let exec_tests () =
  let () = Platform.configure () in
  let o = run_suite !suite in
  Printf.printf "%s\n" (outcome_to_string o);
  raise Ran_tests




