open Ll

(* A translation context for use in Phase 1 of the compiler. *)

(* We now need to keep track of global values.  There might be 
 * some code that must be run to initialize them.  This tracks
 * the information associated with each global value. *)
type global_data = operand * global_initializer

(* A context is more complicated now that there are more 
 * kinds of entities. *)

type ctxt = {
  fns : (string * fn) list;                (* Function signatures. *)
  externals: (string * fn) list;           (* External/builtins function signatures *)
  globals : (string * global_data) list;   (* Global values *)
  locals  : (string * operand) list;       (* Local variables and their associated LL IR operand *)
  fdecls :  fdecl list;                    (* Compiled functions, including code. *)
}

let empty_ctxt = {
  fns = [];
  externals = [];
  globals = [];
  locals = [];
  fdecls = [];
}

(* Entering a fresh local scope, for use when compiling functions bodies. *)
let enter_local_scope (c:ctxt) : ctxt =
  {c with locals = []}

(*************************)
(* Extending the context *)
(*************************)

(* Add a mapping from a source global identifier to an LL operand 
 * and initialization information *)
let add_global (c:ctxt) (id:string) (gop:operand) (ginit:global_initializer) : ctxt =
  {c with globals = (id, (gop, ginit))::c.globals}

(* Add a mapping from a source local identifier to an LL operand *)
let add_local (c:ctxt) (id:string) (op:operand) : ctxt =
  {c with locals = (id, op)::c.locals}

(* Add an externally defined or builtin function signature. 
 * These get emited as global labels to be resolved by the linker.
 *)
let add_external (c:ctxt) (fn:fn) : ctxt =
  {c with externals = (fn.name, fn)::c.externals}

(* Add a function signature *)
let add_fn (c:ctxt) (fn:fn) : ctxt =
  {c with fns = (fn.name, fn)::c.fns}

(* Add a compiled function declaration *)
let add_fdecl (c:ctxt) (f:fdecl) : ctxt =
  {c with fdecls = f::c.fdecls}



(************************************)
(* Looking up values in the context *)
(************************************)

(* Note: in a correct compiler, these should never fail because
 * scoping errors in the source program have already been
 * resolved by the typechecker.  Nevertheless we have them
 * return options so that phase1.ml is forced to produce
 * more meaningful error messages. *)

let lookup_local (id:string) (c:ctxt) : operand option=
  try 
    Some (List.assoc id c.locals)
  with
    | Not_found -> None

let lookup_global_val (id:string) (c:ctxt) : operand option =
  try
    let (op, _) = List.assoc id c.globals
    in Some op
  with
    | Not_found -> None

let lookup_fn (id:string) (c:ctxt) : fn =
  try 
    List.assoc id c.fns 
  with
    | Not_found ->
	try 
	  List.assoc id c.externals
	with
	    Not_found -> failwith ("lookup_fn failed to find " ^ id)

let get_globals (c:ctxt) : (operand * global_initializer) list =
  List.map snd c.globals

let get_fdecls (c:ctxt) : fdecl list = c.fdecls
