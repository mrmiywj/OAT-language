declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh760:
  ret void
}


define i32 @program (i32 %argc3920, { i32, [ 0 x i8* ] }* %argv3918){

__fresh759:
  %argc_slot3921 = alloca i32
  store i32 %argc3920, i32* %argc_slot3921
  %argv_slot3919 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv3918, { i32, [ 0 x i8* ] }** %argv_slot3919
  %array_ptr3922 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 2 )
  %array3923 = bitcast { i32, [ 0 x i32 ] }* %array_ptr3922 to { i32, [ 0 x i32 ] }* 
  %index_ptr3924 = getelementptr { i32, [ 0 x i32 ] }* %array3923, i32 0, i32 1, i32 0
  store i32 0, i32* %index_ptr3924
  %index_ptr3925 = getelementptr { i32, [ 0 x i32 ] }* %array3923, i32 0, i32 1, i32 1
  store i32 0, i32* %index_ptr3925
  %a3926 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array3923, { i32, [ 0 x i32 ] }** %a3926
  %unop3927 = sub i32 0, 1
  %bound_ptr3929 = getelementptr { i32, [ 0 x i32 ] }** %a3926, i32 0, i32 0
  %bound3930 = load i32* %bound_ptr3929
  call void @oat_array_bounds_check( i32 %bound3930, i32 %unop3927 )
  %elt3928 = getelementptr { i32, [ 0 x i32 ] }** %a3926, i32 0, i32 1, i32 %unop3927
  %_lhs3931 = load i32* %elt3928
  ret i32 %_lhs3931
}


