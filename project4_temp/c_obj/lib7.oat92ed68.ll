declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh415:
  ret void
}


define i32 @program (i32 %argc2361, { i32, [ 0 x i8* ] }* %argv2359){

__fresh412:
  %argc_slot2362 = alloca i32
  store i32 %argc2361, i32* %argc_slot2362
  %argv_slot2360 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv2359, { i32, [ 0 x i8* ] }** %argv_slot2360
  %array_ptr2363 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 5 )
  %array2364 = bitcast { i32, [ 0 x i32 ] }* %array_ptr2363 to { i32, [ 0 x i32 ] }* 
  %index_ptr2365 = getelementptr { i32, [ 0 x i32 ] }* %array2364, i32 0, i32 1, i32 0
  store i32 111, i32* %index_ptr2365
  %index_ptr2366 = getelementptr { i32, [ 0 x i32 ] }* %array2364, i32 0, i32 1, i32 1
  store i32 112, i32* %index_ptr2366
  %index_ptr2367 = getelementptr { i32, [ 0 x i32 ] }* %array2364, i32 0, i32 1, i32 2
  store i32 113, i32* %index_ptr2367
  %index_ptr2368 = getelementptr { i32, [ 0 x i32 ] }* %array2364, i32 0, i32 1, i32 3
  store i32 114, i32* %index_ptr2368
  %index_ptr2369 = getelementptr { i32, [ 0 x i32 ] }* %array2364, i32 0, i32 1, i32 4
  store i32 115, i32* %index_ptr2369
  %arr12370 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array2364, { i32, [ 0 x i32 ] }** %arr12370
  %_lhs2371 = load { i32, [ 0 x i32 ] }** %arr12370
  %ret2372 = call i8* @string_of_array ( { i32, [ 0 x i32 ] }* %_lhs2371 )
  %str2373 = alloca i8*
  store i8* %ret2372, i8** %str2373
  %_lhs2374 = load i8** %str2373
  %ret2375 = call { i32, [ 0 x i32 ] }* @array_of_string ( i8* %_lhs2374 )
  %arr22376 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %ret2375, { i32, [ 0 x i32 ] }** %arr22376
  %s2377 = alloca i32
  store i32 0, i32* %s2377
  %i2378 = alloca i32
  store i32 0, i32* %i2378
  br label %__cond411

__cond411:
  %_lhs2379 = load i32* %i2378
  %bop2380 = icmp slt i32 %_lhs2379, 5
  br i1 %bop2380, label %__body410, label %__post409

__fresh413:
  br label %__body410

__body410:
  %_lhs2381 = load i32* %s2377
  %_lhs2382 = load i32* %i2378
  %bound_ptr2384 = getelementptr { i32, [ 0 x i32 ] }** %arr22376, i32 0, i32 0
  %bound2385 = load i32* %bound_ptr2384
  call void @oat_array_bounds_check( i32 %bound2385, i32 %_lhs2382 )
  %elt2383 = getelementptr { i32, [ 0 x i32 ] }** %arr22376, i32 0, i32 1, i32 %_lhs2382
  %_lhs2386 = load i32* %elt2383
  %bop2387 = add i32 %_lhs2381, %_lhs2386
  store i32 %bop2387, i32* %s2377
  %_lhs2388 = load i32* %i2378
  %bop2389 = add i32 %_lhs2388, 1
  store i32 %bop2389, i32* %i2378
  br label %__cond411

__fresh414:
  br label %__post409

__post409:
  %_lhs2390 = load i32* %s2377
  ret i32 %_lhs2390
}


