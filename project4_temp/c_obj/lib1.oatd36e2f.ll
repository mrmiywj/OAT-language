declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh121:
  ret void
}


define i32 @program (i32 %argc946, { i32, [ 0 x i8* ] }* %argv944){

__fresh120:
  %argc_slot947 = alloca i32
  store i32 %argc946, i32* %argc_slot947
  %argv_slot945 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv944, { i32, [ 0 x i8* ] }** %argv_slot945
  %array_ptr948 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 3 )
  %array949 = bitcast { i32, [ 0 x i32 ] }* %array_ptr948 to { i32, [ 0 x i32 ] }* 
  %index_ptr950 = getelementptr { i32, [ 0 x i32 ] }* %array949, i32 0, i32 1, i32 0
  store i32 0, i32* %index_ptr950
  %index_ptr951 = getelementptr { i32, [ 0 x i32 ] }* %array949, i32 0, i32 1, i32 1
  store i32 1, i32* %index_ptr951
  %index_ptr952 = getelementptr { i32, [ 0 x i32 ] }* %array949, i32 0, i32 1, i32 2
  store i32 2, i32* %index_ptr952
  %arr953 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array949, { i32, [ 0 x i32 ] }** %arr953
  %_lhs954 = load { i32, [ 0 x i32 ] }** %arr953
  %len_ptr955 = getelementptr { i32, [ 0 x i32 ] }* %_lhs954, i32 0, i32 0
  %len956 = load i32* %len_ptr955
  %len957 = alloca i32
  store i32 %len956, i32* %len957
  %_lhs958 = load i32* %len957
  ret i32 %_lhs958
}


