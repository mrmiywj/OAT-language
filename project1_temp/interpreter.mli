(** CIS341: Project 1 Interpreter 
    @author Steve Zdancewic 
*)

(* Do NOT modify this file -- we will overwrite it with our *)
(* own version when we test your homework.                  *)

(** Simulates a segmentation fault *)
exception X86_segmentation_fault of string

(** Returns the index of a register in the register file. *)
val get_register_id : X86.reg -> int

(** Size of the interpreter's memory *)
val mem_size : int

(** Largest memory mapped location *)
val mem_top : int32

(** Smallest memory mapped location *)
val mem_bot : int32

(** X86 Interpreter's Machine state
		
    This interpreter treats code addresses abstractly-- 
    that is, it doesn't map code labels to addresses in memory. 
    As a consequence, the interpreter's EIP (the instruction pointer)
    is implicit -- see the project description for more explanation.
  *)
type x86_state = {
  s_mem : int32 array;    (* 1024 32-bit words -- the heap *)
  s_reg : int32 array;    (* 8 32-bit words -- the register file *)
  mutable s_OF : bool;    (* overflow flag *)
  mutable s_SF : bool;    (* sign bit flag *)
  mutable s_ZF : bool;    (* zero flag *)
}

(** Creates an initial X86 machine configuration.  All values should
    be initialized to 0, save for Esp which should start at
    xFFFFFFFC.  *)
val mk_init_state : unit -> x86_state

(** Maps an object-level [int32] X86 machine address to an interpreter
    array index for [s_mem]. 
    
    Throws an X86_segmentation_fault exception if the
    address is unaligned or not within the 1024-words of the
    interpreter's simulated address space.

    Call this function in your interpreter to transform concrete 
    X86 addressses to interpreter array indices -- it will ensure that 
    all reads and writes are aligned to 32-bit boundaries (that is,
    every memory address is evenly divisible by 4).
*)
val map_addr : int32 -> int

(** Determines whether the condition is satisfied in the given state *)
val condition_matches : x86_state -> X86.cnd -> bool

(** Runs the interpreter from a given machine state and starting
    code label, assuming that the program text is given by 
    the [insn_block list]. 

    If the resulting program tries to jump to code not mapped by
    [insn_block list], this function raises an
    [X86_segmentation_fault] exception.

    The interpreter's behavior is undefined if the [insn_block_list]
    has multiple blocks with identical code labels (none of our 
    tests will provide such ill-formed programs).  

    Code blocks that do not end in a branch or [Ret] instruction
    are considered invalid for the purposes of the interpreter (there
    is no "fall through" from one block to another).  If the
    interpreter reaches the end of an invalid [insn_block], it 
    should raise an [X86_segmentation_fault].
*)
val interpret : X86.insn_block list -> x86_state -> X86.lbl -> unit

(** Runs the interpreter starting from the initial machine state and
    the code label "main", assuming that the program text is given by
    the [insn_block list].  The "main" program should terminate via a
    [Ret] instruction, in which case the output of the [run] function is
    the contents of the Eax register.  

    [run] simply calls [interpret] with appropriate arugments, so this
    function raises X86_segmentation_fault if the program tries to
    access unmapped memory locations or jump to a code label not
    mapped by the [insn_block list], or if it tries to execute an
    instruction block that doesn't end in a jump or return. Its
    behavior (like [interpret]'s) is undefined in the case that the
    [insn_block list] has multiple blocks with identical code labels.
*)
val run : X86.insn_block list -> int32

(** Prints the machine state to standard out (for debugging). *)
val print_state : x86_state -> unit
