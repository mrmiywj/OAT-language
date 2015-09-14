declare i8* @string_of_array({ i32, [ 0 x i32 ] })
declare { i32, [ 0 x i32 ] } @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] } @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh192:
  ret void
}


define i32 @program (i32 %argc1483, { i32, [ 0 x i8* ] } %argv1481){

__fresh191:
  %argc_slot1484 = alloca i32
  store i32 %argc1483, i32* %argc_slot1484
  %argv_slot1482 = alloca { i32, [ 0 x i8* ] }
  store { i32, [ 0 x i8* ] } %argv1481, { i32, [ 0 x i8* ] }* %argv_slot1482
  %array_ptr1485 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 4 )
  %array1486 = bitcast { i32, [ 0 x i32 ] } %array_ptr1485 to { i32, [ 0 x { i32, [ 0 x i32 ] } ] } 
  %array_ptr1487 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 2 )
  %array1488 = bitcast { i32, [ 0 x i32 ] } %array_ptr1487 to { i32, [ 0 x i32 ] } 
  %index_ptr1489 = getelementptr { i32, [ 0 x i32 ] } %array1488, i32 0, i32 1, i32 0
  store i32 0, i32* %index_ptr1489
  %index_ptr1490 = getelementptr { i32, [ 0 x i32 ] } %array1488, i32 0, i32 1, i32 1
  store i32 0, i32* %index_ptr1490
  %index_ptr1491 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %array1486, i32 0, i32 1, i32 0
  store { i32, [ 0 x i32 ] } %array1488, { i32, [ 0 x i32 ] }* %index_ptr1491
  %array_ptr1492 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 2 )
  %array1493 = bitcast { i32, [ 0 x i32 ] } %array_ptr1492 to { i32, [ 0 x i32 ] } 
  %index_ptr1494 = getelementptr { i32, [ 0 x i32 ] } %array1493, i32 0, i32 1, i32 0
  store i32 1, i32* %index_ptr1494
  %index_ptr1495 = getelementptr { i32, [ 0 x i32 ] } %array1493, i32 0, i32 1, i32 1
  store i32 1, i32* %index_ptr1495
  %index_ptr1496 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %array1486, i32 0, i32 1, i32 1
  store { i32, [ 0 x i32 ] } %array1493, { i32, [ 0 x i32 ] }* %index_ptr1496
  %array_ptr1497 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 2 )
  %array1498 = bitcast { i32, [ 0 x i32 ] } %array_ptr1497 to { i32, [ 0 x i32 ] } 
  %index_ptr1499 = getelementptr { i32, [ 0 x i32 ] } %array1498, i32 0, i32 1, i32 0
  store i32 2, i32* %index_ptr1499
  %index_ptr1500 = getelementptr { i32, [ 0 x i32 ] } %array1498, i32 0, i32 1, i32 1
  store i32 2, i32* %index_ptr1500
  %index_ptr1501 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %array1486, i32 0, i32 1, i32 2
  store { i32, [ 0 x i32 ] } %array1498, { i32, [ 0 x i32 ] }* %index_ptr1501
  %array_ptr1502 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 2 )
  %array1503 = bitcast { i32, [ 0 x i32 ] } %array_ptr1502 to { i32, [ 0 x i32 ] } 
  %index_ptr1504 = getelementptr { i32, [ 0 x i32 ] } %array1503, i32 0, i32 1, i32 0
  store i32 3, i32* %index_ptr1504
  %index_ptr1505 = getelementptr { i32, [ 0 x i32 ] } %array1503, i32 0, i32 1, i32 1
  store i32 3, i32* %index_ptr1505
  %index_ptr1506 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %array1486, i32 0, i32 1, i32 3
  store { i32, [ 0 x i32 ] } %array1503, { i32, [ 0 x i32 ] }* %index_ptr1506
  %arr1507 = alloca { i32, [ 0 x { i32, [ 0 x i32 ] } ] }
  store { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %array1486, { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* %arr1507
  %bound_ptr1509 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* %arr1507, i32 0, i32 0
  %bound1510 = load i32* %bound_ptr1509
  call void @oat_array_bounds_check( i32 %bound1510, i32 2 )
  %elt1508 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* %arr1507, i32 0, i32 1, i32 2
  %_lhs1511 = load { i32, [ 0 x i32 ] }* %elt1508
  %len_ptr1512 = getelementptr { i32, [ 0 x i32 ] } %_lhs1511, i32 0, i32 0
  %len1513 = load i32* %len_ptr1512
  %len1514 = alloca i32
  store i32 %len1513, i32* %len1514
  %_lhs1515 = load i32* %len1514
  ret i32 %_lhs1515
}


