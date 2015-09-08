declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh61:
  ret void
}


define i32 @program (i32 %argc275, { i32, [ 0 x i8* ] }* %argv273){

__fresh60:
  %argc_slot276 = alloca i32
  store i32 %argc275, i32* %argc_slot276
  %argv_slot274 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv273, { i32, [ 0 x i8* ] }** %argv_slot274
  %_lhs277 = load i32* %argc_slot276
  %ret278 = call i32 @f1 ( i32 %_lhs277 )
  ret i32 %ret278
}


define i32 @f9 (i32 %i270){

__fresh59:
  %i_slot271 = alloca i32
  store i32 %i270, i32* %i_slot271
  %_lhs272 = load i32* %i_slot271
  ret i32 %_lhs272
}


define i32 @f8 (i32 %i266){

__fresh58:
  %i_slot267 = alloca i32
  store i32 %i266, i32* %i_slot267
  %_lhs268 = load i32* %i_slot267
  %ret269 = call i32 @f9 ( i32 %_lhs268 )
  ret i32 %ret269
}


define i32 @f7 (i32 %i262){

__fresh57:
  %i_slot263 = alloca i32
  store i32 %i262, i32* %i_slot263
  %_lhs264 = load i32* %i_slot263
  %ret265 = call i32 @f8 ( i32 %_lhs264 )
  ret i32 %ret265
}


define i32 @f6 (i32 %i258){

__fresh56:
  %i_slot259 = alloca i32
  store i32 %i258, i32* %i_slot259
  %_lhs260 = load i32* %i_slot259
  %ret261 = call i32 @f7 ( i32 %_lhs260 )
  ret i32 %ret261
}


define i32 @f5 (i32 %i254){

__fresh55:
  %i_slot255 = alloca i32
  store i32 %i254, i32* %i_slot255
  %_lhs256 = load i32* %i_slot255
  %ret257 = call i32 @f6 ( i32 %_lhs256 )
  ret i32 %ret257
}


define i32 @f4 (i32 %i250){

__fresh54:
  %i_slot251 = alloca i32
  store i32 %i250, i32* %i_slot251
  %_lhs252 = load i32* %i_slot251
  %ret253 = call i32 @f5 ( i32 %_lhs252 )
  ret i32 %ret253
}


define i32 @f3 (i32 %i246){

__fresh53:
  %i_slot247 = alloca i32
  store i32 %i246, i32* %i_slot247
  %_lhs248 = load i32* %i_slot247
  %ret249 = call i32 @f4 ( i32 %_lhs248 )
  ret i32 %ret249
}


define i32 @f2 (i32 %i242){

__fresh52:
  %i_slot243 = alloca i32
  store i32 %i242, i32* %i_slot243
  %_lhs244 = load i32* %i_slot243
  %ret245 = call i32 @f3 ( i32 %_lhs244 )
  ret i32 %ret245
}


define i32 @f1 (i32 %i238){

__fresh51:
  %i_slot239 = alloca i32
  store i32 %i238, i32* %i_slot239
  %_lhs240 = load i32* %i_slot239
  %ret241 = call i32 @f2 ( i32 %_lhs240 )
  ret i32 %ret241
}


