declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh19:
  ret void
}


define i32 @program (i32 %argc59, { i32, [ 0 x i8* ] }* %argv57){

__fresh18:
  %argc_slot60 = alloca i32
  store i32 %argc59, i32* %argc_slot60
  %argv_slot58 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv57, { i32, [ 0 x i8* ] }** %argv_slot58
  %ret61 = call i32 @f ( i32 1, i32 2 )
  ret i32 %ret61
}


define i32 @f (i32 %x54, i32 %y52){

__fresh17:
  %x_slot55 = alloca i32
  store i32 %x54, i32* %x_slot55
  %y_slot53 = alloca i32
  store i32 %y52, i32* %y_slot53
  %_lhs56 = load i32* %x_slot55
  ret i32 %_lhs56
}


