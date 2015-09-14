declare i8* @string_of_array({ i32, [ 0 x i32 ] })
declare { i32, [ 0 x i32 ] } @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] } @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@garr451 = global { i32, [ 0 x { i32, [ 0 x i32 ] } ] } zeroinitializer, align 4		; initialized by garr451.init
@i438 = global i32 42, align 4
define void @oat_init (){

__fresh121:
  call void @garr451.init(  )
  ret void
}


define i32 @program (i32 %argc463, { i32, [ 0 x i8* ] } %argv461){

__fresh118:
  %argc_slot464 = alloca i32
  store i32 %argc463, i32* %argc_slot464
  %argv_slot462 = alloca { i32, [ 0 x i8* ] }
  store { i32, [ 0 x i8* ] } %argv461, { i32, [ 0 x i8* ] }* %argv_slot462
  %array_ptr465 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 4 )
  %array466 = bitcast { i32, [ 0 x i32 ] } %array_ptr465 to { i32, [ 0 x i32 ] } 
  %index_ptr467 = getelementptr { i32, [ 0 x i32 ] } %array466, i32 0, i32 1, i32 0
  store i32 1, i32* %index_ptr467
  %index_ptr468 = getelementptr { i32, [ 0 x i32 ] } %array466, i32 0, i32 1, i32 1
  store i32 2, i32* %index_ptr468
  %index_ptr469 = getelementptr { i32, [ 0 x i32 ] } %array466, i32 0, i32 1, i32 2
  store i32 3, i32* %index_ptr469
  %index_ptr470 = getelementptr { i32, [ 0 x i32 ] } %array466, i32 0, i32 1, i32 3
  store i32 4, i32* %index_ptr470
  %arr471 = alloca { i32, [ 0 x i32 ] }
  store { i32, [ 0 x i32 ] } %array466, { i32, [ 0 x i32 ] }* %arr471
  %p472 = alloca i32
  store i32 0, i32* %p472
  %j473 = alloca i32
  store i32 0, i32* %j473
  br label %__cond117

__cond117:
  %_lhs474 = load i32* %j473
  %bop475 = icmp slt i32 %_lhs474, 100
  br i1 %bop475, label %__body116, label %__post115

__fresh119:
  br label %__body116

__body116:
  %_lhs476 = load i32* %p472
  %bop477 = add i32 %_lhs476, 1
  store i32 %bop477, i32* %p472
  %_lhs478 = load i32* %j473
  %bop479 = add i32 %_lhs478, 1
  store i32 %bop479, i32* %j473
  br label %__cond117

__fresh120:
  br label %__post115

__post115:
  %_lhs480 = load { i32, [ 0 x i32 ] }* %arr471
  %ret481 = call i32 @g ( { i32, [ 0 x i32 ] } %_lhs480 )
  %_lhs482 = load i32* @i438
  %ret483 = call i32 @f ( i32 %_lhs482 )
  %bop484 = add i32 %ret481, %ret483
  %bound_ptr486 = getelementptr { i32, [ 0 x i32 ] }* %arr471, i32 0, i32 0
  %bound487 = load i32* %bound_ptr486
  call void @oat_array_bounds_check( i32 %bound487, i32 3 )
  %elt485 = getelementptr { i32, [ 0 x i32 ] }* %arr471, i32 0, i32 1, i32 3
  %_lhs488 = load i32* %elt485
  %ret489 = call i32 @f ( i32 %_lhs488 )
  %bop490 = add i32 %bop484, %ret489
  %bound_ptr492 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* @garr451, i32 0, i32 0
  %bound493 = load i32* %bound_ptr492
  call void @oat_array_bounds_check( i32 %bound493, i32 1 )
  %elt491 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* @garr451, i32 0, i32 1, i32 1
  %bound_ptr495 = getelementptr { i32, [ 0 x i32 ] }* %elt491, i32 0, i32 0
  %bound496 = load i32* %bound_ptr495
  call void @oat_array_bounds_check( i32 %bound496, i32 1 )
  %elt494 = getelementptr { i32, [ 0 x i32 ] }* %elt491, i32 0, i32 1, i32 1
  %_lhs497 = load i32* %elt494
  %ret498 = call i32 @f ( i32 %_lhs497 )
  %bop499 = add i32 %bop490, %ret498
  %_lhs500 = load i32* %p472
  %ret501 = call i32 @f ( i32 %_lhs500 )
  %bop502 = add i32 %bop499, %ret501
  ret i32 %bop502
}


define i32 @g ({ i32, [ 0 x i32 ] } %y455){

__fresh114:
  %y_slot456 = alloca { i32, [ 0 x i32 ] }
  store { i32, [ 0 x i32 ] } %y455, { i32, [ 0 x i32 ] }* %y_slot456
  %bound_ptr458 = getelementptr { i32, [ 0 x i32 ] }* %y_slot456, i32 0, i32 0
  %bound459 = load i32* %bound_ptr458
  call void @oat_array_bounds_check( i32 %bound459, i32 2 )
  %elt457 = getelementptr { i32, [ 0 x i32 ] }* %y_slot456, i32 0, i32 1, i32 2
  %_lhs460 = load i32* %elt457
  ret i32 %_lhs460
}


define i32 @f (i32 %x452){

__fresh113:
  %x_slot453 = alloca i32
  store i32 %x452, i32* %x_slot453
  %_lhs454 = load i32* %x_slot453
  ret i32 %_lhs454
}


define void @garr451.init (){

__fresh112:
  %array_ptr439 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 2 )
  %array440 = bitcast { i32, [ 0 x i32 ] } %array_ptr439 to { i32, [ 0 x { i32, [ 0 x i32 ] } ] } 
  %array_ptr441 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 2 )
  %array442 = bitcast { i32, [ 0 x i32 ] } %array_ptr441 to { i32, [ 0 x i32 ] } 
  %index_ptr443 = getelementptr { i32, [ 0 x i32 ] } %array442, i32 0, i32 1, i32 0
  store i32 1, i32* %index_ptr443
  %index_ptr444 = getelementptr { i32, [ 0 x i32 ] } %array442, i32 0, i32 1, i32 1
  store i32 2, i32* %index_ptr444
  %index_ptr445 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %array440, i32 0, i32 1, i32 0
  store { i32, [ 0 x i32 ] } %array442, { i32, [ 0 x i32 ] }* %index_ptr445
  %array_ptr446 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 2 )
  %array447 = bitcast { i32, [ 0 x i32 ] } %array_ptr446 to { i32, [ 0 x i32 ] } 
  %index_ptr448 = getelementptr { i32, [ 0 x i32 ] } %array447, i32 0, i32 1, i32 0
  store i32 3, i32* %index_ptr448
  %index_ptr449 = getelementptr { i32, [ 0 x i32 ] } %array447, i32 0, i32 1, i32 1
  store i32 4, i32* %index_ptr449
  %index_ptr450 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %array440, i32 0, i32 1, i32 1
  store { i32, [ 0 x i32 ] } %array447, { i32, [ 0 x i32 ] }* %index_ptr450
  store { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %array440, { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* @garr451
  ret void
}


