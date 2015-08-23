val failwithf : ('a, unit, string, 'b) format4 -> 'a
val prerr_endlinef : ('a, unit, string, unit) format4 -> 'a


module List :
  sig
    include module type of List
    val findi : (int -> 'a -> bool) -> 'a list -> int * 'a
    val find_index : 'a list -> 'a -> int
    val concat_map : ('a -> 'b list) -> 'a list -> 'b list
    val concat_map2 : ('a -> 'b list * 'c list) -> 'a list -> 'b list * 'c list
    val filter_map : ('a -> 'b option) -> 'a list -> 'b list
    val filter_map2 : ('a -> 'b option * 'c option) -> 'a list -> 'b list * 'c list
  end

module Buffer :
  sig
    include module type of Buffer with type t = Buffer.t
    val ( +> ) : t -> char -> t
    val ( +>> ) : t -> string -> t
    val of_channel: in_channel -> t
  end

