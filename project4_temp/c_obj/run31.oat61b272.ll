declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@i44 = global i32 9, align 4
define void @oat_init (){

__fresh16:
  ret void
}


define i32 @program (i32 %argc47, { i32, [ 0 x i8* ] }* %argv45){

__fresh15:
  %argc_slot48 = alloca i32
  store i32 %argc47, i32* %argc_slot48
  %argv_slot46 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv45, { i32, [ 0 x i8* ] }** %argv_slot46
  %_lhs49 = load i32* @i44
  %j50 = alloca i32
  store i32 %_lhs49, i32* %j50
  %_lhs51 = load i32* %j50
  ret i32 %_lhs51
}


