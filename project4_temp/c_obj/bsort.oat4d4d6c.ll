declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@_oat_string2784.str. = private unnamed_addr constant [ 2 x i8 ] c " \00", align 4
@_oat_string2784 = global i8* getelementptr inbounds ([ 2 x i8 ]* @_oat_string2784.str., i32 0, i32 0), align 4
define void @oat_init (){

__fresh515:
  ret void
}


define i32 @program (i32 %argc2739, { i32, [ 0 x i8* ] }* %argv2737){

__fresh512:
  %argc_slot2740 = alloca i32
  store i32 %argc2739, i32* %argc_slot2740
  %argv_slot2738 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv2737, { i32, [ 0 x i8* ] }** %argv_slot2738
  %array_ptr2741 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 8 )
  %array2742 = bitcast { i32, [ 0 x i32 ] }* %array_ptr2741 to { i32, [ 0 x i32 ] }* 
  %_tmp27422744 = alloca i32
  store i32 8, i32* %_tmp27422744
  %_tmp27442746 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array2742, { i32, [ 0 x i32 ] }** %_tmp27442746
  %i2747 = alloca i32
  store i32 0, i32* %i2747
  br label %__cond511

__cond511:
  %_lhs2748 = load i32* %i2747
  %_lhs2749 = load i32* %_tmp27422744
  %bop2750 = icmp slt i32 %_lhs2748, %_lhs2749
  br i1 %bop2750, label %__body510, label %__post509

__fresh513:
  br label %__body510

__body510:
  %_lhs2751 = load i32* %i2747
  %bound_ptr2753 = getelementptr { i32, [ 0 x i32 ] }** %_tmp27442746, i32 0, i32 0
  %bound2754 = load i32* %bound_ptr2753
  call void @oat_array_bounds_check( i32 %bound2754, i32 %_lhs2751 )
  %elt2752 = getelementptr { i32, [ 0 x i32 ] }** %_tmp27442746, i32 0, i32 1, i32 %_lhs2751
  store i32 0, i32* %elt2752
  %_lhs2755 = load i32* %i2747
  %bop2756 = add i32 %_lhs2755, 1
  store i32 %bop2756, i32* %i2747
  br label %__cond511

__fresh514:
  br label %__post509

__post509:
  %a2757 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array2742, { i32, [ 0 x i32 ] }** %a2757
  %bound_ptr2759 = getelementptr { i32, [ 0 x i32 ] }** %a2757, i32 0, i32 0
  %bound2760 = load i32* %bound_ptr2759
  call void @oat_array_bounds_check( i32 %bound2760, i32 0 )
  %elt2758 = getelementptr { i32, [ 0 x i32 ] }** %a2757, i32 0, i32 1, i32 0
  store i32 121, i32* %elt2758
  %bound_ptr2762 = getelementptr { i32, [ 0 x i32 ] }** %a2757, i32 0, i32 0
  %bound2763 = load i32* %bound_ptr2762
  call void @oat_array_bounds_check( i32 %bound2763, i32 1 )
  %elt2761 = getelementptr { i32, [ 0 x i32 ] }** %a2757, i32 0, i32 1, i32 1
  store i32 125, i32* %elt2761
  %bound_ptr2765 = getelementptr { i32, [ 0 x i32 ] }** %a2757, i32 0, i32 0
  %bound2766 = load i32* %bound_ptr2765
  call void @oat_array_bounds_check( i32 %bound2766, i32 2 )
  %elt2764 = getelementptr { i32, [ 0 x i32 ] }** %a2757, i32 0, i32 1, i32 2
  store i32 120, i32* %elt2764
  %bound_ptr2768 = getelementptr { i32, [ 0 x i32 ] }** %a2757, i32 0, i32 0
  %bound2769 = load i32* %bound_ptr2768
  call void @oat_array_bounds_check( i32 %bound2769, i32 3 )
  %elt2767 = getelementptr { i32, [ 0 x i32 ] }** %a2757, i32 0, i32 1, i32 3
  store i32 111, i32* %elt2767
  %bound_ptr2771 = getelementptr { i32, [ 0 x i32 ] }** %a2757, i32 0, i32 0
  %bound2772 = load i32* %bound_ptr2771
  call void @oat_array_bounds_check( i32 %bound2772, i32 4 )
  %elt2770 = getelementptr { i32, [ 0 x i32 ] }** %a2757, i32 0, i32 1, i32 4
  store i32 116, i32* %elt2770
  %bound_ptr2774 = getelementptr { i32, [ 0 x i32 ] }** %a2757, i32 0, i32 0
  %bound2775 = load i32* %bound_ptr2774
  call void @oat_array_bounds_check( i32 %bound2775, i32 5 )
  %elt2773 = getelementptr { i32, [ 0 x i32 ] }** %a2757, i32 0, i32 1, i32 5
  store i32 110, i32* %elt2773
  %bound_ptr2777 = getelementptr { i32, [ 0 x i32 ] }** %a2757, i32 0, i32 0
  %bound2778 = load i32* %bound_ptr2777
  call void @oat_array_bounds_check( i32 %bound2778, i32 6 )
  %elt2776 = getelementptr { i32, [ 0 x i32 ] }** %a2757, i32 0, i32 1, i32 6
  store i32 117, i32* %elt2776
  %bound_ptr2780 = getelementptr { i32, [ 0 x i32 ] }** %a2757, i32 0, i32 0
  %bound2781 = load i32* %bound_ptr2780
  call void @oat_array_bounds_check( i32 %bound2781, i32 7 )
  %elt2779 = getelementptr { i32, [ 0 x i32 ] }** %a2757, i32 0, i32 1, i32 7
  store i32 119, i32* %elt2779
  %_lhs2782 = load { i32, [ 0 x i32 ] }** %a2757
  %ret2783 = call i8* @string_of_array ( { i32, [ 0 x i32 ] }* %_lhs2782 )
  call void @print_string( i8* %ret2783 )
  %strval2785 = load i8** @_oat_string2784
  call void @print_string( i8* %strval2785 )
  %_lhs2787 = load { i32, [ 0 x i32 ] }** %a2757
  %len_ptr2788 = getelementptr { i32, [ 0 x i32 ] }* %_lhs2787, i32 0, i32 0
  %len2789 = load i32* %len_ptr2788
  %_lhs2786 = load { i32, [ 0 x i32 ] }** %a2757
  call void @bubble_sort( { i32, [ 0 x i32 ] }* %_lhs2786, i32 %len2789 )
  %_lhs2790 = load { i32, [ 0 x i32 ] }** %a2757
  %ret2791 = call i8* @string_of_array ( { i32, [ 0 x i32 ] }* %_lhs2790 )
  call void @print_string( i8* %ret2791 )
  %unop2792 = sub i32 0, 1
  ret i32 %unop2792
}


define void @bubble_sort ({ i32, [ 0 x i32 ] }* %numbers2688, i32 %array_size2686){

__fresh502:
  %numbers_slot2689 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %numbers2688, { i32, [ 0 x i32 ] }** %numbers_slot2689
  %array_size_slot2687 = alloca i32
  store i32 %array_size2686, i32* %array_size_slot2687
  %temp2690 = alloca i32
  store i32 0, i32* %temp2690
  %_lhs2691 = load i32* %array_size_slot2687
  %bop2692 = sub i32 %_lhs2691, 1
  %i2693 = alloca i32
  store i32 %bop2692, i32* %i2693
  br label %__cond495

__cond495:
  %_lhs2694 = load i32* %i2693
  %bop2695 = icmp sgt i32 %_lhs2694, 0
  br i1 %bop2695, label %__body494, label %__post493

__fresh503:
  br label %__body494

__body494:
  %j2696 = alloca i32
  store i32 1, i32* %j2696
  br label %__cond498

__cond498:
  %_lhs2697 = load i32* %j2696
  %_lhs2698 = load i32* %i2693
  %bop2699 = icmp sle i32 %_lhs2697, %_lhs2698
  br i1 %bop2699, label %__body497, label %__post496

__fresh504:
  br label %__body497

__body497:
  %_lhs2700 = load i32* %j2696
  %bop2701 = sub i32 %_lhs2700, 1
  %bound_ptr2703 = getelementptr { i32, [ 0 x i32 ] }** %numbers_slot2689, i32 0, i32 0
  %bound2704 = load i32* %bound_ptr2703
  call void @oat_array_bounds_check( i32 %bound2704, i32 %bop2701 )
  %elt2702 = getelementptr { i32, [ 0 x i32 ] }** %numbers_slot2689, i32 0, i32 1, i32 %bop2701
  %_lhs2705 = load i32* %elt2702
  %_lhs2706 = load i32* %j2696
  %bound_ptr2708 = getelementptr { i32, [ 0 x i32 ] }** %numbers_slot2689, i32 0, i32 0
  %bound2709 = load i32* %bound_ptr2708
  call void @oat_array_bounds_check( i32 %bound2709, i32 %_lhs2706 )
  %elt2707 = getelementptr { i32, [ 0 x i32 ] }** %numbers_slot2689, i32 0, i32 1, i32 %_lhs2706
  %_lhs2710 = load i32* %elt2707
  %bop2711 = icmp sgt i32 %_lhs2705, %_lhs2710
  br i1 %bop2711, label %__then501, label %__else500

__fresh505:
  br label %__then501

__then501:
  %_lhs2712 = load i32* %j2696
  %bop2713 = sub i32 %_lhs2712, 1
  %bound_ptr2715 = getelementptr { i32, [ 0 x i32 ] }** %numbers_slot2689, i32 0, i32 0
  %bound2716 = load i32* %bound_ptr2715
  call void @oat_array_bounds_check( i32 %bound2716, i32 %bop2713 )
  %elt2714 = getelementptr { i32, [ 0 x i32 ] }** %numbers_slot2689, i32 0, i32 1, i32 %bop2713
  %_lhs2717 = load i32* %elt2714
  store i32 %_lhs2717, i32* %temp2690
  %_lhs2718 = load i32* %j2696
  %bop2719 = sub i32 %_lhs2718, 1
  %bound_ptr2721 = getelementptr { i32, [ 0 x i32 ] }** %numbers_slot2689, i32 0, i32 0
  %bound2722 = load i32* %bound_ptr2721
  call void @oat_array_bounds_check( i32 %bound2722, i32 %bop2719 )
  %elt2720 = getelementptr { i32, [ 0 x i32 ] }** %numbers_slot2689, i32 0, i32 1, i32 %bop2719
  %_lhs2723 = load i32* %j2696
  %bound_ptr2725 = getelementptr { i32, [ 0 x i32 ] }** %numbers_slot2689, i32 0, i32 0
  %bound2726 = load i32* %bound_ptr2725
  call void @oat_array_bounds_check( i32 %bound2726, i32 %_lhs2723 )
  %elt2724 = getelementptr { i32, [ 0 x i32 ] }** %numbers_slot2689, i32 0, i32 1, i32 %_lhs2723
  %_lhs2727 = load i32* %elt2724
  store i32 %_lhs2727, i32* %elt2720
  %_lhs2728 = load i32* %j2696
  %bound_ptr2730 = getelementptr { i32, [ 0 x i32 ] }** %numbers_slot2689, i32 0, i32 0
  %bound2731 = load i32* %bound_ptr2730
  call void @oat_array_bounds_check( i32 %bound2731, i32 %_lhs2728 )
  %elt2729 = getelementptr { i32, [ 0 x i32 ] }** %numbers_slot2689, i32 0, i32 1, i32 %_lhs2728
  %_lhs2732 = load i32* %temp2690
  store i32 %_lhs2732, i32* %elt2729
  br label %__merge499

__fresh506:
  br label %__else500

__else500:
  br label %__merge499

__merge499:
  %_lhs2733 = load i32* %j2696
  %bop2734 = add i32 %_lhs2733, 1
  store i32 %bop2734, i32* %j2696
  br label %__cond498

__fresh507:
  br label %__post496

__post496:
  %_lhs2735 = load i32* %i2693
  %bop2736 = sub i32 %_lhs2735, 1
  store i32 %bop2736, i32* %i2693
  br label %__cond495

__fresh508:
  br label %__post493

__post493:
  ret void
}


