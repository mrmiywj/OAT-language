declare i8* @string_of_array({ i32, [ 0 x i32 ] })
declare { i32, [ 0 x i32 ] } @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] } @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh97:
  ret void
}


define i32 @program (i32 %argc377, { i32, [ 0 x i8* ] } %argv375){

__fresh96:
  %argc_slot378 = alloca i32
  store i32 %argc377, i32* %argc_slot378
  %argv_slot376 = alloca { i32, [ 0 x i8* ] }
  store { i32, [ 0 x i8* ] } %argv375, { i32, [ 0 x i8* ] }* %argv_slot376
  %unop381 = sub i32 0, 3
  %unop380 = sub i32 0, 4
  %unop379 = sub i32 0, 5
  %ret382 = call i32 @f ( i32 1, i32 2, i32 3, i32 4, i32 5, i32 %unop379, i32 %unop380, i32 %unop381 )
  ret i32 %ret382
}


define i32 @f (i32 %x1358, i32 %x2356, i32 %x3354, i32 %x4352, i32 %x5350, i32 %x6348, i32 %x7346, i32 %x8344){

__fresh95:
  %x1_slot359 = alloca i32
  store i32 %x1358, i32* %x1_slot359
  %x2_slot357 = alloca i32
  store i32 %x2356, i32* %x2_slot357
  %x3_slot355 = alloca i32
  store i32 %x3354, i32* %x3_slot355
  %x4_slot353 = alloca i32
  store i32 %x4352, i32* %x4_slot353
  %x5_slot351 = alloca i32
  store i32 %x5350, i32* %x5_slot351
  %x6_slot349 = alloca i32
  store i32 %x6348, i32* %x6_slot349
  %x7_slot347 = alloca i32
  store i32 %x7346, i32* %x7_slot347
  %x8_slot345 = alloca i32
  store i32 %x8344, i32* %x8_slot345
  %_lhs360 = load i32* %x1_slot359
  %_lhs361 = load i32* %x2_slot357
  %bop362 = add i32 %_lhs360, %_lhs361
  %_lhs363 = load i32* %x3_slot355
  %bop364 = add i32 %bop362, %_lhs363
  %_lhs365 = load i32* %x4_slot353
  %bop366 = add i32 %bop364, %_lhs365
  %_lhs367 = load i32* %x5_slot351
  %bop368 = add i32 %bop366, %_lhs367
  %_lhs369 = load i32* %x6_slot349
  %bop370 = add i32 %bop368, %_lhs369
  %_lhs371 = load i32* %x7_slot347
  %bop372 = add i32 %bop370, %_lhs371
  %_lhs373 = load i32* %x8_slot345
  %bop374 = add i32 %bop372, %_lhs373
  ret i32 %bop374
}


