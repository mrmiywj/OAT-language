declare i8* @string_of_array({ i32, [ 0 x i32 ] })
declare { i32, [ 0 x i32 ] } @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] } @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@_oat_string1582.str. = private unnamed_addr constant [ 6 x i8 ] c "hello\00", align 4
@_oat_string1582 = global i8* getelementptr inbounds ([ 6 x i8 ]* @_oat_string1582.str., i32 0, i32 0), align 4
define void @oat_init (){

__fresh209:
  ret void
}


define i32 @program (i32 %argc1580, { i32, [ 0 x i8* ] } %argv1578){

__fresh206:
  %argc_slot1581 = alloca i32
  store i32 %argc1580, i32* %argc_slot1581
  %argv_slot1579 = alloca { i32, [ 0 x i8* ] }
  store { i32, [ 0 x i8* ] } %argv1578, { i32, [ 0 x i8* ] }* %argv_slot1579
  %strval1583 = load i8** @_oat_string1582
  %str1584 = alloca i8*
  store i8* %strval1583, i8** %str1584
  %_lhs1585 = load i8** %str1584
  %ret1586 = call { i32, [ 0 x i32 ] } @array_of_string ( i8* %_lhs1585 )
  %arr1587 = alloca { i32, [ 0 x i32 ] }
  store { i32, [ 0 x i32 ] } %ret1586, { i32, [ 0 x i32 ] }* %arr1587
  %s1588 = alloca i32
  store i32 0, i32* %s1588
  %i1589 = alloca i32
  store i32 0, i32* %i1589
  br label %__cond205

__cond205:
  %_lhs1590 = load i32* %i1589
  %bop1591 = icmp slt i32 %_lhs1590, 5
  br i1 %bop1591, label %__body204, label %__post203

__fresh207:
  br label %__body204

__body204:
  %_lhs1592 = load i32* %s1588
  %_lhs1593 = load i32* %i1589
  %bound_ptr1595 = getelementptr { i32, [ 0 x i32 ] }* %arr1587, i32 0, i32 0
  %bound1596 = load i32* %bound_ptr1595
  call void @oat_array_bounds_check( i32 %bound1596, i32 %_lhs1593 )
  %elt1594 = getelementptr { i32, [ 0 x i32 ] }* %arr1587, i32 0, i32 1, i32 %_lhs1593
  %_lhs1597 = load i32* %elt1594
  %bop1598 = add i32 %_lhs1592, %_lhs1597
  store i32 %bop1598, i32* %s1588
  %_lhs1599 = load i32* %i1589
  %bop1600 = add i32 %_lhs1599, 1
  store i32 %bop1600, i32* %i1589
  br label %__cond205

__fresh208:
  br label %__post203

__post203:
  %_lhs1601 = load i32* %s1588
  ret i32 %_lhs1601
}


