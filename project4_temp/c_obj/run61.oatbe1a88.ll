declare i8** @string_of_array({ i32, [ 0 x i32 ] }**)
declare { i32, [ 0 x i32 ] }** @array_of_string(i8**)
declare void @print_string(i8**)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32** @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }** @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@s380 = global i8** zeroinitializer, align 4		; initialized by s380.init
@_oat_string378.str. = private unnamed_addr constant [ 4 x i8 ] c "341\00", align 4
@_oat_string378 = global i8* getelementptr inbounds ([ 4 x i8 ]* @_oat_string378.str., i32 0, i32 0), align 4
define void @oat_init (){

__fresh82:
  call void @s380.init(  )
  ret void
}


define i32 @program (i32 %argc384, { i32, [ 0 x i8** ] }** %argv382){

__fresh81:
  %argc_slot385 = alloca i32
  store i32 %argc384, i32** %argc_slot385
  %argv_slot383 = alloca { i32, [ 0 x i8** ] }**
  store { i32, [ 0 x i8** ] }** %argv382, { i32, [ 0 x i8** ] }**** %argv_slot383
  %_lhs386 = load i8**** @s380
  call void @print_string( i8** %_lhs386 )
  ret i32 0
}


define void @s380.init (){

__fresh80:
  %strval379 = load i8**** @_oat_string378
  store i8** %strval379, i8**** @s380
  ret void
}


