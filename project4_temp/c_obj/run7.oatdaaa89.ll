declare i8* @string_of_array({ i32, [ 0 x i32 ] })
declare { i32, [ 0 x i32 ] } @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] } @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@arr2666 = global { i32, [ 0 x { i32, [ 0 x i32 ] } ] } zeroinitializer, align 4		; initialized by arr2666.init
define void @oat_init (){

__fresh437:
  call void @arr2666.init(  )
  ret void
}


define i32 @program (i32 %argc2669, { i32, [ 0 x i8* ] } %argv2667){

__fresh436:
  %argc_slot2670 = alloca i32
  store i32 %argc2669, i32* %argc_slot2670
  %argv_slot2668 = alloca { i32, [ 0 x i8* ] }
  store { i32, [ 0 x i8* ] } %argv2667, { i32, [ 0 x i8* ] }* %argv_slot2668
  %bound_ptr2672 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* @arr2666, i32 0, i32 0
  %bound2673 = load i32* %bound_ptr2672
  call void @oat_array_bounds_check( i32 %bound2673, i32 3 )
  %elt2671 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* @arr2666, i32 0, i32 1, i32 3
  %bound_ptr2675 = getelementptr { i32, [ 0 x i32 ] }* %elt2671, i32 0, i32 0
  %bound2676 = load i32* %bound_ptr2675
  call void @oat_array_bounds_check( i32 %bound2676, i32 0 )
  %elt2674 = getelementptr { i32, [ 0 x i32 ] }* %elt2671, i32 0, i32 1, i32 0
  %_lhs2677 = load i32* %elt2674
  ret i32 %_lhs2677
}


define void @arr2666.init (){

__fresh435:
  %array_ptr2654 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 2 )
  %array2655 = bitcast { i32, [ 0 x i32 ] } %array_ptr2654 to { i32, [ 0 x { i32, [ 0 x i32 ] } ] } 
  %array_ptr2656 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 2 )
  %array2657 = bitcast { i32, [ 0 x i32 ] } %array_ptr2656 to { i32, [ 0 x i32 ] } 
  %index_ptr2658 = getelementptr { i32, [ 0 x i32 ] } %array2657, i32 0, i32 1, i32 0
  store i32 1, i32* %index_ptr2658
  %index_ptr2659 = getelementptr { i32, [ 0 x i32 ] } %array2657, i32 0, i32 1, i32 1
  store i32 2, i32* %index_ptr2659
  %index_ptr2660 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %array2655, i32 0, i32 1, i32 0
  store { i32, [ 0 x i32 ] } %array2657, { i32, [ 0 x i32 ] }* %index_ptr2660
  %array_ptr2661 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 2 )
  %array2662 = bitcast { i32, [ 0 x i32 ] } %array_ptr2661 to { i32, [ 0 x i32 ] } 
  %index_ptr2663 = getelementptr { i32, [ 0 x i32 ] } %array2662, i32 0, i32 1, i32 0
  store i32 3, i32* %index_ptr2663
  %index_ptr2664 = getelementptr { i32, [ 0 x i32 ] } %array2662, i32 0, i32 1, i32 1
  store i32 4, i32* %index_ptr2664
  %index_ptr2665 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %array2655, i32 0, i32 1, i32 1
  store { i32, [ 0 x i32 ] } %array2662, { i32, [ 0 x i32 ] }* %index_ptr2665
  store { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %array2655, { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* @arr2666
  ret void
}


