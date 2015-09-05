open LibUtil

(* 
 * One possible implementation of a context is:
 * an association list of the form: (string, uid) list
 *)
type t = (string * Ll.uid) list
exception Scope_error of string 

let dump (c : t) : unit =
  List.iter(
    fun ((name,id) : string * Ll.uid) ->
      let _ = Printf.sprintf "%s -> \n" name in
      ()) c
      
let empty : t = [] 

(* try to reuse freed, otherwise create new *)
let alloc (sym : string) (c : t) : (t * Ll.uid) =
  let new_uid = Ll.mk_uid (sym) in
  let new_t = (sym, new_uid) :: c in
  (new_t, new_uid)


let lookup (sym : string) (c : t) : Ll.uid =
  try
    List.assoc sym c
  with
  | _ -> raise (Scope_error sym)
