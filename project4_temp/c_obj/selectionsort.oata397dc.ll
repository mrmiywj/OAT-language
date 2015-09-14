declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh691:
  ret void
}


define i32 @program (i32 %argc3560, { i32, [ 0 x i8* ] }* %argv3558){

__fresh688:
  %argc_slot3561 = alloca i32
  store i32 %argc3560, i32* %argc_slot3561
  %argv_slot3559 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv3558, { i32, [ 0 x i8* ] }** %argv_slot3559
  %array_ptr3562 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 8 )
  %array3563 = bitcast { i32, [ 0 x i32 ] }* %array_ptr3562 to { i32, [ 0 x i32 ] }* 
  %index_ptr3564 = getelementptr { i32, [ 0 x i32 ] }* %array3563, i32 0, i32 1, i32 0
  store i32 5, i32* %index_ptr3564
  %index_ptr3565 = getelementptr { i32, [ 0 x i32 ] }* %array3563, i32 0, i32 1, i32 1
  store i32 200, i32* %index_ptr3565
  %index_ptr3566 = getelementptr { i32, [ 0 x i32 ] }* %array3563, i32 0, i32 1, i32 2
  store i32 1, i32* %index_ptr3566
  %index_ptr3567 = getelementptr { i32, [ 0 x i32 ] }* %array3563, i32 0, i32 1, i32 3
  store i32 65, i32* %index_ptr3567
  %index_ptr3568 = getelementptr { i32, [ 0 x i32 ] }* %array3563, i32 0, i32 1, i32 4
  store i32 30, i32* %index_ptr3568
  %index_ptr3569 = getelementptr { i32, [ 0 x i32 ] }* %array3563, i32 0, i32 1, i32 5
  store i32 99, i32* %index_ptr3569
  %index_ptr3570 = getelementptr { i32, [ 0 x i32 ] }* %array3563, i32 0, i32 1, i32 6
  store i32 2, i32* %index_ptr3570
  %index_ptr3571 = getelementptr { i32, [ 0 x i32 ] }* %array3563, i32 0, i32 1, i32 7
  store i32 0, i32* %index_ptr3571
  %ar3572 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array3563, { i32, [ 0 x i32 ] }** %ar3572
  %_lhs3573 = load { i32, [ 0 x i32 ] }** %ar3572
  call void @selectionsort( { i32, [ 0 x i32 ] }* %_lhs3573, i32 8 )
  %i3574 = alloca i32
  store i32 0, i32* %i3574
  br label %__cond687

__cond687:
  %_lhs3575 = load i32* %i3574
  %bop3576 = icmp slt i32 %_lhs3575, 8
  br i1 %bop3576, label %__body686, label %__post685

__fresh689:
  br label %__body686

__body686:
  %_lhs3577 = load i32* %i3574
  %bound_ptr3579 = getelementptr { i32, [ 0 x i32 ] }** %ar3572, i32 0, i32 0
  %bound3580 = load i32* %bound_ptr3579
  call void @oat_array_bounds_check( i32 %bound3580, i32 %_lhs3577 )
  %elt3578 = getelementptr { i32, [ 0 x i32 ] }** %ar3572, i32 0, i32 1, i32 %_lhs3577
  %_lhs3581 = load i32* %elt3578
  call void @print_int( i32 %_lhs3581 )
  %_lhs3582 = load i32* %i3574
  %bop3583 = add i32 %_lhs3582, 1
  store i32 %bop3583, i32* %i3574
  br label %__cond687

__fresh690:
  br label %__post685

__post685:
  ret i32 0
}


define void @selectionsort ({ i32, [ 0 x i32 ] }* %a3525, i32 %s3523){

__fresh682:
  %a_slot3526 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %a3525, { i32, [ 0 x i32 ] }** %a_slot3526
  %s_slot3524 = alloca i32
  store i32 %s3523, i32* %s_slot3524
  %t3527 = alloca i32
  store i32 0, i32* %t3527
  %mi3528 = alloca i32
  store i32 0, i32* %mi3528
  %i3529 = alloca i32
  store i32 0, i32* %i3529
  br label %__cond681

__cond681:
  %_lhs3530 = load i32* %i3529
  %_lhs3531 = load i32* %s_slot3524
  %bop3532 = icmp slt i32 %_lhs3530, %_lhs3531
  br i1 %bop3532, label %__body680, label %__post679

__fresh683:
  br label %__body680

__body680:
  %_lhs3535 = load i32* %s_slot3524
  %_lhs3534 = load i32* %i3529
  %_lhs3533 = load { i32, [ 0 x i32 ] }** %a_slot3526
  %ret3536 = call i32 @getminindex ( { i32, [ 0 x i32 ] }* %_lhs3533, i32 %_lhs3534, i32 %_lhs3535 )
  store i32 %ret3536, i32* %mi3528
  %_lhs3537 = load i32* %i3529
  %bound_ptr3539 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3526, i32 0, i32 0
  %bound3540 = load i32* %bound_ptr3539
  call void @oat_array_bounds_check( i32 %bound3540, i32 %_lhs3537 )
  %elt3538 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3526, i32 0, i32 1, i32 %_lhs3537
  %_lhs3541 = load i32* %elt3538
  store i32 %_lhs3541, i32* %t3527
  %_lhs3542 = load i32* %i3529
  %bound_ptr3544 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3526, i32 0, i32 0
  %bound3545 = load i32* %bound_ptr3544
  call void @oat_array_bounds_check( i32 %bound3545, i32 %_lhs3542 )
  %elt3543 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3526, i32 0, i32 1, i32 %_lhs3542
  %_lhs3546 = load i32* %mi3528
  %bound_ptr3548 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3526, i32 0, i32 0
  %bound3549 = load i32* %bound_ptr3548
  call void @oat_array_bounds_check( i32 %bound3549, i32 %_lhs3546 )
  %elt3547 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3526, i32 0, i32 1, i32 %_lhs3546
  %_lhs3550 = load i32* %elt3547
  store i32 %_lhs3550, i32* %elt3543
  %_lhs3551 = load i32* %mi3528
  %bound_ptr3553 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3526, i32 0, i32 0
  %bound3554 = load i32* %bound_ptr3553
  call void @oat_array_bounds_check( i32 %bound3554, i32 %_lhs3551 )
  %elt3552 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3526, i32 0, i32 1, i32 %_lhs3551
  %_lhs3555 = load i32* %t3527
  store i32 %_lhs3555, i32* %elt3552
  %_lhs3556 = load i32* %i3529
  %bop3557 = add i32 %_lhs3556, 1
  store i32 %bop3557, i32* %i3529
  br label %__cond681

__fresh684:
  br label %__post679

__post679:
  ret void
}


define i32 @getminindex ({ i32, [ 0 x i32 ] }* %a3492, i32 %s3490, i32 %b3488){

__fresh674:
  %a_slot3493 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %a3492, { i32, [ 0 x i32 ] }** %a_slot3493
  %s_slot3491 = alloca i32
  store i32 %s3490, i32* %s_slot3491
  %b_slot3489 = alloca i32
  store i32 %b3488, i32* %b_slot3489
  %_lhs3494 = load i32* %s_slot3491
  %i3495 = alloca i32
  store i32 %_lhs3494, i32* %i3495
  %_lhs3496 = load i32* %s_slot3491
  %bound_ptr3498 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3493, i32 0, i32 0
  %bound3499 = load i32* %bound_ptr3498
  call void @oat_array_bounds_check( i32 %bound3499, i32 %_lhs3496 )
  %elt3497 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3493, i32 0, i32 1, i32 %_lhs3496
  %_lhs3500 = load i32* %elt3497
  %min3501 = alloca i32
  store i32 %_lhs3500, i32* %min3501
  %_lhs3502 = load i32* %s_slot3491
  %mi3503 = alloca i32
  store i32 %_lhs3502, i32* %mi3503
  br label %__cond670

__cond670:
  %_lhs3504 = load i32* %i3495
  %_lhs3505 = load i32* %b_slot3489
  %bop3506 = icmp slt i32 %_lhs3504, %_lhs3505
  br i1 %bop3506, label %__body669, label %__post668

__fresh675:
  br label %__body669

__body669:
  %_lhs3507 = load i32* %i3495
  %bound_ptr3509 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3493, i32 0, i32 0
  %bound3510 = load i32* %bound_ptr3509
  call void @oat_array_bounds_check( i32 %bound3510, i32 %_lhs3507 )
  %elt3508 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3493, i32 0, i32 1, i32 %_lhs3507
  %_lhs3511 = load i32* %elt3508
  %_lhs3512 = load i32* %min3501
  %bop3513 = icmp slt i32 %_lhs3511, %_lhs3512
  br i1 %bop3513, label %__then673, label %__else672

__fresh676:
  br label %__then673

__then673:
  %_lhs3514 = load i32* %i3495
  %bound_ptr3516 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3493, i32 0, i32 0
  %bound3517 = load i32* %bound_ptr3516
  call void @oat_array_bounds_check( i32 %bound3517, i32 %_lhs3514 )
  %elt3515 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3493, i32 0, i32 1, i32 %_lhs3514
  %_lhs3518 = load i32* %elt3515
  store i32 %_lhs3518, i32* %min3501
  %_lhs3519 = load i32* %i3495
  store i32 %_lhs3519, i32* %mi3503
  br label %__merge671

__fresh677:
  br label %__else672

__else672:
  br label %__merge671

__merge671:
  %_lhs3520 = load i32* %i3495
  %bop3521 = add i32 %_lhs3520, 1
  store i32 %bop3521, i32* %i3495
  br label %__cond670

__fresh678:
  br label %__post668

__post668:
  %_lhs3522 = load i32* %mi3503
  ret i32 %_lhs3522
}


