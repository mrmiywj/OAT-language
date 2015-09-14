declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@arr12334 = global { i32, [ 0 x i32 ] }* zeroinitializer, align 4		; initialized by arr12334.init
define void @oat_init (){

__fresh408:
  call void @arr12334.init(  )
  ret void
}


define i32 @program (i32 %argc2337, { i32, [ 0 x i8* ] }* %argv2335){

__fresh405:
  %argc_slot2338 = alloca i32
  store i32 %argc2337, i32* %argc_slot2338
  %argv_slot2336 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv2335, { i32, [ 0 x i8* ] }** %argv_slot2336
  %_lhs2339 = load { i32, [ 0 x i32 ] }** @arr12334
  %ret2340 = call i8* @string_of_array ( { i32, [ 0 x i32 ] }* %_lhs2339 )
  %str2341 = alloca i8*
  store i8* %ret2340, i8** %str2341
  %_lhs2342 = load i8** %str2341
  %ret2343 = call { i32, [ 0 x i32 ] }* @array_of_string ( i8* %_lhs2342 )
  %arr22344 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %ret2343, { i32, [ 0 x i32 ] }** %arr22344
  %s2345 = alloca i32
  store i32 0, i32* %s2345
  %i2346 = alloca i32
  store i32 0, i32* %i2346
  br label %__cond404

__cond404:
  %_lhs2347 = load i32* %i2346
  %bop2348 = icmp slt i32 %_lhs2347, 5
  br i1 %bop2348, label %__body403, label %__post402

__fresh406:
  br label %__body403

__body403:
  %_lhs2349 = load i32* %s2345
  %_lhs2350 = load i32* %i2346
  %bound_ptr2352 = getelementptr { i32, [ 0 x i32 ] }** %arr22344, i32 0, i32 0
  %bound2353 = load i32* %bound_ptr2352
  call void @oat_array_bounds_check( i32 %bound2353, i32 %_lhs2350 )
  %elt2351 = getelementptr { i32, [ 0 x i32 ] }** %arr22344, i32 0, i32 1, i32 %_lhs2350
  %_lhs2354 = load i32* %elt2351
  %bop2355 = add i32 %_lhs2349, %_lhs2354
  store i32 %bop2355, i32* %s2345
  %_lhs2356 = load i32* %i2346
  %bop2357 = add i32 %_lhs2356, 1
  store i32 %bop2357, i32* %i2346
  br label %__cond404

__fresh407:
  br label %__post402

__post402:
  %_lhs2358 = load i32* %s2345
  ret i32 %_lhs2358
}


define void @arr12334.init (){

__fresh401:
  %array_ptr2327 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 5 )
  %array2328 = bitcast { i32, [ 0 x i32 ] }* %array_ptr2327 to { i32, [ 0 x i32 ] }* 
  %index_ptr2329 = getelementptr { i32, [ 0 x i32 ] }* %array2328, i32 0, i32 1, i32 0
  store i32 111, i32* %index_ptr2329
  %index_ptr2330 = getelementptr { i32, [ 0 x i32 ] }* %array2328, i32 0, i32 1, i32 1
  store i32 112, i32* %index_ptr2330
  %index_ptr2331 = getelementptr { i32, [ 0 x i32 ] }* %array2328, i32 0, i32 1, i32 2
  store i32 113, i32* %index_ptr2331
  %index_ptr2332 = getelementptr { i32, [ 0 x i32 ] }* %array2328, i32 0, i32 1, i32 3
  store i32 114, i32* %index_ptr2332
  %index_ptr2333 = getelementptr { i32, [ 0 x i32 ] }* %array2328, i32 0, i32 1, i32 4
  store i32 115, i32* %index_ptr2333
  store { i32, [ 0 x i32 ] }* %array2328, { i32, [ 0 x i32 ] }** @arr12334
  ret void
}


