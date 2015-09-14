declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@garr585 = global { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* zeroinitializer, align 4		; initialized by garr585.init
@i572 = global i32 42, align 4
define void @oat_init (){

__fresh160:
  call void @garr585.init(  )
  ret void
}


define i32 @program (i32 %argc597, { i32, [ 0 x i8* ] }* %argv595){

__fresh157:
  %argc_slot598 = alloca i32
  store i32 %argc597, i32* %argc_slot598
  %argv_slot596 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv595, { i32, [ 0 x i8* ] }** %argv_slot596
  %array_ptr599 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 4 )
  %array600 = bitcast { i32, [ 0 x i32 ] }* %array_ptr599 to { i32, [ 0 x i32 ] }* 
  %index_ptr601 = getelementptr { i32, [ 0 x i32 ] }* %array600, i32 0, i32 1, i32 0
  store i32 1, i32* %index_ptr601
  %index_ptr602 = getelementptr { i32, [ 0 x i32 ] }* %array600, i32 0, i32 1, i32 1
  store i32 2, i32* %index_ptr602
  %index_ptr603 = getelementptr { i32, [ 0 x i32 ] }* %array600, i32 0, i32 1, i32 2
  store i32 3, i32* %index_ptr603
  %index_ptr604 = getelementptr { i32, [ 0 x i32 ] }* %array600, i32 0, i32 1, i32 3
  store i32 4, i32* %index_ptr604
  %arr605 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array600, { i32, [ 0 x i32 ] }** %arr605
  %p606 = alloca i32
  store i32 0, i32* %p606
  %j607 = alloca i32
  store i32 0, i32* %j607
  br label %__cond156

__cond156:
  %_lhs608 = load i32* %j607
  %bop609 = icmp slt i32 %_lhs608, 100
  br i1 %bop609, label %__body155, label %__post154

__fresh158:
  br label %__body155

__body155:
  %_lhs610 = load i32* %p606
  %bop611 = add i32 %_lhs610, 1
  store i32 %bop611, i32* %p606
  %_lhs612 = load i32* %j607
  %bop613 = add i32 %_lhs612, 1
  store i32 %bop613, i32* %j607
  br label %__cond156

__fresh159:
  br label %__post154

__post154:
  %_lhs614 = load { i32, [ 0 x i32 ] }** %arr605
  %ret615 = call i32 @g ( { i32, [ 0 x i32 ] }* %_lhs614 )
  %_lhs616 = load i32* @i572
  %ret617 = call i32 @f ( i32 %_lhs616 )
  %bop618 = add i32 %ret615, %ret617
  %bound_ptr620 = getelementptr { i32, [ 0 x i32 ] }** %arr605, i32 0, i32 0
  %bound621 = load i32* %bound_ptr620
  call void @oat_array_bounds_check( i32 %bound621, i32 3 )
  %elt619 = getelementptr { i32, [ 0 x i32 ] }** %arr605, i32 0, i32 1, i32 3
  %_lhs622 = load i32* %elt619
  %ret623 = call i32 @f ( i32 %_lhs622 )
  %bop624 = add i32 %bop618, %ret623
  %bound_ptr626 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** @garr585, i32 0, i32 0
  %bound627 = load i32* %bound_ptr626
  call void @oat_array_bounds_check( i32 %bound627, i32 1 )
  %elt625 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** @garr585, i32 0, i32 1, i32 1
  %bound_ptr629 = getelementptr { i32, [ 0 x i32 ] }** %elt625, i32 0, i32 0
  %bound630 = load i32* %bound_ptr629
  call void @oat_array_bounds_check( i32 %bound630, i32 1 )
  %elt628 = getelementptr { i32, [ 0 x i32 ] }** %elt625, i32 0, i32 1, i32 1
  %_lhs631 = load i32* %elt628
  %ret632 = call i32 @f ( i32 %_lhs631 )
  %bop633 = add i32 %bop624, %ret632
  %_lhs634 = load i32* %p606
  %ret635 = call i32 @f ( i32 %_lhs634 )
  %bop636 = add i32 %bop633, %ret635
  ret i32 %bop636
}


define i32 @g ({ i32, [ 0 x i32 ] }* %y589){

__fresh153:
  %y_slot590 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %y589, { i32, [ 0 x i32 ] }** %y_slot590
  %bound_ptr592 = getelementptr { i32, [ 0 x i32 ] }** %y_slot590, i32 0, i32 0
  %bound593 = load i32* %bound_ptr592
  call void @oat_array_bounds_check( i32 %bound593, i32 2 )
  %elt591 = getelementptr { i32, [ 0 x i32 ] }** %y_slot590, i32 0, i32 1, i32 2
  %_lhs594 = load i32* %elt591
  ret i32 %_lhs594
}


define i32 @f (i32 %x586){

__fresh152:
  %x_slot587 = alloca i32
  store i32 %x586, i32* %x_slot587
  %_lhs588 = load i32* %x_slot587
  ret i32 %_lhs588
}


define void @garr585.init (){

__fresh151:
  %array_ptr573 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 2 )
  %array574 = bitcast { i32, [ 0 x i32 ] }* %array_ptr573 to { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* 
  %array_ptr575 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 2 )
  %array576 = bitcast { i32, [ 0 x i32 ] }* %array_ptr575 to { i32, [ 0 x i32 ] }* 
  %index_ptr577 = getelementptr { i32, [ 0 x i32 ] }* %array576, i32 0, i32 1, i32 0
  store i32 1, i32* %index_ptr577
  %index_ptr578 = getelementptr { i32, [ 0 x i32 ] }* %array576, i32 0, i32 1, i32 1
  store i32 2, i32* %index_ptr578
  %index_ptr579 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array574, i32 0, i32 1, i32 0
  store { i32, [ 0 x i32 ] }* %array576, { i32, [ 0 x i32 ] }** %index_ptr579
  %array_ptr580 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 2 )
  %array581 = bitcast { i32, [ 0 x i32 ] }* %array_ptr580 to { i32, [ 0 x i32 ] }* 
  %index_ptr582 = getelementptr { i32, [ 0 x i32 ] }* %array581, i32 0, i32 1, i32 0
  store i32 3, i32* %index_ptr582
  %index_ptr583 = getelementptr { i32, [ 0 x i32 ] }* %array581, i32 0, i32 1, i32 1
  store i32 4, i32* %index_ptr583
  %index_ptr584 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array574, i32 0, i32 1, i32 1
  store { i32, [ 0 x i32 ] }* %array581, { i32, [ 0 x i32 ] }** %index_ptr584
  store { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array574, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** @garr585
  ret void
}


