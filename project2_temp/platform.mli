
exception AsmLinkError of string * string

val runtime_path : string ref
val include_paths : (string list) ref
val libs : (string list) ref
val lib_search_paths : (string list) ref
val lib_paths : (string list) ref
val obj_path : string ref
val bin_path : string ref
val executable_name : string ref
val executable_exn : string
val path_sep : string
val full_executable_name : unit -> string
val linux : bool ref

val verbose_on : bool ref

val gen_name : string -> string -> string -> string
val decorate_cdecl : string -> string
val assemble : string -> string -> unit
val preprocess : string -> string -> unit
val link : (string list) -> string -> unit
val cpplink : (string list) -> string -> unit
val run_executable : int -> string -> int
val run_executable_to_tmpfile : int -> string -> string -> unit
val run_program : string -> string -> string -> string

val clean_paths : unit -> unit
