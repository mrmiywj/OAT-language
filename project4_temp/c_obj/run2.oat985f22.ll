declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@i401 = global i32 0, align 4
define void @oat_init (){

__fresh92:
  ret void
}


define i32 @program (i32 %argc420, { i32, [ 0 x i8* ] }* %argv418){

__fresh91:
  %argc_slot421 = alloca i32
  store i32 %argc420, i32* %argc_slot421
  %argv_slot419 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv418, { i32, [ 0 x i8* ] }** %argv_slot419
  %x422 = alloca i32
  store i32 3, i32* %x422
  %y423 = alloca i32
  store i32 3, i32* %y423
  %_lhs425 = load i32* %y423
  %_lhs424 = load i32* %x422
  %ret426 = call i32 @f ( i32 %_lhs424, i32 %_lhs425 )
  %_lhs427 = load i32* @i401
  %bop428 = add i32 %ret426, %_lhs427
  ret i32 %bop428
}


define i32 @f (i32 %x404, i32 %y402){

__fresh88:
  %x_slot405 = alloca i32
  store i32 %x404, i32* %x_slot405
  %y_slot403 = alloca i32
  store i32 %y402, i32* %y_slot403
  %r406 = alloca i32
  store i32 0, i32* %r406
  %_lhs407 = load i32* %x_slot405
  %bop408 = icmp sge i32 %_lhs407, 1
  br i1 %bop408, label %__then87, label %__else86

__fresh89:
  br label %__then87

__then87:
  %_lhs411 = load i32* %y_slot403
  %_lhs409 = load i32* %x_slot405
  %bop410 = sub i32 %_lhs409, 1
  %ret412 = call i32 @f ( i32 %bop410, i32 %_lhs411 )
  %bop413 = add i32 1, %ret412
  store i32 %bop413, i32* %r406
  br label %__merge85

__fresh90:
  br label %__else86

__else86:
  %_lhs414 = load i32* %x_slot405
  %_lhs415 = load i32* %y_slot403
  %bop416 = add i32 %_lhs414, %_lhs415
  store i32 %bop416, i32* %r406
  br label %__merge85

__merge85:
  %_lhs417 = load i32* %r406
  ret i32 %_lhs417
}


