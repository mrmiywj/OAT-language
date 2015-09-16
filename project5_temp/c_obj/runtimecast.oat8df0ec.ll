%Bb = type { %_Bb_vtable*, i8* }
%_Bb_vtable = type { %_A_vtable*, i8* (%Object*)* }
%B = type { %_B_vtable*, i8* }
%_B_vtable = type { %_A_vtable*, i8* (%Object*)* }
%A = type { %_A_vtable*, i8* }
%_A_vtable = type { %_Object_vtable*, i8* (%Object*)* }
%Object = type { %_Object_vtable*, i8* }
%_Object_vtable = type { {  }*, i8* (%Object*)* }
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
declare void @oat_abort(i32)
declare void @print_bool(i1)
declare void @print_int(i32)
declare void @print_string(i8*)
declare i32 @length_of_string(i8*)
declare i8* @string_cat(i8*, i8*)
declare i8* @string_of_int(i32)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
@bb536 = global %Object* zeroinitializer, align 4		; initialized by @bb536.init537
@b534 = global %Object* zeroinitializer, align 4		; initialized by @b534.init535
@a532 = global %Object* zeroinitializer, align 4		; initialized by @a532.init533
@_const_str531.str. = private unnamed_addr constant [ 3 x i8 ] c "Bb\00", align 4
@_const_str531 = alias bitcast([ 3 x i8 ]* @_const_str531.str. to i8*)@_const_str530.str. = private unnamed_addr constant [ 2 x i8 ] c "B\00", align 4
@_const_str530 = alias bitcast([ 2 x i8 ]* @_const_str530.str. to i8*)@_const_str529.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str529 = alias bitcast([ 2 x i8 ]* @_const_str529.str. to i8*)@_const_str528.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str528 = alias bitcast([ 7 x i8 ]* @_const_str528.str. to i8*)@_Bb_vtable527 = private constant %_Bb_vtable {%_A_vtable* @_A_vtable525, i8* (%Object*)* @_Object_get_name}, align 4
@_B_vtable526 = private constant %_B_vtable {%_A_vtable* @_A_vtable525, i8* (%Object*)* @_Object_get_name}, align 4
@_A_vtable525 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable524, i8* (%Object*)* @_Object_get_name}, align 4
@_Object_vtable524 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh900:
  call void @a532.init533(  )
  call void @b534.init535(  )
  call void @bb536.init537(  )
  ret void
}


define i32 @program (i32 %argc2957, { i32, [ 0 x i8* ] }* %argv2955){
__fresh863:
  %argc_slot2958 = alloca i32
  store i32 %argc2957, i32* %argc_slot2958
  %argv_slot2956 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv2955, { i32, [ 0 x i8* ] }** %argv_slot2956
  %vdecl_slot2959 = alloca i32
  store i32 0, i32* %vdecl_slot2959
  %lhs_or_call2960 = load %Object** @a532
  %cast_op2961 = bitcast %Object* %lhs_or_call2960 to %A* 
  %cast_op2962 = bitcast %A* %cast_op2961 to i8** 
  %cast_op2963 = bitcast %_A_vtable* @_A_vtable525 to i8* 
  %vt_ptr_slot2964 = alloca i8*
  %tmp02966 = load i8** %cast_op2962
  store i8* %tmp02966, i8** %vt_ptr_slot2964
  br label %__loop814

__loop814:
  %tmp12967 = load i8** %vt_ptr_slot2964
  %guard12971 = icmp eq i8* %tmp12967, %cast_op2963
  br i1 %guard12971, label %__then811, label %__fall1813

__fresh864:
  br label %__fall1813

__fall1813:
  %guard22972 = icmp eq i8* %tmp12967, null
  br i1 %guard22972, label %__else810, label %__fall2812

__fresh865:
  br label %__fall2812

__fall2812:
  %tmp22968 = load i8** %vt_ptr_slot2964
  %tmp32969 = bitcast i8* %tmp22968 to i8** 
  %tmp42970 = load i8** %tmp32969
  store i8* %tmp42970, i8** %vt_ptr_slot2964
  br label %__loop814

__fresh866:
  br label %__then811

__then811:
  %var_slot2965 = alloca %A*
  store %A* %cast_op2961, %A** %var_slot2965
  %lhs_or_call2973 = load i32* %vdecl_slot2959
  %bop2974 = add i32 %lhs_or_call2973, 1
  store i32 %bop2974, i32* %vdecl_slot2959
  br label %__done809

__fresh867:
  br label %__else810

__else810:
  br label %__done809

__done809:
  %lhs_or_call2975 = load %Object** @b534
  %cast_op2976 = bitcast %Object* %lhs_or_call2975 to %A* 
  %cast_op2977 = bitcast %A* %cast_op2976 to i8** 
  %cast_op2978 = bitcast %_A_vtable* @_A_vtable525 to i8* 
  %vt_ptr_slot2979 = alloca i8*
  %tmp02981 = load i8** %cast_op2977
  store i8* %tmp02981, i8** %vt_ptr_slot2979
  br label %__loop820

__loop820:
  %tmp12982 = load i8** %vt_ptr_slot2979
  %guard12986 = icmp eq i8* %tmp12982, %cast_op2978
  br i1 %guard12986, label %__then817, label %__fall1819

__fresh868:
  br label %__fall1819

__fall1819:
  %guard22987 = icmp eq i8* %tmp12982, null
  br i1 %guard22987, label %__else816, label %__fall2818

__fresh869:
  br label %__fall2818

__fall2818:
  %tmp22983 = load i8** %vt_ptr_slot2979
  %tmp32984 = bitcast i8* %tmp22983 to i8** 
  %tmp42985 = load i8** %tmp32984
  store i8* %tmp42985, i8** %vt_ptr_slot2979
  br label %__loop820

__fresh870:
  br label %__then817

__then817:
  %var_slot2980 = alloca %A*
  store %A* %cast_op2976, %A** %var_slot2980
  %lhs_or_call2988 = load i32* %vdecl_slot2959
  %bop2989 = add i32 %lhs_or_call2988, 1
  store i32 %bop2989, i32* %vdecl_slot2959
  br label %__done815

__fresh871:
  br label %__else816

__else816:
  br label %__done815

__done815:
  %lhs_or_call2990 = load %Object** @bb536
  %cast_op2991 = bitcast %Object* %lhs_or_call2990 to %A* 
  %cast_op2992 = bitcast %A* %cast_op2991 to i8** 
  %cast_op2993 = bitcast %_A_vtable* @_A_vtable525 to i8* 
  %vt_ptr_slot2994 = alloca i8*
  %tmp02996 = load i8** %cast_op2992
  store i8* %tmp02996, i8** %vt_ptr_slot2994
  br label %__loop826

__loop826:
  %tmp12997 = load i8** %vt_ptr_slot2994
  %guard13001 = icmp eq i8* %tmp12997, %cast_op2993
  br i1 %guard13001, label %__then823, label %__fall1825

__fresh872:
  br label %__fall1825

__fall1825:
  %guard23002 = icmp eq i8* %tmp12997, null
  br i1 %guard23002, label %__else822, label %__fall2824

__fresh873:
  br label %__fall2824

__fall2824:
  %tmp22998 = load i8** %vt_ptr_slot2994
  %tmp32999 = bitcast i8* %tmp22998 to i8** 
  %tmp43000 = load i8** %tmp32999
  store i8* %tmp43000, i8** %vt_ptr_slot2994
  br label %__loop826

__fresh874:
  br label %__then823

__then823:
  %var_slot2995 = alloca %A*
  store %A* %cast_op2991, %A** %var_slot2995
  %lhs_or_call3003 = load i32* %vdecl_slot2959
  %bop3004 = add i32 %lhs_or_call3003, 1
  store i32 %bop3004, i32* %vdecl_slot2959
  br label %__done821

__fresh875:
  br label %__else822

__else822:
  br label %__done821

__done821:
  %lhs_or_call3005 = load %Object** @b534
  %cast_op3006 = bitcast %Object* %lhs_or_call3005 to %B* 
  %cast_op3007 = bitcast %B* %cast_op3006 to i8** 
  %cast_op3008 = bitcast %_B_vtable* @_B_vtable526 to i8* 
  %vt_ptr_slot3009 = alloca i8*
  %tmp03011 = load i8** %cast_op3007
  store i8* %tmp03011, i8** %vt_ptr_slot3009
  br label %__loop832

__loop832:
  %tmp13012 = load i8** %vt_ptr_slot3009
  %guard13016 = icmp eq i8* %tmp13012, %cast_op3008
  br i1 %guard13016, label %__then829, label %__fall1831

__fresh876:
  br label %__fall1831

__fall1831:
  %guard23017 = icmp eq i8* %tmp13012, null
  br i1 %guard23017, label %__else828, label %__fall2830

__fresh877:
  br label %__fall2830

__fall2830:
  %tmp23013 = load i8** %vt_ptr_slot3009
  %tmp33014 = bitcast i8* %tmp23013 to i8** 
  %tmp43015 = load i8** %tmp33014
  store i8* %tmp43015, i8** %vt_ptr_slot3009
  br label %__loop832

__fresh878:
  br label %__then829

__then829:
  %var_slot3010 = alloca %B*
  store %B* %cast_op3006, %B** %var_slot3010
  %lhs_or_call3018 = load i32* %vdecl_slot2959
  %bop3019 = add i32 %lhs_or_call3018, 1
  store i32 %bop3019, i32* %vdecl_slot2959
  br label %__done827

__fresh879:
  br label %__else828

__else828:
  br label %__done827

__done827:
  %lhs_or_call3020 = load %Object** @bb536
  %cast_op3021 = bitcast %Object* %lhs_or_call3020 to %Bb* 
  %cast_op3022 = bitcast %Bb* %cast_op3021 to i8** 
  %cast_op3023 = bitcast %_Bb_vtable* @_Bb_vtable527 to i8* 
  %vt_ptr_slot3024 = alloca i8*
  %tmp03026 = load i8** %cast_op3022
  store i8* %tmp03026, i8** %vt_ptr_slot3024
  br label %__loop838

__loop838:
  %tmp13027 = load i8** %vt_ptr_slot3024
  %guard13031 = icmp eq i8* %tmp13027, %cast_op3023
  br i1 %guard13031, label %__then835, label %__fall1837

__fresh880:
  br label %__fall1837

__fall1837:
  %guard23032 = icmp eq i8* %tmp13027, null
  br i1 %guard23032, label %__else834, label %__fall2836

__fresh881:
  br label %__fall2836

__fall2836:
  %tmp23028 = load i8** %vt_ptr_slot3024
  %tmp33029 = bitcast i8* %tmp23028 to i8** 
  %tmp43030 = load i8** %tmp33029
  store i8* %tmp43030, i8** %vt_ptr_slot3024
  br label %__loop838

__fresh882:
  br label %__then835

__then835:
  %var_slot3025 = alloca %Bb*
  store %Bb* %cast_op3021, %Bb** %var_slot3025
  %lhs_or_call3033 = load i32* %vdecl_slot2959
  %bop3034 = add i32 %lhs_or_call3033, 1
  store i32 %bop3034, i32* %vdecl_slot2959
  br label %__done833

__fresh883:
  br label %__else834

__else834:
  br label %__done833

__done833:
  %lhs_or_call3035 = load %Object** @a532
  %cast_op3036 = bitcast %Object* %lhs_or_call3035 to %B* 
  %cast_op3037 = bitcast %B* %cast_op3036 to i8** 
  %cast_op3038 = bitcast %_B_vtable* @_B_vtable526 to i8* 
  %vt_ptr_slot3039 = alloca i8*
  %tmp03041 = load i8** %cast_op3037
  store i8* %tmp03041, i8** %vt_ptr_slot3039
  br label %__loop844

__loop844:
  %tmp13042 = load i8** %vt_ptr_slot3039
  %guard13046 = icmp eq i8* %tmp13042, %cast_op3038
  br i1 %guard13046, label %__then841, label %__fall1843

__fresh884:
  br label %__fall1843

__fall1843:
  %guard23047 = icmp eq i8* %tmp13042, null
  br i1 %guard23047, label %__else840, label %__fall2842

__fresh885:
  br label %__fall2842

__fall2842:
  %tmp23043 = load i8** %vt_ptr_slot3039
  %tmp33044 = bitcast i8* %tmp23043 to i8** 
  %tmp43045 = load i8** %tmp33044
  store i8* %tmp43045, i8** %vt_ptr_slot3039
  br label %__loop844

__fresh886:
  br label %__then841

__then841:
  %var_slot3040 = alloca %B*
  store %B* %cast_op3036, %B** %var_slot3040
  br label %__done839

__fresh887:
  br label %__else840

__else840:
  %lhs_or_call3048 = load i32* %vdecl_slot2959
  %bop3049 = add i32 %lhs_or_call3048, 1
  store i32 %bop3049, i32* %vdecl_slot2959
  br label %__done839

__done839:
  %lhs_or_call3050 = load %Object** @a532
  %cast_op3051 = bitcast %Object* %lhs_or_call3050 to %Bb* 
  %cast_op3052 = bitcast %Bb* %cast_op3051 to i8** 
  %cast_op3053 = bitcast %_Bb_vtable* @_Bb_vtable527 to i8* 
  %vt_ptr_slot3054 = alloca i8*
  %tmp03056 = load i8** %cast_op3052
  store i8* %tmp03056, i8** %vt_ptr_slot3054
  br label %__loop850

__loop850:
  %tmp13057 = load i8** %vt_ptr_slot3054
  %guard13061 = icmp eq i8* %tmp13057, %cast_op3053
  br i1 %guard13061, label %__then847, label %__fall1849

__fresh888:
  br label %__fall1849

__fall1849:
  %guard23062 = icmp eq i8* %tmp13057, null
  br i1 %guard23062, label %__else846, label %__fall2848

__fresh889:
  br label %__fall2848

__fall2848:
  %tmp23058 = load i8** %vt_ptr_slot3054
  %tmp33059 = bitcast i8* %tmp23058 to i8** 
  %tmp43060 = load i8** %tmp33059
  store i8* %tmp43060, i8** %vt_ptr_slot3054
  br label %__loop850

__fresh890:
  br label %__then847

__then847:
  %var_slot3055 = alloca %Bb*
  store %Bb* %cast_op3051, %Bb** %var_slot3055
  br label %__done845

__fresh891:
  br label %__else846

__else846:
  %lhs_or_call3063 = load i32* %vdecl_slot2959
  %bop3064 = add i32 %lhs_or_call3063, 1
  store i32 %bop3064, i32* %vdecl_slot2959
  br label %__done845

__done845:
  %lhs_or_call3065 = load %Object** @b534
  %cast_op3066 = bitcast %Object* %lhs_or_call3065 to %Bb* 
  %cast_op3067 = bitcast %Bb* %cast_op3066 to i8** 
  %cast_op3068 = bitcast %_Bb_vtable* @_Bb_vtable527 to i8* 
  %vt_ptr_slot3069 = alloca i8*
  %tmp03071 = load i8** %cast_op3067
  store i8* %tmp03071, i8** %vt_ptr_slot3069
  br label %__loop856

__loop856:
  %tmp13072 = load i8** %vt_ptr_slot3069
  %guard13076 = icmp eq i8* %tmp13072, %cast_op3068
  br i1 %guard13076, label %__then853, label %__fall1855

__fresh892:
  br label %__fall1855

__fall1855:
  %guard23077 = icmp eq i8* %tmp13072, null
  br i1 %guard23077, label %__else852, label %__fall2854

__fresh893:
  br label %__fall2854

__fall2854:
  %tmp23073 = load i8** %vt_ptr_slot3069
  %tmp33074 = bitcast i8* %tmp23073 to i8** 
  %tmp43075 = load i8** %tmp33074
  store i8* %tmp43075, i8** %vt_ptr_slot3069
  br label %__loop856

__fresh894:
  br label %__then853

__then853:
  %var_slot3070 = alloca %Bb*
  store %Bb* %cast_op3066, %Bb** %var_slot3070
  br label %__done851

__fresh895:
  br label %__else852

__else852:
  %lhs_or_call3078 = load i32* %vdecl_slot2959
  %bop3079 = add i32 %lhs_or_call3078, 1
  store i32 %bop3079, i32* %vdecl_slot2959
  br label %__done851

__done851:
  %lhs_or_call3080 = load %Object** @bb536
  %cast_op3081 = bitcast %Object* %lhs_or_call3080 to %B* 
  %cast_op3082 = bitcast %B* %cast_op3081 to i8** 
  %cast_op3083 = bitcast %_B_vtable* @_B_vtable526 to i8* 
  %vt_ptr_slot3084 = alloca i8*
  %tmp03086 = load i8** %cast_op3082
  store i8* %tmp03086, i8** %vt_ptr_slot3084
  br label %__loop862

__loop862:
  %tmp13087 = load i8** %vt_ptr_slot3084
  %guard13091 = icmp eq i8* %tmp13087, %cast_op3083
  br i1 %guard13091, label %__then859, label %__fall1861

__fresh896:
  br label %__fall1861

__fall1861:
  %guard23092 = icmp eq i8* %tmp13087, null
  br i1 %guard23092, label %__else858, label %__fall2860

__fresh897:
  br label %__fall2860

__fall2860:
  %tmp23088 = load i8** %vt_ptr_slot3084
  %tmp33089 = bitcast i8* %tmp23088 to i8** 
  %tmp43090 = load i8** %tmp33089
  store i8* %tmp43090, i8** %vt_ptr_slot3084
  br label %__loop862

__fresh898:
  br label %__then859

__then859:
  %var_slot3085 = alloca %B*
  store %B* %cast_op3081, %B** %var_slot3085
  br label %__done857

__fresh899:
  br label %__else858

__else858:
  %lhs_or_call3093 = load i32* %vdecl_slot2959
  %bop3094 = add i32 %lhs_or_call3093, 1
  store i32 %bop3094, i32* %vdecl_slot2959
  br label %__done857

__done857:
  %lhs_or_call3095 = load i32* %vdecl_slot2959
  ret i32 %lhs_or_call3095
}


define void @bb536.init537 (){
__fresh808:
  %mem_ptr2951 = call i32* @oat_malloc ( i32 8 )
  %obj2952 = bitcast i32* %mem_ptr2951 to %Bb* 
  %new_obj2953 = call %Bb* @_Bb_ctor ( %Bb* %obj2952 )
  %cast_op2954 = bitcast %Bb* %new_obj2953 to %Object* 
  store %Object* %cast_op2954, %Object** @bb536
  ret void
}


define void @b534.init535 (){
__fresh807:
  %mem_ptr2947 = call i32* @oat_malloc ( i32 8 )
  %obj2948 = bitcast i32* %mem_ptr2947 to %B* 
  %new_obj2949 = call %B* @_B_ctor ( %B* %obj2948 )
  %cast_op2950 = bitcast %B* %new_obj2949 to %Object* 
  store %Object* %cast_op2950, %Object** @b534
  ret void
}


define void @a532.init533 (){
__fresh806:
  %mem_ptr2943 = call i32* @oat_malloc ( i32 8 )
  %obj2944 = bitcast i32* %mem_ptr2943 to %A* 
  %new_obj2945 = call %A* @_A_ctor ( %A* %obj2944 )
  %cast_op2946 = bitcast %A* %new_obj2945 to %Object* 
  store %Object* %cast_op2946, %Object** @a532
  ret void
}


define %Bb* @_Bb_ctor (%Bb* %_this1){
__fresh805:
  %cast_op2939 = bitcast %Bb* %_this1 to %A* 
  %dummy2940 = call %A* @_A_ctor ( %A* %cast_op2939 )
  %path2941 = getelementptr %Bb* %_this1, i32 0, i32 1
  store i8* @_const_str531, i8** %path2941
  %vt_slot2942 = getelementptr %Bb* %_this1, i32 0, i32 0
  store %_Bb_vtable* @_Bb_vtable527, %_Bb_vtable** %vt_slot2942
  ret %Bb* %_this1
}


define %B* @_B_ctor (%B* %_this1){
__fresh804:
  %cast_op2935 = bitcast %B* %_this1 to %A* 
  %dummy2936 = call %A* @_A_ctor ( %A* %cast_op2935 )
  %path2937 = getelementptr %B* %_this1, i32 0, i32 1
  store i8* @_const_str530, i8** %path2937
  %vt_slot2938 = getelementptr %B* %_this1, i32 0, i32 0
  store %_B_vtable* @_B_vtable526, %_B_vtable** %vt_slot2938
  ret %B* %_this1
}


define %A* @_A_ctor (%A* %_this1){
__fresh803:
  %cast_op2931 = bitcast %A* %_this1 to %Object* 
  %dummy2932 = call %Object* @_Object_ctor ( %Object* %cast_op2931 )
  %path2933 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str529, i8** %path2933
  %vt_slot2934 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable525, %_A_vtable** %vt_slot2934
  ret %A* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh802:
  %path2929 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call2930 = load i8** %path2929
  ret i8* %lhs_or_call2930
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh801:
  %path2927 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str528, i8** %path2927
  %vt_slot2928 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable524, %_Object_vtable** %vt_slot2928
  ret %Object* %_this1
}


