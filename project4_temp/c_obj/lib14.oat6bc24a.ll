declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@a1568 = global { i32, [ 0 x i32 ] }* zeroinitializer, align 4		; initialized by a1568.init
define void @oat_init (){

__fresh246:
  call void @a1568.init(  )
  ret void
}


define i32 @program (i32 %argc1571, { i32, [ 0 x i8* ] }* %argv1569){

__fresh245:
  %argc_slot1572 = alloca i32
  store i32 %argc1571, i32* %argc_slot1572
  %argv_slot1570 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv1569, { i32, [ 0 x i8* ] }** %argv_slot1570
  %_lhs1573 = load { i32, [ 0 x i32 ] }** @a1568
  %ret1574 = call i8* @string_of_array ( { i32, [ 0 x i32 ] }* %_lhs1573 )
  call void @print_string( i8* %ret1574 )
  ret i32 0
}


define void @a1568.init (){

__fresh244:
  %array_ptr1556 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 10 )
  %array1557 = bitcast { i32, [ 0 x i32 ] }* %array_ptr1556 to { i32, [ 0 x i32 ] }* 
  %index_ptr1558 = getelementptr { i32, [ 0 x i32 ] }* %array1557, i32 0, i32 1, i32 0
  store i32 126, i32* %index_ptr1558
  %index_ptr1559 = getelementptr { i32, [ 0 x i32 ] }* %array1557, i32 0, i32 1, i32 1
  store i32 125, i32* %index_ptr1559
  %index_ptr1560 = getelementptr { i32, [ 0 x i32 ] }* %array1557, i32 0, i32 1, i32 2
  store i32 124, i32* %index_ptr1560
  %index_ptr1561 = getelementptr { i32, [ 0 x i32 ] }* %array1557, i32 0, i32 1, i32 3
  store i32 123, i32* %index_ptr1561
  %index_ptr1562 = getelementptr { i32, [ 0 x i32 ] }* %array1557, i32 0, i32 1, i32 4
  store i32 122, i32* %index_ptr1562
  %index_ptr1563 = getelementptr { i32, [ 0 x i32 ] }* %array1557, i32 0, i32 1, i32 5
  store i32 121, i32* %index_ptr1563
  %index_ptr1564 = getelementptr { i32, [ 0 x i32 ] }* %array1557, i32 0, i32 1, i32 6
  store i32 120, i32* %index_ptr1564
  %index_ptr1565 = getelementptr { i32, [ 0 x i32 ] }* %array1557, i32 0, i32 1, i32 7
  store i32 119, i32* %index_ptr1565
  %index_ptr1566 = getelementptr { i32, [ 0 x i32 ] }* %array1557, i32 0, i32 1, i32 8
  store i32 118, i32* %index_ptr1566
  %index_ptr1567 = getelementptr { i32, [ 0 x i32 ] }* %array1557, i32 0, i32 1, i32 9
  store i32 117, i32* %index_ptr1567
  store { i32, [ 0 x i32 ] }* %array1557, { i32, [ 0 x i32 ] }** @a1568
  ret void
}


