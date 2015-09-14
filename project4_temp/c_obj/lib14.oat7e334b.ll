declare i8* @string_of_array({ i32, [ 0 x i32 ] })
declare { i32, [ 0 x i32 ] } @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] } @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@a1751 = global { i32, [ 0 x i32 ] } zeroinitializer, align 4		; initialized by a1751.init
define void @oat_init (){

__fresh251:
  call void @a1751.init(  )
  ret void
}


define i32 @program (i32 %argc1754, { i32, [ 0 x i8* ] } %argv1752){

__fresh250:
  %argc_slot1755 = alloca i32
  store i32 %argc1754, i32* %argc_slot1755
  %argv_slot1753 = alloca { i32, [ 0 x i8* ] }
  store { i32, [ 0 x i8* ] } %argv1752, { i32, [ 0 x i8* ] }* %argv_slot1753
  %_lhs1756 = load { i32, [ 0 x i32 ] }* @a1751
  %ret1757 = call i8* @string_of_array ( { i32, [ 0 x i32 ] } %_lhs1756 )
  call void @print_string( i8* %ret1757 )
  ret i32 0
}


define void @a1751.init (){

__fresh249:
  %array_ptr1739 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 10 )
  %array1740 = bitcast { i32, [ 0 x i32 ] } %array_ptr1739 to { i32, [ 0 x i32 ] } 
  %index_ptr1741 = getelementptr { i32, [ 0 x i32 ] } %array1740, i32 0, i32 1, i32 0
  store i32 126, i32* %index_ptr1741
  %index_ptr1742 = getelementptr { i32, [ 0 x i32 ] } %array1740, i32 0, i32 1, i32 1
  store i32 125, i32* %index_ptr1742
  %index_ptr1743 = getelementptr { i32, [ 0 x i32 ] } %array1740, i32 0, i32 1, i32 2
  store i32 124, i32* %index_ptr1743
  %index_ptr1744 = getelementptr { i32, [ 0 x i32 ] } %array1740, i32 0, i32 1, i32 3
  store i32 123, i32* %index_ptr1744
  %index_ptr1745 = getelementptr { i32, [ 0 x i32 ] } %array1740, i32 0, i32 1, i32 4
  store i32 122, i32* %index_ptr1745
  %index_ptr1746 = getelementptr { i32, [ 0 x i32 ] } %array1740, i32 0, i32 1, i32 5
  store i32 121, i32* %index_ptr1746
  %index_ptr1747 = getelementptr { i32, [ 0 x i32 ] } %array1740, i32 0, i32 1, i32 6
  store i32 120, i32* %index_ptr1747
  %index_ptr1748 = getelementptr { i32, [ 0 x i32 ] } %array1740, i32 0, i32 1, i32 7
  store i32 119, i32* %index_ptr1748
  %index_ptr1749 = getelementptr { i32, [ 0 x i32 ] } %array1740, i32 0, i32 1, i32 8
  store i32 118, i32* %index_ptr1749
  %index_ptr1750 = getelementptr { i32, [ 0 x i32 ] } %array1740, i32 0, i32 1, i32 9
  store i32 117, i32* %index_ptr1750
  store { i32, [ 0 x i32 ] } %array1740, { i32, [ 0 x i32 ] }* @a1751
  ret void
}


