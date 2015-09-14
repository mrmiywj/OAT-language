declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@x488 = global i32 10, align 4
define void @oat_init (){

__fresh98:
  ret void
}


define i32 @program (i32 %argc491, { i32, [ 0 x i8* ] }* %argv489){

__fresh97:
  %argc_slot492 = alloca i32
  store i32 %argc491, i32* %argc_slot492
  %argv_slot490 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv489, { i32, [ 0 x i8* ] }** %argv_slot490
  %y493 = alloca i32
  store i32 0, i32* %y493
  %_lhs494 = load i32* @x488
  %bop495 = add i32 %_lhs494, 1
  %x496 = alloca i32
  store i32 %bop495, i32* %x496
  %_lhs497 = load i32* %x496
  store i32 %_lhs497, i32* %y493
  %_lhs498 = load i32* %y493
  ret i32 %_lhs498
}


