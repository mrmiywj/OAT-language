declare i8* @string_of_array({ i32, [ 0 x i32 ] })
declare { i32, [ 0 x i32 ] } @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] } @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@str1555 = global i8* zeroinitializer, align 4		; initialized by str1555.init
@_oat_string1553.str. = private unnamed_addr constant [ 6 x i8 ] c "hello\00", align 4
@_oat_string1553 = global i8* getelementptr inbounds ([ 6 x i8 ]* @_oat_string1553.str., i32 0, i32 0), align 4
define void @oat_init (){

__fresh202:
  call void @str1555.init(  )
  ret void
}


define i32 @program (i32 %argc1559, { i32, [ 0 x i8* ] } %argv1557){

__fresh199:
  %argc_slot1560 = alloca i32
  store i32 %argc1559, i32* %argc_slot1560
  %argv_slot1558 = alloca { i32, [ 0 x i8* ] }
  store { i32, [ 0 x i8* ] } %argv1557, { i32, [ 0 x i8* ] }* %argv_slot1558
  %_lhs1561 = load i8** @str1555
  %ret1562 = call { i32, [ 0 x i32 ] } @array_of_string ( i8* %_lhs1561 )
  %arr1563 = alloca { i32, [ 0 x i32 ] }
  store { i32, [ 0 x i32 ] } %ret1562, { i32, [ 0 x i32 ] }* %arr1563
  %s1564 = alloca i32
  store i32 0, i32* %s1564
  %i1565 = alloca i32
  store i32 0, i32* %i1565
  br label %__cond198

__cond198:
  %_lhs1566 = load i32* %i1565
  %bop1567 = icmp slt i32 %_lhs1566, 5
  br i1 %bop1567, label %__body197, label %__post196

__fresh200:
  br label %__body197

__body197:
  %_lhs1568 = load i32* %s1564
  %_lhs1569 = load i32* %i1565
  %bound_ptr1571 = getelementptr { i32, [ 0 x i32 ] }* %arr1563, i32 0, i32 0
  %bound1572 = load i32* %bound_ptr1571
  call void @oat_array_bounds_check( i32 %bound1572, i32 %_lhs1569 )
  %elt1570 = getelementptr { i32, [ 0 x i32 ] }* %arr1563, i32 0, i32 1, i32 %_lhs1569
  %_lhs1573 = load i32* %elt1570
  %bop1574 = add i32 %_lhs1568, %_lhs1573
  store i32 %bop1574, i32* %s1564
  %_lhs1575 = load i32* %i1565
  %bop1576 = add i32 %_lhs1575, 1
  store i32 %bop1576, i32* %i1565
  br label %__cond198

__fresh201:
  br label %__post196

__post196:
  %_lhs1577 = load i32* %s1564
  ret i32 %_lhs1577
}


define void @str1555.init (){

__fresh195:
  %strval1554 = load i8** @_oat_string1553
  store i8* %strval1554, i8** @str1555
  ret void
}


