declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@arr3809 = global { i32, [ 0 x i32 ] }* zeroinitializer, align 4		; initialized by arr3809.init
define void @oat_init (){

__fresh740:
  call void @arr3809.init(  )
  ret void
}


define i32 @program (i32 %argc3812, { i32, [ 0 x i8* ] }* %argv3810){

__fresh739:
  %argc_slot3813 = alloca i32
  store i32 %argc3812, i32* %argc_slot3813
  %argv_slot3811 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv3810, { i32, [ 0 x i8* ] }** %argv_slot3811
  %bound_ptr3815 = getelementptr { i32, [ 0 x i32 ] }** @arr3809, i32 0, i32 0
  %bound3816 = load i32* %bound_ptr3815
  call void @oat_array_bounds_check( i32 %bound3816, i32 2 )
  %elt3814 = getelementptr { i32, [ 0 x i32 ] }** @arr3809, i32 0, i32 1, i32 2
  %_lhs3817 = load i32* %elt3814
  ret i32 %_lhs3817
}


define void @arr3809.init (){

__fresh738:
  %array_ptr3805 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 2 )
  %array3806 = bitcast { i32, [ 0 x i32 ] }* %array_ptr3805 to { i32, [ 0 x i32 ] }* 
  %index_ptr3807 = getelementptr { i32, [ 0 x i32 ] }* %array3806, i32 0, i32 1, i32 0
  store i32 1, i32* %index_ptr3807
  %index_ptr3808 = getelementptr { i32, [ 0 x i32 ] }* %array3806, i32 0, i32 1, i32 1
  store i32 2, i32* %index_ptr3808
  store { i32, [ 0 x i32 ] }* %array3806, { i32, [ 0 x i32 ] }** @arr3809
  ret void
}


