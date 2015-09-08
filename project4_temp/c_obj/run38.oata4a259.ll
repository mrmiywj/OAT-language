declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh26:
  ret void
}


define i32 @program (i32 %argc136, { i32, [ 0 x i8* ] }* %argv134){

__fresh25:
  %argc_slot137 = alloca i32
  store i32 %argc136, i32* %argc_slot137
  %argv_slot135 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv134, { i32, [ 0 x i8* ] }** %argv_slot135
  %ret138 = call i32 @f1 (  )
  ret i32 %ret138
}


define i32 @f9 (){

__fresh24:
  ret i32 31
}


define i32 @f8 (){

__fresh23:
  %ret133 = call i32 @f9 (  )
  ret i32 %ret133
}


define i32 @f7 (){

__fresh22:
  %ret132 = call i32 @f8 (  )
  ret i32 %ret132
}


define i32 @f6 (){

__fresh21:
  %ret131 = call i32 @f7 (  )
  ret i32 %ret131
}


define i32 @f5 (){

__fresh20:
  %ret130 = call i32 @f6 (  )
  ret i32 %ret130
}


define i32 @f4 (){

__fresh19:
  %ret129 = call i32 @f5 (  )
  ret i32 %ret129
}


define i32 @f3 (){

__fresh18:
  %ret128 = call i32 @f4 (  )
  ret i32 %ret128
}


define i32 @f2 (){

__fresh17:
  %ret127 = call i32 @f3 (  )
  ret i32 %ret127
}


define i32 @f1 (){

__fresh16:
  %ret126 = call i32 @f2 (  )
  ret i32 %ret126
}


