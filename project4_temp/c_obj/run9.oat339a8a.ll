declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh178:
  ret void
}


define i32 @program (i32 %argc717, { i32, [ 0 x i8* ] }* %argv715){

__fresh177:
  %argc_slot718 = alloca i32
  store i32 %argc717, i32* %argc_slot718
  %argv_slot716 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv715, { i32, [ 0 x i8* ] }** %argv_slot716
  %array_ptr719 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 2 )
  %array720 = bitcast { i32, [ 0 x i32 ] }* %array_ptr719 to { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* 
  %array_ptr721 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 2 )
  %array722 = bitcast { i32, [ 0 x i32 ] }* %array_ptr721 to { i32, [ 0 x i32 ] }* 
  %index_ptr723 = getelementptr { i32, [ 0 x i32 ] }* %array722, i32 0, i32 1, i32 0
  store i32 1, i32* %index_ptr723
  %index_ptr724 = getelementptr { i32, [ 0 x i32 ] }* %array722, i32 0, i32 1, i32 1
  store i32 2, i32* %index_ptr724
  %index_ptr725 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array720, i32 0, i32 1, i32 0
  store { i32, [ 0 x i32 ] }* %array722, { i32, [ 0 x i32 ] }** %index_ptr725
  %array_ptr726 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 2 )
  %array727 = bitcast { i32, [ 0 x i32 ] }* %array_ptr726 to { i32, [ 0 x i32 ] }* 
  %index_ptr728 = getelementptr { i32, [ 0 x i32 ] }* %array727, i32 0, i32 1, i32 0
  store i32 3, i32* %index_ptr728
  %index_ptr729 = getelementptr { i32, [ 0 x i32 ] }* %array727, i32 0, i32 1, i32 1
  store i32 4, i32* %index_ptr729
  %index_ptr730 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array720, i32 0, i32 1, i32 1
  store { i32, [ 0 x i32 ] }* %array727, { i32, [ 0 x i32 ] }** %index_ptr730
  %arr731 = alloca { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }*
  store { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array720, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %arr731
  %bound_ptr733 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %arr731, i32 0, i32 0
  %bound734 = load i32* %bound_ptr733
  call void @oat_array_bounds_check( i32 %bound734, i32 1 )
  %elt732 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %arr731, i32 0, i32 1, i32 1
  %bound_ptr736 = getelementptr { i32, [ 0 x i32 ] }** %elt732, i32 0, i32 0
  %bound737 = load i32* %bound_ptr736
  call void @oat_array_bounds_check( i32 %bound737, i32 1 )
  %elt735 = getelementptr { i32, [ 0 x i32 ] }** %elt732, i32 0, i32 1, i32 1
  %_lhs738 = load i32* %elt735
  ret i32 %_lhs738
}


