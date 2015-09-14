declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@arr3830 = global { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* zeroinitializer, align 4		; initialized by arr3830.init
define void @oat_init (){

__fresh743:
  call void @arr3830.init(  )
  ret void
}


define i32 @program (i32 %argc3833, { i32, [ 0 x i8* ] }* %argv3831){

__fresh742:
  %argc_slot3834 = alloca i32
  store i32 %argc3833, i32* %argc_slot3834
  %argv_slot3832 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv3831, { i32, [ 0 x i8* ] }** %argv_slot3832
  %bound_ptr3836 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** @arr3830, i32 0, i32 0
  %bound3837 = load i32* %bound_ptr3836
  call void @oat_array_bounds_check( i32 %bound3837, i32 1 )
  %elt3835 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** @arr3830, i32 0, i32 1, i32 1
  %bound_ptr3839 = getelementptr { i32, [ 0 x i32 ] }** %elt3835, i32 0, i32 0
  %bound3840 = load i32* %bound_ptr3839
  call void @oat_array_bounds_check( i32 %bound3840, i32 3 )
  %elt3838 = getelementptr { i32, [ 0 x i32 ] }** %elt3835, i32 0, i32 1, i32 3
  %_lhs3841 = load i32* %elt3838
  ret i32 %_lhs3841
}


define void @arr3830.init (){

__fresh741:
  %array_ptr3818 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 2 )
  %array3819 = bitcast { i32, [ 0 x i32 ] }* %array_ptr3818 to { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* 
  %array_ptr3820 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 2 )
  %array3821 = bitcast { i32, [ 0 x i32 ] }* %array_ptr3820 to { i32, [ 0 x i32 ] }* 
  %index_ptr3822 = getelementptr { i32, [ 0 x i32 ] }* %array3821, i32 0, i32 1, i32 0
  store i32 1, i32* %index_ptr3822
  %index_ptr3823 = getelementptr { i32, [ 0 x i32 ] }* %array3821, i32 0, i32 1, i32 1
  store i32 2, i32* %index_ptr3823
  %index_ptr3824 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array3819, i32 0, i32 1, i32 0
  store { i32, [ 0 x i32 ] }* %array3821, { i32, [ 0 x i32 ] }** %index_ptr3824
  %array_ptr3825 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 2 )
  %array3826 = bitcast { i32, [ 0 x i32 ] }* %array_ptr3825 to { i32, [ 0 x i32 ] }* 
  %index_ptr3827 = getelementptr { i32, [ 0 x i32 ] }* %array3826, i32 0, i32 1, i32 0
  store i32 3, i32* %index_ptr3827
  %index_ptr3828 = getelementptr { i32, [ 0 x i32 ] }* %array3826, i32 0, i32 1, i32 1
  store i32 4, i32* %index_ptr3828
  %index_ptr3829 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array3819, i32 0, i32 1, i32 1
  store { i32, [ 0 x i32 ] }* %array3826, { i32, [ 0 x i32 ] }** %index_ptr3829
  store { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array3819, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** @arr3830
  ret void
}


