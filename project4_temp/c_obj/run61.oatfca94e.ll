declare i8* @string_of_array({ i32, [ 0 x i32 ] })
declare { i32, [ 0 x i32 ] } @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] } @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@s431 = global i8* zeroinitializer, align 4		; initialized by s431.init
@_oat_string429.str. = private unnamed_addr constant [ 4 x i8 ] c "341\00", align 4
@_oat_string429 = global i8* getelementptr inbounds ([ 4 x i8 ]* @_oat_string429.str., i32 0, i32 0), align 4
define void @oat_init (){

__fresh111:
  call void @s431.init(  )
  ret void
}


define i32 @program (i32 %argc435, { i32, [ 0 x i8* ] } %argv433){

__fresh110:
  %argc_slot436 = alloca i32
  store i32 %argc435, i32* %argc_slot436
  %argv_slot434 = alloca { i32, [ 0 x i8* ] }
  store { i32, [ 0 x i8* ] } %argv433, { i32, [ 0 x i8* ] }* %argv_slot434
  %_lhs437 = load i8** @s431
  call void @print_string( i8* %_lhs437 )
  ret i32 0
}


define void @s431.init (){

__fresh109:
  %strval430 = load i8** @_oat_string429
  store i8* %strval430, i8** @s431
  ret void
}


