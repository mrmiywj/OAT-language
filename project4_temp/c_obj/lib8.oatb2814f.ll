declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@_oat_string1515.str. = private unnamed_addr constant [ 14 x i8 ] c "Hello world!
\00", align 4
@_oat_string1515 = global i8* getelementptr inbounds ([ 14 x i8 ]* @_oat_string1515.str., i32 0, i32 0), align 4
define void @oat_init (){

__fresh234:
  ret void
}


define i32 @program (i32 %argc1513, { i32, [ 0 x i8* ] }* %argv1511){

__fresh233:
  %argc_slot1514 = alloca i32
  store i32 %argc1513, i32* %argc_slot1514
  %argv_slot1512 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv1511, { i32, [ 0 x i8* ] }** %argv_slot1512
  %strval1516 = load i8** @_oat_string1515
  %str1517 = alloca i8*
  store i8* %strval1516, i8** %str1517
  %_lhs1518 = load i8** %str1517
  call void @print_string( i8* %_lhs1518 )
  ret i32 0
}


