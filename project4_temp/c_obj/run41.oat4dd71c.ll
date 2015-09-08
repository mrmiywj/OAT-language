declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh68:
  ret void
}


define i32 @program (i32 %argc322, { i32, [ 0 x i8* ] }* %argv320){

__fresh67:
  %argc_slot323 = alloca i32
  store i32 %argc322, i32* %argc_slot323
  %argv_slot321 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv320, { i32, [ 0 x i8* ] }** %argv_slot321
  %unop326 = sub i32 0, 3
  %unop325 = sub i32 0, 4
  %unop324 = sub i32 0, 5
  %ret327 = call i32 @f ( i32 1, i32 2, i32 3, i32 4, i32 5, i32 %unop324, i32 %unop325, i32 %unop326 )
  ret i32 %ret327
}


define i32 @f (i32 %x1303, i32 %x2301, i32 %x3299, i32 %x4297, i32 %x5295, i32 %x6293, i32 %x7291, i32 %x8289){

__fresh66:
  %x1_slot304 = alloca i32
  store i32 %x1303, i32* %x1_slot304
  %x2_slot302 = alloca i32
  store i32 %x2301, i32* %x2_slot302
  %x3_slot300 = alloca i32
  store i32 %x3299, i32* %x3_slot300
  %x4_slot298 = alloca i32
  store i32 %x4297, i32* %x4_slot298
  %x5_slot296 = alloca i32
  store i32 %x5295, i32* %x5_slot296
  %x6_slot294 = alloca i32
  store i32 %x6293, i32* %x6_slot294
  %x7_slot292 = alloca i32
  store i32 %x7291, i32* %x7_slot292
  %x8_slot290 = alloca i32
  store i32 %x8289, i32* %x8_slot290
  %_lhs305 = load i32* %x1_slot304
  %_lhs306 = load i32* %x2_slot302
  %bop307 = add i32 %_lhs305, %_lhs306
  %_lhs308 = load i32* %x3_slot300
  %bop309 = add i32 %bop307, %_lhs308
  %_lhs310 = load i32* %x4_slot298
  %bop311 = add i32 %bop309, %_lhs310
  %_lhs312 = load i32* %x5_slot296
  %bop313 = add i32 %bop311, %_lhs312
  %_lhs314 = load i32* %x6_slot294
  %bop315 = add i32 %bop313, %_lhs314
  %_lhs316 = load i32* %x7_slot292
  %bop317 = add i32 %bop315, %_lhs316
  %_lhs318 = load i32* %x8_slot290
  %bop319 = add i32 %bop317, %_lhs318
  ret i32 %bop319
}


