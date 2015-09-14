declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@s507 = global i8* zeroinitializer, align 4		; initialized by s507.init
@_oat_string505.str. = private unnamed_addr constant [ 4 x i8 ] c "341\00", align 4
@_oat_string505 = global i8* getelementptr inbounds ([ 4 x i8 ]* @_oat_string505.str., i32 0, i32 0), align 4
define void @oat_init (){

__fresh103:
  call void @s507.init(  )
  ret void
}


define i32 @program (i32 %argc511, { i32, [ 0 x i8* ] }* %argv509){

__fresh102:
  %argc_slot512 = alloca i32
  store i32 %argc511, i32* %argc_slot512
  %argv_slot510 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv509, { i32, [ 0 x i8* ] }** %argv_slot510
  %_lhs513 = load i8** @s507
  call void @print_string( i8* %_lhs513 )
  ret i32 0
}


define void @s507.init (){

__fresh101:
  %strval506 = load i8** @_oat_string505
  store i8* %strval506, i8** @s507
  ret void
}


