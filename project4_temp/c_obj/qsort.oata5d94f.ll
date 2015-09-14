declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@_oat_string2681.str. = private unnamed_addr constant [ 2 x i8 ] c "
\00", align 4
@_oat_string2681 = global i8* getelementptr inbounds ([ 2 x i8 ]* @_oat_string2681.str., i32 0, i32 0), align 4
@_oat_string2676.str. = private unnamed_addr constant [ 2 x i8 ] c "
\00", align 4
@_oat_string2676 = global i8* getelementptr inbounds ([ 2 x i8 ]* @_oat_string2676.str., i32 0, i32 0), align 4
@_oat_string2672.str. = private unnamed_addr constant [ 2 x i8 ] c "
\00", align 4
@_oat_string2672 = global i8* getelementptr inbounds ([ 2 x i8 ]* @_oat_string2672.str., i32 0, i32 0), align 4
define void @oat_init (){

__fresh492:
  ret void
}


define i32 @program (i32 %argc2658, { i32, [ 0 x i8* ] }* %argv2656){

__fresh491:
  %argc_slot2659 = alloca i32
  store i32 %argc2658, i32* %argc_slot2659
  %argv_slot2657 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv2656, { i32, [ 0 x i8* ] }** %argv_slot2657
  %array_ptr2660 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 9 )
  %array2661 = bitcast { i32, [ 0 x i32 ] }* %array_ptr2660 to { i32, [ 0 x i32 ] }* 
  %index_ptr2662 = getelementptr { i32, [ 0 x i32 ] }* %array2661, i32 0, i32 1, i32 0
  store i32 107, i32* %index_ptr2662
  %index_ptr2663 = getelementptr { i32, [ 0 x i32 ] }* %array2661, i32 0, i32 1, i32 1
  store i32 112, i32* %index_ptr2663
  %index_ptr2664 = getelementptr { i32, [ 0 x i32 ] }* %array2661, i32 0, i32 1, i32 2
  store i32 121, i32* %index_ptr2664
  %index_ptr2665 = getelementptr { i32, [ 0 x i32 ] }* %array2661, i32 0, i32 1, i32 3
  store i32 102, i32* %index_ptr2665
  %index_ptr2666 = getelementptr { i32, [ 0 x i32 ] }* %array2661, i32 0, i32 1, i32 4
  store i32 123, i32* %index_ptr2666
  %index_ptr2667 = getelementptr { i32, [ 0 x i32 ] }* %array2661, i32 0, i32 1, i32 5
  store i32 115, i32* %index_ptr2667
  %index_ptr2668 = getelementptr { i32, [ 0 x i32 ] }* %array2661, i32 0, i32 1, i32 6
  store i32 104, i32* %index_ptr2668
  %index_ptr2669 = getelementptr { i32, [ 0 x i32 ] }* %array2661, i32 0, i32 1, i32 7
  store i32 111, i32* %index_ptr2669
  %index_ptr2670 = getelementptr { i32, [ 0 x i32 ] }* %array2661, i32 0, i32 1, i32 8
  store i32 109, i32* %index_ptr2670
  %a2671 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array2661, { i32, [ 0 x i32 ] }** %a2671
  %strval2673 = load i8** @_oat_string2672
  call void @print_string( i8* %strval2673 )
  %_lhs2674 = load { i32, [ 0 x i32 ] }** %a2671
  %ret2675 = call i8* @string_of_array ( { i32, [ 0 x i32 ] }* %_lhs2674 )
  call void @print_string( i8* %ret2675 )
  %strval2677 = load i8** @_oat_string2676
  call void @print_string( i8* %strval2677 )
  %_lhs2678 = load { i32, [ 0 x i32 ] }** %a2671
  call void @quick_sort( { i32, [ 0 x i32 ] }* %_lhs2678, i32 0, i32 8 )
  %_lhs2679 = load { i32, [ 0 x i32 ] }** %a2671
  %ret2680 = call i8* @string_of_array ( { i32, [ 0 x i32 ] }* %_lhs2679 )
  call void @print_string( i8* %ret2680 )
  %strval2682 = load i8** @_oat_string2681
  call void @print_string( i8* %strval2682 )
  ret i32 255
}


define i32 @partition ({ i32, [ 0 x i32 ] }* %a2569, i32 %l2567, i32 %r2565){

__fresh480:
  %a_slot2570 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %a2569, { i32, [ 0 x i32 ] }** %a_slot2570
  %l_slot2568 = alloca i32
  store i32 %l2567, i32* %l_slot2568
  %r_slot2566 = alloca i32
  store i32 %r2565, i32* %r_slot2566
  %_lhs2571 = load i32* %l_slot2568
  %bound_ptr2573 = getelementptr { i32, [ 0 x i32 ] }** %a_slot2570, i32 0, i32 0
  %bound2574 = load i32* %bound_ptr2573
  call void @oat_array_bounds_check( i32 %bound2574, i32 %_lhs2571 )
  %elt2572 = getelementptr { i32, [ 0 x i32 ] }** %a_slot2570, i32 0, i32 1, i32 %_lhs2571
  %_lhs2575 = load i32* %elt2572
  %pivot2576 = alloca i32
  store i32 %_lhs2575, i32* %pivot2576
  %_lhs2577 = load i32* %l_slot2568
  %i2578 = alloca i32
  store i32 %_lhs2577, i32* %i2578
  %_lhs2579 = load i32* %r_slot2566
  %bop2580 = add i32 %_lhs2579, 1
  %j2581 = alloca i32
  store i32 %bop2580, i32* %j2581
  %t2582 = alloca i32
  store i32 0, i32* %t2582
  %done2583 = alloca i32
  store i32 0, i32* %done2583
  br label %__cond467

__cond467:
  %_lhs2584 = load i32* %done2583
  %bop2585 = icmp eq i32 %_lhs2584, 0
  br i1 %bop2585, label %__body466, label %__post465

__fresh481:
  br label %__body466

__body466:
  %_lhs2586 = load i32* %i2578
  %bop2587 = add i32 %_lhs2586, 1
  store i32 %bop2587, i32* %i2578
  br label %__cond470

__cond470:
  %_lhs2588 = load i32* %i2578
  %bound_ptr2590 = getelementptr { i32, [ 0 x i32 ] }** %a_slot2570, i32 0, i32 0
  %bound2591 = load i32* %bound_ptr2590
  call void @oat_array_bounds_check( i32 %bound2591, i32 %_lhs2588 )
  %elt2589 = getelementptr { i32, [ 0 x i32 ] }** %a_slot2570, i32 0, i32 1, i32 %_lhs2588
  %_lhs2592 = load i32* %elt2589
  %_lhs2593 = load i32* %pivot2576
  %bop2594 = icmp sle i32 %_lhs2592, %_lhs2593
  %_lhs2595 = load i32* %i2578
  %_lhs2596 = load i32* %r_slot2566
  %bop2597 = icmp sle i32 %_lhs2595, %_lhs2596
  %bop2598 = and i1 %bop2594, %bop2597
  br i1 %bop2598, label %__body469, label %__post468

__fresh482:
  br label %__body469

__body469:
  %_lhs2599 = load i32* %i2578
  %bop2600 = add i32 %_lhs2599, 1
  store i32 %bop2600, i32* %i2578
  br label %__cond470

__fresh483:
  br label %__post468

__post468:
  %_lhs2601 = load i32* %j2581
  %bop2602 = sub i32 %_lhs2601, 1
  store i32 %bop2602, i32* %j2581
  br label %__cond473

__cond473:
  %_lhs2603 = load i32* %j2581
  %bound_ptr2605 = getelementptr { i32, [ 0 x i32 ] }** %a_slot2570, i32 0, i32 0
  %bound2606 = load i32* %bound_ptr2605
  call void @oat_array_bounds_check( i32 %bound2606, i32 %_lhs2603 )
  %elt2604 = getelementptr { i32, [ 0 x i32 ] }** %a_slot2570, i32 0, i32 1, i32 %_lhs2603
  %_lhs2607 = load i32* %elt2604
  %_lhs2608 = load i32* %pivot2576
  %bop2609 = icmp sgt i32 %_lhs2607, %_lhs2608
  br i1 %bop2609, label %__body472, label %__post471

__fresh484:
  br label %__body472

__body472:
  %_lhs2610 = load i32* %j2581
  %bop2611 = sub i32 %_lhs2610, 1
  store i32 %bop2611, i32* %j2581
  br label %__cond473

__fresh485:
  br label %__post471

__post471:
  %_lhs2612 = load i32* %i2578
  %_lhs2613 = load i32* %j2581
  %bop2614 = icmp sge i32 %_lhs2612, %_lhs2613
  br i1 %bop2614, label %__then476, label %__else475

__fresh486:
  br label %__then476

__then476:
  store i32 1, i32* %done2583
  br label %__merge474

__fresh487:
  br label %__else475

__else475:
  br label %__merge474

__merge474:
  %_lhs2615 = load i32* %done2583
  %bop2616 = icmp eq i32 %_lhs2615, 0
  br i1 %bop2616, label %__then479, label %__else478

__fresh488:
  br label %__then479

__then479:
  %_lhs2617 = load i32* %i2578
  %bound_ptr2619 = getelementptr { i32, [ 0 x i32 ] }** %a_slot2570, i32 0, i32 0
  %bound2620 = load i32* %bound_ptr2619
  call void @oat_array_bounds_check( i32 %bound2620, i32 %_lhs2617 )
  %elt2618 = getelementptr { i32, [ 0 x i32 ] }** %a_slot2570, i32 0, i32 1, i32 %_lhs2617
  %_lhs2621 = load i32* %elt2618
  store i32 %_lhs2621, i32* %t2582
  %_lhs2622 = load i32* %i2578
  %bound_ptr2624 = getelementptr { i32, [ 0 x i32 ] }** %a_slot2570, i32 0, i32 0
  %bound2625 = load i32* %bound_ptr2624
  call void @oat_array_bounds_check( i32 %bound2625, i32 %_lhs2622 )
  %elt2623 = getelementptr { i32, [ 0 x i32 ] }** %a_slot2570, i32 0, i32 1, i32 %_lhs2622
  %_lhs2626 = load i32* %j2581
  %bound_ptr2628 = getelementptr { i32, [ 0 x i32 ] }** %a_slot2570, i32 0, i32 0
  %bound2629 = load i32* %bound_ptr2628
  call void @oat_array_bounds_check( i32 %bound2629, i32 %_lhs2626 )
  %elt2627 = getelementptr { i32, [ 0 x i32 ] }** %a_slot2570, i32 0, i32 1, i32 %_lhs2626
  %_lhs2630 = load i32* %elt2627
  store i32 %_lhs2630, i32* %elt2623
  %_lhs2631 = load i32* %j2581
  %bound_ptr2633 = getelementptr { i32, [ 0 x i32 ] }** %a_slot2570, i32 0, i32 0
  %bound2634 = load i32* %bound_ptr2633
  call void @oat_array_bounds_check( i32 %bound2634, i32 %_lhs2631 )
  %elt2632 = getelementptr { i32, [ 0 x i32 ] }** %a_slot2570, i32 0, i32 1, i32 %_lhs2631
  %_lhs2635 = load i32* %t2582
  store i32 %_lhs2635, i32* %elt2632
  br label %__merge477

__fresh489:
  br label %__else478

__else478:
  br label %__merge477

__merge477:
  br label %__cond467

__fresh490:
  br label %__post465

__post465:
  %_lhs2636 = load i32* %l_slot2568
  %bound_ptr2638 = getelementptr { i32, [ 0 x i32 ] }** %a_slot2570, i32 0, i32 0
  %bound2639 = load i32* %bound_ptr2638
  call void @oat_array_bounds_check( i32 %bound2639, i32 %_lhs2636 )
  %elt2637 = getelementptr { i32, [ 0 x i32 ] }** %a_slot2570, i32 0, i32 1, i32 %_lhs2636
  %_lhs2640 = load i32* %elt2637
  store i32 %_lhs2640, i32* %t2582
  %_lhs2641 = load i32* %l_slot2568
  %bound_ptr2643 = getelementptr { i32, [ 0 x i32 ] }** %a_slot2570, i32 0, i32 0
  %bound2644 = load i32* %bound_ptr2643
  call void @oat_array_bounds_check( i32 %bound2644, i32 %_lhs2641 )
  %elt2642 = getelementptr { i32, [ 0 x i32 ] }** %a_slot2570, i32 0, i32 1, i32 %_lhs2641
  %_lhs2645 = load i32* %j2581
  %bound_ptr2647 = getelementptr { i32, [ 0 x i32 ] }** %a_slot2570, i32 0, i32 0
  %bound2648 = load i32* %bound_ptr2647
  call void @oat_array_bounds_check( i32 %bound2648, i32 %_lhs2645 )
  %elt2646 = getelementptr { i32, [ 0 x i32 ] }** %a_slot2570, i32 0, i32 1, i32 %_lhs2645
  %_lhs2649 = load i32* %elt2646
  store i32 %_lhs2649, i32* %elt2642
  %_lhs2650 = load i32* %j2581
  %bound_ptr2652 = getelementptr { i32, [ 0 x i32 ] }** %a_slot2570, i32 0, i32 0
  %bound2653 = load i32* %bound_ptr2652
  call void @oat_array_bounds_check( i32 %bound2653, i32 %_lhs2650 )
  %elt2651 = getelementptr { i32, [ 0 x i32 ] }** %a_slot2570, i32 0, i32 1, i32 %_lhs2650
  %_lhs2654 = load i32* %t2582
  store i32 %_lhs2654, i32* %elt2651
  %_lhs2655 = load i32* %j2581
  ret i32 %_lhs2655
}


define void @quick_sort ({ i32, [ 0 x i32 ] }* %a2547, i32 %l2545, i32 %r2543){

__fresh462:
  %a_slot2548 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %a2547, { i32, [ 0 x i32 ] }** %a_slot2548
  %l_slot2546 = alloca i32
  store i32 %l2545, i32* %l_slot2546
  %r_slot2544 = alloca i32
  store i32 %r2543, i32* %r_slot2544
  %j2549 = alloca i32
  store i32 0, i32* %j2549
  %_lhs2550 = load i32* %l_slot2546
  %_lhs2551 = load i32* %r_slot2544
  %bop2552 = icmp slt i32 %_lhs2550, %_lhs2551
  br i1 %bop2552, label %__then461, label %__else460

__fresh463:
  br label %__then461

__then461:
  %_lhs2555 = load i32* %r_slot2544
  %_lhs2554 = load i32* %l_slot2546
  %_lhs2553 = load { i32, [ 0 x i32 ] }** %a_slot2548
  %ret2556 = call i32 @partition ( { i32, [ 0 x i32 ] }* %_lhs2553, i32 %_lhs2554, i32 %_lhs2555 )
  store i32 %ret2556, i32* %j2549
  %_lhs2559 = load i32* %j2549
  %bop2560 = sub i32 %_lhs2559, 1
  %_lhs2558 = load i32* %l_slot2546
  %_lhs2557 = load { i32, [ 0 x i32 ] }** %a_slot2548
  call void @quick_sort( { i32, [ 0 x i32 ] }* %_lhs2557, i32 %_lhs2558, i32 %bop2560 )
  %_lhs2564 = load i32* %r_slot2544
  %_lhs2562 = load i32* %j2549
  %bop2563 = add i32 %_lhs2562, 1
  %_lhs2561 = load { i32, [ 0 x i32 ] }** %a_slot2548
  call void @quick_sort( { i32, [ 0 x i32 ] }* %_lhs2561, i32 %bop2563, i32 %_lhs2564 )
  br label %__merge459

__fresh464:
  br label %__else460

__else460:
  br label %__merge459

__merge459:
  ret void
}


