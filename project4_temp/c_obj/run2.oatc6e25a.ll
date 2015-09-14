declare i8** @string_of_array({ i32, [ 0 x i32 ] }**)
declare { i32, [ 0 x i32 ] }** @array_of_string(i8**)
declare void @print_string(i8**)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32** @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }** @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@i406 = global i32 0, align 4
define void @oat_init (){

__fresh92:
  ret void
}


define i32 @program (i32 %argc425, { i32, [ 0 x i8** ] }** %argv423){

__fresh91:
  %argc_slot426 = alloca i32
  store i32 %argc425, i32** %argc_slot426
  %argv_slot424 = alloca { i32, [ 0 x i8** ] }**
  store { i32, [ 0 x i8** ] }** %argv423, { i32, [ 0 x i8** ] }**** %argv_slot424
  %x427 = alloca i32
  store i32 3, i32** %x427
  %y428 = alloca i32
  store i32 3, i32** %y428
  %_lhs430 = load i32** %y428
  %_lhs429 = load i32** %x427
  %ret431 = call i32 @f ( i32 %_lhs429, i32 %_lhs430 )
  %_lhs432 = load i32** @i406
  %bop433 = add i32 %ret431, %_lhs432
  ret i32 %bop433
}


define i32 @f (i32 %x409, i32 %y407){

__fresh88:
  %x_slot410 = alloca i32
  store i32 %x409, i32** %x_slot410
  %y_slot408 = alloca i32
  store i32 %y407, i32** %y_slot408
  %r411 = alloca i32
  store i32 0, i32** %r411
  %_lhs412 = load i32** %x_slot410
  %bop413 = icmp sge i32 %_lhs412, 1
  br i1 %bop413, label %__then87, label %__else86

__fresh89:
  br label %__then87

__then87:
  %_lhs416 = load i32** %y_slot408
  %_lhs414 = load i32** %x_slot410
  %bop415 = sub i32 %_lhs414, 1
  %ret417 = call i32 @f ( i32 %bop415, i32 %_lhs416 )
  %bop418 = add i32 1, %ret417
  store i32 %bop418, i32** %r411
  br label %__merge85

__fresh90:
  br label %__else86

__else86:
  %_lhs419 = load i32** %x_slot410
  %_lhs420 = load i32** %y_slot408
  %bop421 = add i32 %_lhs419, %_lhs420
  store i32 %bop421, i32** %r411
  br label %__merge85

__merge85:
  %_lhs422 = load i32** %r411
  ret i32 %_lhs422
}


