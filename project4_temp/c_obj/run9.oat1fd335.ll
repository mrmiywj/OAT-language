declare i8* @string_of_array({ i32, [ 0 x i32 ] })
declare { i32, [ 0 x i32 ] } @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] } @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh139:
  ret void
}


define i32 @program (i32 %argc583, { i32, [ 0 x i8* ] } %argv581){

__fresh138:
  %argc_slot584 = alloca i32
  store i32 %argc583, i32* %argc_slot584
  %argv_slot582 = alloca { i32, [ 0 x i8* ] }
  store { i32, [ 0 x i8* ] } %argv581, { i32, [ 0 x i8* ] }* %argv_slot582
  %array_ptr585 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 2 )
  %array586 = bitcast { i32, [ 0 x i32 ] } %array_ptr585 to { i32, [ 0 x { i32, [ 0 x i32 ] } ] } 
  %array_ptr587 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 2 )
  %array588 = bitcast { i32, [ 0 x i32 ] } %array_ptr587 to { i32, [ 0 x i32 ] } 
  %index_ptr589 = getelementptr { i32, [ 0 x i32 ] } %array588, i32 0, i32 1, i32 0
  store i32 1, i32* %index_ptr589
  %index_ptr590 = getelementptr { i32, [ 0 x i32 ] } %array588, i32 0, i32 1, i32 1
  store i32 2, i32* %index_ptr590
  %index_ptr591 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %array586, i32 0, i32 1, i32 0
  store { i32, [ 0 x i32 ] } %array588, { i32, [ 0 x i32 ] }* %index_ptr591
  %array_ptr592 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 2 )
  %array593 = bitcast { i32, [ 0 x i32 ] } %array_ptr592 to { i32, [ 0 x i32 ] } 
  %index_ptr594 = getelementptr { i32, [ 0 x i32 ] } %array593, i32 0, i32 1, i32 0
  store i32 3, i32* %index_ptr594
  %index_ptr595 = getelementptr { i32, [ 0 x i32 ] } %array593, i32 0, i32 1, i32 1
  store i32 4, i32* %index_ptr595
  %index_ptr596 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %array586, i32 0, i32 1, i32 1
  store { i32, [ 0 x i32 ] } %array593, { i32, [ 0 x i32 ] }* %index_ptr596
  %arr597 = alloca { i32, [ 0 x { i32, [ 0 x i32 ] } ] }
  store { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %array586, { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* %arr597
  %bound_ptr599 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* %arr597, i32 0, i32 0
  %bound600 = load i32* %bound_ptr599
  call void @oat_array_bounds_check( i32 %bound600, i32 1 )
  %elt598 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* %arr597, i32 0, i32 1, i32 1
  %bound_ptr602 = getelementptr { i32, [ 0 x i32 ] }* %elt598, i32 0, i32 0
  %bound603 = load i32* %bound_ptr602
  call void @oat_array_bounds_check( i32 %bound603, i32 1 )
  %elt601 = getelementptr { i32, [ 0 x i32 ] }* %elt598, i32 0, i32 1, i32 1
  %_lhs604 = load i32* %elt601
  ret i32 %_lhs604
}


