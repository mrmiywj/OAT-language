declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh40:
  ret void
}


define i32 @program (i32 %argc213, { i32, [ 0 x i8* ] }* %argv211){

__fresh39:
  %argc_slot214 = alloca i32
  store i32 %argc213, i32* %argc_slot214
  %argv_slot212 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv211, { i32, [ 0 x i8* ] }** %argv_slot212
  %unop217 = sub i32 0, 3
  %unop216 = sub i32 0, 4
  %unop215 = sub i32 0, 5
  %ret218 = call i32 @f ( i32 1, i32 2, i32 3, i32 4, i32 5, i32 %unop215, i32 %unop216, i32 %unop217 )
  ret i32 %ret218
}


define i32 @f (i32 %x1194, i32 %x2192, i32 %x3190, i32 %x4188, i32 %x5186, i32 %x6184, i32 %x7182, i32 %x8180){

__fresh38:
  %x1_slot195 = alloca i32
  store i32 %x1194, i32* %x1_slot195
  %x2_slot193 = alloca i32
  store i32 %x2192, i32* %x2_slot193
  %x3_slot191 = alloca i32
  store i32 %x3190, i32* %x3_slot191
  %x4_slot189 = alloca i32
  store i32 %x4188, i32* %x4_slot189
  %x5_slot187 = alloca i32
  store i32 %x5186, i32* %x5_slot187
  %x6_slot185 = alloca i32
  store i32 %x6184, i32* %x6_slot185
  %x7_slot183 = alloca i32
  store i32 %x7182, i32* %x7_slot183
  %x8_slot181 = alloca i32
  store i32 %x8180, i32* %x8_slot181
  %_lhs196 = load i32* %x1_slot195
  %_lhs197 = load i32* %x2_slot193
  %bop198 = add i32 %_lhs196, %_lhs197
  %_lhs199 = load i32* %x3_slot191
  %bop200 = add i32 %bop198, %_lhs199
  %_lhs201 = load i32* %x4_slot189
  %bop202 = add i32 %bop200, %_lhs201
  %_lhs203 = load i32* %x5_slot187
  %bop204 = add i32 %bop202, %_lhs203
  %_lhs205 = load i32* %x6_slot185
  %bop206 = add i32 %bop204, %_lhs205
  %_lhs207 = load i32* %x7_slot183
  %bop208 = add i32 %bop206, %_lhs207
  %_lhs209 = load i32* %x8_slot181
  %bop210 = add i32 %bop208, %_lhs209
  ret i32 %bop210
}


