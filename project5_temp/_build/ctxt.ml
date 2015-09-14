open Ll

(* A translation context for use in Phase 1 of the compiler. *)

(* We now need to keep track of global values.  There might be 
 * some code that must be run to initialize them.  This tracks
 * the information associated with each global value. *)
type global_data = operand * global_initializer

(* Class signatures *)
type csig = { 
  ext: string option;              (* Super class id *)
  vtable: Ll.operand;              (* Vtable pointer operand *)
  ctor: Ll.fn;                     (* Constructor function signature *)
  fields: (string * Ll.ty) list;   (* Source field id -> type map *)
  methods: (string * Ll.fn) list;  (* Source method id -> sig map *)
}

(* A context is more complicated now that there are more 
 * kinds of entities. *)
type ctxt = {
  this      : string option;                (* Current 'this' pointer. *)
  fns       : (string * Ll.fn) list;        (* Function signatures. *)
  externals : (string * Ll.fn) list;        (* External/builtins function signatures *)
  globals   : (string * global_data) list;  (* Global values *)
  locals    : (string * operand) list;      (* Local variables and their associated LL IR operand *)
  fdecls    : fdecl list;                   (* Compiled functions, including code. *)
  csigs     : (string * csig) list;         (* Map named types to class sigs *)
  namedts   : (string * Ll.ty) list         (* Named types *)
}

let empty_ctxt = {
  this = None;
  fns = [];
  externals = [];
  globals = [];
  locals = [];
  fdecls = [];
  csigs = [];
  namedts = [];
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
let add_external (c:ctxt) (id:string) (f:Ll.fn) : ctxt =
  {c with externals = (id, f)::c.externals}

(* Add a function signature *)
let add_fn (c:ctxt) (id:string) (f:Ll.fn) : ctxt =
  {c with fns = (id, f)::c.fns}

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
  try Some (List.assoc id c.locals)
  with Not_found -> None

let lookup_global_val (id:string) (c:ctxt) : operand option =
  try Some (fst (List.assoc id c.globals))
  with Not_found -> None

let lookup_fn (c:ctxt) (id:string) : Ll.fn =
  try List.assoc id c.fns
  with Not_found ->
	try List.assoc id c.externals
	with Not_found -> failwith ("lookup_fn failed to find " ^ id)

let get_globals (c:ctxt) = List.map snd c.globals
let get_fdecls (c:ctxt) : fdecl list = c.fdecls

(* New in project 5 *)
(* Access various fields *)
let get_efdecls (c:ctxt) : Ll.fn list = List.map snd c.externals
let get_namedts (c:ctxt) = c.namedts
let get_csigs (c:ctxt) : (string * csig) list = c.csigs

(* Look up translation info for class 'cid' *)
let lookup_csig (c:ctxt) (cid:string) : csig =
  try List.assoc cid c.csigs
  with Not_found -> failwith ("lookup_csig failed to find: " ^ cid)

(* If in class scope, get current class identifier *)
let lookup_this (c:ctxt) : string =
  match c.this with 
    | Some cid -> cid 
    | None -> raise Not_found

(* Set current class identifier *)
let set_this (c:ctxt) (cido:string option) : ctxt = {c with this=cido}

(* Add translation info for class 'cid' *)
let add_csig (c:ctxt) (cid:string) (cs:csig) : ctxt =
  {c with csigs=(cid,cs)::c.csigs}

(* Add a type alias *)
let add_namedt (c:ctxt) (name:string) (t:ty) =
  {c with namedts=(name,t)::c.namedts}

