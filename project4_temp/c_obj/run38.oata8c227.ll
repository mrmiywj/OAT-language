declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh79:
  ret void
}


define i32 @program (i32 %argc290, { i32, [ 0 x i8* ] }* %argv288){

__fresh78:
  %argc_slot291 = alloca i32
  store i32 %argc290, i32* %argc_slot291
  %argv_slot289 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv288, { i32, [ 0 x i8* ] }** %argv_slot289
  %ret292 = call i32 @f1 (  )
  ret i32 %ret292
}


define i32 @f9 (){

__fresh77:
  ret i32 31
}


define i32 @f8 (){

__fresh76:
  %ret287 = call i32 @f9 (  )
  ret i32 %ret287
}


define i32 @f7 (){

__fresh75:
  %ret286 = call i32 @f8 (  )
  ret i32 %ret286
}


define i32 @f6 (){

__fresh74:
  %ret285 = call i32 @f7 (  )
  ret i32 %ret285
}


define i32 @f5 (){

__fresh73:
  %ret284 = call i32 @f6 (  )
  ret i32 %ret284
}


define i32 @f4 (){

__fresh72:
  %ret283 = call i32 @f5 (  )
  ret i32 %ret283
}


define i32 @f3 (){

__fresh71:
  %ret282 = call i32 @f4 (  )
  ret i32 %ret282
}


define i32 @f2 (){

__fresh70:
  %ret281 = call i32 @f3 (  )
  ret i32 %ret281
}


define i32 @f1 (){

__fresh69:
  %ret280 = call i32 @f2 (  )
  ret i32 %ret280
}


