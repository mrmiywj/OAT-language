declare i8** @string_of_array({ i32, [ 0 x i32 ] }**)
declare { i32, [ 0 x i32 ] }** @array_of_string(i8**)
declare void @print_string(i8**)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32** @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }** @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh68:
  ret void
}


define i32 @program (i32 %argc326, { i32, [ 0 x i8** ] }** %argv324){

__fresh67:
  %argc_slot327 = alloca i32
  store i32 %argc326, i32** %argc_slot327
  %argv_slot325 = alloca { i32, [ 0 x i8** ] }**
  store { i32, [ 0 x i8** ] }** %argv324, { i32, [ 0 x i8** ] }**** %argv_slot325
  %unop330 = sub i32 0, 3
  %unop329 = sub i32 0, 4
  %unop328 = sub i32 0, 5
  %ret331 = call i32 @f ( i32 1, i32 2, i32 3, i32 4, i32 5, i32 %unop328, i32 %unop329, i32 %unop330 )
  ret i32 %ret331
}


define i32 @f (i32 %x1307, i32 %x2305, i32 %x3303, i32 %x4301, i32 %x5299, i32 %x6297, i32 %x7295, i32 %x8293){

__fresh66:
  %x1_slot308 = alloca i32
  store i32 %x1307, i32** %x1_slot308
  %x2_slot306 = alloca i32
  store i32 %x2305, i32** %x2_slot306
  %x3_slot304 = alloca i32
  store i32 %x3303, i32** %x3_slot304
  %x4_slot302 = alloca i32
  store i32 %x4301, i32** %x4_slot302
  %x5_slot300 = alloca i32
  store i32 %x5299, i32** %x5_slot300
  %x6_slot298 = alloca i32
  store i32 %x6297, i32** %x6_slot298
  %x7_slot296 = alloca i32
  store i32 %x7295, i32** %x7_slot296
  %x8_slot294 = alloca i32
  store i32 %x8293, i32** %x8_slot294
  %_lhs309 = load i32** %x1_slot308
  %_lhs310 = load i32** %x2_slot306
  %bop311 = add i32 %_lhs309, %_lhs310
  %_lhs312 = load i32** %x3_slot304
  %bop313 = add i32 %bop311, %_lhs312
  %_lhs314 = load i32** %x4_slot302
  %bop315 = add i32 %bop313, %_lhs314
  %_lhs316 = load i32** %x5_slot300
  %bop317 = add i32 %bop315, %_lhs316
  %_lhs318 = load i32** %x6_slot298
  %bop319 = add i32 %bop317, %_lhs318
  %_lhs320 = load i32** %x7_slot296
  %bop321 = add i32 %bop319, %_lhs320
  %_lhs322 = load i32** %x8_slot294
  %bop323 = add i32 %bop321, %_lhs322
  ret i32 %bop323
}


