declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@s375 = global i8* zeroinitializer, align 4		; initialized by s375.init
@_oat_string373.str. = private unnamed_addr constant [ 4 x i8 ] c "341\00", align 4
@_oat_string373 = global i8* getelementptr inbounds ([ 4 x i8 ]* @_oat_string373.str., i32 0, i32 0), align 4
define void @oat_init (){

__fresh82:
  call void @s375.init(  )
  ret void
}


define i32 @program (i32 %argc379, { i32, [ 0 x i8* ] }* %argv377){

__fresh81:
  %argc_slot380 = alloca i32
  store i32 %argc379, i32* %argc_slot380
  %argv_slot378 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv377, { i32, [ 0 x i8* ] }** %argv_slot378
  %_lhs381 = load i8** @s375
  call void @print_string( i8* %_lhs381 )
  ret i32 0
}


define void @s375.init (){

__fresh80:
  %strval374 = load i8** @_oat_string373
  store i8* %strval374, i8** @s375
  ret void
}


