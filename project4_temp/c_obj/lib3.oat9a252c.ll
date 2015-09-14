declare i8* @string_of_array({ i32, [ 0 x i32 ] })
declare { i32, [ 0 x i32 ] } @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] } @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh194:
  ret void
}


define i32 @program (i32 %argc1518, { i32, [ 0 x i8* ] } %argv1516){

__fresh193:
  %argc_slot1519 = alloca i32
  store i32 %argc1518, i32* %argc_slot1519
  %argv_slot1517 = alloca { i32, [ 0 x i8* ] }
  store { i32, [ 0 x i8* ] } %argv1516, { i32, [ 0 x i8* ] }* %argv_slot1517
  %array_ptr1520 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 4 )
  %array1521 = bitcast { i32, [ 0 x i32 ] } %array_ptr1520 to { i32, [ 0 x { i32, [ 0 x i32 ] } ] } 
  %array_ptr1522 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 4 )
  %array1523 = bitcast { i32, [ 0 x i32 ] } %array_ptr1522 to { i32, [ 0 x i32 ] } 
  %index_ptr1524 = getelementptr { i32, [ 0 x i32 ] } %array1523, i32 0, i32 1, i32 0
  store i32 0, i32* %index_ptr1524
  %index_ptr1525 = getelementptr { i32, [ 0 x i32 ] } %array1523, i32 0, i32 1, i32 1
  store i32 0, i32* %index_ptr1525
  %index_ptr1526 = getelementptr { i32, [ 0 x i32 ] } %array1523, i32 0, i32 1, i32 2
  store i32 0, i32* %index_ptr1526
  %index_ptr1527 = getelementptr { i32, [ 0 x i32 ] } %array1523, i32 0, i32 1, i32 3
  store i32 0, i32* %index_ptr1527
  %index_ptr1528 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %array1521, i32 0, i32 1, i32 0
  store { i32, [ 0 x i32 ] } %array1523, { i32, [ 0 x i32 ] }* %index_ptr1528
  %array_ptr1529 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 2 )
  %array1530 = bitcast { i32, [ 0 x i32 ] } %array_ptr1529 to { i32, [ 0 x i32 ] } 
  %index_ptr1531 = getelementptr { i32, [ 0 x i32 ] } %array1530, i32 0, i32 1, i32 0
  store i32 1, i32* %index_ptr1531
  %index_ptr1532 = getelementptr { i32, [ 0 x i32 ] } %array1530, i32 0, i32 1, i32 1
  store i32 1, i32* %index_ptr1532
  %index_ptr1533 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %array1521, i32 0, i32 1, i32 1
  store { i32, [ 0 x i32 ] } %array1530, { i32, [ 0 x i32 ] }* %index_ptr1533
  %array_ptr1534 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 2 )
  %array1535 = bitcast { i32, [ 0 x i32 ] } %array_ptr1534 to { i32, [ 0 x i32 ] } 
  %index_ptr1536 = getelementptr { i32, [ 0 x i32 ] } %array1535, i32 0, i32 1, i32 0
  store i32 2, i32* %index_ptr1536
  %index_ptr1537 = getelementptr { i32, [ 0 x i32 ] } %array1535, i32 0, i32 1, i32 1
  store i32 2, i32* %index_ptr1537
  %index_ptr1538 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %array1521, i32 0, i32 1, i32 2
  store { i32, [ 0 x i32 ] } %array1535, { i32, [ 0 x i32 ] }* %index_ptr1538
  %array_ptr1539 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 2 )
  %array1540 = bitcast { i32, [ 0 x i32 ] } %array_ptr1539 to { i32, [ 0 x i32 ] } 
  %index_ptr1541 = getelementptr { i32, [ 0 x i32 ] } %array1540, i32 0, i32 1, i32 0
  store i32 3, i32* %index_ptr1541
  %index_ptr1542 = getelementptr { i32, [ 0 x i32 ] } %array1540, i32 0, i32 1, i32 1
  store i32 3, i32* %index_ptr1542
  %index_ptr1543 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %array1521, i32 0, i32 1, i32 3
  store { i32, [ 0 x i32 ] } %array1540, { i32, [ 0 x i32 ] }* %index_ptr1543
  %arr1544 = alloca { i32, [ 0 x { i32, [ 0 x i32 ] } ] }
  store { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %array1521, { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* %arr1544
  %bound_ptr1546 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* %arr1544, i32 0, i32 0
  %bound1547 = load i32* %bound_ptr1546
  call void @oat_array_bounds_check( i32 %bound1547, i32 0 )
  %elt1545 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* %arr1544, i32 0, i32 1, i32 0
  %_lhs1548 = load { i32, [ 0 x i32 ] }* %elt1545
  %len_ptr1549 = getelementptr { i32, [ 0 x i32 ] } %_lhs1548, i32 0, i32 0
  %len1550 = load i32* %len_ptr1549
  %len1551 = alloca i32
  store i32 %len1550, i32* %len1551
  %_lhs1552 = load i32* %len1551
  ret i32 %_lhs1552
}


