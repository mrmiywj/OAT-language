declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh218:
  ret void
}


define i32 @program (i32 %argc1361, { i32, [ 0 x i8* ] }* %argv1359){

__fresh217:
  %argc_slot1362 = alloca i32
  store i32 %argc1361, i32* %argc_slot1362
  %argv_slot1360 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv1359, { i32, [ 0 x i8* ] }** %argv_slot1360
  %array_ptr1363 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 3 )
  %array1364 = bitcast { i32, [ 0 x i32 ] }* %array_ptr1363 to { i32, [ 0 x i32 ] }* 
  %index_ptr1365 = getelementptr { i32, [ 0 x i32 ] }* %array1364, i32 0, i32 1, i32 0
  store i32 0, i32* %index_ptr1365
  %index_ptr1366 = getelementptr { i32, [ 0 x i32 ] }* %array1364, i32 0, i32 1, i32 1
  store i32 1, i32* %index_ptr1366
  %index_ptr1367 = getelementptr { i32, [ 0 x i32 ] }* %array1364, i32 0, i32 1, i32 2
  store i32 2, i32* %index_ptr1367
  %arr1368 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array1364, { i32, [ 0 x i32 ] }** %arr1368
  %_lhs1369 = load { i32, [ 0 x i32 ] }** %arr1368
  %len_ptr1370 = getelementptr { i32, [ 0 x i32 ] }* %_lhs1369, i32 0, i32 0
  %len1371 = load i32* %len_ptr1370
  %len1372 = alloca i32
  store i32 %len1371, i32* %len1372
  %_lhs1373 = load i32* %len1372
  ret i32 %_lhs1373
}


