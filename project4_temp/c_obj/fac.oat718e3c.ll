declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh458:
  ret void
}


define i32 @program (i32 %argc2540, { i32, [ 0 x i8* ] }* %argv2538){

__fresh457:
  %argc_slot2541 = alloca i32
  store i32 %argc2540, i32* %argc_slot2541
  %argv_slot2539 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv2538, { i32, [ 0 x i8* ] }** %argv_slot2539
  %ret2542 = call i32 @f ( i32 5 )
  ret i32 %ret2542
}


define i32 @f (i32 %i2527){

__fresh454:
  %i_slot2528 = alloca i32
  store i32 %i2527, i32* %i_slot2528
  %r2529 = alloca i32
  store i32 0, i32* %r2529
  %_lhs2530 = load i32* %i_slot2528
  %bop2531 = icmp eq i32 %_lhs2530, 0
  br i1 %bop2531, label %__then453, label %__else452

__fresh455:
  br label %__then453

__then453:
  store i32 1, i32* %r2529
  br label %__merge451

__fresh456:
  br label %__else452

__else452:
  %_lhs2532 = load i32* %i_slot2528
  %_lhs2533 = load i32* %i_slot2528
  %bop2534 = sub i32 %_lhs2533, 1
  %ret2535 = call i32 @f ( i32 %bop2534 )
  %bop2536 = mul i32 %_lhs2532, %ret2535
  store i32 %bop2536, i32* %r2529
  br label %__merge451

__merge451:
  %_lhs2537 = load i32* %r2529
  ret i32 %_lhs2537
}


