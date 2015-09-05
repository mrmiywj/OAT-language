open Ast

(* A typing context contains two components: globals contains types
 * for functions and global value definitions.
 * 
 * locals maps function arguments and local variables to their
 * types.  *)
type ctxt = {
  globals : Range.t gcontext;    (* Global values and Function type context *)
  locals  : Range.t lcontext;    (* Local variable context *)
  }

(* The initial context. *)
let empty_ctxt = {globals = []; locals = [];}


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


(* Binds a new function identifier to its type in the global context.
 * Raises a Failure exception if the identifier is already used in the
 * global context.  *)
let add_global_fn (fid:string) (ft:ftyp) (c:ctxt) : ctxt =
  {c with globals = (fid,GFn ft)::c.globals }


(* Binds a new global value identifier to its type in the global
  context.  Raises a Failure exception if the identifier is already
  used in the global context.  *)
let add_global_val (id:string) (t:typ) (c:ctxt) : ctxt =
  {c with globals = (id,GVal t)::c.globals }


