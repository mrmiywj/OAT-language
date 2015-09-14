declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@i62 = global i32 11, align 4
define void @oat_init (){

__fresh23:
  ret void
}


define i32 @program (i32 %argc72, { i32, [ 0 x i8* ] }* %argv70){

__fresh22:
  %argc_slot73 = alloca i32
  store i32 %argc72, i32* %argc_slot73
  %argv_slot71 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv70, { i32, [ 0 x i8* ] }** %argv_slot71
  %ret74 = call i32 @f (  )
  %ret75 = call i32 @g (  )
  %bop76 = add i32 %ret74, %ret75
  %_lhs77 = load i32* @i62
  %bop78 = add i32 %bop76, %_lhs77
  ret i32 %bop78
}


define i32 @g (){

__fresh21:
  %j65 = alloca i32
  store i32 1, i32* %j65
  %_lhs66 = load i32* %j65
  %i67 = alloca i32
  store i32 %_lhs66, i32* %i67
  %i68 = alloca i32
  store i32 10, i32* %i68
  %_lhs69 = load i32* @i62
  ret i32 %_lhs69
}


define i32 @f (){

__fresh20:
  %i63 = alloca i32
  store i32 12, i32* %i63
  %_lhs64 = load i32* %i63
  ret i32 %_lhs64
}


