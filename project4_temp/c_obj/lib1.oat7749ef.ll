declare i8** @string_of_array({ i32, [ 0 x i32 ] }**)
declare { i32, [ 0 x i32 ] }** @array_of_string(i8**)
declare void @print_string(i8**)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32** @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }** @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh121:
  ret void
}


define i32 @program (i32 %argc956, { i32, [ 0 x i8** ] }** %argv954){

__fresh120:
  %argc_slot957 = alloca i32
  store i32 %argc956, i32** %argc_slot957
  %argv_slot955 = alloca { i32, [ 0 x i8** ] }**
  store { i32, [ 0 x i8** ] }** %argv954, { i32, [ 0 x i8** ] }**** %argv_slot955
  %array_ptr958 = call { i32, [ 0 x i32 ] }** @oat_alloc_array ( i32 3 )
  %array959 = bitcast { i32, [ 0 x i32 ] }** %array_ptr958 to { i32, [ 0 x i32 ] }** 
  %index_ptr960 = getelementptr { i32, [ 0 x i32 ] }** %array959, i32 0, i32 1, i32 0
  store i32 0, i32** %index_ptr960
  %index_ptr961 = getelementptr { i32, [ 0 x i32 ] }** %array959, i32 0, i32 1, i32 1
  store i32 1, i32** %index_ptr961
  %index_ptr962 = getelementptr { i32, [ 0 x i32 ] }** %array959, i32 0, i32 1, i32 2
  store i32 2, i32** %index_ptr962
  %arr963 = alloca { i32, [ 0 x i32 ] }**
  store { i32, [ 0 x i32 ] }** %array959, { i32, [ 0 x i32 ] }**** %arr963
  %_lhs964 = load { i32, [ 0 x i32 ] }**** %arr963
  %len_ptr965 = getelementptr { i32, [ 0 x i32 ] }** %_lhs964, i32 0, i32 0
  %len966 = load i32** %len_ptr965
  %len967 = alloca i32
  store i32 %len966, i32** %len967
  %_lhs968 = load i32** %len967
  ret i32 %_lhs968
}


