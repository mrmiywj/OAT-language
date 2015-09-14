declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@garr753 = global { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* zeroinitializer, align 4		; initialized by garr753.init
define void @oat_init (){

__fresh182:
  call void @garr753.init(  )
  ret void
}


define i32 @program (i32 %argc759, { i32, [ 0 x i8* ] }* %argv757){

__fresh181:
  %argc_slot760 = alloca i32
  store i32 %argc759, i32* %argc_slot760
  %argv_slot758 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv757, { i32, [ 0 x i8* ] }** %argv_slot758
  %bound_ptr762 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** @garr753, i32 0, i32 0
  %bound763 = load i32* %bound_ptr762
  call void @oat_array_bounds_check( i32 %bound763, i32 1 )
  %elt761 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** @garr753, i32 0, i32 1, i32 1
  %_lhs764 = load { i32, [ 0 x i32 ] }** %elt761
  %ret765 = call { i32, [ 0 x i32 ] }* @f ( { i32, [ 0 x i32 ] }* %_lhs764 )
  %arr766 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %ret765, { i32, [ 0 x i32 ] }** %arr766
  %bound_ptr768 = getelementptr { i32, [ 0 x i32 ] }** %arr766, i32 0, i32 0
  %bound769 = load i32* %bound_ptr768
  call void @oat_array_bounds_check( i32 %bound769, i32 1 )
  %elt767 = getelementptr { i32, [ 0 x i32 ] }** %arr766, i32 0, i32 1, i32 1
  %_lhs770 = load i32* %elt767
  ret i32 %_lhs770
}


define { i32, [ 0 x i32 ] }* @f ({ i32, [ 0 x i32 ] }* %arr754){

__fresh180:
  %arr_slot755 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %arr754, { i32, [ 0 x i32 ] }** %arr_slot755
  %_lhs756 = load { i32, [ 0 x i32 ] }** %arr_slot755
  ret { i32, [ 0 x i32 ] }* %_lhs756
}


define void @garr753.init (){

__fresh179:
  %array_ptr739 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 2 )
  %array740 = bitcast { i32, [ 0 x i32 ] }* %array_ptr739 to { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* 
  %array_ptr741 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 3 )
  %array742 = bitcast { i32, [ 0 x i32 ] }* %array_ptr741 to { i32, [ 0 x i32 ] }* 
  %index_ptr743 = getelementptr { i32, [ 0 x i32 ] }* %array742, i32 0, i32 1, i32 0
  store i32 1, i32* %index_ptr743
  %index_ptr744 = getelementptr { i32, [ 0 x i32 ] }* %array742, i32 0, i32 1, i32 1
  store i32 2, i32* %index_ptr744
  %index_ptr745 = getelementptr { i32, [ 0 x i32 ] }* %array742, i32 0, i32 1, i32 2
  store i32 3, i32* %index_ptr745
  %index_ptr746 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array740, i32 0, i32 1, i32 0
  store { i32, [ 0 x i32 ] }* %array742, { i32, [ 0 x i32 ] }** %index_ptr746
  %array_ptr747 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 3 )
  %array748 = bitcast { i32, [ 0 x i32 ] }* %array_ptr747 to { i32, [ 0 x i32 ] }* 
  %index_ptr749 = getelementptr { i32, [ 0 x i32 ] }* %array748, i32 0, i32 1, i32 0
  store i32 4, i32* %index_ptr749
  %index_ptr750 = getelementptr { i32, [ 0 x i32 ] }* %array748, i32 0, i32 1, i32 1
  store i32 5, i32* %index_ptr750
  %index_ptr751 = getelementptr { i32, [ 0 x i32 ] }* %array748, i32 0, i32 1, i32 2
  store i32 6, i32* %index_ptr751
  %index_ptr752 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array740, i32 0, i32 1, i32 1
  store { i32, [ 0 x i32 ] }* %array748, { i32, [ 0 x i32 ] }** %index_ptr752
  store { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array740, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** @garr753
  ret void
}


