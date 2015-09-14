declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@_oat_string1539.str. = private unnamed_addr constant [ 7 x i8 ] c "Hello?\00", align 4
@_oat_string1539 = global i8* getelementptr inbounds ([ 7 x i8 ]* @_oat_string1539.str., i32 0, i32 0), align 4
define void @oat_init (){

__fresh240:
  ret void
}


define i32 @program (i32 %argc1537, { i32, [ 0 x i8* ] }* %argv1535){

__fresh239:
  %argc_slot1538 = alloca i32
  store i32 %argc1537, i32* %argc_slot1538
  %argv_slot1536 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv1535, { i32, [ 0 x i8* ] }** %argv_slot1536
  %strval1540 = load i8** @_oat_string1539
  %ret1541 = call i32 @my_length_of_string ( i8* %strval1540 )
  ret i32 %ret1541
}


define i32 @my_length_of_string (i8* %str1529){

__fresh238:
  %str_slot1530 = alloca i8*
  store i8* %str1529, i8** %str_slot1530
  %_lhs1531 = load i8** %str_slot1530
  %ret1532 = call { i32, [ 0 x i32 ] }* @array_of_string ( i8* %_lhs1531 )
  %len_ptr1533 = getelementptr { i32, [ 0 x i32 ] }* %ret1532, i32 0, i32 0
  %len1534 = load i32* %len_ptr1533
  ret i32 %len1534
}


