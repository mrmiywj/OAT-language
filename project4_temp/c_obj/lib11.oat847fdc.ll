declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@_oat_string2434.str. = private unnamed_addr constant [ 11 x i8 ] c "1234967890\00", align 4
@_oat_string2434 = global i8* getelementptr inbounds ([ 11 x i8 ]* @_oat_string2434.str., i32 0, i32 0), align 4
define void @oat_init (){

__fresh439:
  ret void
}


define i32 @program (i32 %argc2432, { i32, [ 0 x i8* ] }* %argv2430){

__fresh434:
  %argc_slot2433 = alloca i32
  store i32 %argc2432, i32* %argc_slot2433
  %argv_slot2431 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv2430, { i32, [ 0 x i8* ] }** %argv_slot2431
  %strval2435 = load i8** @_oat_string2434
  %ret2436 = call { i32, [ 0 x i32 ] }* @array_of_string ( i8* %strval2435 )
  %arr2437 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %ret2436, { i32, [ 0 x i32 ] }** %arr2437
  %sum2438 = alloca i32
  store i32 0, i32* %sum2438
  %i2439 = alloca i32
  store i32 0, i32* %i2439
  br label %__cond430

__cond430:
  %_lhs2440 = load i32* %i2439
  %bop2441 = icmp slt i32 %_lhs2440, 10
  br i1 %bop2441, label %__body429, label %__post428

__fresh435:
  br label %__body429

__body429:
  %_lhs2442 = load i32* %i2439
  %bound_ptr2444 = getelementptr { i32, [ 0 x i32 ] }** %arr2437, i32 0, i32 0
  %bound2445 = load i32* %bound_ptr2444
  call void @oat_array_bounds_check( i32 %bound2445, i32 %_lhs2442 )
  %elt2443 = getelementptr { i32, [ 0 x i32 ] }** %arr2437, i32 0, i32 1, i32 %_lhs2442
  %_lhs2446 = load i32* %i2439
  store i32 %_lhs2446, i32* %elt2443
  %_lhs2447 = load i32* %i2439
  %bop2448 = add i32 %_lhs2447, 1
  store i32 %bop2448, i32* %i2439
  br label %__cond430

__fresh436:
  br label %__post428

__post428:
  %i2449 = alloca i32
  store i32 0, i32* %i2449
  br label %__cond433

__cond433:
  %_lhs2450 = load i32* %i2449
  %bop2451 = icmp slt i32 %_lhs2450, 10
  br i1 %bop2451, label %__body432, label %__post431

__fresh437:
  br label %__body432

__body432:
  %_lhs2452 = load i32* %sum2438
  %_lhs2453 = load i32* %i2449
  %bound_ptr2455 = getelementptr { i32, [ 0 x i32 ] }** %arr2437, i32 0, i32 0
  %bound2456 = load i32* %bound_ptr2455
  call void @oat_array_bounds_check( i32 %bound2456, i32 %_lhs2453 )
  %elt2454 = getelementptr { i32, [ 0 x i32 ] }** %arr2437, i32 0, i32 1, i32 %_lhs2453
  %_lhs2457 = load i32* %elt2454
  %bop2458 = add i32 %_lhs2452, %_lhs2457
  store i32 %bop2458, i32* %sum2438
  %_lhs2459 = load i32* %i2449
  %bop2460 = add i32 %_lhs2459, 1
  store i32 %bop2460, i32* %i2449
  br label %__cond433

__fresh438:
  br label %__post431

__post431:
  %_lhs2461 = load i32* %sum2438
  ret i32 %_lhs2461
}


