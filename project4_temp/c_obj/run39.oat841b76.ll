declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh37:
  ret void
}


define i32 @program (i32 %argc176, { i32, [ 0 x i8* ] }* %argv174){

__fresh36:
  %argc_slot177 = alloca i32
  store i32 %argc176, i32* %argc_slot177
  %argv_slot175 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv174, { i32, [ 0 x i8* ] }** %argv_slot175
  %_lhs178 = load i32* %argc_slot177
  %ret179 = call i32 @f1 ( i32 %_lhs178 )
  ret i32 %ret179
}


define i32 @f9 (i32 %i171){

__fresh35:
  %i_slot172 = alloca i32
  store i32 %i171, i32* %i_slot172
  %_lhs173 = load i32* %i_slot172
  ret i32 %_lhs173
}


define i32 @f8 (i32 %i167){

__fresh34:
  %i_slot168 = alloca i32
  store i32 %i167, i32* %i_slot168
  %_lhs169 = load i32* %i_slot168
  %ret170 = call i32 @f9 ( i32 %_lhs169 )
  ret i32 %ret170
}


define i32 @f7 (i32 %i163){

__fresh33:
  %i_slot164 = alloca i32
  store i32 %i163, i32* %i_slot164
  %_lhs165 = load i32* %i_slot164
  %ret166 = call i32 @f8 ( i32 %_lhs165 )
  ret i32 %ret166
}


define i32 @f6 (i32 %i159){

__fresh32:
  %i_slot160 = alloca i32
  store i32 %i159, i32* %i_slot160
  %_lhs161 = load i32* %i_slot160
  %ret162 = call i32 @f7 ( i32 %_lhs161 )
  ret i32 %ret162
}


define i32 @f5 (i32 %i155){

__fresh31:
  %i_slot156 = alloca i32
  store i32 %i155, i32* %i_slot156
  %_lhs157 = load i32* %i_slot156
  %ret158 = call i32 @f6 ( i32 %_lhs157 )
  ret i32 %ret158
}


define i32 @f4 (i32 %i151){

__fresh30:
  %i_slot152 = alloca i32
  store i32 %i151, i32* %i_slot152
  %_lhs153 = load i32* %i_slot152
  %ret154 = call i32 @f5 ( i32 %_lhs153 )
  ret i32 %ret154
}


define i32 @f3 (i32 %i147){

__fresh29:
  %i_slot148 = alloca i32
  store i32 %i147, i32* %i_slot148
  %_lhs149 = load i32* %i_slot148
  %ret150 = call i32 @f4 ( i32 %_lhs149 )
  ret i32 %ret150
}


define i32 @f2 (i32 %i143){

__fresh28:
  %i_slot144 = alloca i32
  store i32 %i143, i32* %i_slot144
  %_lhs145 = load i32* %i_slot144
  %ret146 = call i32 @f3 ( i32 %_lhs145 )
  ret i32 %ret146
}


define i32 @f1 (i32 %i139){

__fresh27:
  %i_slot140 = alloca i32
  store i32 %i139, i32* %i_slot140
  %_lhs141 = load i32* %i_slot140
  %ret142 = call i32 @f2 ( i32 %_lhs141 )
  ret i32 %ret142
}


