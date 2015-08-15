(* CIS341: Project 1 Interpreter *)
(* Author: Steve Zdancewic *)

open X86

(* Int32 / Int64 abbreviations and infix arithmetic *)
let (+@) = Int32.add
let (-@) = Int32.sub
let (/@) = Int32.div
let ( *@ ) = Int32.mul
let (<@) a b = (Int32.compare a b) < 0
let (<=@) a b = (Int32.compare a b) <= 0
let (>@) a b = (Int32.compare a b) > 0
let (>=@) a b = (Int32.compare a b) >= 0
let (<@@) a b = (Int64.compare a b) < 0
let (>@@) a b = (Int64.compare a b) > 0
let (>=@@) a b = (Int64.compare a b) >= 0

exception X86_segmentation_fault of string

(* Interpret the registers as indices into the register file array *)
let eaxi = 0
let ebxi = 1
let ecxi = 2
let edxi = 3
let esii = 4
let edii = 5
let ebpi = 6
let espi = 7 

let get_register_id = function
  | Eax -> eaxi 
  | Ebx -> ebxi 
  | Ecx -> ecxi 
  | Edx -> edxi 
  | Esi -> esii 
  | Edi -> edii 
  | Ebp -> ebpi
  | Esp -> espi


let mem_size = 1024                 (* Size of memory in words *)
let mem_top : int32 = 0xfffffffcl   (* Last addressable memory location *)
let mem_bot : int32 =               (* First addressable memory location *)
	  (Int32.of_int (mem_size * 4)) *@ (-1l)

(* 
   Maps virtual addresses (int32 addresses) to physical addresses (int indices). 
   Raises an X86_segmentation_fault exception if the provided virtual address 
   does not map or if the address is unaligned. 
*)
let map_addr (addr:int32) : int =
  if (addr >=@ mem_bot) && (addr <=@ mem_top) && (Int32.logand addr 3l = 0l)
  then (Int32.to_int ((addr -@ mem_bot) /@  4l))
  else (raise (X86_segmentation_fault "memory not mapped or aligned"))

type x86_state = {
    s_mem : int32 array;    (* 1024 32-bit words -- the heap *)
    s_reg : int32 array;    (* 8 32-bit words -- the register file *)
    mutable s_OF : bool;    (* overflow flag *)
    mutable s_SF : bool;    (* sign bit flag *)
    mutable s_ZF : bool;    (* zero flag *)
}

let mk_init_state () : x86_state = 
  let xs = {
  s_mem = Array.make mem_size 0l;
  s_reg = Array.make 8 0l;
  s_OF  = false;
  s_SF  = false;
  s_ZF  = false;
  } in
  xs.s_reg.(espi) <- mem_top; xs 

let print_state (xs:x86_state) : unit =
  (Array.iter (fun e -> Printf.printf "%lx " e) xs.s_mem);
  (Printf.printf "\neax: %lx ebx: %lx ecx: %lx edx: %lx" xs.s_reg.(eaxi)
      xs.s_reg.(ebxi) xs.s_reg.(ecxi) xs.s_reg.(edxi));
  (Printf.printf "\nesi: %lx edi: %lx ebp: %lx esp: %lx" xs.s_reg.(esii)
      xs.s_reg.(edii) xs.s_reg.(ebpi) xs.s_reg.(espi));
  (Printf.printf "\nOF: %b SF: %b ZF: %b\n" xs.s_OF xs.s_SF xs.s_ZF)
  

(* Helper function that determines whether a given condition code
   applies in the x86 state xs. *)  
let condition_matches (xs:x86_state) (c:X86.cnd) : bool =
  match c with
  | Eq -> (xs.s_ZF)
  | Zero -> (xs.s_ZF)
  | NotZero -> (not xs.s_ZF)
  | NotEq -> (not xs.s_ZF)
  | Slt -> (xs.s_SF != xs.s_OF)
  | Sle -> (xs.s_SF != xs.s_OF ||  xs.s_ZF)
  | Sge -> (xs.s_SF = xs.s_OF)
  | Sgt -> (xs.s_SF = xs.s_OF && (not xs.s_ZF))
(* Returns the bit at a given index in a 32-bit word as a boolean *)
let get_bit bitidx n =
  let shb = Int32.shift_left 1l bitidx in
  Int32.logand shb n = shb  

(*Get the block of name l*)
let rec get_block (code:insn_block list) (l:lbl) :insn_block =
  begin match code with
  | [] -> raise (X86_segmentation_fault "Do such block found!")
  | hd :: tl -> if hd.label = l then hd else get_block tl l
  end

(*Translate the ind to int*)
let get_ind (i:ind) (xs:x86_state) : int32 =
  begin match i.i_base with
  | Some n -> xs.s_reg.(get_register_id n)
  | None -> 0l
  end +@
    begin match i.i_iscl with
    | Some (r, scale) -> xs.s_reg.(get_register_id r) *@ scale
    | None -> 0l
    end +@
    begin match i.i_disp with
    | Some n ->
      begin match n with
      | DImm x -> x
      | DLbl l -> raise (X86_segmentation_fault "Don't accept lable")
      end
    | None -> 0l
    end

let set_neg_codes (i:int32) (xs:x86_state) :unit =
  if i = 0l then (xs.s_ZF <- true; xs.s_OF <- false; xs.s_SF <- false)
  else if i = Int32.min_int then (xs.s_ZF <- false; xs.s_OF <- true; xs.s_SF <-true)
  else if i >@ 0l then (xs.s_ZF <- false; xs.s_SF <- false; xs.s_OF <- false)
  else if i <@ 0l then (xs.s_ZF <- false; xs.s_SF <-true; xs.s_OF <- false)

let set_add_codes (r:int32) (xs:x86_state) : unit =
  if r=0l then (xs.s_ZF<-true; xs.s_SF<-false)
  else if r>@0l then (xs.s_ZF<-false; xs.s_SF<-false)
  else (xs.s_ZF<-false; xs.s_SF<-true)

let set_add_OF (d:int32) (s:int32) (r:int32) (xs:x86_state) : unit =
  let s64=Int64.of_int32 s in
  let d64=Int64.of_int32 d in
  if Int64.mul s64 d64 >=@@ 0L && Int64.mul (Int64.of_int32 r) s64 <@@ 0L
  then xs.s_OF <- true else xs.s_OF <- false

let set_sub_codes(r:int32) (xs:x86_state) : unit =
  if r=0l then (xs.s_ZF<-true;xs.s_SF<-false)
    else if r>@0l then (xs.s_ZF<-false;xs.s_SF<-false)
      else (xs.s_ZF<-false;xs.s_SF<-true)

let set_sub_OF(d:int32) (s:int32) (r:int32) (xs:x86_state) : unit =
  let s64=Int64.of_int32 s in
    let d64=Int64.of_int32 d in
      if (((Int64.mul (Int64.neg s64) d64) >=@@ 0L &&
       (Int64.mul (Int64.of_int32 r) (Int64.neg s64)) <@@ 0L) ||
       s = Int32.min_int)
      then xs.s_OF<-true else xs.s_OF<-false

let set_logic_flags (i:int32) (xs:x86_state) :unit =
  if i = 0l then (xs.s_ZF <- true; xs.s_SF<-false; xs.s_OF <- false)
  else if i >@0l then (xs.s_ZF <- false; xs.s_SF <- false; xs.s_OF <- false)
  else if i <@ 0l then (xs.s_OF <- false; xs.s_ZF <- false; xs.s_ZF <- true)

let set_sar_codes (d:int32) (a:int32) (xs:x86_state) : unit =
  if a = 1l then set_add_codes d xs;
  if a = 1l then xs.s_OF <- false
  else ()

let set_mul_OF(d:int32) (s:int32) (xs:x86_state) : unit =
  let s64=Int64.of_int32 s in
  let d64=Int64.of_int32 d in
  let r64=Int64.mul s64 d64 in
  if r64 >@@ Int64.of_int32 Int32.max_int || r64 <@@ 
    Int64.of_int32 Int32.min_int then xs.s_OF<-true
  else xs.s_OF<-false
  

let set_shl_codes (d:int32) (a:int32) (xs:x86_state) : unit =
  if a = 1l then
    set_add_codes d xs;
  if (a = 1l && not(get_bit 1 d =
      get_bit 0 d)) then xs.s_OF<-true
  else ()
  
let set_shr_codes (d:int32) (a:int32) (xs:x86_state) : unit =
  if a = 1l then
    set_add_codes d xs;
  if a = 1l then xs.s_OF<-(get_bit 31 d)
  else ()

let rec do_command(code:insn_block list)(i:insn) (xs:x86_state) : unit =
  begin match i with
    | Add (d,s) -> 
      begin match (d,s) with
        | (Reg x, Reg y) -> 
          set_add_OF xs.s_reg.(get_register_id x) xs.s_reg.(get_register_id y) 
            (xs.s_reg.(get_register_id x) 
            +@ xs.s_reg.(get_register_id y)) xs;
          set_add_codes (xs.s_reg.(get_register_id x)
           +@ xs.s_reg.(get_register_id y)) xs;
          xs.s_reg.(get_register_id x) <-
           xs.s_reg.(get_register_id x) +@ xs.s_reg.(get_register_id y);
        | (Reg x, Imm y) ->
          set_add_OF xs.s_reg.(get_register_id x) y 
            (xs.s_reg.(get_register_id x) +@ y) xs;
          set_add_codes (xs.s_reg.(get_register_id x) +@ y) xs;
          xs.s_reg.(get_register_id x) <- 
          xs.s_reg.(get_register_id x) +@ y
          
        | (Imm x, _) -> raise (X86_segmentation_fault "FAIL!")
        | (Lbl x, _) -> raise (X86_segmentation_fault "FAIL!")
        | (Ind x, Imm y) -> 
          set_add_OF xs.s_mem.(map_addr(get_ind x xs)) y 
            (xs.s_mem.(map_addr(get_ind x xs)) +@ y) xs;
          set_add_codes (xs.s_mem.(map_addr(get_ind x xs)) +@ y) xs;
          xs.s_mem.(map_addr (get_ind x xs)) <-
          xs.s_mem.(map_addr(get_ind x xs)) +@ y;
        | (Ind x, Reg y) -> 
          set_add_OF xs.s_mem.(map_addr(get_ind x xs)) 
            xs.s_reg.(get_register_id y) 
            (xs.s_mem.(map_addr(get_ind x xs)) +@ 
            xs.s_reg.(get_register_id y)) xs; 
          set_add_codes (xs.s_mem.(map_addr(get_ind x xs)) +@
           xs.s_reg.(get_register_id y)) xs;
          xs.s_mem.(map_addr (get_ind x xs)) <-
          xs.s_mem.(map_addr(get_ind x xs)) +@ xs.s_reg.(get_register_id y);
        | (Ind x, Ind y) -> 
          set_add_OF xs.s_mem.(map_addr(get_ind x xs)) 
            xs.s_mem.(map_addr(get_ind y xs)) 
            (xs.s_mem.(map_addr(get_ind x xs)) +@ 
            xs.s_mem.(map_addr(get_ind y xs))) xs;     
          set_add_codes (xs.s_mem.(map_addr(get_ind x xs)) +@
          xs.s_mem.(map_addr(get_ind y xs))) xs;     
          xs.s_mem.(map_addr (get_ind x xs)) <-
          xs.s_mem.(map_addr(get_ind x xs)) +@
          xs.s_mem.(map_addr(get_ind y xs));
        | (Ind x, Lbl y) -> raise (X86_segmentation_fault "FAIL!")
        | (Reg x, Ind y) -> 
          set_add_OF xs.s_reg.(get_register_id x) 
            xs.s_mem.(map_addr (get_ind y xs))
            (xs.s_reg.(get_register_id x) +@ 
            xs.s_mem.(map_addr (get_ind y xs))) xs;
          set_add_codes (xs.s_reg.(get_register_id x) +@ 
            xs.s_mem.(map_addr (get_ind y xs))) xs;
          xs.s_reg.(get_register_id x) <- 
          xs.s_reg.(get_register_id x) +@ xs.s_mem.(map_addr (get_ind y xs));
        | (Reg x, Lbl y) -> raise (X86_segmentation_fault "FAIL!")
      end
    | Neg o ->
      begin match o with
        | Reg x ->
          xs.s_reg.(get_register_id x) <-
          Int32.neg(xs.s_reg.(get_register_id x));
          set_neg_codes (xs.s_reg.(get_register_id x)) xs;
        | Imm x -> ()
        | Lbl x -> raise (X86_segmentation_fault "FAIL!")
        | Ind x -> xs.s_mem.(map_addr (get_ind x xs)) <-
          Int32.neg(xs.s_mem.(map_addr (get_ind x xs)));
          set_neg_codes (xs.s_mem.(map_addr (get_ind x xs))) xs
      end
    | Sub (d,s) ->
      begin match (d,s) with
        | (Reg x, Reg y) -> 
          set_sub_OF xs.s_reg.(get_register_id x) xs.s_reg.(get_register_id y) 
            (xs.s_reg.(get_register_id x) -@ xs.s_reg.(get_register_id y)) xs;
          set_sub_codes (xs.s_reg.(get_register_id x) -@ 
          xs.s_reg.(get_register_id y)) xs;
          xs.s_reg.(get_register_id x) <- xs.s_reg.(get_register_id x) -@ 
          xs.s_reg.(get_register_id y);
        | (Reg x, Imm y) ->
          set_sub_OF xs.s_reg.(get_register_id x) y 
            (xs.s_reg.(get_register_id x) -@ y) xs;
          set_sub_codes (xs.s_reg.(get_register_id x) -@ y) xs;
          xs.s_reg.(get_register_id x) <- 
          xs.s_reg.(get_register_id x) -@ y
          
        | (Imm x, _) -> raise (X86_segmentation_fault "FAIL!")
        | (Lbl x, _) -> raise (X86_segmentation_fault "FAIL!")
        | (Ind x, Imm y) -> 
          set_sub_OF xs.s_mem.(map_addr(get_ind x xs)) y 
            (xs.s_mem.(map_addr(get_ind x xs)) -@ y) xs;
          set_sub_codes (xs.s_mem.(map_addr(get_ind x xs)) -@ y) xs;
          xs.s_mem.(map_addr (get_ind x xs)) <-
          xs.s_mem.(map_addr(get_ind x xs)) -@ y;
        | (Ind x, Reg y) -> 
          set_sub_OF xs.s_mem.(map_addr(get_ind x xs)) 
            xs.s_reg.(get_register_id y) 
            (xs.s_mem.(map_addr(get_ind x xs)) -@ 
            xs.s_reg.(get_register_id y)) xs; 
          set_sub_codes (xs.s_mem.(map_addr(get_ind x xs)) -@
           xs.s_reg.(get_register_id y)) xs;
          xs.s_mem.(map_addr (get_ind x xs)) <-
          xs.s_mem.(map_addr(get_ind x xs)) -@ xs.s_reg.(get_register_id y);
        | (Ind x, Ind y) -> 
          set_sub_OF xs.s_mem.(map_addr(get_ind x xs)) 
            xs.s_mem.(map_addr(get_ind y xs)) 
            (xs.s_mem.(map_addr(get_ind x xs)) -@ 
            xs.s_mem.(map_addr(get_ind y xs))) xs;     
          set_sub_codes (xs.s_mem.(map_addr(get_ind x xs)) -@
          xs.s_mem.(map_addr(get_ind y xs))) xs;     
          xs.s_mem.(map_addr (get_ind x xs)) <-
          xs.s_mem.(map_addr(get_ind x xs)) -@
          xs.s_mem.(map_addr(get_ind y xs));
        | (Ind x, Lbl y) -> raise (X86_segmentation_fault "FAIL!")
        | (Reg x, Ind y) -> 
          set_sub_OF xs.s_reg.(get_register_id x) 
            xs.s_mem.(map_addr (get_ind y xs))
            (xs.s_reg.(get_register_id x) -@ 
            xs.s_mem.(map_addr (get_ind y xs))) xs;
          set_sub_codes (xs.s_reg.(get_register_id x) -@ 
            xs.s_mem.(map_addr (get_ind y xs))) xs;
          xs.s_reg.(get_register_id x) <- 
          xs.s_reg.(get_register_id x) -@ xs.s_mem.(map_addr (get_ind y xs));
        | (Reg x, Lbl y) -> raise (X86_segmentation_fault "FAIL!")
      end
    | Lea (d,s) -> xs.s_reg.(get_register_id d) <-
          (get_ind s xs)
    | Mov (d,s) ->
      begin match (d,s) with
        | (Reg x, Reg y) -> xs.s_reg.(get_register_id x) <- 
          xs.s_reg.(get_register_id y)
        | (Reg x, Imm y) -> xs.s_reg.(get_register_id x) <- 
          y
        | (Reg x, Ind y) -> xs.s_reg.(get_register_id x) <- 
          xs.s_mem.(map_addr (get_ind y xs))
        | (Reg x, Lbl y) -> ()
        | (Imm x, _) -> ()
        | (Lbl x, _) -> ()
        | (Ind x, Reg y) -> xs.s_mem.(map_addr (get_ind x xs)) <-
          xs.s_reg.(get_register_id y)
        | (Ind x, Imm y) -> xs.s_mem.(map_addr (get_ind x xs)) <- y
        | (Ind x, Lbl y) -> ()
        | (Ind x, Ind y) -> xs.s_mem.(map_addr (get_ind x xs)) <-
          xs.s_mem.(map_addr (get_ind y xs))
      end
    | Shl (d,s) ->
      begin match (d,s) with
        | (Reg x, Reg y) ->
           set_sar_codes xs.s_reg.(get_register_id x)
             xs.s_reg.(get_register_id y) xs;
           xs.s_reg.(get_register_id x) <- 
           Int32.shift_left xs.s_reg.(get_register_id x)
           (Int32.to_int xs.s_reg.(get_register_id y))
        | (Reg x, Imm y) ->
           set_sar_codes xs.s_reg.(get_register_id x) y xs;
           xs.s_reg.(get_register_id x) <- 
           Int32.shift_left xs.s_reg.(get_register_id x) (Int32.to_int y);
        | (Imm x, _) -> raise (X86_segmentation_fault "FAIL!")
        | (Lbl x, _) -> raise (X86_segmentation_fault "FAIL!")
        | (Ind x, Imm y) ->
          set_sar_codes xs.s_mem.(map_addr (get_ind x xs)) y xs;
           xs.s_mem.(map_addr (get_ind x xs)) <-
           Int32.shift_left xs.s_mem.(map_addr(get_ind x xs))
             (Int32.to_int y);
        | (Ind x, Reg y) ->
          set_sar_codes xs.s_mem.(map_addr (get_ind x xs))
            xs.s_reg.(get_register_id y) xs;
          xs.s_mem.(map_addr (get_ind x xs)) <-
           Int32.shift_left xs.s_mem.(map_addr(get_ind x xs))
           (Int32.to_int xs.s_reg.(get_register_id y))
        | (Ind x, Ind y) ->
           set_sar_codes xs.s_mem.(map_addr (get_ind x xs))
           xs.s_mem.(map_addr (get_ind y xs)) xs;
           xs.s_mem.(map_addr (get_ind x xs)) <-
           Int32.shift_left xs.s_mem.(map_addr(get_ind x xs))
           (Int32.to_int xs.s_mem.(map_addr(get_ind y xs)))
        | (Ind x, Lbl y) -> raise (X86_segmentation_fault "FAIL!")
        | (Reg x, Ind y) ->
          set_sar_codes xs.s_reg.(get_register_id x)
          xs.s_mem.(map_addr (get_ind y xs)) xs;
          xs.s_reg.(get_register_id x) <- 
          Int32.shift_left xs.s_reg.(get_register_id x)
            (Int32.to_int xs.s_mem.(map_addr (get_ind y xs)))
        | (Reg x, Lbl y) -> raise (X86_segmentation_fault "FAIL!")
      end
    | Sar (d,s) ->
      begin match (d,s) with
         | (Reg x, Reg y) ->
           set_sar_codes xs.s_reg.(get_register_id x)
             xs.s_reg.(get_register_id y) xs;
           xs.s_reg.(get_register_id x) <- 
           Int32.shift_right xs.s_reg.(get_register_id x)
           (Int32.to_int xs.s_reg.(get_register_id y))
        | (Reg x, Imm y) ->
           set_sar_codes xs.s_reg.(get_register_id x) y xs;
           xs.s_reg.(get_register_id x) <- 
           Int32.shift_right xs.s_reg.(get_register_id x) (Int32.to_int y);
        | (Imm x, _) -> raise (X86_segmentation_fault "FAIL!")
        | (Lbl x, _) -> raise (X86_segmentation_fault "FAIL!")
        | (Ind x, Imm y) ->
          set_sar_codes xs.s_mem.(map_addr (get_ind x xs)) y xs;
           xs.s_mem.(map_addr (get_ind x xs)) <-
           Int32.shift_right xs.s_mem.(map_addr(get_ind x xs)) (Int32.to_int y);
        | (Ind x, Reg y) ->
          set_sar_codes xs.s_mem.(map_addr (get_ind x xs))
            xs.s_reg.(get_register_id y) xs;
          xs.s_mem.(map_addr (get_ind x xs)) <-
           Int32.shift_right xs.s_mem.(map_addr(get_ind x xs))
           (Int32.to_int xs.s_reg.(get_register_id y))
        | (Ind x, Ind y) ->
           set_sar_codes xs.s_mem.(map_addr (get_ind x xs))
           xs.s_mem.(map_addr (get_ind y xs)) xs;
           xs.s_mem.(map_addr (get_ind x xs)) <-
           Int32.shift_right xs.s_mem.(map_addr(get_ind x xs))
           (Int32.to_int xs.s_mem.(map_addr(get_ind y xs)))
        | (Ind x, Lbl y) -> raise (X86_segmentation_fault "FAIL!")
        | (Reg x, Ind y) ->
          set_sar_codes xs.s_reg.(get_register_id x)
          xs.s_mem.(map_addr (get_ind y xs)) xs;
          xs.s_reg.(get_register_id x) <- 
          Int32.shift_right xs.s_reg.(get_register_id x)
            (Int32.to_int xs.s_mem.(map_addr (get_ind y xs)))
        | (Reg x, Lbl y) -> raise (X86_segmentation_fault "FAIL!")
      end 
    | Shr (d,s) ->
      begin match (d,s) with
        | (Reg x, Reg y) ->
           set_sar_codes xs.s_reg.(get_register_id x)
             xs.s_reg.(get_register_id y) xs;
           xs.s_reg.(get_register_id x) <- 
           Int32.shift_right_logical xs.s_reg.(get_register_id x)
           (Int32.to_int xs.s_reg.(get_register_id y))
        | (Reg x, Imm y) ->
           set_sar_codes xs.s_reg.(get_register_id x) y xs;
           xs.s_reg.(get_register_id x) <- 
           Int32.shift_right_logical xs.s_reg.(get_register_id x) 
          (Int32.to_int y);
        | (Imm x, _) -> raise (X86_segmentation_fault "FAIL!")
        | (Lbl x, _) -> raise (X86_segmentation_fault "FAIL!")
        | (Ind x, Imm y) ->
          set_sar_codes xs.s_mem.(map_addr (get_ind x xs)) y xs;
           xs.s_mem.(map_addr (get_ind x xs)) <-
           Int32.shift_right_logical xs.s_mem.(map_addr(get_ind x xs)) 
          (Int32.to_int y);
        | (Ind x, Reg y) ->
          set_sar_codes xs.s_mem.(map_addr (get_ind x xs))
            xs.s_reg.(get_register_id y) xs;
          xs.s_mem.(map_addr (get_ind x xs)) <-
           Int32.shift_right_logical xs.s_mem.(map_addr(get_ind x xs))
           (Int32.to_int xs.s_reg.(get_register_id y))
        | (Ind x, Ind y) ->
           set_sar_codes xs.s_mem.(map_addr (get_ind x xs))
           xs.s_mem.(map_addr (get_ind y xs)) xs;
           xs.s_mem.(map_addr (get_ind x xs)) <-
           Int32.shift_right_logical xs.s_mem.(map_addr(get_ind x xs))
           (Int32.to_int xs.s_mem.(map_addr(get_ind y xs)))
        | (Ind x, Lbl y) -> raise (X86_segmentation_fault "FAIL!")
        | (Reg x, Ind y) ->
          set_sar_codes xs.s_reg.(get_register_id x)
          xs.s_mem.(map_addr (get_ind y xs)) xs;
          xs.s_reg.(get_register_id x) <- 
          Int32.shift_right_logical xs.s_reg.(get_register_id x)
            (Int32.to_int xs.s_mem.(map_addr (get_ind y xs)))
        | (Reg x, Lbl y) -> raise (X86_segmentation_fault "FAIL!")
      end 
    | Not o     -> 
      begin match o with
        | Imm x -> raise (X86_segmentation_fault "Error")
        | Reg x -> xs.s_reg.(get_register_id x) <-
          Int32.lognot xs.s_reg.(get_register_id x)
        | Lbl x -> raise (X86_segmentation_fault "Error")
        | Ind x -> xs.s_mem.(map_addr (get_ind x xs)) <-
          Int32.lognot xs.s_mem.(map_addr (get_ind x xs))
      end
    | And (d,s) -> 
        begin match (d,s) with
        | (Reg x, Reg y) -> xs.s_reg.(get_register_id x) <- 
           Int32.logand xs.s_reg.(get_register_id y)
           xs.s_reg.(get_register_id x);
           set_logic_flags xs.s_reg.(get_register_id x) xs
        | (Reg x, Imm y) -> xs.s_reg.(get_register_id x) <- 
           Int32.logand y xs.s_reg.(get_register_id x);
           set_logic_flags xs.s_reg.(get_register_id x) xs
        | (Imm x, _) -> raise (X86_segmentation_fault "FAIL!")
        | (Lbl x, _) -> raise (X86_segmentation_fault "FAIL!")
        | (Ind x, Imm y) -> xs.s_mem.(map_addr (get_ind x xs)) <-
           Int32.logand y xs.s_mem.(map_addr(get_ind x xs));
           set_logic_flags xs.s_mem.(map_addr(get_ind x xs)) xs
        | (Ind x, Reg y) -> xs.s_mem.(map_addr (get_ind x xs)) <-
           Int32.logand xs.s_mem.(map_addr(get_ind x xs))
           xs.s_reg.(get_register_id y);
           set_logic_flags xs.s_mem.(map_addr(get_ind x xs)) xs
        | (Ind x, Ind y) -> xs.s_mem.(map_addr (get_ind x xs)) <-
           Int32.logand xs.s_mem.(map_addr(get_ind x xs))
           xs.s_mem.(map_addr(get_ind y xs));
           set_logic_flags xs.s_mem.(map_addr(get_ind x xs)) xs
        | (Ind x, Lbl y) -> raise (X86_segmentation_fault "FAIL!")
        | (Reg x, Ind y) -> xs.s_reg.(get_register_id x) <- 
          Int32.logand xs.s_mem.(map_addr (get_ind y xs))
          xs.s_reg.(get_register_id x);
          set_logic_flags xs.s_reg.(get_register_id x) xs
        | (Reg x, Lbl y) -> raise (X86_segmentation_fault "FAIL!")
      end
    | Or (d,s)  -> 
        begin match (d,s) with
        | (Reg x, Reg y) -> xs.s_reg.(get_register_id x) <- 
           Int32.logor xs.s_reg.(get_register_id y)
           xs.s_reg.(get_register_id x);
           set_logic_flags xs.s_reg.(get_register_id x) xs
        | (Reg x, Imm y) -> xs.s_reg.(get_register_id x) <- 
           Int32.logor y xs.s_reg.(get_register_id x);
           set_logic_flags xs.s_reg.(get_register_id x) xs
        | (Imm x, _) -> raise (X86_segmentation_fault "FAIL!")
        | (Lbl x, _) -> raise (X86_segmentation_fault "FAIL!")
        | (Ind x, Imm y) -> xs.s_mem.(map_addr (get_ind x xs)) <-
           Int32.logor y xs.s_mem.(map_addr(get_ind x xs));
           set_logic_flags xs.s_mem.(map_addr(get_ind x xs)) xs
        | (Ind x, Reg y) -> xs.s_mem.(map_addr (get_ind x xs)) <-
           Int32.logor xs.s_mem.(map_addr(get_ind x xs))
           xs.s_reg.(get_register_id y);
           set_logic_flags xs.s_mem.(map_addr(get_ind x xs)) xs
        | (Ind x, Ind y) -> xs.s_mem.(map_addr (get_ind x xs)) <-
           Int32.logor xs.s_mem.(map_addr(get_ind x xs))
           xs.s_mem.(map_addr(get_ind y xs));
           set_logic_flags xs.s_mem.(map_addr(get_ind x xs)) xs
        | (Ind x, Lbl y) -> raise (X86_segmentation_fault "FAIL!")
        | (Reg x, Ind y) -> xs.s_reg.(get_register_id x) <- 
          Int32.logor xs.s_mem.(map_addr (get_ind y xs))
          xs.s_reg.(get_register_id x);
          set_logic_flags xs.s_reg.(get_register_id x) xs
        | (Reg x, Lbl y) -> raise (X86_segmentation_fault "FAIL!")
      end
    | Xor (d,s) -> 
      begin match (d,s) with
        | (Reg x, Reg y) -> xs.s_reg.(get_register_id x) <- 
           Int32.logxor xs.s_reg.(get_register_id y)
           xs.s_reg.(get_register_id x);
           set_logic_flags xs.s_reg.(get_register_id x) xs
        | (Reg x, Imm y) -> xs.s_reg.(get_register_id x) <- 
           Int32.logxor y xs.s_reg.(get_register_id x);
           set_logic_flags xs.s_reg.(get_register_id x) xs
        | (Imm x, _) -> raise (X86_segmentation_fault "FAIL!")
        | (Lbl x, _) -> raise (X86_segmentation_fault "FAIL!")
        | (Ind x, Imm y) -> xs.s_mem.(map_addr (get_ind x xs)) <-
           Int32.logxor y xs.s_mem.(map_addr(get_ind x xs));
           set_logic_flags xs.s_mem.(map_addr(get_ind x xs)) xs
        | (Ind x, Reg y) -> xs.s_mem.(map_addr (get_ind x xs)) <-
           Int32.logxor xs.s_mem.(map_addr(get_ind x xs))
           xs.s_reg.(get_register_id y);
           set_logic_flags xs.s_mem.(map_addr(get_ind x xs)) xs
        | (Ind x, Ind y) -> xs.s_mem.(map_addr (get_ind x xs)) <-
           Int32.logxor xs.s_mem.(map_addr(get_ind x xs))
           xs.s_mem.(map_addr(get_ind y xs));
           set_logic_flags xs.s_mem.(map_addr(get_ind x xs)) xs
        | (Ind x, Lbl y) -> raise (X86_segmentation_fault "FAIL!")
        | (Reg x, Ind y) -> xs.s_reg.(get_register_id x) <- 
          Int32.logxor xs.s_mem.(map_addr (get_ind y xs))
          xs.s_reg.(get_register_id x);
          set_logic_flags xs.s_reg.(get_register_id x) xs
        | (Reg x, Lbl y) -> raise (X86_segmentation_fault "FAIL!")
      end
    | Push o ->
      begin match o with
        | Reg x -> xs.s_reg.(get_register_id Esp) <-
          xs.s_reg.(get_register_id Esp) -@ 4l;
          xs.s_mem.(map_addr(xs.s_reg.(get_register_id Esp))) <- 
          xs.s_reg.(get_register_id x)
        | Imm x ->
          xs.s_reg.(get_register_id Esp) <-
          xs.s_reg.(get_register_id Esp) -@ 4l;
          xs.s_mem.(map_addr(xs.s_reg.(get_register_id Esp))) <- x
        | Lbl x -> ()
        | Ind x -> xs.s_reg.(get_register_id Esp) <-
          xs.s_reg.(get_register_id Esp) -@ 4l;
          xs.s_mem.(Int32.to_int(xs.s_reg.(get_register_id Esp))) <- 
          xs.s_mem.(map_addr(get_ind x xs))
      end
    | Pop o ->
      begin match o with
        | Reg x -> 
          xs.s_reg.(get_register_id x) <-
          xs.s_mem.(map_addr(xs.s_reg.(get_register_id Esp)));
          xs.s_reg.(get_register_id Esp) <-
          xs.s_reg.(get_register_id Esp) +@ 4l;
        | Imm x -> ()
        | Lbl x -> ()
        | Ind x -> 
          xs.s_mem.(map_addr(get_ind x xs)) <-
          xs.s_mem.(map_addr(xs.s_reg.(get_register_id Esp)));
          xs.s_reg.(get_register_id Esp) <-
          xs.s_reg.(get_register_id Esp) +@ 4l;
      end
    | Cmp (c1,c2)    ->
      begin match (c1,c2) with
        | (Reg x, Reg y) -> 
          set_sub_OF xs.s_reg.(get_register_id x) xs.s_reg.(get_register_id y) 
            (xs.s_reg.(get_register_id x) -@ xs.s_reg.(get_register_id y)) xs;
          set_sub_codes (xs.s_reg.(get_register_id x)
            -@ xs.s_reg.(get_register_id y)) xs;
        | (Reg x, Imm y) ->
          set_sub_OF xs.s_reg.(get_register_id x) y 
            (xs.s_reg.(get_register_id x) -@ y) xs;
          set_sub_codes (xs.s_reg.(get_register_id x) -@ y) xs;
        | (Imm x, Reg y) -> 
          set_sub_OF  x xs.s_reg.(get_register_id y)
            (x -@ xs.s_reg.(get_register_id y)) xs;
          set_sub_codes (x -@ xs.s_reg.(get_register_id y)) xs;
        | (Imm x, Imm y) -> 
          set_sub_OF  x y
            (x -@ y) xs;
          set_sub_codes (x -@ y) xs;
        | (Imm x, Ind y) -> 
          set_sub_OF  x xs.s_mem.(map_addr(get_ind y xs))
            (x -@ xs.s_mem.(map_addr(get_ind y xs))) xs;
          set_sub_codes (x -@ xs.s_mem.(map_addr(get_ind y xs))) xs;
        | (Imm x, Lbl y) -> raise (X86_segmentation_fault "FAIL!")
        | (Lbl x, _) -> raise (X86_segmentation_fault "FAIL!")
        | (Ind x, Imm y) -> 
          set_sub_OF xs.s_mem.(map_addr(get_ind x xs)) y 
            (xs.s_mem.(map_addr(get_ind x xs)) -@ y) xs;
          set_sub_codes (xs.s_mem.(map_addr(get_ind x xs)) -@ y) xs;
        | (Ind x, Reg y) -> 
          set_sub_OF xs.s_mem.(map_addr(get_ind x xs)) 
            xs.s_reg.(get_register_id y) 
            (xs.s_mem.(map_addr(get_ind x xs)) -@ 
            xs.s_reg.(get_register_id y)) xs; 
          set_sub_codes (xs.s_mem.(map_addr(get_ind x xs)) -@
           xs.s_reg.(get_register_id y)) xs;
        | (Ind x, Ind y) -> 
          set_sub_OF xs.s_mem.(map_addr(get_ind x xs)) 
            xs.s_mem.(map_addr(get_ind y xs)) 
            (xs.s_mem.(map_addr(get_ind x xs)) -@ 
            xs.s_mem.(map_addr(get_ind y xs))) xs;     
          set_sub_codes (xs.s_mem.(map_addr(get_ind x xs)) -@
          xs.s_mem.(map_addr(get_ind y xs))) xs;     
        | (Ind x, Lbl y) -> raise (X86_segmentation_fault "FAIL!")
        | (Reg x, Ind y) -> 
          set_sub_OF xs.s_reg.(get_register_id x) 
            xs.s_mem.(map_addr (get_ind y xs))
            (xs.s_reg.(get_register_id x) -@ 
            xs.s_mem.(map_addr (get_ind y xs))) xs;
          set_sub_codes (xs.s_reg.(get_register_id x) -@ 
            xs.s_mem.(map_addr (get_ind y xs))) xs;
        | (Reg x, Lbl y) -> raise (X86_segmentation_fault "FAIL!")
      end
    | Setb (dest,cc) ->
      begin match dest with
        | Reg x -> 
      if condition_matches xs cc then xs.s_reg.(get_register_id x)
        <- Int32.logor(Int32.logand xs.s_reg.(get_register_id x) 0xFFFFFF00l) 1l
      else  xs.s_reg.(get_register_id x) <- 
        Int32.logand xs.s_reg.(get_register_id x) 0xFFFFFF00l
        | Imm x -> raise (X86_segmentation_fault "FAIL!")
        | Ind x -> raise (X86_segmentation_fault "FAIL!")
        | Lbl x -> raise (X86_segmentation_fault "FAIL!")
      end
    | Jmp o     ->
      begin match o with
        | Reg x -> raise (X86_segmentation_fault "FAIL!")
        | Imm x -> raise (X86_segmentation_fault "FAIL!")
        | Ind x -> raise (X86_segmentation_fault "FAIL!")
        | Lbl x -> interpret code xs x
      end
    | Call o -> xs.s_reg.(get_register_id Esp) <-
      xs.s_reg.(get_register_id Esp) -@ 4l;
      begin match o with
        | Reg x -> raise (X86_segmentation_fault "FAIL!")
        | Imm x -> raise (X86_segmentation_fault "FAIL!")
        | Ind x -> raise (X86_segmentation_fault "FAIL!")
        | Lbl x -> interpret code xs x
      end
    | Ret -> xs.s_reg.(get_register_id Esp) <-
      xs.s_reg.(get_register_id Esp) +@ 4l; ()
    | J (cond,lbl) -> if condition_matches xs cond then
      interpret code xs lbl else ()
    | Imul (d,s) ->
      begin match s with
        | Reg x -> 
          set_mul_OF xs.s_reg.(get_register_id d) 
          xs.s_reg.(get_register_id x) xs;
          xs.s_reg.(get_register_id d) <- 
          xs.s_reg.(get_register_id d) *@ xs.s_reg.(get_register_id x)
        | Imm y -> 
          set_mul_OF xs.s_reg.(get_register_id d) y xs;
          xs.s_reg.(get_register_id d) <- 
          xs.s_reg.(get_register_id d) *@ y
        | Ind y -> 
          set_mul_OF xs.s_reg.(get_register_id d) 
          xs.s_mem.(map_addr (get_ind y xs)) xs;
          xs.s_reg.(get_register_id d) <- 
          xs.s_reg.(get_register_id d) *@ xs.s_mem.(map_addr (get_ind y xs))
        | Lbl y -> raise (X86_segmentation_fault "FAIL!")
      end
  end

let interpret (code:insn_block list) (xs:x86_state) (l:lbl) : unit =
failwith "unimplemented"

      
let run (code:insn_block list) : int32 =
  let main = X86.mk_lbl_named "main" in
  let xs = mk_init_state () in
  let _ = interpret code xs main in
    xs.s_reg.(eaxi)
      
