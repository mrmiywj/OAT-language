declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@_oat_string1119.str. = private unnamed_addr constant [ 7 x i8 ] c "Hello?\00", align 4
@_oat_string1119 = global i8* getelementptr inbounds ([ 7 x i8 ]* @_oat_string1119.str., i32 0, i32 0), align 4
define void @oat_init (){

__fresh143:
  ret void
}


define i32 @program (i32 %argc1117, { i32, [ 0 x i8* ] }* %argv1115){

__fresh142:
  %argc_slot1118 = alloca i32
  store i32 %argc1117, i32* %argc_slot1118
  %argv_slot1116 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv1115, { i32, [ 0 x i8* ] }** %argv_slot1116
  %strval1120 = load i8** @_oat_string1119
  %ret1121 = call i32 @my_length_of_string ( i8* %strval1120 )
  ret i32 %ret1121
}


define i32 @my_length_of_string (i8* %str1109){

__fresh141:
  %str_slot1110 = alloca i8*
  store i8* %str1109, i8** %str_slot1110
  %_lhs1111 = load i8** %str_slot1110
  %ret1112 = call { i32, [ 0 x i32 ] }* @array_of_string ( i8* %_lhs1111 )
  %len_ptr1113 = getelementptr { i32, [ 0 x i32 ] }* %ret1112, i32 0, i32 0
  %len1114 = load i32* %len_ptr1113
  ret i32 %len1114
}


