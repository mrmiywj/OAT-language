declare i8* @string_of_array({ i32, [ 0 x i32 ] })
declare { i32, [ 0 x i32 ] } @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] } @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh224:
  ret void
}


define i32 @program (i32 %argc1637, { i32, [ 0 x i8* ] } %argv1635){

__fresh221:
  %argc_slot1638 = alloca i32
  store i32 %argc1637, i32* %argc_slot1638
  %argv_slot1636 = alloca { i32, [ 0 x i8* ] }
  store { i32, [ 0 x i8* ] } %argv1635, { i32, [ 0 x i8* ] }* %argv_slot1636
  %array_ptr1639 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 5 )
  %array1640 = bitcast { i32, [ 0 x i32 ] } %array_ptr1639 to { i32, [ 0 x i32 ] } 
  %index_ptr1641 = getelementptr { i32, [ 0 x i32 ] } %array1640, i32 0, i32 1, i32 0
  store i32 111, i32* %index_ptr1641
  %index_ptr1642 = getelementptr { i32, [ 0 x i32 ] } %array1640, i32 0, i32 1, i32 1
  store i32 112, i32* %index_ptr1642
  %index_ptr1643 = getelementptr { i32, [ 0 x i32 ] } %array1640, i32 0, i32 1, i32 2
  store i32 113, i32* %index_ptr1643
  %index_ptr1644 = getelementptr { i32, [ 0 x i32 ] } %array1640, i32 0, i32 1, i32 3
  store i32 114, i32* %index_ptr1644
  %index_ptr1645 = getelementptr { i32, [ 0 x i32 ] } %array1640, i32 0, i32 1, i32 4
  store i32 115, i32* %index_ptr1645
  %arr11646 = alloca { i32, [ 0 x i32 ] }
  store { i32, [ 0 x i32 ] } %array1640, { i32, [ 0 x i32 ] }* %arr11646
  %_lhs1647 = load { i32, [ 0 x i32 ] }* %arr11646
  %ret1648 = call i8* @string_of_array ( { i32, [ 0 x i32 ] } %_lhs1647 )
  %str1649 = alloca i8*
  store i8* %ret1648, i8** %str1649
  %_lhs1650 = load i8** %str1649
  %ret1651 = call { i32, [ 0 x i32 ] } @array_of_string ( i8* %_lhs1650 )
  %arr21652 = alloca { i32, [ 0 x i32 ] }
  store { i32, [ 0 x i32 ] } %ret1651, { i32, [ 0 x i32 ] }* %arr21652
  %s1653 = alloca i32
  store i32 0, i32* %s1653
  %i1654 = alloca i32
  store i32 0, i32* %i1654
  br label %__cond220

__cond220:
  %_lhs1655 = load i32* %i1654
  %bop1656 = icmp slt i32 %_lhs1655, 5
  br i1 %bop1656, label %__body219, label %__post218

__fresh222:
  br label %__body219

__body219:
  %_lhs1657 = load i32* %s1653
  %_lhs1658 = load i32* %i1654
  %bound_ptr1660 = getelementptr { i32, [ 0 x i32 ] }* %arr21652, i32 0, i32 0
  %bound1661 = load i32* %bound_ptr1660
  call void @oat_array_bounds_check( i32 %bound1661, i32 %_lhs1658 )
  %elt1659 = getelementptr { i32, [ 0 x i32 ] }* %arr21652, i32 0, i32 1, i32 %_lhs1658
  %_lhs1662 = load i32* %elt1659
  %bop1663 = add i32 %_lhs1657, %_lhs1662
  store i32 %bop1663, i32* %s1653
  %_lhs1664 = load i32* %i1654
  %bop1665 = add i32 %_lhs1664, 1
  store i32 %bop1665, i32* %i1654
  br label %__cond220

__fresh223:
  br label %__post218

__post218:
  %_lhs1666 = load i32* %s1653
  ret i32 %_lhs1666
}


