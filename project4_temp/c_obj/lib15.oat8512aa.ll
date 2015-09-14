declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh450:
  ret void
}


define i32 @program (i32 %argc2520, { i32, [ 0 x i8* ] }* %argv2518){

__fresh449:
  %argc_slot2521 = alloca i32
  store i32 %argc2520, i32* %argc_slot2521
  %argv_slot2519 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv2518, { i32, [ 0 x i8* ] }** %argv_slot2519
  %bound_ptr2523 = getelementptr { i32, [ 0 x i8* ] }** %argv_slot2519, i32 0, i32 0
  %bound2524 = load i32* %bound_ptr2523
  call void @oat_array_bounds_check( i32 %bound2524, i32 1 )
  %elt2522 = getelementptr { i32, [ 0 x i8* ] }** %argv_slot2519, i32 0, i32 1, i32 1
  %_lhs2525 = load i8** %elt2522
  %ret2526 = call i8* @sub ( i8* %_lhs2525, i32 3, i32 5 )
  call void @print_string( i8* %ret2526 )
  ret i32 0
}


define i8* @sub (i8* %str2486, i32 %start2484, i32 %len2482){

__fresh446:
  %str_slot2487 = alloca i8*
  store i8* %str2486, i8** %str_slot2487
  %start_slot2485 = alloca i32
  store i32 %start2484, i32* %start_slot2485
  %len_slot2483 = alloca i32
  store i32 %len2482, i32* %len_slot2483
  %_lhs2488 = load i8** %str_slot2487
  %ret2489 = call { i32, [ 0 x i32 ] }* @array_of_string ( i8* %_lhs2488 )
  %arr2490 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %ret2489, { i32, [ 0 x i32 ] }** %arr2490
  %_lhs2491 = load i32* %len_slot2483
  %array_ptr2492 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 %_lhs2491 )
  %array2493 = bitcast { i32, [ 0 x i32 ] }* %array_ptr2492 to { i32, [ 0 x i32 ] }* 
  %_tmp24932495 = alloca i32
  store i32 %_lhs2491, i32* %_tmp24932495
  %_tmp24952497 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array2493, { i32, [ 0 x i32 ] }** %_tmp24952497
  %i2498 = alloca i32
  store i32 0, i32* %i2498
  br label %__cond445

__cond445:
  %_lhs2499 = load i32* %i2498
  %_lhs2500 = load i32* %_tmp24932495
  %bop2501 = icmp slt i32 %_lhs2499, %_lhs2500
  br i1 %bop2501, label %__body444, label %__post443

__fresh447:
  br label %__body444

__body444:
  %_lhs2502 = load i32* %i2498
  %bound_ptr2504 = getelementptr { i32, [ 0 x i32 ] }** %_tmp24952497, i32 0, i32 0
  %bound2505 = load i32* %bound_ptr2504
  call void @oat_array_bounds_check( i32 %bound2505, i32 %_lhs2502 )
  %elt2503 = getelementptr { i32, [ 0 x i32 ] }** %_tmp24952497, i32 0, i32 1, i32 %_lhs2502
  %_lhs2506 = load i32* %i2498
  %_lhs2507 = load i32* %start_slot2485
  %bop2508 = add i32 %_lhs2506, %_lhs2507
  %bound_ptr2510 = getelementptr { i32, [ 0 x i32 ] }** %arr2490, i32 0, i32 0
  %bound2511 = load i32* %bound_ptr2510
  call void @oat_array_bounds_check( i32 %bound2511, i32 %bop2508 )
  %elt2509 = getelementptr { i32, [ 0 x i32 ] }** %arr2490, i32 0, i32 1, i32 %bop2508
  %_lhs2512 = load i32* %elt2509
  store i32 %_lhs2512, i32* %elt2503
  %_lhs2513 = load i32* %i2498
  %bop2514 = add i32 %_lhs2513, 1
  store i32 %bop2514, i32* %i2498
  br label %__cond445

__fresh448:
  br label %__post443

__post443:
  %r2515 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array2493, { i32, [ 0 x i32 ] }** %r2515
  %_lhs2516 = load { i32, [ 0 x i32 ] }** %r2515
  %ret2517 = call i8* @string_of_array ( { i32, [ 0 x i32 ] }* %_lhs2516 )
  ret i8* %ret2517
}


