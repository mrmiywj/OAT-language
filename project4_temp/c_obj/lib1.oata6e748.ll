declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh52:
  ret void
}


define i32 @program (i32 %argc391, { i32, [ 0 x i8* ] }* %argv389){

__fresh51:
  %argc_slot392 = alloca i32
  store i32 %argc391, i32* %argc_slot392
  %argv_slot390 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv389, { i32, [ 0 x i8* ] }** %argv_slot390
  %array_ptr393 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 3 )
  %array394 = bitcast { i32, [ 0 x i32 ] }* %array_ptr393 to { i32, [ 0 x i32 ] }* 
  %index_ptr395 = getelementptr { i32, [ 0 x i32 ] }* %array394, i32 0, i32 1, i32 0
  store i32 0, i32* %index_ptr395
  %index_ptr396 = getelementptr { i32, [ 0 x i32 ] }* %array394, i32 0, i32 1, i32 1
  store i32 1, i32* %index_ptr396
  %index_ptr397 = getelementptr { i32, [ 0 x i32 ] }* %array394, i32 0, i32 1, i32 2
  store i32 2, i32* %index_ptr397
  %arr398 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array394, { i32, [ 0 x i32 ] }** %arr398
  %_lhs399 = load { i32, [ 0 x i32 ] }** %arr398
  %len_ptr400 = getelementptr { i32, [ 0 x i32 ] }* %_lhs399, i32 0, i32 0
  %len401 = load i32* %len_ptr400
  %len402 = alloca i32
  store i32 %len401, i32* %len402
  %_lhs403 = load i32* %len402
  ret i32 %_lhs403
}


