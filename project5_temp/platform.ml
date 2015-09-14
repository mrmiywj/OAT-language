(** Assembling and linking for X86.  Depends on the underlying OS platform    *)
(******************************************************************************)

open Printf
open Unix

exception AsmLinkError of string * string

(****************************************************************)
(* Platform specific configuration: Unix/Max vs. Windows/Cygwin *)
(****************************************************************)
let os = Sys.os_type   (* One of "Unix" "Win32" or "Cygwin" *)
let runtime_path = ref "runtime.c" 
let libs = ref [] 
let lib_paths = ref []
let lib_search_paths = ref []
let include_paths = ref []
let obj_path = ref (if os = "Unix" then "c_obj/" else "c_obj\\")
let bin_path = ref (if os = "Unix" then "c_bin/" else "c_bin\\")
let executable_name = ref (if os = "Unix" then "a.out" else "a.exe")
let executable_exn = if os = "Unix" then "" else ".exe" 
let path_sep = if (os = "Unix") then "/" else "\\"
let full_executable_name () = !bin_path ^ path_sep ^ !executable_name
let linux = ref false

let pp_cmd = if os = "Unix" then "cpp -E " else "cpp-4 -E "  
let rm_cmd = if os = "Unix" then "rm -f " else "del /Q "
let dot_path = if os = "Unix" then "./" else ".\\"

(* Default to Mac OS X configuration *)
let link_cmd = ref "gcc -Wl,-no_pie -mstackrealign -m32 -o "
let cpplink_cmd = ref "g++ -Wl,-no_pie -mstackrealign -m32 -o "
let as_cmd = if os = "Unix" then "gcc -mstackrealign -c -m32 -o " else "as --32 -o "


(* Set the link commands properly *)
let configure () =
  (Printf.printf "Configuring platform...\n");
  if os = "Unix" then begin 
    if !linux then begin
      (* Linux *)
      Printf.printf "[Linux]\n";
      link_cmd := "gcc -mstackrealign -m32 -o ";
      cpplink_cmd := "g++ -mstackrealign -m32 -o "
    end else 
      (* Mac *)
      Printf.printf "[Mac OS]\n"
  end else begin
    (* Windows *)
    Printf.printf "[Windows]\n";
    link_cmd := "gcc-4 -m32 -o ";
    cpplink_cmd := "g++-4 -m32 -o "
  end

(****************************************************************)


let verbose_on = ref true

let decorate_cdecl name = if !linux then name else ("_" ^ name)

(* Platform independent shell command *)  
let sh (cmd:string) : unit =
  (if !verbose_on then (printf "* %s" cmd; print_newline ()));
  match (system cmd) with
  | WEXITED i when i <> 0 ->
      raise (AsmLinkError (cmd, sprintf "Stopped with %d." i))
  | WSIGNALED i -> raise (AsmLinkError (cmd, sprintf "Signaled with %d." i))
  | WSTOPPED i -> raise (AsmLinkError (cmd, sprintf "Stopped with %d." i))
  | _ -> ()

(* Generate a name which does not exist before *)
let gen_name (basedir:string) (basen:string) (baseext:string) : string =  
  let rec nocollide ofs =
    let ctime = Int64.add (Int64.of_float (time ())) ofs in
    let nfn = sprintf "%s%s%Lx%s" basedir basen ctime baseext in
      try ignore (stat nfn); nocollide (Int64.add ofs 1L)
      with Unix_error (ENOENT,_,_) -> nfn
  in nocollide 0L


let assemble (dot_s:string) (dot_o:string) : unit =
  sh (sprintf "%s%s %s" as_cmd dot_o dot_s)

let preprocess (dot_oat:string) (dot_i:string) : unit =
  sh (sprintf "%s%s %s %s" pp_cmd 
	(List.fold_left (fun s -> fun i -> s ^ " -I" ^ i) "" !include_paths)
        dot_oat dot_i)

let link (mods:string list) (out_fn:string) : unit =
  sh (sprintf "%s%s %s %s %s %s" !link_cmd out_fn 
	(String.concat " " (mods @ !runtime_path :: !lib_paths))
	(List.fold_left (fun s -> fun i -> s ^ " -L" ^ i) "" !lib_search_paths)
	(List.fold_left (fun s -> fun i -> s ^ " -I" ^ i) "" !include_paths)
	(List.fold_left (fun s -> fun l -> s ^ " -l" ^ l) "" !libs))

let cpplink (mods:string list) (out_fn:string) : unit =
  sh (sprintf "%s%s %s %s %s %s" !cpplink_cmd out_fn 
	(String.concat " " (mods @ !runtime_path :: !lib_paths))
	(List.fold_left (fun s -> fun i -> s ^ " -L" ^ i) "" !lib_search_paths)
	(List.fold_left (fun s -> fun i -> s ^ " -I" ^ i) "" !include_paths)
	(List.fold_left (fun s -> fun l -> s ^ " -l" ^ l) "" !libs))

let run_executable arg pr =
  let cmd = sprintf "%s%s %d" dot_path pr arg in
  (if !verbose_on then printf "* %s\n" cmd);
  match (system cmd) with
  | WEXITED i -> i
  | WSIGNALED i -> raise (AsmLinkError (cmd, sprintf "Signaled with %d." i))
  | WSTOPPED i -> raise (AsmLinkError (cmd, sprintf "Stopped with %d." i))

let run_executable_to_tmpfile arg pr tmp =
  let cmd = sprintf "%s%s %d > %s 2>&1" dot_path pr arg tmp in
  (if !verbose_on then printf "* %s\n" cmd);
  match (system cmd) with
  | WEXITED _ -> ()
  | WSIGNALED i -> raise (AsmLinkError (cmd, sprintf "Signaled with %d." i))
  | WSTOPPED i -> raise (AsmLinkError (cmd, sprintf "Stopped with %d." i))

let string_of_file (f:in_channel) : string =
  let rec _string_of_file (stream:string list) (f:in_channel) : string list=
    try 
      let s = input_line f in
      _string_of_file (s::stream) f
    with
      | End_of_file -> stream
  in 
    String.concat "\n" (List.rev (_string_of_file [] f))

let run_program (args:string) (tmp_exe:string) (tmp_out:string) : string =
  let _ = 
    let cmd = sprintf "%s%s %s > %s 2>&1" dot_path tmp_exe args tmp_out in
    (if !verbose_on then printf "* %s\n" cmd);
    match (system cmd) with
    | WEXITED _ -> ()
    | WSIGNALED i -> raise (AsmLinkError (cmd, sprintf "Signaled with %d." i))
    | WSTOPPED i -> raise (AsmLinkError (cmd, sprintf "Stopped with %d." i))  in
  let fi = open_in tmp_out in
  let result = string_of_file fi in
  let _ = close_in fi in
    result

let clean_paths () =
  sh (sprintf "%s%s*" rm_cmd !obj_path);
  sh (sprintf "%s%s*" rm_cmd !bin_path)

