%A = type { %_A_vtable*, i8*, i32, i32, %O*, { i32, [ 0 x %A* ] }* }
%_A_vtable = type { %_O_vtable*, i8* (%Object*)*, void (%A*)*, void (%A*)*, i32 (%A*)* }
%O = type { %_O_vtable*, i8* }
%_O_vtable = type { %_Object_vtable*, i8* (%Object*)* }
%Object = type { %_Object_vtable*, i8* }
%_Object_vtable = type { {  }*, i8* (%Object*)* }
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
declare void @oat_abort(i32)
declare void @print_bool(i1)
declare void @print_int(i32)
declare void @print_string(i8*)
declare i32 @length_of_string(i8*)
declare i8* @string_cat(i8*, i8*)
declare i8* @string_of_int(i32)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
@_const_str286.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str286 = alias bitcast([ 2 x i8 ]* @_const_str286.str. to i8*)@_const_str285.str. = private unnamed_addr constant [ 2 x i8 ] c "O\00", align 4
@_const_str285 = alias bitcast([ 2 x i8 ]* @_const_str285.str. to i8*)@_const_str284.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str284 = alias bitcast([ 7 x i8 ]* @_const_str284.str. to i8*)@_A_vtable283 = private constant %_A_vtable {%_O_vtable* @_O_vtable282, i8* (%Object*)* @_Object_get_name, void (%A*)* @_A_init, void (%A*)* @_A_incr, i32 (%A*)* @_A_sum}, align 4
@_O_vtable282 = private constant %_O_vtable {%_Object_vtable* @_Object_vtable281, i8* (%Object*)* @_Object_get_name}, align 4
@_Object_vtable281 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh514:
  ret void
}


define i32 @program (i32 %argc1582, { i32, [ 0 x i8* ] }* %argv1580){
__fresh513:
  %argc_slot1583 = alloca i32
  store i32 %argc1582, i32* %argc_slot1583
  %argv_slot1581 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv1580, { i32, [ 0 x i8* ] }** %argv_slot1581
  %mem_ptr1584 = call i32* @oat_malloc ( i32 24 )
  %obj1585 = bitcast i32* %mem_ptr1584 to %A* 
  %new_obj1586 = call %A* @_A_ctor ( %A* %obj1585 )
  %vdecl_slot1587 = alloca %A*
  store %A* %new_obj1586, %A** %vdecl_slot1587
  %lhs_or_call1588 = load %A** %vdecl_slot1587
  %vtmp1590 = getelementptr %A* %lhs_or_call1588, i32 0, i32 0
  %vtable1589 = load %_A_vtable** %vtmp1590
  %fptmp1591 = getelementptr %_A_vtable* %vtable1589, i32 0, i32 2
  %method1592 = load void (%A*)** %fptmp1591
  call void %method1592( %A* %lhs_or_call1588 )
  %lhs_or_call1593 = load %A** %vdecl_slot1587
  %vtmp1595 = getelementptr %A* %lhs_or_call1593, i32 0, i32 0
  %vtable1594 = load %_A_vtable** %vtmp1595
  %fptmp1596 = getelementptr %_A_vtable* %vtable1594, i32 0, i32 4
  %method1597 = load i32 (%A*)** %fptmp1596
  %ret1598 = call i32 %method1597 ( %A* %lhs_or_call1593 )
  ret i32 %ret1598
}


define i32 @_A_sum (%A* %_this1){
__fresh506:
  %vdecl_slot1528 = alloca i32
  store i32 0, i32* %vdecl_slot1528
  %path1529 = getelementptr %A* %_this1, i32 0, i32 5
  %lhs_or_call1530 = load { i32, [ 0 x %A* ] }** %path1529
  %ifnull_slot1531 = alloca { i32, [ 0 x %A* ] }*
  store { i32, [ 0 x %A* ] }* %lhs_or_call1530, { i32, [ 0 x %A* ] }** %ifnull_slot1531
  %ifnull_guard1532 = icmp ne { i32, [ 0 x %A* ] }* %lhs_or_call1530, null
  br i1 %ifnull_guard1532, label %__then505, label %__else504

__fresh507:
  br label %__then505

__then505:
  %vdecl_slot1533 = alloca i32
  store i32 0, i32* %vdecl_slot1533
  br label %__cond499

__cond499:
  %lhs_or_call1534 = load i32* %vdecl_slot1533
  %lhs_or_call1535 = load { i32, [ 0 x %A* ] }** %ifnull_slot1531
  %len_ptr1536 = getelementptr { i32, [ 0 x %A* ] }* %lhs_or_call1535, i32 0, i32 0
  %len1537 = load i32* %len_ptr1536
  %bop1538 = icmp slt i32 %lhs_or_call1534, %len1537
  br i1 %bop1538, label %__body498, label %__post497

__fresh508:
  br label %__body498

__body498:
  %lhs_or_call1539 = load { i32, [ 0 x %A* ] }** %ifnull_slot1531
  %lhs_or_call1540 = load i32* %vdecl_slot1533
  %bound_ptr1542 = getelementptr { i32, [ 0 x %A* ] }* %lhs_or_call1539, i32 0, i32 0
  %bound1543 = load i32* %bound_ptr1542
  call void @oat_array_bounds_check( i32 %bound1543, i32 %lhs_or_call1540 )
  %elt1541 = getelementptr { i32, [ 0 x %A* ] }* %lhs_or_call1539, i32 0, i32 1, i32 %lhs_or_call1540
  %lhs_or_call1544 = load %A** %elt1541
  %vtmp1546 = getelementptr %A* %lhs_or_call1544, i32 0, i32 0
  %vtable1545 = load %_A_vtable** %vtmp1546
  %fptmp1547 = getelementptr %_A_vtable* %vtable1545, i32 0, i32 3
  %method1548 = load void (%A*)** %fptmp1547
  call void %method1548( %A* %lhs_or_call1544 )
  %lhs_or_call1549 = load i32* %vdecl_slot1533
  %bop1550 = add i32 %lhs_or_call1549, 1
  store i32 %bop1550, i32* %vdecl_slot1533
  br label %__cond499

__fresh509:
  br label %__post497

__post497:
  %vdecl_slot1551 = alloca i32
  store i32 0, i32* %vdecl_slot1551
  br label %__cond502

__cond502:
  %lhs_or_call1552 = load i32* %vdecl_slot1551
  %lhs_or_call1553 = load { i32, [ 0 x %A* ] }** %ifnull_slot1531
  %len_ptr1554 = getelementptr { i32, [ 0 x %A* ] }* %lhs_or_call1553, i32 0, i32 0
  %len1555 = load i32* %len_ptr1554
  %bop1556 = icmp slt i32 %lhs_or_call1552, %len1555
  br i1 %bop1556, label %__body501, label %__post500

__fresh510:
  br label %__body501

__body501:
  %lhs_or_call1557 = load i32* %vdecl_slot1528
  %lhs_or_call1558 = load { i32, [ 0 x %A* ] }** %ifnull_slot1531
  %lhs_or_call1559 = load i32* %vdecl_slot1551
  %bound_ptr1561 = getelementptr { i32, [ 0 x %A* ] }* %lhs_or_call1558, i32 0, i32 0
  %bound1562 = load i32* %bound_ptr1561
  call void @oat_array_bounds_check( i32 %bound1562, i32 %lhs_or_call1559 )
  %elt1560 = getelementptr { i32, [ 0 x %A* ] }* %lhs_or_call1558, i32 0, i32 1, i32 %lhs_or_call1559
  %lhs_or_call1563 = load %A** %elt1560
  %path1564 = getelementptr %A* %lhs_or_call1563, i32 0, i32 2
  %lhs_or_call1565 = load i32* %path1564
  %bop1566 = add i32 %lhs_or_call1557, %lhs_or_call1565
  store i32 %bop1566, i32* %vdecl_slot1528
  %lhs_or_call1567 = load i32* %vdecl_slot1528
  %lhs_or_call1568 = load { i32, [ 0 x %A* ] }** %ifnull_slot1531
  %lhs_or_call1569 = load i32* %vdecl_slot1551
  %bound_ptr1571 = getelementptr { i32, [ 0 x %A* ] }* %lhs_or_call1568, i32 0, i32 0
  %bound1572 = load i32* %bound_ptr1571
  call void @oat_array_bounds_check( i32 %bound1572, i32 %lhs_or_call1569 )
  %elt1570 = getelementptr { i32, [ 0 x %A* ] }* %lhs_or_call1568, i32 0, i32 1, i32 %lhs_or_call1569
  %lhs_or_call1573 = load %A** %elt1570
  %path1574 = getelementptr %A* %lhs_or_call1573, i32 0, i32 3
  %lhs_or_call1575 = load i32* %path1574
  %bop1576 = add i32 %lhs_or_call1567, %lhs_or_call1575
  store i32 %bop1576, i32* %vdecl_slot1528
  %lhs_or_call1577 = load i32* %vdecl_slot1551
  %bop1578 = add i32 %lhs_or_call1577, 1
  store i32 %bop1578, i32* %vdecl_slot1551
  br label %__cond502

__fresh511:
  br label %__post500

__post500:
  br label %__merge503

__fresh512:
  br label %__else504

__else504:
  br label %__merge503

__merge503:
  %lhs_or_call1579 = load i32* %vdecl_slot1528
  ret i32 %lhs_or_call1579
}


define void @_A_incr (%A* %_this1){
__fresh496:
  %path1520 = getelementptr %A* %_this1, i32 0, i32 2
  %path1521 = getelementptr %A* %_this1, i32 0, i32 2
  %lhs_or_call1522 = load i32* %path1521
  %bop1523 = add i32 %lhs_or_call1522, 1
  store i32 %bop1523, i32* %path1520
  %path1524 = getelementptr %A* %_this1, i32 0, i32 3
  %path1525 = getelementptr %A* %_this1, i32 0, i32 3
  %lhs_or_call1526 = load i32* %path1525
  %bop1527 = add i32 %lhs_or_call1526, 1
  store i32 %bop1527, i32* %path1524
  ret void
}


define void @_A_init (%A* %_this1){
__fresh487:
  %path1479 = getelementptr %A* %_this1, i32 0, i32 4
  %mem_ptr1480 = call i32* @oat_malloc ( i32 24 )
  %obj1481 = bitcast i32* %mem_ptr1480 to %A* 
  %new_obj1482 = call %A* @_A_ctor ( %A* %obj1481 )
  %cast_op1483 = bitcast %A* %new_obj1482 to %O* 
  store %O* %cast_op1483, %O** %path1479
  %path1484 = getelementptr %A* %_this1, i32 0, i32 4
  %lhs_or_call1485 = load %O** %path1484
  %ifnull_slot1486 = alloca %O*
  store %O* %lhs_or_call1485, %O** %ifnull_slot1486
  %ifnull_guard1487 = icmp ne %O* %lhs_or_call1485, null
  br i1 %ifnull_guard1487, label %__then483, label %__else482

__fresh488:
  br label %__then483

__then483:
  %lhs_or_call1488 = load %O** %ifnull_slot1486
  %cast_op1489 = bitcast %O* %lhs_or_call1488 to %A* 
  %cast_op1490 = bitcast %A* %cast_op1489 to i8** 
  %cast_op1491 = bitcast %_A_vtable* @_A_vtable283 to i8* 
  %vt_ptr_slot1492 = alloca i8*
  %tmp01494 = load i8** %cast_op1490
  store i8* %tmp01494, i8** %vt_ptr_slot1492
  br label %__loop480

__loop480:
  %tmp11495 = load i8** %vt_ptr_slot1492
  %guard11499 = icmp eq i8* %tmp11495, %cast_op1491
  br i1 %guard11499, label %__then477, label %__fall1479

__fresh489:
  br label %__fall1479

__fall1479:
  %guard21500 = icmp eq i8* %tmp11495, null
  br i1 %guard21500, label %__else476, label %__fall2478

__fresh490:
  br label %__fall2478

__fall2478:
  %tmp21496 = load i8** %vt_ptr_slot1492
  %tmp31497 = bitcast i8* %tmp21496 to i8** 
  %tmp41498 = load i8** %tmp31497
  store i8* %tmp41498, i8** %vt_ptr_slot1492
  br label %__loop480

__fresh491:
  br label %__then477

__then477:
  %var_slot1493 = alloca %A*
  store %A* %cast_op1489, %A** %var_slot1493
  br label %__done475

__fresh492:
  br label %__else476

__else476:
  br label %__done475

__done475:
  br label %__merge481

__fresh493:
  br label %__else482

__else482:
  br label %__merge481

__merge481:
  %path1501 = getelementptr %A* %_this1, i32 0, i32 5
  %array_ptr1502 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 2 )
  %array1503 = bitcast { i32, [ 0 x i32 ] }* %array_ptr1502 to { i32, [ 0 x %A* ] }* 
  %_tmp2891504 = alloca i32
  store i32 2, i32* %_tmp2891504
  %_tmp2901505 = alloca { i32, [ 0 x %A* ] }*
  store { i32, [ 0 x %A* ] }* %array1503, { i32, [ 0 x %A* ] }** %_tmp2901505
  %vdecl_slot1506 = alloca i32
  store i32 0, i32* %vdecl_slot1506
  br label %__cond486

__cond486:
  %lhs_or_call1507 = load i32* %vdecl_slot1506
  %lhs_or_call1508 = load i32* %_tmp2891504
  %bop1509 = icmp slt i32 %lhs_or_call1507, %lhs_or_call1508
  br i1 %bop1509, label %__body485, label %__post484

__fresh494:
  br label %__body485

__body485:
  %lhs_or_call1510 = load { i32, [ 0 x %A* ] }** %_tmp2901505
  %lhs_or_call1511 = load i32* %vdecl_slot1506
  %bound_ptr1513 = getelementptr { i32, [ 0 x %A* ] }* %lhs_or_call1510, i32 0, i32 0
  %bound1514 = load i32* %bound_ptr1513
  call void @oat_array_bounds_check( i32 %bound1514, i32 %lhs_or_call1511 )
  %elt1512 = getelementptr { i32, [ 0 x %A* ] }* %lhs_or_call1510, i32 0, i32 1, i32 %lhs_or_call1511
  %mem_ptr1515 = call i32* @oat_malloc ( i32 24 )
  %obj1516 = bitcast i32* %mem_ptr1515 to %A* 
  %new_obj1517 = call %A* @_A_ctor ( %A* %obj1516 )
  store %A* %new_obj1517, %A** %elt1512
  %lhs_or_call1518 = load i32* %vdecl_slot1506
  %bop1519 = add i32 %lhs_or_call1518, 1
  store i32 %bop1519, i32* %vdecl_slot1506
  br label %__cond486

__fresh495:
  br label %__post484

__post484:
  store { i32, [ 0 x %A* ] }* %array1503, { i32, [ 0 x %A* ] }** %path1501
  ret void
}


define %A* @_A_ctor (%A* %_this1){
__fresh474:
  %cast_op1473 = bitcast %A* %_this1 to %O* 
  %dummy1474 = call %O* @_O_ctor ( %O* %cast_op1473 )
  %path1475 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str286, i8** %path1475
  %path1476 = getelementptr %A* %_this1, i32 0, i32 2
  store i32 1, i32* %path1476
  %path1477 = getelementptr %A* %_this1, i32 0, i32 3
  store i32 2, i32* %path1477
  %vt_slot1478 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable283, %_A_vtable** %vt_slot1478
  ret %A* %_this1
}


define %O* @_O_ctor (%O* %_this1){
__fresh473:
  %cast_op1469 = bitcast %O* %_this1 to %Object* 
  %dummy1470 = call %Object* @_Object_ctor ( %Object* %cast_op1469 )
  %path1471 = getelementptr %O* %_this1, i32 0, i32 1
  store i8* @_const_str285, i8** %path1471
  %vt_slot1472 = getelementptr %O* %_this1, i32 0, i32 0
  store %_O_vtable* @_O_vtable282, %_O_vtable** %vt_slot1472
  ret %O* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh472:
  %path1467 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call1468 = load i8** %path1467
  ret i8* %lhs_or_call1468
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh471:
  %path1465 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str284, i8** %path1465
  %vt_slot1466 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable281, %_Object_vtable** %vt_slot1466
  ret %Object* %_this1
}


