declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@s565 = global i8* zeroinitializer, align 4		; initialized by s565.init
@_oat_string563.str. = private unnamed_addr constant [ 4 x i8 ] c "341\00", align 4
@_oat_string563 = global i8* getelementptr inbounds ([ 4 x i8 ]* @_oat_string563.str., i32 0, i32 0), align 4
define void @oat_init (){

__fresh150:
  call void @s565.init(  )
  ret void
}


define i32 @program (i32 %argc569, { i32, [ 0 x i8* ] }* %argv567){

__fresh149:
  %argc_slot570 = alloca i32
  store i32 %argc569, i32* %argc_slot570
  %argv_slot568 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv567, { i32, [ 0 x i8* ] }** %argv_slot568
  %_lhs571 = load i8** @s565
  call void @print_string( i8* %_lhs571 )
  ret i32 0
}


define void @s565.init (){

__fresh148:
  %strval564 = load i8** @_oat_string563
  store i8* %strval564, i8** @s565
  ret void
}


