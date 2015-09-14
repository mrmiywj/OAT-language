declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@_oat_string2819.str. = private unnamed_addr constant [ 2 x i8 ] c " \00", align 4
@_oat_string2819 = global i8* getelementptr inbounds ([ 2 x i8 ]* @_oat_string2819.str., i32 0, i32 0), align 4
@_oat_string2815.str. = private unnamed_addr constant [ 2 x i8 ] c " \00", align 4
@_oat_string2815 = global i8* getelementptr inbounds ([ 2 x i8 ]* @_oat_string2815.str., i32 0, i32 0), align 4
define void @oat_init (){

__fresh554:
  ret void
}


define void @merge ({ i32, [ 0 x i32 ] }* %a2855, i32 %low2853, i32 %high2851, i32 %mid2849){

__fresh541:
  %a_slot2856 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %a2855, { i32, [ 0 x i32 ] }** %a_slot2856
  %low_slot2854 = alloca i32
  store i32 %low2853, i32* %low_slot2854
  %high_slot2852 = alloca i32
  store i32 %high2851, i32* %high_slot2852
  %mid_slot2850 = alloca i32
  store i32 %mid2849, i32* %mid_slot2850
  %i2857 = alloca i32
  store i32 0, i32* %i2857
  %j2858 = alloca i32
  store i32 0, i32* %j2858
  %k2859 = alloca i32
  store i32 0, i32* %k2859
  %array_ptr2860 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 50 )
  %array2861 = bitcast { i32, [ 0 x i32 ] }* %array_ptr2860 to { i32, [ 0 x i32 ] }* 
  %_tmp28612863 = alloca i32
  store i32 50, i32* %_tmp28612863
  %_tmp28632865 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array2861, { i32, [ 0 x i32 ] }** %_tmp28632865
  %i2866 = alloca i32
  store i32 0, i32* %i2866
  br label %__cond525

__cond525:
  %_lhs2867 = load i32* %i2866
  %_lhs2868 = load i32* %_tmp28612863
  %bop2869 = icmp slt i32 %_lhs2867, %_lhs2868
  br i1 %bop2869, label %__body524, label %__post523

__fresh542:
  br label %__body524

__body524:
  %_lhs2870 = load i32* %i2866
  %bound_ptr2872 = getelementptr { i32, [ 0 x i32 ] }** %_tmp28632865, i32 0, i32 0
  %bound2873 = load i32* %bound_ptr2872
  call void @oat_array_bounds_check( i32 %bound2873, i32 %_lhs2870 )
  %elt2871 = getelementptr { i32, [ 0 x i32 ] }** %_tmp28632865, i32 0, i32 1, i32 %_lhs2870
  store i32 0, i32* %elt2871
  %_lhs2874 = load i32* %i2866
  %bop2875 = add i32 %_lhs2874, 1
  store i32 %bop2875, i32* %i2866
  br label %__cond525

__fresh543:
  br label %__post523

__post523:
  %c2876 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array2861, { i32, [ 0 x i32 ] }** %c2876
  %_lhs2877 = load i32* %low_slot2854
  store i32 %_lhs2877, i32* %i2857
  %_lhs2878 = load i32* %mid_slot2850
  %bop2879 = add i32 %_lhs2878, 1
  store i32 %bop2879, i32* %j2858
  %_lhs2880 = load i32* %low_slot2854
  store i32 %_lhs2880, i32* %k2859
  br label %__cond528

__cond528:
  %_lhs2881 = load i32* %i2857
  %_lhs2882 = load i32* %mid_slot2850
  %bop2883 = icmp sle i32 %_lhs2881, %_lhs2882
  %_lhs2884 = load i32* %j2858
  %_lhs2885 = load i32* %high_slot2852
  %bop2886 = icmp sle i32 %_lhs2884, %_lhs2885
  %bop2887 = and i1 %bop2883, %bop2886
  br i1 %bop2887, label %__body527, label %__post526

__fresh544:
  br label %__body527

__body527:
  %_lhs2888 = load i32* %i2857
  %bound_ptr2890 = getelementptr { i32, [ 0 x i32 ] }** %a_slot2856, i32 0, i32 0
  %bound2891 = load i32* %bound_ptr2890
  call void @oat_array_bounds_check( i32 %bound2891, i32 %_lhs2888 )
  %elt2889 = getelementptr { i32, [ 0 x i32 ] }** %a_slot2856, i32 0, i32 1, i32 %_lhs2888
  %_lhs2892 = load i32* %elt2889
  %_lhs2893 = load i32* %j2858
  %bound_ptr2895 = getelementptr { i32, [ 0 x i32 ] }** %a_slot2856, i32 0, i32 0
  %bound2896 = load i32* %bound_ptr2895
  call void @oat_array_bounds_check( i32 %bound2896, i32 %_lhs2893 )
  %elt2894 = getelementptr { i32, [ 0 x i32 ] }** %a_slot2856, i32 0, i32 1, i32 %_lhs2893
  %_lhs2897 = load i32* %elt2894
  %bop2898 = icmp slt i32 %_lhs2892, %_lhs2897
  br i1 %bop2898, label %__then531, label %__else530

__fresh545:
  br label %__then531

__then531:
  %_lhs2899 = load i32* %k2859
  %bound_ptr2901 = getelementptr { i32, [ 0 x i32 ] }** %c2876, i32 0, i32 0
  %bound2902 = load i32* %bound_ptr2901
  call void @oat_array_bounds_check( i32 %bound2902, i32 %_lhs2899 )
  %elt2900 = getelementptr { i32, [ 0 x i32 ] }** %c2876, i32 0, i32 1, i32 %_lhs2899
  %_lhs2903 = load i32* %i2857
  %bound_ptr2905 = getelementptr { i32, [ 0 x i32 ] }** %a_slot2856, i32 0, i32 0
  %bound2906 = load i32* %bound_ptr2905
  call void @oat_array_bounds_check( i32 %bound2906, i32 %_lhs2903 )
  %elt2904 = getelementptr { i32, [ 0 x i32 ] }** %a_slot2856, i32 0, i32 1, i32 %_lhs2903
  %_lhs2907 = load i32* %elt2904
  store i32 %_lhs2907, i32* %elt2900
  %_lhs2908 = load i32* %k2859
  %bop2909 = add i32 %_lhs2908, 1
  store i32 %bop2909, i32* %k2859
  %_lhs2910 = load i32* %i2857
  %bop2911 = add i32 %_lhs2910, 1
  store i32 %bop2911, i32* %i2857
  br label %__merge529

__fresh546:
  br label %__else530

__else530:
  %_lhs2912 = load i32* %k2859
  %bound_ptr2914 = getelementptr { i32, [ 0 x i32 ] }** %c2876, i32 0, i32 0
  %bound2915 = load i32* %bound_ptr2914
  call void @oat_array_bounds_check( i32 %bound2915, i32 %_lhs2912 )
  %elt2913 = getelementptr { i32, [ 0 x i32 ] }** %c2876, i32 0, i32 1, i32 %_lhs2912
  %_lhs2916 = load i32* %j2858
  %bound_ptr2918 = getelementptr { i32, [ 0 x i32 ] }** %a_slot2856, i32 0, i32 0
  %bound2919 = load i32* %bound_ptr2918
  call void @oat_array_bounds_check( i32 %bound2919, i32 %_lhs2916 )
  %elt2917 = getelementptr { i32, [ 0 x i32 ] }** %a_slot2856, i32 0, i32 1, i32 %_lhs2916
  %_lhs2920 = load i32* %elt2917
  store i32 %_lhs2920, i32* %elt2913
  %_lhs2921 = load i32* %k2859
  %bop2922 = add i32 %_lhs2921, 1
  store i32 %bop2922, i32* %k2859
  %_lhs2923 = load i32* %j2858
  %bop2924 = add i32 %_lhs2923, 1
  store i32 %bop2924, i32* %j2858
  br label %__merge529

__merge529:
  br label %__cond528

__fresh547:
  br label %__post526

__post526:
  br label %__cond534

__cond534:
  %_lhs2925 = load i32* %i2857
  %_lhs2926 = load i32* %mid_slot2850
  %bop2927 = icmp sle i32 %_lhs2925, %_lhs2926
  br i1 %bop2927, label %__body533, label %__post532

__fresh548:
  br label %__body533

__body533:
  %_lhs2928 = load i32* %k2859
  %bound_ptr2930 = getelementptr { i32, [ 0 x i32 ] }** %c2876, i32 0, i32 0
  %bound2931 = load i32* %bound_ptr2930
  call void @oat_array_bounds_check( i32 %bound2931, i32 %_lhs2928 )
  %elt2929 = getelementptr { i32, [ 0 x i32 ] }** %c2876, i32 0, i32 1, i32 %_lhs2928
  %_lhs2932 = load i32* %i2857
  %bound_ptr2934 = getelementptr { i32, [ 0 x i32 ] }** %a_slot2856, i32 0, i32 0
  %bound2935 = load i32* %bound_ptr2934
  call void @oat_array_bounds_check( i32 %bound2935, i32 %_lhs2932 )
  %elt2933 = getelementptr { i32, [ 0 x i32 ] }** %a_slot2856, i32 0, i32 1, i32 %_lhs2932
  %_lhs2936 = load i32* %elt2933
  store i32 %_lhs2936, i32* %elt2929
  %_lhs2937 = load i32* %k2859
  %bop2938 = add i32 %_lhs2937, 1
  store i32 %bop2938, i32* %k2859
  %_lhs2939 = load i32* %i2857
  %bop2940 = add i32 %_lhs2939, 1
  store i32 %bop2940, i32* %i2857
  br label %__cond534

__fresh549:
  br label %__post532

__post532:
  br label %__cond537

__cond537:
  %_lhs2941 = load i32* %j2858
  %_lhs2942 = load i32* %high_slot2852
  %bop2943 = icmp sle i32 %_lhs2941, %_lhs2942
  br i1 %bop2943, label %__body536, label %__post535

__fresh550:
  br label %__body536

__body536:
  %_lhs2944 = load i32* %k2859
  %bound_ptr2946 = getelementptr { i32, [ 0 x i32 ] }** %c2876, i32 0, i32 0
  %bound2947 = load i32* %bound_ptr2946
  call void @oat_array_bounds_check( i32 %bound2947, i32 %_lhs2944 )
  %elt2945 = getelementptr { i32, [ 0 x i32 ] }** %c2876, i32 0, i32 1, i32 %_lhs2944
  %_lhs2948 = load i32* %j2858
  %bound_ptr2950 = getelementptr { i32, [ 0 x i32 ] }** %a_slot2856, i32 0, i32 0
  %bound2951 = load i32* %bound_ptr2950
  call void @oat_array_bounds_check( i32 %bound2951, i32 %_lhs2948 )
  %elt2949 = getelementptr { i32, [ 0 x i32 ] }** %a_slot2856, i32 0, i32 1, i32 %_lhs2948
  %_lhs2952 = load i32* %elt2949
  store i32 %_lhs2952, i32* %elt2945
  %_lhs2953 = load i32* %k2859
  %bop2954 = add i32 %_lhs2953, 1
  store i32 %bop2954, i32* %k2859
  %_lhs2955 = load i32* %j2858
  %bop2956 = add i32 %_lhs2955, 1
  store i32 %bop2956, i32* %j2858
  br label %__cond537

__fresh551:
  br label %__post535

__post535:
  %_lhs2957 = load i32* %low_slot2854
  store i32 %_lhs2957, i32* %i2857
  br label %__cond540

__cond540:
  %_lhs2958 = load i32* %i2857
  %_lhs2959 = load i32* %k2859
  %bop2960 = icmp slt i32 %_lhs2958, %_lhs2959
  br i1 %bop2960, label %__body539, label %__post538

__fresh552:
  br label %__body539

__body539:
  %_lhs2961 = load i32* %i2857
  %bound_ptr2963 = getelementptr { i32, [ 0 x i32 ] }** %a_slot2856, i32 0, i32 0
  %bound2964 = load i32* %bound_ptr2963
  call void @oat_array_bounds_check( i32 %bound2964, i32 %_lhs2961 )
  %elt2962 = getelementptr { i32, [ 0 x i32 ] }** %a_slot2856, i32 0, i32 1, i32 %_lhs2961
  %_lhs2965 = load i32* %i2857
  %bound_ptr2967 = getelementptr { i32, [ 0 x i32 ] }** %c2876, i32 0, i32 0
  %bound2968 = load i32* %bound_ptr2967
  call void @oat_array_bounds_check( i32 %bound2968, i32 %_lhs2965 )
  %elt2966 = getelementptr { i32, [ 0 x i32 ] }** %c2876, i32 0, i32 1, i32 %_lhs2965
  %_lhs2969 = load i32* %elt2966
  store i32 %_lhs2969, i32* %elt2962
  %_lhs2970 = load i32* %i2857
  %bop2971 = add i32 %_lhs2970, 1
  store i32 %bop2971, i32* %i2857
  br label %__cond540

__fresh553:
  br label %__post538

__post538:
  ret void
}


define void @oat_mergesort ({ i32, [ 0 x i32 ] }* %a2828, i32 %low2826, i32 %high2824){

__fresh520:
  %a_slot2829 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %a2828, { i32, [ 0 x i32 ] }** %a_slot2829
  %low_slot2827 = alloca i32
  store i32 %low2826, i32* %low_slot2827
  %high_slot2825 = alloca i32
  store i32 %high2824, i32* %high_slot2825
  %mid2830 = alloca i32
  store i32 0, i32* %mid2830
  %_lhs2831 = load i32* %low_slot2827
  %_lhs2832 = load i32* %high_slot2825
  %bop2833 = icmp slt i32 %_lhs2831, %_lhs2832
  br i1 %bop2833, label %__then519, label %__else518

__fresh521:
  br label %__then519

__then519:
  %_lhs2834 = load i32* %low_slot2827
  %_lhs2835 = load i32* %high_slot2825
  %bop2836 = add i32 %_lhs2834, %_lhs2835
  %bop2837 = ashr i32 %bop2836, 1
  store i32 %bop2837, i32* %mid2830
  %_lhs2840 = load i32* %mid2830
  %_lhs2839 = load i32* %low_slot2827
  %_lhs2838 = load { i32, [ 0 x i32 ] }** %a_slot2829
  call void @oat_mergesort( { i32, [ 0 x i32 ] }* %_lhs2838, i32 %_lhs2839, i32 %_lhs2840 )
  %_lhs2844 = load i32* %high_slot2825
  %_lhs2842 = load i32* %mid2830
  %bop2843 = add i32 %_lhs2842, 1
  %_lhs2841 = load { i32, [ 0 x i32 ] }** %a_slot2829
  call void @oat_mergesort( { i32, [ 0 x i32 ] }* %_lhs2841, i32 %bop2843, i32 %_lhs2844 )
  %_lhs2848 = load i32* %mid2830
  %_lhs2847 = load i32* %high_slot2825
  %_lhs2846 = load i32* %low_slot2827
  %_lhs2845 = load { i32, [ 0 x i32 ] }** %a_slot2829
  call void @merge( { i32, [ 0 x i32 ] }* %_lhs2845, i32 %_lhs2846, i32 %_lhs2847, i32 %_lhs2848 )
  br label %__merge517

__fresh522:
  br label %__else518

__else518:
  br label %__merge517

__merge517:
  ret void
}


define i32 @program (i32 %argc2796, { i32, [ 0 x i8* ] }* %argv2794){

__fresh516:
  %argc_slot2797 = alloca i32
  store i32 %argc2796, i32* %argc_slot2797
  %argv_slot2795 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv2794, { i32, [ 0 x i8* ] }** %argv_slot2795
  %i2798 = alloca i32
  store i32 0, i32* %i2798
  %array_ptr2799 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 10 )
  %array2800 = bitcast { i32, [ 0 x i32 ] }* %array_ptr2799 to { i32, [ 0 x i32 ] }* 
  %index_ptr2801 = getelementptr { i32, [ 0 x i32 ] }* %array2800, i32 0, i32 1, i32 0
  store i32 126, i32* %index_ptr2801
  %index_ptr2802 = getelementptr { i32, [ 0 x i32 ] }* %array2800, i32 0, i32 1, i32 1
  store i32 125, i32* %index_ptr2802
  %index_ptr2803 = getelementptr { i32, [ 0 x i32 ] }* %array2800, i32 0, i32 1, i32 2
  store i32 124, i32* %index_ptr2803
  %index_ptr2804 = getelementptr { i32, [ 0 x i32 ] }* %array2800, i32 0, i32 1, i32 3
  store i32 123, i32* %index_ptr2804
  %index_ptr2805 = getelementptr { i32, [ 0 x i32 ] }* %array2800, i32 0, i32 1, i32 4
  store i32 122, i32* %index_ptr2805
  %index_ptr2806 = getelementptr { i32, [ 0 x i32 ] }* %array2800, i32 0, i32 1, i32 5
  store i32 121, i32* %index_ptr2806
  %index_ptr2807 = getelementptr { i32, [ 0 x i32 ] }* %array2800, i32 0, i32 1, i32 6
  store i32 120, i32* %index_ptr2807
  %index_ptr2808 = getelementptr { i32, [ 0 x i32 ] }* %array2800, i32 0, i32 1, i32 7
  store i32 119, i32* %index_ptr2808
  %index_ptr2809 = getelementptr { i32, [ 0 x i32 ] }* %array2800, i32 0, i32 1, i32 8
  store i32 118, i32* %index_ptr2809
  %index_ptr2810 = getelementptr { i32, [ 0 x i32 ] }* %array2800, i32 0, i32 1, i32 9
  store i32 117, i32* %index_ptr2810
  %a2811 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array2800, { i32, [ 0 x i32 ] }** %a2811
  %_lhs2812 = load { i32, [ 0 x i32 ] }** %a2811
  %ret2813 = call i8* @string_of_array ( { i32, [ 0 x i32 ] }* %_lhs2812 )
  call void @print_string( i8* %ret2813 )
  %_lhs2814 = load { i32, [ 0 x i32 ] }** %a2811
  call void @oat_mergesort( { i32, [ 0 x i32 ] }* %_lhs2814, i32 0, i32 9 )
  %strval2816 = load i8** @_oat_string2815
  call void @print_string( i8* %strval2816 )
  %_lhs2817 = load { i32, [ 0 x i32 ] }** %a2811
  %ret2818 = call i8* @string_of_array ( { i32, [ 0 x i32 ] }* %_lhs2817 )
  call void @print_string( i8* %ret2818 )
  %strval2820 = load i8** @_oat_string2819
  call void @print_string( i8* %strval2820 )
  %_lhs2821 = load i32* %i2798
  ret i32 %_lhs2821
}


