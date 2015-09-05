(* CIS 341 *)
(* Author: Steve Zdancewic *)

(* A compilation unit is a collection of labeled, global data *)
(* It is processed by "as" -- the assembler                   *)
open Format
(* Global Data Values *)

type global =
| GStringz of string
| GSafeStringz of string 
| GLabelOffset of X86.lbl * int32
| GLabels of X86.lbl list
| GInt32 of int32
| GZero  of int          
| GExtern                

type global_data = {
  link   : bool;         
  label  : X86.lbl;
  value  : global;
}

(* Compilation Units are Lists of Components *)
type component =
  | Code of X86.insn_block
  | Data of global_data
      
type cunit = component list
      
(* Quotes a string for printing to the listing, appending
 * the null terminator. *)
let quote_asm_string s =
  sprintf "\"%s\\0\"" (String.escaped s );;

let string_of_global_data (d:global_data) =
  let data_defn =
    match d.value with
    | GSafeStringz s -> "\t.long " ^ string_of_int (String.length s) ^
        "\n\t.ascii " ^ quote_asm_string s
    (* FIXME replace with .asciz *)                      
    | GStringz s -> "\t.ascii " ^ quote_asm_string s
    | GLabelOffset (l, i) ->
        "\t.long " ^ (X86.string_of_lbl l) ^ " + " ^ (Int32.to_string i)
    | GLabels ls -> List.fold_left 
        (fun s -> fun l -> s ^ "\t.long " ^ X86.string_of_lbl l ^ "\n") "" ls
    | GInt32 v -> "\t.long " ^ Int32.to_string v
    | GZero z -> "\t.zero " ^ string_of_int z
    | GExtern -> ""  in
  let maybe_global =
    if d.link || d.value = GExtern then 
      ".globl " ^ X86.string_of_lbl d.label ^ "\n"
    else "" in
    maybe_global ^ 
      (if (d.value <> GExtern) then
         X86.string_of_lbl d.label ^ ":\n" ^ data_defn ^ "\n"
       else "")
      

let mode_data = "\t.data\n"
let mode_text = "\t.text\n"

let serialize_cunit (cu:cunit) (printfn : string -> unit) =
  (* x86 does not generally require alignment on natural boundaries
   * (i16: even-numbered addresses; i32: divisible by 4; i64: divisible by 8)
   * but the performance of programs will improve if this alignment is
   * maintained wherever possible. The processor may require two
   * memory accesses to read a single unaligned memory address. (see: 
   * IA-32 Intel Architecture Software Developer's Manual, Volume 1, 4-2) *)
  printfn "\t.align 4\n";
  ignore
    (List.fold_left 
       (fun mode ni ->
	 let mode' =
	   match ni with
	   | Code c ->
	       (if mode <> mode_text then printfn mode_text);
	       X86.serialize_insn_block c printfn;
	       mode_text
	   | Data d ->
	       (if mode <> mode_data then printfn mode_data);  
	       printfn (string_of_global_data d);
	       mode_data in mode') "" cu)
let string_of_cunit cu =
  let b = Buffer.create 256 in
    (serialize_cunit cu (Buffer.add_string b));
    Buffer.contents b
      
let output_cunit (cu:cunit) (oc:out_channel) =
  serialize_cunit cu (output_string oc)
    
let dump_to_file cu fn =
  let f = open_out fn in begin
    output_cunit cu f ;
    close_out f
  end
