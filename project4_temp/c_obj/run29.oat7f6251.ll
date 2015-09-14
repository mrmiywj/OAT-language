declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@b30 = global i1 1, align 4
define void @oat_init (){

__fresh12:
  ret void
}


define i32 @program (i32 %argc33, { i32, [ 0 x i8* ] }* %argv31){

__fresh9:
  %argc_slot34 = alloca i32
  store i32 %argc33, i32* %argc_slot34
  %argv_slot32 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv31, { i32, [ 0 x i8* ] }** %argv_slot32
  %i35 = alloca i32
  store i32 0, i32* %i35
  %_lhs36 = load i1* @b30
  br i1 %_lhs36, label %__then8, label %__else7

__fresh10:
  br label %__then8

__then8:
  store i32 1, i32* %i35
  br label %__merge6

__fresh11:
  br label %__else7

__else7:
  br label %__merge6

__merge6:
  %_lhs37 = load i32* %i35
  ret i32 %_lhs37
}


