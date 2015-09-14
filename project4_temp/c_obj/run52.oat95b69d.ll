declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@x546 = global i32 10, align 4
define void @oat_init (){

__fresh145:
  ret void
}


define i32 @program (i32 %argc549, { i32, [ 0 x i8* ] }* %argv547){

__fresh144:
  %argc_slot550 = alloca i32
  store i32 %argc549, i32* %argc_slot550
  %argv_slot548 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv547, { i32, [ 0 x i8* ] }** %argv_slot548
  %y551 = alloca i32
  store i32 0, i32* %y551
  %_lhs552 = load i32* @x546
  %bop553 = add i32 %_lhs552, 1
  %x554 = alloca i32
  store i32 %bop553, i32* %x554
  %_lhs555 = load i32* %x554
  store i32 %_lhs555, i32* %y551
  %_lhs556 = load i32* %y551
  ret i32 %_lhs556
}


