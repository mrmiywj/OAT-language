open Ast

(* A typing context contains two components: globals contains types
 * for functions and global value definitions.
 * 
 * locals maps function arguments and local variables to their
 * types.  *)
type ctxt = {
  this    : cid option;          (* Current class (cidopt) *)
  globals : Range.t gcontext;    (* Global values and Function type context *)
  locals  : Range.t lcontext;    (* Local variable context *)
  sigs    : signature;           (* Class signatures *)
}

(* The initial context. *)
let builtin_sigs = [
  ("Object", (None, 
              [("_name", TRef RString)], [],
              [("get_name", ([], Some (TRef RString)))]));
]

let builtin_fdecls = [
  "string_of_array",  GFn ([TRef (RArray TInt)], Some (TRef RString));
  "array_of_string",  GFn ([TRef RString], Some (TRef (RArray TInt)));
  "print_string",     GFn ([TRef RString], None);
  "print_int",        GFn ([TInt], None);
  "print_bool",       GFn ([TBool], None);
  "alloc_array",      GFn ([TInt], Some (TRef (RArray TInt)));
  "string_cat",       GFn ([TRef RString; TRef RString], Some (TRef RString));
  "string_alloc",     GFn ([TInt], Some (TRef RString));
  "length_of_string", GFn ([TRef RString], Some TInt);
  "string_of_int",    GFn ([TInt], Some (TRef RString));
  "int_of_string",    GFn ([TRef RString], Some TInt);
  "string_of_bool",   GFn ([TBool], Some (TRef RString));
  "bool_of_string",   GFn ([TRef RString], Some TBool);
  "string_at",        GFn ([TRef RString; TInt], Some TInt);
  "string_set",       GFn ([TRef RString; TInt; TInt], None);
  "write_file",       GFn ([TRef RString; TRef RString], Some TInt);
  "read_file",        GFn ([TRef RString], Some (TRef RString));
  "random_int",       GFn ([], Some TInt);
  "oat_abort",        GFn ([TInt], None);
]

let empty_ctxt = {
  this = None; 
  globals = builtin_fdecls; 
  locals = [];
  sigs = builtin_sigs;
}


(* Determines whether a given identifier is in the local context *)
let in_locals (id:string) (c:ctxt) : bool =
  try 
    ignore (List.assoc id c.locals); true
  with
    | Not_found -> false

(* Determines whether a given identifier is in the global context *)
let in_globals (id:string) (c:ctxt) : bool =
  try 
    ignore (List.assoc id c.globals); true
  with
    | Not_found -> false


(* Finds (Some typ) of the first occurence of the local identifier in
 * a given context. Returns None if the identifier is not bound in the
 * local context *)
let lookup_local (id:string) (c:ctxt) : typ option =
  try
    Some (List.assoc id c.locals)
  with
    | Not_found -> None


(* Binds a new local variable to a type, returning the new context.
 * Clients of tctx must explicitly prevent shadowing of other
 * locals.  *)
let add_local (id:string) (t:typ) (c:ctxt) : ctxt =
  {c with locals = (id,t)::c.locals }


(* Finds (Some ftyp) for a function identifier fid in the given
 * context.  Returns None if the function is not bound.  Note that the
 * Oat built-in function declarations are checked if the user- defined
 * functions don't mention the desired identifier.  *)
let lookup_global_fn (fid:string) (c:ctxt) : ftyp option =
  try 
    match (List.assoc fid c.globals) with
      | GFn ft -> Some ft
      | GVal _ -> None
  with
    | Not_found -> None

(* Finds (Some typ) for a global identifier in the given context.
 * Returns None if the identifier is not bound in the global
 * context.  *)
let lookup_global_val (id:string) (c:ctxt) : typ option =
  try
    match (List.assoc id c.globals) with
      | GFn _ -> None
      | GVal t -> Some t
  with
    | Not_found -> None


(* Binds a new function identifier to its type in the global context. *)
let add_global_fn (fid:string) (ft:ftyp) (c:ctxt) : ctxt =
  {c with globals = (fid,GFn ft)::c.globals }


(* Binds a new global value identifier to its type in the global
 * context. *)
let add_global_val (id:string) (t:typ) (c:ctxt) : ctxt =
  {c with globals = (id,GVal t)::c.globals }


(* Binds a new class idenitifer to its signature in the context. *)
let add_class_sig (cid:string) (extopt:string option) 
    (fs:fcontext) (ts:typ list) (ms:mcontext) (c:ctxt) : ctxt =
  {c with sigs = (cid, (extopt, fs, ts, ms))::c.sigs}

(* Find a class signature *)
let lookup_class_sig (cid:string) (c:ctxt) =
  try Some (List.assoc cid c.sigs)
  with Not_found -> None

(* Get/set the current class id. This is set while ctor/method code
   where the 'this' pointer would be in scope *)
let lookup_this (c:ctxt) : string option = c.this
let set_this (ido:string option) (c:ctxt) = {c with this=ido}


