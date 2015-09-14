declare i8* @string_of_array({ i32, [ 0 x i32 ] })
declare { i32, [ 0 x i32 ] } @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] } @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@arr11610 = global { i32, [ 0 x i32 ] } zeroinitializer, align 4		; initialized by arr11610.init
define void @oat_init (){

__fresh217:
  call void @arr11610.init(  )
  ret void
}


define i32 @program (i32 %argc1613, { i32, [ 0 x i8* ] } %argv1611){

__fresh214:
  %argc_slot1614 = alloca i32
  store i32 %argc1613, i32* %argc_slot1614
  %argv_slot1612 = alloca { i32, [ 0 x i8* ] }
  store { i32, [ 0 x i8* ] } %argv1611, { i32, [ 0 x i8* ] }* %argv_slot1612
  %_lhs1615 = load { i32, [ 0 x i32 ] }* @arr11610
  %ret1616 = call i8* @string_of_array ( { i32, [ 0 x i32 ] } %_lhs1615 )
  %str1617 = alloca i8*
  store i8* %ret1616, i8** %str1617
  %_lhs1618 = load i8** %str1617
  %ret1619 = call { i32, [ 0 x i32 ] } @array_of_string ( i8* %_lhs1618 )
  %arr21620 = alloca { i32, [ 0 x i32 ] }
  store { i32, [ 0 x i32 ] } %ret1619, { i32, [ 0 x i32 ] }* %arr21620
  %s1621 = alloca i32
  store i32 0, i32* %s1621
  %i1622 = alloca i32
  store i32 0, i32* %i1622
  br label %__cond213

__cond213:
  %_lhs1623 = load i32* %i1622
  %bop1624 = icmp slt i32 %_lhs1623, 5
  br i1 %bop1624, label %__body212, label %__post211

__fresh215:
  br label %__body212

__body212:
  %_lhs1625 = load i32* %s1621
  %_lhs1626 = load i32* %i1622
  %bound_ptr1628 = getelementptr { i32, [ 0 x i32 ] }* %arr21620, i32 0, i32 0
  %bound1629 = load i32* %bound_ptr1628
  call void @oat_array_bounds_check( i32 %bound1629, i32 %_lhs1626 )
  %elt1627 = getelementptr { i32, [ 0 x i32 ] }* %arr21620, i32 0, i32 1, i32 %_lhs1626
  %_lhs1630 = load i32* %elt1627
  %bop1631 = add i32 %_lhs1625, %_lhs1630
  store i32 %bop1631, i32* %s1621
  %_lhs1632 = load i32* %i1622
  %bop1633 = add i32 %_lhs1632, 1
  store i32 %bop1633, i32* %i1622
  br label %__cond213

__fresh216:
  br label %__post211

__post211:
  %_lhs1634 = load i32* %s1621
  ret i32 %_lhs1634
}


define void @arr11610.init (){

__fresh210:
  %array_ptr1603 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 5 )
  %array1604 = bitcast { i32, [ 0 x i32 ] } %array_ptr1603 to { i32, [ 0 x i32 ] } 
  %index_ptr1605 = getelementptr { i32, [ 0 x i32 ] } %array1604, i32 0, i32 1, i32 0
  store i32 111, i32* %index_ptr1605
  %index_ptr1606 = getelementptr { i32, [ 0 x i32 ] } %array1604, i32 0, i32 1, i32 1
  store i32 112, i32* %index_ptr1606
  %index_ptr1607 = getelementptr { i32, [ 0 x i32 ] } %array1604, i32 0, i32 1, i32 2
  store i32 113, i32* %index_ptr1607
  %index_ptr1608 = getelementptr { i32, [ 0 x i32 ] } %array1604, i32 0, i32 1, i32 3
  store i32 114, i32* %index_ptr1608
  %index_ptr1609 = getelementptr { i32, [ 0 x i32 ] } %array1604, i32 0, i32 1, i32 4
  store i32 115, i32* %index_ptr1609
  store { i32, [ 0 x i32 ] } %array1604, { i32, [ 0 x i32 ] }* @arr11610
  ret void
}


