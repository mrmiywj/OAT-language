declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh8:
  ret void
}


define i32 @program (i32 %argc37, { i32, [ 0 x i8* ] }* %argv35){

__fresh7:
  %argc_slot38 = alloca i32
  store i32 %argc37, i32* %argc_slot38
  %argv_slot36 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv35, { i32, [ 0 x i8* ] }** %argv_slot36
  %ret39 = call i32 @f ( i32 1, i32 2 )
  ret i32 %ret39
}


define i32 @f (i32 %x32, i32 %y30){

__fresh6:
  %x_slot33 = alloca i32
  store i32 %x32, i32* %x_slot33
  %y_slot31 = alloca i32
  store i32 %y30, i32* %y_slot31
  %_lhs34 = load i32* %x_slot33
  ret i32 %_lhs34
}


