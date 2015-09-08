declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh50:
  ret void
}


define i32 @program (i32 %argc235, { i32, [ 0 x i8* ] }* %argv233){

__fresh49:
  %argc_slot236 = alloca i32
  store i32 %argc235, i32* %argc_slot236
  %argv_slot234 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv233, { i32, [ 0 x i8* ] }** %argv_slot234
  %ret237 = call i32 @f1 (  )
  ret i32 %ret237
}


define i32 @f9 (){

__fresh48:
  ret i32 31
}


define i32 @f8 (){

__fresh47:
  %ret232 = call i32 @f9 (  )
  ret i32 %ret232
}


define i32 @f7 (){

__fresh46:
  %ret231 = call i32 @f8 (  )
  ret i32 %ret231
}


define i32 @f6 (){

__fresh45:
  %ret230 = call i32 @f7 (  )
  ret i32 %ret230
}


define i32 @f5 (){

__fresh44:
  %ret229 = call i32 @f6 (  )
  ret i32 %ret229
}


define i32 @f4 (){

__fresh43:
  %ret228 = call i32 @f5 (  )
  ret i32 %ret228
}


define i32 @f3 (){

__fresh42:
  %ret227 = call i32 @f4 (  )
  ret i32 %ret227
}


define i32 @f2 (){

__fresh41:
  %ret226 = call i32 @f3 (  )
  ret i32 %ret226
}


define i32 @f1 (){

__fresh40:
  %ret225 = call i32 @f2 (  )
  ret i32 %ret225
}


