declare i8* @string_of_array({ i32, [ 0 x i32 ] })
declare { i32, [ 0 x i32 ] } @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] } @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@_oat_string2611.str. = private unnamed_addr constant [ 2 x i8 ] c "
\00", align 4
@_oat_string2611 = global i8* getelementptr inbounds ([ 2 x i8 ]* @_oat_string2611.str., i32 0, i32 0), align 4
@_oat_string2607.str. = private unnamed_addr constant [ 2 x i8 ] c " \00", align 4
@_oat_string2607 = global i8* getelementptr inbounds ([ 2 x i8 ]* @_oat_string2607.str., i32 0, i32 0), align 4
define void @oat_init (){

__fresh428:
  ret void
}


define void @prnNx4 ({ i32, [ 0 x { i32, [ 0 x i32 ] } ] } %ar2589, i32 %n2587){

__fresh423:
  %ar_slot2590 = alloca { i32, [ 0 x { i32, [ 0 x i32 ] } ] }
  store { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %ar2589, { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* %ar_slot2590
  %n_slot2588 = alloca i32
  store i32 %n2587, i32* %n_slot2588
  %i2591 = alloca i32
  store i32 0, i32* %i2591
  br label %__cond419

__cond419:
  %_lhs2592 = load i32* %i2591
  %_lhs2593 = load i32* %n_slot2588
  %bop2594 = icmp slt i32 %_lhs2592, %_lhs2593
  br i1 %bop2594, label %__body418, label %__post417

__fresh424:
  br label %__body418

__body418:
  %j2595 = alloca i32
  store i32 0, i32* %j2595
  br label %__cond422

__cond422:
  %_lhs2596 = load i32* %j2595
  %bop2597 = icmp slt i32 %_lhs2596, 4
  br i1 %bop2597, label %__body421, label %__post420

__fresh425:
  br label %__body421

__body421:
  %_lhs2599 = load i32* %i2591
  %bound_ptr2601 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* %ar_slot2590, i32 0, i32 0
  %bound2602 = load i32* %bound_ptr2601
  call void @oat_array_bounds_check( i32 %bound2602, i32 %_lhs2599 )
  %elt2600 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* %ar_slot2590, i32 0, i32 1, i32 %_lhs2599
  %_lhs2598 = load i32* %j2595
  %bound_ptr2604 = getelementptr { i32, [ 0 x i32 ] }* %elt2600, i32 0, i32 0
  %bound2605 = load i32* %bound_ptr2604
  call void @oat_array_bounds_check( i32 %bound2605, i32 %_lhs2598 )
  %elt2603 = getelementptr { i32, [ 0 x i32 ] }* %elt2600, i32 0, i32 1, i32 %_lhs2598
  %_lhs2606 = load i32* %elt2603
  call void @print_int( i32 %_lhs2606 )
  %strval2608 = load i8** @_oat_string2607
  call void @print_string( i8* %strval2608 )
  %_lhs2609 = load i32* %j2595
  %bop2610 = add i32 %_lhs2609, 1
  store i32 %bop2610, i32* %j2595
  br label %__cond422

__fresh426:
  br label %__post420

__post420:
  %strval2612 = load i8** @_oat_string2611
  call void @print_string( i8* %strval2612 )
  %_lhs2613 = load i32* %i2591
  %bop2614 = add i32 %_lhs2613, 1
  store i32 %bop2614, i32* %i2591
  br label %__cond419

__fresh427:
  br label %__post417

__post417:
  ret void
}


define i32 @dot3 ({ i32, [ 0 x { i32, [ 0 x i32 ] } ] } %a12557, { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %a22555, i32 %row2553, i32 %col2551){

__fresh414:
  %a1_slot2558 = alloca { i32, [ 0 x { i32, [ 0 x i32 ] } ] }
  store { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %a12557, { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* %a1_slot2558
  %a2_slot2556 = alloca { i32, [ 0 x { i32, [ 0 x i32 ] } ] }
  store { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %a22555, { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* %a2_slot2556
  %row_slot2554 = alloca i32
  store i32 %row2553, i32* %row_slot2554
  %col_slot2552 = alloca i32
  store i32 %col2551, i32* %col_slot2552
  %sum2559 = alloca i32
  store i32 0, i32* %sum2559
  %k2560 = alloca i32
  store i32 0, i32* %k2560
  br label %__cond413

__cond413:
  %_lhs2561 = load i32* %k2560
  %bop2562 = icmp slt i32 %_lhs2561, 3
  br i1 %bop2562, label %__body412, label %__post411

__fresh415:
  br label %__body412

__body412:
  %_lhs2563 = load i32* %sum2559
  %_lhs2565 = load i32* %row_slot2554
  %bound_ptr2567 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* %a1_slot2558, i32 0, i32 0
  %bound2568 = load i32* %bound_ptr2567
  call void @oat_array_bounds_check( i32 %bound2568, i32 %_lhs2565 )
  %elt2566 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* %a1_slot2558, i32 0, i32 1, i32 %_lhs2565
  %_lhs2564 = load i32* %k2560
  %bound_ptr2570 = getelementptr { i32, [ 0 x i32 ] }* %elt2566, i32 0, i32 0
  %bound2571 = load i32* %bound_ptr2570
  call void @oat_array_bounds_check( i32 %bound2571, i32 %_lhs2564 )
  %elt2569 = getelementptr { i32, [ 0 x i32 ] }* %elt2566, i32 0, i32 1, i32 %_lhs2564
  %_lhs2572 = load i32* %elt2569
  %_lhs2574 = load i32* %k2560
  %bound_ptr2576 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* %a2_slot2556, i32 0, i32 0
  %bound2577 = load i32* %bound_ptr2576
  call void @oat_array_bounds_check( i32 %bound2577, i32 %_lhs2574 )
  %elt2575 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* %a2_slot2556, i32 0, i32 1, i32 %_lhs2574
  %_lhs2573 = load i32* %col_slot2552
  %bound_ptr2579 = getelementptr { i32, [ 0 x i32 ] }* %elt2575, i32 0, i32 0
  %bound2580 = load i32* %bound_ptr2579
  call void @oat_array_bounds_check( i32 %bound2580, i32 %_lhs2573 )
  %elt2578 = getelementptr { i32, [ 0 x i32 ] }* %elt2575, i32 0, i32 1, i32 %_lhs2573
  %_lhs2581 = load i32* %elt2578
  %bop2582 = mul i32 %_lhs2572, %_lhs2581
  %bop2583 = add i32 %_lhs2563, %bop2582
  store i32 %bop2583, i32* %sum2559
  %_lhs2584 = load i32* %k2560
  %bop2585 = add i32 %_lhs2584, 1
  store i32 %bop2585, i32* %k2560
  br label %__cond413

__fresh416:
  br label %__post411

__post411:
  %_lhs2586 = load i32* %sum2559
  ret i32 %_lhs2586
}


define void @matrix_MultAlt ({ i32, [ 0 x { i32, [ 0 x i32 ] } ] } %a12526, { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %a22524, { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %a32522){

__fresh406:
  %a1_slot2527 = alloca { i32, [ 0 x { i32, [ 0 x i32 ] } ] }
  store { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %a12526, { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* %a1_slot2527
  %a2_slot2525 = alloca { i32, [ 0 x { i32, [ 0 x i32 ] } ] }
  store { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %a22524, { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* %a2_slot2525
  %a3_slot2523 = alloca { i32, [ 0 x { i32, [ 0 x i32 ] } ] }
  store { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %a32522, { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* %a3_slot2523
  %i2528 = alloca i32
  store i32 0, i32* %i2528
  br label %__cond402

__cond402:
  %_lhs2529 = load i32* %i2528
  %bop2530 = icmp slt i32 %_lhs2529, 2
  br i1 %bop2530, label %__body401, label %__post400

__fresh407:
  br label %__body401

__body401:
  %j2531 = alloca i32
  store i32 0, i32* %j2531
  br label %__cond405

__cond405:
  %_lhs2532 = load i32* %j2531
  %bop2533 = icmp slt i32 %_lhs2532, 4
  br i1 %bop2533, label %__body404, label %__post403

__fresh408:
  br label %__body404

__body404:
  %_lhs2535 = load i32* %i2528
  %bound_ptr2537 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* %a3_slot2523, i32 0, i32 0
  %bound2538 = load i32* %bound_ptr2537
  call void @oat_array_bounds_check( i32 %bound2538, i32 %_lhs2535 )
  %elt2536 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* %a3_slot2523, i32 0, i32 1, i32 %_lhs2535
  %_lhs2534 = load i32* %j2531
  %bound_ptr2540 = getelementptr { i32, [ 0 x i32 ] }* %elt2536, i32 0, i32 0
  %bound2541 = load i32* %bound_ptr2540
  call void @oat_array_bounds_check( i32 %bound2541, i32 %_lhs2534 )
  %elt2539 = getelementptr { i32, [ 0 x i32 ] }* %elt2536, i32 0, i32 1, i32 %_lhs2534
  %_lhs2545 = load i32* %j2531
  %_lhs2544 = load i32* %i2528
  %_lhs2543 = load { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* %a2_slot2525
  %_lhs2542 = load { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* %a1_slot2527
  %ret2546 = call i32 @dot3 ( { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %_lhs2542, { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %_lhs2543, i32 %_lhs2544, i32 %_lhs2545 )
  store i32 %ret2546, i32* %elt2539
  %_lhs2547 = load i32* %j2531
  %bop2548 = add i32 %_lhs2547, 1
  store i32 %bop2548, i32* %j2531
  br label %__cond405

__fresh409:
  br label %__post403

__post403:
  %_lhs2549 = load i32* %i2528
  %bop2550 = add i32 %_lhs2549, 1
  store i32 %bop2550, i32* %i2528
  br label %__cond402

__fresh410:
  br label %__post400

__post400:
  ret void
}


define void @matrix_Mult ({ i32, [ 0 x { i32, [ 0 x i32 ] } ] } %a12468, { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %a22466, { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %a32464){

__fresh393:
  %a1_slot2469 = alloca { i32, [ 0 x { i32, [ 0 x i32 ] } ] }
  store { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %a12468, { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* %a1_slot2469
  %a2_slot2467 = alloca { i32, [ 0 x { i32, [ 0 x i32 ] } ] }
  store { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %a22466, { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* %a2_slot2467
  %a3_slot2465 = alloca { i32, [ 0 x { i32, [ 0 x i32 ] } ] }
  store { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %a32464, { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* %a3_slot2465
  %i2470 = alloca i32
  store i32 0, i32* %i2470
  br label %__cond386

__cond386:
  %_lhs2471 = load i32* %i2470
  %bop2472 = icmp slt i32 %_lhs2471, 2
  br i1 %bop2472, label %__body385, label %__post384

__fresh394:
  br label %__body385

__body385:
  %j2473 = alloca i32
  store i32 0, i32* %j2473
  br label %__cond389

__cond389:
  %_lhs2474 = load i32* %j2473
  %bop2475 = icmp slt i32 %_lhs2474, 4
  br i1 %bop2475, label %__body388, label %__post387

__fresh395:
  br label %__body388

__body388:
  %k2476 = alloca i32
  store i32 0, i32* %k2476
  br label %__cond392

__cond392:
  %_lhs2477 = load i32* %k2476
  %bop2478 = icmp slt i32 %_lhs2477, 3
  br i1 %bop2478, label %__body391, label %__post390

__fresh396:
  br label %__body391

__body391:
  %_lhs2480 = load i32* %i2470
  %bound_ptr2482 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* %a3_slot2465, i32 0, i32 0
  %bound2483 = load i32* %bound_ptr2482
  call void @oat_array_bounds_check( i32 %bound2483, i32 %_lhs2480 )
  %elt2481 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* %a3_slot2465, i32 0, i32 1, i32 %_lhs2480
  %_lhs2479 = load i32* %j2473
  %bound_ptr2485 = getelementptr { i32, [ 0 x i32 ] }* %elt2481, i32 0, i32 0
  %bound2486 = load i32* %bound_ptr2485
  call void @oat_array_bounds_check( i32 %bound2486, i32 %_lhs2479 )
  %elt2484 = getelementptr { i32, [ 0 x i32 ] }* %elt2481, i32 0, i32 1, i32 %_lhs2479
  %_lhs2488 = load i32* %i2470
  %bound_ptr2490 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* %a3_slot2465, i32 0, i32 0
  %bound2491 = load i32* %bound_ptr2490
  call void @oat_array_bounds_check( i32 %bound2491, i32 %_lhs2488 )
  %elt2489 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* %a3_slot2465, i32 0, i32 1, i32 %_lhs2488
  %_lhs2487 = load i32* %j2473
  %bound_ptr2493 = getelementptr { i32, [ 0 x i32 ] }* %elt2489, i32 0, i32 0
  %bound2494 = load i32* %bound_ptr2493
  call void @oat_array_bounds_check( i32 %bound2494, i32 %_lhs2487 )
  %elt2492 = getelementptr { i32, [ 0 x i32 ] }* %elt2489, i32 0, i32 1, i32 %_lhs2487
  %_lhs2495 = load i32* %elt2492
  %_lhs2497 = load i32* %i2470
  %bound_ptr2499 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* %a1_slot2469, i32 0, i32 0
  %bound2500 = load i32* %bound_ptr2499
  call void @oat_array_bounds_check( i32 %bound2500, i32 %_lhs2497 )
  %elt2498 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* %a1_slot2469, i32 0, i32 1, i32 %_lhs2497
  %_lhs2496 = load i32* %k2476
  %bound_ptr2502 = getelementptr { i32, [ 0 x i32 ] }* %elt2498, i32 0, i32 0
  %bound2503 = load i32* %bound_ptr2502
  call void @oat_array_bounds_check( i32 %bound2503, i32 %_lhs2496 )
  %elt2501 = getelementptr { i32, [ 0 x i32 ] }* %elt2498, i32 0, i32 1, i32 %_lhs2496
  %_lhs2504 = load i32* %elt2501
  %_lhs2506 = load i32* %k2476
  %bound_ptr2508 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* %a2_slot2467, i32 0, i32 0
  %bound2509 = load i32* %bound_ptr2508
  call void @oat_array_bounds_check( i32 %bound2509, i32 %_lhs2506 )
  %elt2507 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* %a2_slot2467, i32 0, i32 1, i32 %_lhs2506
  %_lhs2505 = load i32* %j2473
  %bound_ptr2511 = getelementptr { i32, [ 0 x i32 ] }* %elt2507, i32 0, i32 0
  %bound2512 = load i32* %bound_ptr2511
  call void @oat_array_bounds_check( i32 %bound2512, i32 %_lhs2505 )
  %elt2510 = getelementptr { i32, [ 0 x i32 ] }* %elt2507, i32 0, i32 1, i32 %_lhs2505
  %_lhs2513 = load i32* %elt2510
  %bop2514 = mul i32 %_lhs2504, %_lhs2513
  %bop2515 = add i32 %_lhs2495, %bop2514
  store i32 %bop2515, i32* %elt2484
  %_lhs2516 = load i32* %k2476
  %bop2517 = add i32 %_lhs2516, 1
  store i32 %bop2517, i32* %k2476
  br label %__cond392

__fresh397:
  br label %__post390

__post390:
  %_lhs2518 = load i32* %j2473
  %bop2519 = add i32 %_lhs2518, 1
  store i32 %bop2519, i32* %j2473
  br label %__cond389

__fresh398:
  br label %__post387

__post387:
  %_lhs2520 = load i32* %i2470
  %bop2521 = add i32 %_lhs2520, 1
  store i32 %bop2521, i32* %i2470
  br label %__cond386

__fresh399:
  br label %__post384

__post384:
  ret void
}


define i32 @program (i32 %argc2398, { i32, [ 0 x i8* ] } %argv2396){

__fresh383:
  %argc_slot2399 = alloca i32
  store i32 %argc2398, i32* %argc_slot2399
  %argv_slot2397 = alloca { i32, [ 0 x i8* ] }
  store { i32, [ 0 x i8* ] } %argv2396, { i32, [ 0 x i8* ] }* %argv_slot2397
  %array_ptr2400 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 2 )
  %array2401 = bitcast { i32, [ 0 x i32 ] } %array_ptr2400 to { i32, [ 0 x { i32, [ 0 x i32 ] } ] } 
  %array_ptr2402 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 3 )
  %array2403 = bitcast { i32, [ 0 x i32 ] } %array_ptr2402 to { i32, [ 0 x i32 ] } 
  %index_ptr2404 = getelementptr { i32, [ 0 x i32 ] } %array2403, i32 0, i32 1, i32 0
  store i32 1, i32* %index_ptr2404
  %index_ptr2405 = getelementptr { i32, [ 0 x i32 ] } %array2403, i32 0, i32 1, i32 1
  store i32 3, i32* %index_ptr2405
  %index_ptr2406 = getelementptr { i32, [ 0 x i32 ] } %array2403, i32 0, i32 1, i32 2
  store i32 4, i32* %index_ptr2406
  %index_ptr2407 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %array2401, i32 0, i32 1, i32 0
  store { i32, [ 0 x i32 ] } %array2403, { i32, [ 0 x i32 ] }* %index_ptr2407
  %array_ptr2408 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 3 )
  %array2409 = bitcast { i32, [ 0 x i32 ] } %array_ptr2408 to { i32, [ 0 x i32 ] } 
  %index_ptr2410 = getelementptr { i32, [ 0 x i32 ] } %array2409, i32 0, i32 1, i32 0
  store i32 2, i32* %index_ptr2410
  %index_ptr2411 = getelementptr { i32, [ 0 x i32 ] } %array2409, i32 0, i32 1, i32 1
  store i32 0, i32* %index_ptr2411
  %index_ptr2412 = getelementptr { i32, [ 0 x i32 ] } %array2409, i32 0, i32 1, i32 2
  store i32 1, i32* %index_ptr2412
  %index_ptr2413 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %array2401, i32 0, i32 1, i32 1
  store { i32, [ 0 x i32 ] } %array2409, { i32, [ 0 x i32 ] }* %index_ptr2413
  %a2414 = alloca { i32, [ 0 x { i32, [ 0 x i32 ] } ] }
  store { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %array2401, { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* %a2414
  %array_ptr2415 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 3 )
  %array2416 = bitcast { i32, [ 0 x i32 ] } %array_ptr2415 to { i32, [ 0 x { i32, [ 0 x i32 ] } ] } 
  %array_ptr2417 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 4 )
  %array2418 = bitcast { i32, [ 0 x i32 ] } %array_ptr2417 to { i32, [ 0 x i32 ] } 
  %index_ptr2419 = getelementptr { i32, [ 0 x i32 ] } %array2418, i32 0, i32 1, i32 0
  store i32 1, i32* %index_ptr2419
  %index_ptr2420 = getelementptr { i32, [ 0 x i32 ] } %array2418, i32 0, i32 1, i32 1
  store i32 2, i32* %index_ptr2420
  %index_ptr2421 = getelementptr { i32, [ 0 x i32 ] } %array2418, i32 0, i32 1, i32 2
  store i32 3, i32* %index_ptr2421
  %index_ptr2422 = getelementptr { i32, [ 0 x i32 ] } %array2418, i32 0, i32 1, i32 3
  store i32 1, i32* %index_ptr2422
  %index_ptr2423 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %array2416, i32 0, i32 1, i32 0
  store { i32, [ 0 x i32 ] } %array2418, { i32, [ 0 x i32 ] }* %index_ptr2423
  %array_ptr2424 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 4 )
  %array2425 = bitcast { i32, [ 0 x i32 ] } %array_ptr2424 to { i32, [ 0 x i32 ] } 
  %index_ptr2426 = getelementptr { i32, [ 0 x i32 ] } %array2425, i32 0, i32 1, i32 0
  store i32 2, i32* %index_ptr2426
  %index_ptr2427 = getelementptr { i32, [ 0 x i32 ] } %array2425, i32 0, i32 1, i32 1
  store i32 2, i32* %index_ptr2427
  %index_ptr2428 = getelementptr { i32, [ 0 x i32 ] } %array2425, i32 0, i32 1, i32 2
  store i32 2, i32* %index_ptr2428
  %index_ptr2429 = getelementptr { i32, [ 0 x i32 ] } %array2425, i32 0, i32 1, i32 3
  store i32 2, i32* %index_ptr2429
  %index_ptr2430 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %array2416, i32 0, i32 1, i32 1
  store { i32, [ 0 x i32 ] } %array2425, { i32, [ 0 x i32 ] }* %index_ptr2430
  %array_ptr2431 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 4 )
  %array2432 = bitcast { i32, [ 0 x i32 ] } %array_ptr2431 to { i32, [ 0 x i32 ] } 
  %index_ptr2433 = getelementptr { i32, [ 0 x i32 ] } %array2432, i32 0, i32 1, i32 0
  store i32 3, i32* %index_ptr2433
  %index_ptr2434 = getelementptr { i32, [ 0 x i32 ] } %array2432, i32 0, i32 1, i32 1
  store i32 2, i32* %index_ptr2434
  %index_ptr2435 = getelementptr { i32, [ 0 x i32 ] } %array2432, i32 0, i32 1, i32 2
  store i32 1, i32* %index_ptr2435
  %index_ptr2436 = getelementptr { i32, [ 0 x i32 ] } %array2432, i32 0, i32 1, i32 3
  store i32 4, i32* %index_ptr2436
  %index_ptr2437 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %array2416, i32 0, i32 1, i32 2
  store { i32, [ 0 x i32 ] } %array2432, { i32, [ 0 x i32 ] }* %index_ptr2437
  %b2438 = alloca { i32, [ 0 x { i32, [ 0 x i32 ] } ] }
  store { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %array2416, { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* %b2438
  %array_ptr2439 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 2 )
  %array2440 = bitcast { i32, [ 0 x i32 ] } %array_ptr2439 to { i32, [ 0 x { i32, [ 0 x i32 ] } ] } 
  %array_ptr2441 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 4 )
  %array2442 = bitcast { i32, [ 0 x i32 ] } %array_ptr2441 to { i32, [ 0 x i32 ] } 
  %index_ptr2443 = getelementptr { i32, [ 0 x i32 ] } %array2442, i32 0, i32 1, i32 0
  store i32 0, i32* %index_ptr2443
  %index_ptr2444 = getelementptr { i32, [ 0 x i32 ] } %array2442, i32 0, i32 1, i32 1
  store i32 0, i32* %index_ptr2444
  %index_ptr2445 = getelementptr { i32, [ 0 x i32 ] } %array2442, i32 0, i32 1, i32 2
  store i32 0, i32* %index_ptr2445
  %index_ptr2446 = getelementptr { i32, [ 0 x i32 ] } %array2442, i32 0, i32 1, i32 3
  store i32 0, i32* %index_ptr2446
  %index_ptr2447 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %array2440, i32 0, i32 1, i32 0
  store { i32, [ 0 x i32 ] } %array2442, { i32, [ 0 x i32 ] }* %index_ptr2447
  %array_ptr2448 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 4 )
  %array2449 = bitcast { i32, [ 0 x i32 ] } %array_ptr2448 to { i32, [ 0 x i32 ] } 
  %index_ptr2450 = getelementptr { i32, [ 0 x i32 ] } %array2449, i32 0, i32 1, i32 0
  store i32 0, i32* %index_ptr2450
  %index_ptr2451 = getelementptr { i32, [ 0 x i32 ] } %array2449, i32 0, i32 1, i32 1
  store i32 0, i32* %index_ptr2451
  %index_ptr2452 = getelementptr { i32, [ 0 x i32 ] } %array2449, i32 0, i32 1, i32 2
  store i32 0, i32* %index_ptr2452
  %index_ptr2453 = getelementptr { i32, [ 0 x i32 ] } %array2449, i32 0, i32 1, i32 3
  store i32 0, i32* %index_ptr2453
  %index_ptr2454 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %array2440, i32 0, i32 1, i32 1
  store { i32, [ 0 x i32 ] } %array2449, { i32, [ 0 x i32 ] }* %index_ptr2454
  %c2455 = alloca { i32, [ 0 x { i32, [ 0 x i32 ] } ] }
  store { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %array2440, { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* %c2455
  %_lhs2458 = load { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* %c2455
  %_lhs2457 = load { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* %b2438
  %_lhs2456 = load { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* %a2414
  call void @matrix_Mult( { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %_lhs2456, { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %_lhs2457, { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %_lhs2458 )
  %_lhs2459 = load { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* %c2455
  call void @prnNx4( { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %_lhs2459, i32 2 )
  %_lhs2462 = load { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* %c2455
  %_lhs2461 = load { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* %b2438
  %_lhs2460 = load { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* %a2414
  call void @matrix_MultAlt( { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %_lhs2460, { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %_lhs2461, { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %_lhs2462 )
  %_lhs2463 = load { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* %c2455
  call void @prnNx4( { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %_lhs2463, i32 2 )
  ret i32 0
}


