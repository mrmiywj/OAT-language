declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@x361 = global i32 10, align 4
define void @oat_init (){

__fresh77:
  ret void
}


define i32 @program (i32 %argc364, { i32, [ 0 x i8* ] }* %argv362){

__fresh76:
  %argc_slot365 = alloca i32
  store i32 %argc364, i32* %argc_slot365
  %argv_slot363 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv362, { i32, [ 0 x i8* ] }** %argv_slot363
  %y366 = alloca i32
  store i32 0, i32* %y366
  %_lhs367 = load i32* @x361
  %bop368 = add i32 %_lhs367, 1
  %x369 = alloca i32
  store i32 %bop368, i32* %x369
  %_lhs370 = load i32* %x369
  store i32 %_lhs370, i32* %y366
  %_lhs371 = load i32* %y366
  ret i32 %_lhs371
}


