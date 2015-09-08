declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@x356 = global i32 10, align 4
define void @oat_init (){

__fresh77:
  ret void
}


define i32 @program (i32 %argc359, { i32, [ 0 x i8* ] }* %argv357){

__fresh76:
  %argc_slot360 = alloca i32
  store i32 %argc359, i32* %argc_slot360
  %argv_slot358 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv357, { i32, [ 0 x i8* ] }** %argv_slot358
  %y361 = alloca i32
  store i32 0, i32* %y361
  %_lhs362 = load i32* @x356
  %bop363 = add i32 %_lhs362, 1
  %x364 = alloca i32
  store i32 %bop363, i32* %x364
  %_lhs365 = load i32* %x364
  store i32 %_lhs365, i32* %y361
  %_lhs366 = load i32* %y361
  ret i32 %_lhs366
}


