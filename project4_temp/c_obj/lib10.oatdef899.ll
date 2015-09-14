declare i8* @string_of_array({ i32, [ 0 x i32 ] })
declare { i32, [ 0 x i32 ] } @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] } @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@_oat_string1702.str. = private unnamed_addr constant [ 7 x i8 ] c "Hello?\00", align 4
@_oat_string1702 = global i8* getelementptr inbounds ([ 7 x i8 ]* @_oat_string1702.str., i32 0, i32 0), align 4
define void @oat_init (){

__fresh236:
  ret void
}


define i32 @program (i32 %argc1700, { i32, [ 0 x i8* ] } %argv1698){

__fresh235:
  %argc_slot1701 = alloca i32
  store i32 %argc1700, i32* %argc_slot1701
  %argv_slot1699 = alloca { i32, [ 0 x i8* ] }
  store { i32, [ 0 x i8* ] } %argv1698, { i32, [ 0 x i8* ] }* %argv_slot1699
  %strval1703 = load i8** @_oat_string1702
  %ret1704 = call i32 @my_length_of_string ( i8* %strval1703 )
  ret i32 %ret1704
}


define i32 @my_length_of_string (i8* %str1692){

__fresh234:
  %str_slot1693 = alloca i8*
  store i8* %str1692, i8** %str_slot1693
  %_lhs1694 = load i8** %str_slot1693
  %ret1695 = call { i32, [ 0 x i32 ] } @array_of_string ( i8* %_lhs1694 )
  %len_ptr1696 = getelementptr { i32, [ 0 x i32 ] } %ret1695, i32 0, i32 0
  %len1697 = load i32* %len_ptr1696
  ret i32 %len1697
}


