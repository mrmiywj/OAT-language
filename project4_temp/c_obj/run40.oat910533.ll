declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@i279 = global i32 8, align 4
define void @oat_init (){

__fresh65:
  ret void
}


define i32 @program (i32 %argc286, { i32, [ 0 x i8* ] }* %argv284){

__fresh64:
  %argc_slot287 = alloca i32
  store i32 %argc286, i32* %argc_slot287
  %argv_slot285 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv284, { i32, [ 0 x i8* ] }** %argv_slot285
  %ret288 = call i32 @f (  )
  ret i32 %ret288
}


define i32 @g (){

__fresh63:
  %_lhs283 = load i32* @i279
  ret i32 %_lhs283
}


define i32 @f (){

__fresh62:
  %j280 = alloca i32
  store i32 0, i32* %j280
  %ret281 = call i32 @g (  )
  store i32 %ret281, i32* %j280
  %_lhs282 = load i32* %j280
  ret i32 %_lhs282
}


