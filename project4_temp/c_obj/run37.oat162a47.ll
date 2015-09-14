declare i8* @string_of_array({ i32, [ 0 x i32 ] })
declare { i32, [ 0 x i32 ] } @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] } @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh444:
  ret void
}


define i32 @program (i32 %argc2710, { i32, [ 0 x i8* ] } %argv2708){

__fresh443:
  %argc_slot2711 = alloca i32
  store i32 %argc2710, i32* %argc_slot2711
  %argv_slot2709 = alloca { i32, [ 0 x i8* ] }
  store { i32, [ 0 x i8* ] } %argv2708, { i32, [ 0 x i8* ] }* %argv_slot2709
  %array_ptr2712 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 2 )
  %array2713 = bitcast { i32, [ 0 x i32 ] } %array_ptr2712 to { i32, [ 0 x { i32, [ 0 x i32 ] } ] } 
  %array_ptr2714 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 2 )
  %array2715 = bitcast { i32, [ 0 x i32 ] } %array_ptr2714 to { i32, [ 0 x i32 ] } 
  %index_ptr2716 = getelementptr { i32, [ 0 x i32 ] } %array2715, i32 0, i32 1, i32 0
  store i32 0, i32* %index_ptr2716
  %index_ptr2717 = getelementptr { i32, [ 0 x i32 ] } %array2715, i32 0, i32 1, i32 1
  store i32 0, i32* %index_ptr2717
  %index_ptr2718 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %array2713, i32 0, i32 1, i32 0
  store { i32, [ 0 x i32 ] } %array2715, { i32, [ 0 x i32 ] }* %index_ptr2718
  %array_ptr2719 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 2 )
  %array2720 = bitcast { i32, [ 0 x i32 ] } %array_ptr2719 to { i32, [ 0 x i32 ] } 
  %index_ptr2721 = getelementptr { i32, [ 0 x i32 ] } %array2720, i32 0, i32 1, i32 0
  store i32 0, i32* %index_ptr2721
  %index_ptr2722 = getelementptr { i32, [ 0 x i32 ] } %array2720, i32 0, i32 1, i32 1
  store i32 0, i32* %index_ptr2722
  %index_ptr2723 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %array2713, i32 0, i32 1, i32 1
  store { i32, [ 0 x i32 ] } %array2720, { i32, [ 0 x i32 ] }* %index_ptr2723
  %a2724 = alloca { i32, [ 0 x { i32, [ 0 x i32 ] } ] }
  store { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %array2713, { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* %a2724
  %bound_ptr2726 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* %a2724, i32 0, i32 0
  %bound2727 = load i32* %bound_ptr2726
  call void @oat_array_bounds_check( i32 %bound2727, i32 1 )
  %elt2725 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* %a2724, i32 0, i32 1, i32 1
  %bound_ptr2729 = getelementptr { i32, [ 0 x i32 ] }* %elt2725, i32 0, i32 0
  %bound2730 = load i32* %bound_ptr2729
  call void @oat_array_bounds_check( i32 %bound2730, i32 3 )
  %elt2728 = getelementptr { i32, [ 0 x i32 ] }* %elt2725, i32 0, i32 1, i32 3
  %_lhs2731 = load i32* %elt2728
  ret i32 %_lhs2731
}


