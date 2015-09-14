declare i8* @string_of_array({ i32, [ 0 x i32 ] })
declare { i32, [ 0 x i32 ] } @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] } @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh190:
  ret void
}


define i32 @program (i32 %argc1468, { i32, [ 0 x i8* ] } %argv1466){

__fresh189:
  %argc_slot1469 = alloca i32
  store i32 %argc1468, i32* %argc_slot1469
  %argv_slot1467 = alloca { i32, [ 0 x i8* ] }
  store { i32, [ 0 x i8* ] } %argv1466, { i32, [ 0 x i8* ] }* %argv_slot1467
  %array_ptr1470 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 3 )
  %array1471 = bitcast { i32, [ 0 x i32 ] } %array_ptr1470 to { i32, [ 0 x i32 ] } 
  %index_ptr1472 = getelementptr { i32, [ 0 x i32 ] } %array1471, i32 0, i32 1, i32 0
  store i32 0, i32* %index_ptr1472
  %index_ptr1473 = getelementptr { i32, [ 0 x i32 ] } %array1471, i32 0, i32 1, i32 1
  store i32 1, i32* %index_ptr1473
  %index_ptr1474 = getelementptr { i32, [ 0 x i32 ] } %array1471, i32 0, i32 1, i32 2
  store i32 2, i32* %index_ptr1474
  %arr1475 = alloca { i32, [ 0 x i32 ] }
  store { i32, [ 0 x i32 ] } %array1471, { i32, [ 0 x i32 ] }* %arr1475
  %_lhs1476 = load { i32, [ 0 x i32 ] }* %arr1475
  %len_ptr1477 = getelementptr { i32, [ 0 x i32 ] } %_lhs1476, i32 0, i32 0
  %len1478 = load i32* %len_ptr1477
  %len1479 = alloca i32
  store i32 %len1478, i32* %len1479
  %_lhs1480 = load i32* %len1479
  ret i32 %_lhs1480
}


