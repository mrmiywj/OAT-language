open Format
let failwithf fmt = ksprintf failwith fmt
let prerr_endlinef fmt = ksprintf prerr_endline fmt
let (|>) a f  = f a
module List =
  struct
    include List
    let findi p l =
      let rec loop n = function
        | [] -> raise Not_found
        | h :: t ->
            if p n h then (n,h) else loop (n+1) t in
      loop 0 l

    let find_index xs x = 
      let (i, _) = findi (fun _ a -> a = x) xs
      in i

    let concat_map f lst = fold_right (fun x  acc  -> (f x) @ acc) lst []

    let concat_map2 (f:'a -> 'b list * 'c list) (lst:'a list)  = 
      fold_right (fun x (acc1, acc2) -> 
		    let (l1, l2) = f x in (l1@acc1, l2@acc2)) lst ([],[])

    let rec filter_map f ls =
      match ls with
	| [] -> []
	| x::xs ->
            (match f x with
               | Some y -> y :: (filter_map f xs)
               | None  -> filter_map f xs)

    let rec filter_map2 f ls =
      let rec loop ls acc1 acc2 =
	match ls with
	  | [] -> (acc1, acc2)
	  | x::xs ->
              (match f x with
		 | None, None       -> loop xs acc1 acc2
		 | None, Some y2    -> loop xs acc1 (y2::acc2)
		 | Some y1, None    -> loop xs (y1::acc1) acc2
		 | Some y1, Some y2 -> loop xs (y1::acc1) (y2::acc2))
      in
	loop ls [] [] 
  end

module Buffer =
  struct
    include Buffer
    let (+>) buf chr = Buffer.add_char buf chr; buf
    let (+>>) buf str = Buffer.add_string buf str; buf
    let of_channel (ch : in_channel) : Buffer.t =
      (* Buffer.add_channel appears to be broken... *)
      let len = 2048 in
      let str = String.create len in
      let buf = Buffer.create len in
      let nch = ref 1 in
      while !nch <> 0 do
        nch := input ch str 0 len;
        Buffer.add_substring buf str 0 !nch
      done; buf

  end
