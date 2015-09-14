declare i8** @string_of_array({ i32, [ 0 x i32 ] }**)
declare { i32, [ 0 x i32 ] }** @array_of_string(i8**)
declare void @print_string(i8**)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32** @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }** @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh50:
  ret void
}


define i32 @program (i32 %argc239, { i32, [ 0 x i8** ] }** %argv237){

__fresh49:
  %argc_slot240 = alloca i32
  store i32 %argc239, i32** %argc_slot240
  %argv_slot238 = alloca { i32, [ 0 x i8** ] }**
  store { i32, [ 0 x i8** ] }** %argv237, { i32, [ 0 x i8** ] }**** %argv_slot238
  %ret241 = call i32 @f1 (  )
  ret i32 %ret241
}


define i32 @f9 (){

__fresh48:
  ret i32 31
}


define i32 @f8 (){

__fresh47:
  %ret236 = call i32 @f9 (  )
  ret i32 %ret236
}


define i32 @f7 (){

__fresh46:
  %ret235 = call i32 @f8 (  )
  ret i32 %ret235
}


define i32 @f6 (){

__fresh45:
  %ret234 = call i32 @f7 (  )
  ret i32 %ret234
}


define i32 @f5 (){

__fresh44:
  %ret233 = call i32 @f6 (  )
  ret i32 %ret233
}


define i32 @f4 (){

__fresh43:
  %ret232 = call i32 @f5 (  )
  ret i32 %ret232
}


define i32 @f3 (){

__fresh42:
  %ret231 = call i32 @f4 (  )
  ret i32 %ret231
}


define i32 @f2 (){

__fresh41:
  %ret230 = call i32 @f3 (  )
  ret i32 %ret230
}


define i32 @f1 (){

__fresh40:
  %ret229 = call i32 @f2 (  )
  ret i32 %ret229
}


