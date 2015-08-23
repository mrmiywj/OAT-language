(* Interface for variable contexts. *)

type t  (* The abstract type of contexts *)

(* 
 * Exception that should be raised when a variable scoping 
 * error occurs.  The string should carry the variable
 * identifier that was not in scope.
 *)
exception Scope_error of string

(* For debugging *)
val dump : t -> unit

(* The empty context *)
val empty : t

(* 
 * Allocate a fresh local and bind it to the identifier
 * given by the string. 
 *)
val alloc : string -> t -> t * Ll.uid


(* Look up the most recent binding for the given identifier.
   @raise Symbol_error - if not found
*)
val lookup : string -> t -> Ll.uid





