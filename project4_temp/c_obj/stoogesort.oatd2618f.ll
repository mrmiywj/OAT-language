declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh667:
  ret void
}


define i32 @program (i32 %argc3445, { i32, [ 0 x i8* ] }* %argv3443){

__fresh664:
  %argc_slot3446 = alloca i32
  store i32 %argc3445, i32* %argc_slot3446
  %argv_slot3444 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv3443, { i32, [ 0 x i8* ] }** %argv_slot3444
  %array_ptr3447 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 15 )
  %array3448 = bitcast { i32, [ 0 x i32 ] }* %array_ptr3447 to { i32, [ 0 x i32 ] }* 
  %index_ptr3449 = getelementptr { i32, [ 0 x i32 ] }* %array3448, i32 0, i32 1, i32 0
  store i32 1, i32* %index_ptr3449
  %index_ptr3450 = getelementptr { i32, [ 0 x i32 ] }* %array3448, i32 0, i32 1, i32 1
  store i32 4, i32* %index_ptr3450
  %index_ptr3451 = getelementptr { i32, [ 0 x i32 ] }* %array3448, i32 0, i32 1, i32 2
  store i32 5, i32* %index_ptr3451
  %index_ptr3452 = getelementptr { i32, [ 0 x i32 ] }* %array3448, i32 0, i32 1, i32 3
  store i32 3, i32* %index_ptr3452
  %unop3453 = sub i32 0, 6
  %index_ptr3454 = getelementptr { i32, [ 0 x i32 ] }* %array3448, i32 0, i32 1, i32 4
  store i32 %unop3453, i32* %index_ptr3454
  %index_ptr3455 = getelementptr { i32, [ 0 x i32 ] }* %array3448, i32 0, i32 1, i32 5
  store i32 3, i32* %index_ptr3455
  %index_ptr3456 = getelementptr { i32, [ 0 x i32 ] }* %array3448, i32 0, i32 1, i32 6
  store i32 7, i32* %index_ptr3456
  %index_ptr3457 = getelementptr { i32, [ 0 x i32 ] }* %array3448, i32 0, i32 1, i32 7
  store i32 10, i32* %index_ptr3457
  %unop3458 = sub i32 0, 2
  %index_ptr3459 = getelementptr { i32, [ 0 x i32 ] }* %array3448, i32 0, i32 1, i32 8
  store i32 %unop3458, i32* %index_ptr3459
  %unop3460 = sub i32 0, 5
  %index_ptr3461 = getelementptr { i32, [ 0 x i32 ] }* %array3448, i32 0, i32 1, i32 9
  store i32 %unop3460, i32* %index_ptr3461
  %index_ptr3462 = getelementptr { i32, [ 0 x i32 ] }* %array3448, i32 0, i32 1, i32 10
  store i32 7, i32* %index_ptr3462
  %index_ptr3463 = getelementptr { i32, [ 0 x i32 ] }* %array3448, i32 0, i32 1, i32 11
  store i32 5, i32* %index_ptr3463
  %index_ptr3464 = getelementptr { i32, [ 0 x i32 ] }* %array3448, i32 0, i32 1, i32 12
  store i32 9, i32* %index_ptr3464
  %unop3465 = sub i32 0, 3
  %index_ptr3466 = getelementptr { i32, [ 0 x i32 ] }* %array3448, i32 0, i32 1, i32 13
  store i32 %unop3465, i32* %index_ptr3466
  %index_ptr3467 = getelementptr { i32, [ 0 x i32 ] }* %array3448, i32 0, i32 1, i32 14
  store i32 7, i32* %index_ptr3467
  %nums3468 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array3448, { i32, [ 0 x i32 ] }** %nums3468
  %i3469 = alloca i32
  store i32 0, i32* %i3469
  %_lhs3470 = load { i32, [ 0 x i32 ] }** %nums3468
  %len_ptr3471 = getelementptr { i32, [ 0 x i32 ] }* %_lhs3470, i32 0, i32 0
  %len3472 = load i32* %len_ptr3471
  %n3473 = alloca i32
  store i32 %len3472, i32* %n3473
  %_lhs3475 = load i32* %n3473
  %bop3476 = sub i32 %_lhs3475, 1
  %_lhs3474 = load { i32, [ 0 x i32 ] }** %nums3468
  call void @stoogeSort( { i32, [ 0 x i32 ] }* %_lhs3474, i32 0, i32 %bop3476 )
  store i32 0, i32* %i3469
  br label %__cond663

__cond663:
  %_lhs3477 = load i32* %i3469
  %_lhs3478 = load i32* %n3473
  %bop3479 = sub i32 %_lhs3478, 1
  %bop3480 = icmp sle i32 %_lhs3477, %bop3479
  br i1 %bop3480, label %__body662, label %__post661

__fresh665:
  br label %__body662

__body662:
  %_lhs3481 = load i32* %i3469
  %bound_ptr3483 = getelementptr { i32, [ 0 x i32 ] }** %nums3468, i32 0, i32 0
  %bound3484 = load i32* %bound_ptr3483
  call void @oat_array_bounds_check( i32 %bound3484, i32 %_lhs3481 )
  %elt3482 = getelementptr { i32, [ 0 x i32 ] }** %nums3468, i32 0, i32 1, i32 %_lhs3481
  %_lhs3485 = load i32* %elt3482
  call void @print_int( i32 %_lhs3485 )
  %_lhs3486 = load i32* %i3469
  %bop3487 = add i32 %_lhs3486, 1
  store i32 %bop3487, i32* %i3469
  br label %__cond663

__fresh666:
  br label %__post661

__post661:
  ret i32 0
}


define void @stoogeSort ({ i32, [ 0 x i32 ] }* %a3386, i32 %i3384, i32 %j3382){

__fresh656:
  %a_slot3387 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %a3386, { i32, [ 0 x i32 ] }** %a_slot3387
  %i_slot3385 = alloca i32
  store i32 %i3384, i32* %i_slot3385
  %j_slot3383 = alloca i32
  store i32 %j3382, i32* %j_slot3383
  %t3388 = alloca i32
  store i32 0, i32* %t3388
  %_lhs3389 = load i32* %j_slot3383
  %bound_ptr3391 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3387, i32 0, i32 0
  %bound3392 = load i32* %bound_ptr3391
  call void @oat_array_bounds_check( i32 %bound3392, i32 %_lhs3389 )
  %elt3390 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3387, i32 0, i32 1, i32 %_lhs3389
  %_lhs3393 = load i32* %elt3390
  %_lhs3394 = load i32* %i_slot3385
  %bound_ptr3396 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3387, i32 0, i32 0
  %bound3397 = load i32* %bound_ptr3396
  call void @oat_array_bounds_check( i32 %bound3397, i32 %_lhs3394 )
  %elt3395 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3387, i32 0, i32 1, i32 %_lhs3394
  %_lhs3398 = load i32* %elt3395
  %bop3399 = icmp slt i32 %_lhs3393, %_lhs3398
  br i1 %bop3399, label %__then652, label %__else651

__fresh657:
  br label %__then652

__then652:
  %_lhs3400 = load i32* %i_slot3385
  %bound_ptr3402 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3387, i32 0, i32 0
  %bound3403 = load i32* %bound_ptr3402
  call void @oat_array_bounds_check( i32 %bound3403, i32 %_lhs3400 )
  %elt3401 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3387, i32 0, i32 1, i32 %_lhs3400
  %_lhs3404 = load i32* %elt3401
  store i32 %_lhs3404, i32* %t3388
  %_lhs3405 = load i32* %i_slot3385
  %bound_ptr3407 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3387, i32 0, i32 0
  %bound3408 = load i32* %bound_ptr3407
  call void @oat_array_bounds_check( i32 %bound3408, i32 %_lhs3405 )
  %elt3406 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3387, i32 0, i32 1, i32 %_lhs3405
  %_lhs3409 = load i32* %j_slot3383
  %bound_ptr3411 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3387, i32 0, i32 0
  %bound3412 = load i32* %bound_ptr3411
  call void @oat_array_bounds_check( i32 %bound3412, i32 %_lhs3409 )
  %elt3410 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3387, i32 0, i32 1, i32 %_lhs3409
  %_lhs3413 = load i32* %elt3410
  store i32 %_lhs3413, i32* %elt3406
  %_lhs3414 = load i32* %j_slot3383
  %bound_ptr3416 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3387, i32 0, i32 0
  %bound3417 = load i32* %bound_ptr3416
  call void @oat_array_bounds_check( i32 %bound3417, i32 %_lhs3414 )
  %elt3415 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3387, i32 0, i32 1, i32 %_lhs3414
  %_lhs3418 = load i32* %t3388
  store i32 %_lhs3418, i32* %elt3415
  br label %__merge650

__fresh658:
  br label %__else651

__else651:
  br label %__merge650

__merge650:
  %_lhs3419 = load i32* %j_slot3383
  %_lhs3420 = load i32* %i_slot3385
  %bop3421 = sub i32 %_lhs3419, %_lhs3420
  %bop3422 = icmp sgt i32 %bop3421, 1
  br i1 %bop3422, label %__then655, label %__else654

__fresh659:
  br label %__then655

__then655:
  %_lhs3423 = load i32* %j_slot3383
  %_lhs3424 = load i32* %i_slot3385
  %bop3425 = sub i32 %_lhs3423, %_lhs3424
  %bop3426 = add i32 %bop3425, 1
  %bop3427 = ashr i32 %bop3426, 1
  store i32 %bop3427, i32* %t3388
  %_lhs3430 = load i32* %j_slot3383
  %_lhs3431 = load i32* %t3388
  %bop3432 = sub i32 %_lhs3430, %_lhs3431
  %_lhs3429 = load i32* %i_slot3385
  %_lhs3428 = load { i32, [ 0 x i32 ] }** %a_slot3387
  call void @stoogeSort( { i32, [ 0 x i32 ] }* %_lhs3428, i32 %_lhs3429, i32 %bop3432 )
  %_lhs3437 = load i32* %j_slot3383
  %_lhs3434 = load i32* %i_slot3385
  %_lhs3435 = load i32* %t3388
  %bop3436 = add i32 %_lhs3434, %_lhs3435
  %_lhs3433 = load { i32, [ 0 x i32 ] }** %a_slot3387
  call void @stoogeSort( { i32, [ 0 x i32 ] }* %_lhs3433, i32 %bop3436, i32 %_lhs3437 )
  %_lhs3440 = load i32* %j_slot3383
  %_lhs3441 = load i32* %t3388
  %bop3442 = sub i32 %_lhs3440, %_lhs3441
  %_lhs3439 = load i32* %i_slot3385
  %_lhs3438 = load { i32, [ 0 x i32 ] }** %a_slot3387
  call void @stoogeSort( { i32, [ 0 x i32 ] }* %_lhs3438, i32 %_lhs3439, i32 %bop3442 )
  br label %__merge653

__fresh660:
  br label %__else654

__else654:
  br label %__merge653

__merge653:
  ret void
}


