declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh424:
  ret void
}


define i32 @program (i32 %argc2402, { i32, [ 0 x i8* ] }* %argv2400){

__fresh421:
  %argc_slot2403 = alloca i32
  store i32 %argc2402, i32* %argc_slot2403
  %argv_slot2401 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv2400, { i32, [ 0 x i8* ] }** %argv_slot2401
  %i2404 = alloca i32
  store i32 1, i32* %i2404
  br label %__cond420

__cond420:
  %_lhs2405 = load i32* %i2404
  %_lhs2406 = load i32* %argc_slot2403
  %bop2407 = icmp slt i32 %_lhs2405, %_lhs2406
  br i1 %bop2407, label %__body419, label %__post418

__fresh422:
  br label %__body419

__body419:
  %_lhs2408 = load i32* %i2404
  %bound_ptr2410 = getelementptr { i32, [ 0 x i8* ] }** %argv_slot2401, i32 0, i32 0
  %bound2411 = load i32* %bound_ptr2410
  call void @oat_array_bounds_check( i32 %bound2411, i32 %_lhs2408 )
  %elt2409 = getelementptr { i32, [ 0 x i8* ] }** %argv_slot2401, i32 0, i32 1, i32 %_lhs2408
  %_lhs2412 = load i8** %elt2409
  call void @print_string( i8* %_lhs2412 )
  %_lhs2413 = load i32* %i2404
  %bop2414 = add i32 %_lhs2413, 1
  store i32 %bop2414, i32* %i2404
  br label %__cond420

__fresh423:
  br label %__post418

__post418:
  %_lhs2415 = load i32* %argc_slot2403
  ret i32 %_lhs2415
}


