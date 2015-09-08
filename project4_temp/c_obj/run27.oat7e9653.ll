declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh3:
  ret void
}


define i32 @program (i32 %argc7, { i32, [ 0 x i8* ] }* %argv5){

__fresh2:
  %argc_slot8 = alloca i32
  store i32 %argc7, i32* %argc_slot8
  %argv_slot6 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv5, { i32, [ 0 x i8* ] }** %argv_slot6
  %i9 = alloca i32
  store i32 99, i32* %i9
  %_lhs10 = load i32* %i9
  ret i32 %_lhs10
}


