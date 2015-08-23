open Ll
open X86
open LibUtil



let compile_prog (prog : Ll.prog) : Cunit.cunit =
    let block_name = (Platform.decorate_cdecl "program") in
failwith "unimplemented"
