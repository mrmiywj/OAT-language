declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@i38 = global i32 9, align 4
define void @oat_init (){

__fresh14:
  ret void
}


define i32 @program (i32 %argc41, { i32, [ 0 x i8* ] }* %argv39){

__fresh13:
  %argc_slot42 = alloca i32
  store i32 %argc41, i32* %argc_slot42
  %argv_slot40 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv39, { i32, [ 0 x i8* ] }** %argv_slot40
  %_lhs43 = load i32* @i38
  ret i32 %_lhs43
}


