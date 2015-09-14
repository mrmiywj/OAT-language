declare i8* @string_of_array({ i32, [ 0 x i32 ] })
declare { i32, [ 0 x i32 ] } @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] } @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@arr2642 = global { i32, [ 0 x { i32, [ 0 x i32 ] } ] } zeroinitializer, align 4		; initialized by arr2642.init
define void @oat_init (){

__fresh434:
  call void @arr2642.init(  )
  ret void
}


define i32 @program (i32 %argc2645, { i32, [ 0 x i8* ] } %argv2643){

__fresh433:
  %argc_slot2646 = alloca i32
  store i32 %argc2645, i32* %argc_slot2646
  %argv_slot2644 = alloca { i32, [ 0 x i8* ] }
  store { i32, [ 0 x i8* ] } %argv2643, { i32, [ 0 x i8* ] }* %argv_slot2644
  %bound_ptr2648 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* @arr2642, i32 0, i32 0
  %bound2649 = load i32* %bound_ptr2648
  call void @oat_array_bounds_check( i32 %bound2649, i32 1 )
  %elt2647 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* @arr2642, i32 0, i32 1, i32 1
  %bound_ptr2651 = getelementptr { i32, [ 0 x i32 ] }* %elt2647, i32 0, i32 0
  %bound2652 = load i32* %bound_ptr2651
  call void @oat_array_bounds_check( i32 %bound2652, i32 3 )
  %elt2650 = getelementptr { i32, [ 0 x i32 ] }* %elt2647, i32 0, i32 1, i32 3
  %_lhs2653 = load i32* %elt2650
  ret i32 %_lhs2653
}


define void @arr2642.init (){

__fresh432:
  %array_ptr2630 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 2 )
  %array2631 = bitcast { i32, [ 0 x i32 ] } %array_ptr2630 to { i32, [ 0 x { i32, [ 0 x i32 ] } ] } 
  %array_ptr2632 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 2 )
  %array2633 = bitcast { i32, [ 0 x i32 ] } %array_ptr2632 to { i32, [ 0 x i32 ] } 
  %index_ptr2634 = getelementptr { i32, [ 0 x i32 ] } %array2633, i32 0, i32 1, i32 0
  store i32 1, i32* %index_ptr2634
  %index_ptr2635 = getelementptr { i32, [ 0 x i32 ] } %array2633, i32 0, i32 1, i32 1
  store i32 2, i32* %index_ptr2635
  %index_ptr2636 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %array2631, i32 0, i32 1, i32 0
  store { i32, [ 0 x i32 ] } %array2633, { i32, [ 0 x i32 ] }* %index_ptr2636
  %array_ptr2637 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 2 )
  %array2638 = bitcast { i32, [ 0 x i32 ] } %array_ptr2637 to { i32, [ 0 x i32 ] } 
  %index_ptr2639 = getelementptr { i32, [ 0 x i32 ] } %array2638, i32 0, i32 1, i32 0
  store i32 3, i32* %index_ptr2639
  %index_ptr2640 = getelementptr { i32, [ 0 x i32 ] } %array2638, i32 0, i32 1, i32 1
  store i32 4, i32* %index_ptr2640
  %index_ptr2641 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %array2631, i32 0, i32 1, i32 1
  store { i32, [ 0 x i32 ] } %array2638, { i32, [ 0 x i32 ] }* %index_ptr2641
  store { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %array2631, { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* @arr2642
  ret void
}


