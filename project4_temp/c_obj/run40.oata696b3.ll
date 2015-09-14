declare i8* @string_of_array({ i32, [ 0 x i32 ] })
declare { i32, [ 0 x i32 ] } @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] } @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@i334 = global i32 8, align 4
define void @oat_init (){

__fresh94:
  ret void
}


define i32 @program (i32 %argc341, { i32, [ 0 x i8* ] } %argv339){

__fresh93:
  %argc_slot342 = alloca i32
  store i32 %argc341, i32* %argc_slot342
  %argv_slot340 = alloca { i32, [ 0 x i8* ] }
  store { i32, [ 0 x i8* ] } %argv339, { i32, [ 0 x i8* ] }* %argv_slot340
  %ret343 = call i32 @f (  )
  ret i32 %ret343
}


define i32 @g (){

__fresh92:
  %_lhs338 = load i32* @i334
  ret i32 %_lhs338
}


define i32 @f (){

__fresh91:
  %j335 = alloca i32
  store i32 0, i32* %j335
  %ret336 = call i32 @g (  )
  store i32 %ret336, i32* %j335
  %_lhs337 = load i32* %j335
  ret i32 %_lhs337
}


