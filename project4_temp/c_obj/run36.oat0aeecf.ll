declare i8* @string_of_array({ i32, [ 0 x i32 ] })
declare { i32, [ 0 x i32 ] } @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] } @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh442:
  ret void
}


define i32 @program (i32 %argc2696, { i32, [ 0 x i8* ] } %argv2694){

__fresh441:
  %argc_slot2697 = alloca i32
  store i32 %argc2696, i32* %argc_slot2697
  %argv_slot2695 = alloca { i32, [ 0 x i8* ] }
  store { i32, [ 0 x i8* ] } %argv2694, { i32, [ 0 x i8* ] }* %argv_slot2695
  %array_ptr2698 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 2 )
  %array2699 = bitcast { i32, [ 0 x i32 ] } %array_ptr2698 to { i32, [ 0 x i32 ] } 
  %index_ptr2700 = getelementptr { i32, [ 0 x i32 ] } %array2699, i32 0, i32 1, i32 0
  store i32 0, i32* %index_ptr2700
  %index_ptr2701 = getelementptr { i32, [ 0 x i32 ] } %array2699, i32 0, i32 1, i32 1
  store i32 0, i32* %index_ptr2701
  %a2702 = alloca { i32, [ 0 x i32 ] }
  store { i32, [ 0 x i32 ] } %array2699, { i32, [ 0 x i32 ] }* %a2702
  %unop2703 = sub i32 0, 1
  %bound_ptr2705 = getelementptr { i32, [ 0 x i32 ] }* %a2702, i32 0, i32 0
  %bound2706 = load i32* %bound_ptr2705
  call void @oat_array_bounds_check( i32 %bound2706, i32 %unop2703 )
  %elt2704 = getelementptr { i32, [ 0 x i32 ] }* %a2702, i32 0, i32 1, i32 %unop2703
  %_lhs2707 = load i32* %elt2704
  ret i32 %_lhs2707
}


