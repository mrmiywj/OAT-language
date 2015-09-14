declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@a2475 = global { i32, [ 0 x i32 ] }* zeroinitializer, align 4		; initialized by a2475.init
define void @oat_init (){

__fresh442:
  call void @a2475.init(  )
  ret void
}


define i32 @program (i32 %argc2478, { i32, [ 0 x i8* ] }* %argv2476){

__fresh441:
  %argc_slot2479 = alloca i32
  store i32 %argc2478, i32* %argc_slot2479
  %argv_slot2477 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv2476, { i32, [ 0 x i8* ] }** %argv_slot2477
  %_lhs2480 = load { i32, [ 0 x i32 ] }** @a2475
  %ret2481 = call i8* @string_of_array ( { i32, [ 0 x i32 ] }* %_lhs2480 )
  call void @print_string( i8* %ret2481 )
  ret i32 0
}


define void @a2475.init (){

__fresh440:
  %array_ptr2463 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 10 )
  %array2464 = bitcast { i32, [ 0 x i32 ] }* %array_ptr2463 to { i32, [ 0 x i32 ] }* 
  %index_ptr2465 = getelementptr { i32, [ 0 x i32 ] }* %array2464, i32 0, i32 1, i32 0
  store i32 126, i32* %index_ptr2465
  %index_ptr2466 = getelementptr { i32, [ 0 x i32 ] }* %array2464, i32 0, i32 1, i32 1
  store i32 125, i32* %index_ptr2466
  %index_ptr2467 = getelementptr { i32, [ 0 x i32 ] }* %array2464, i32 0, i32 1, i32 2
  store i32 124, i32* %index_ptr2467
  %index_ptr2468 = getelementptr { i32, [ 0 x i32 ] }* %array2464, i32 0, i32 1, i32 3
  store i32 123, i32* %index_ptr2468
  %index_ptr2469 = getelementptr { i32, [ 0 x i32 ] }* %array2464, i32 0, i32 1, i32 4
  store i32 122, i32* %index_ptr2469
  %index_ptr2470 = getelementptr { i32, [ 0 x i32 ] }* %array2464, i32 0, i32 1, i32 5
  store i32 121, i32* %index_ptr2470
  %index_ptr2471 = getelementptr { i32, [ 0 x i32 ] }* %array2464, i32 0, i32 1, i32 6
  store i32 120, i32* %index_ptr2471
  %index_ptr2472 = getelementptr { i32, [ 0 x i32 ] }* %array2464, i32 0, i32 1, i32 7
  store i32 119, i32* %index_ptr2472
  %index_ptr2473 = getelementptr { i32, [ 0 x i32 ] }* %array2464, i32 0, i32 1, i32 8
  store i32 118, i32* %index_ptr2473
  %index_ptr2474 = getelementptr { i32, [ 0 x i32 ] }* %array2464, i32 0, i32 1, i32 9
  store i32 117, i32* %index_ptr2474
  store { i32, [ 0 x i32 ] }* %array2464, { i32, [ 0 x i32 ] }** @a2475
  ret void
}


