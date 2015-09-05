val llvm_backend : bool ref
module type BACKEND =
  sig
    type cunit
    val codegen : Ll.prog -> cunit
    val write : out_channel -> cunit -> unit
  end
module DefaultBackend : BACKEND
module LLVMBackend : BACKEND
module Make :
  functor (Backend : BACKEND) ->
    sig
      val compile : Lexing.lexbuf -> Backend.cunit
      val compile_file : string -> string -> unit
      val write : out_channel -> Backend.cunit -> unit
    end
