declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@i283 = global i32 8, align 4
define void @oat_init (){

__fresh65:
  ret void
}


define i32 @program (i32 %argc290, { i32, [ 0 x i8* ] }* %argv288){

__fresh64:
  %argc_slot291 = alloca i32
  store i32 %argc290, i32* %argc_slot291
  %argv_slot289 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv288, { i32, [ 0 x i8* ] }** %argv_slot289
  %ret292 = call i32 @f (  )
  ret i32 %ret292
}


define i32 @g (){

__fresh63:
  %_lhs287 = load i32* @i283
  ret i32 %_lhs287
}


define i32 @f (){

__fresh62:
  %j284 = alloca i32
  store i32 0, i32* %j284
  %ret285 = call i32 @g (  )
  store i32 %ret285, i32* %j284
  %_lhs286 = load i32* %j284
  ret i32 %_lhs286
}


