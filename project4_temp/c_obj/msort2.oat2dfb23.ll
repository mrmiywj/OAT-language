declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@_oat_string2997.str. = private unnamed_addr constant [ 2 x i8 ] c " \00", align 4
@_oat_string2997 = global i8* getelementptr inbounds ([ 2 x i8 ]* @_oat_string2997.str., i32 0, i32 0), align 4
@_oat_string2993.str. = private unnamed_addr constant [ 2 x i8 ] c " \00", align 4
@_oat_string2993 = global i8* getelementptr inbounds ([ 2 x i8 ]* @_oat_string2993.str., i32 0, i32 0), align 4
@a2984 = global { i32, [ 0 x i32 ] }* zeroinitializer, align 4		; initialized by a2984.init
define void @oat_init (){

__fresh594:
  call void @a2984.init(  )
  ret void
}


define void @merge ({ i32, [ 0 x i32 ] }* %a3033, i32 %low3031, i32 %high3029, i32 %mid3027){

__fresh581:
  %a_slot3034 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %a3033, { i32, [ 0 x i32 ] }** %a_slot3034
  %low_slot3032 = alloca i32
  store i32 %low3031, i32* %low_slot3032
  %high_slot3030 = alloca i32
  store i32 %high3029, i32* %high_slot3030
  %mid_slot3028 = alloca i32
  store i32 %mid3027, i32* %mid_slot3028
  %i3035 = alloca i32
  store i32 0, i32* %i3035
  %j3036 = alloca i32
  store i32 0, i32* %j3036
  %k3037 = alloca i32
  store i32 0, i32* %k3037
  %array_ptr3038 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 50 )
  %array3039 = bitcast { i32, [ 0 x i32 ] }* %array_ptr3038 to { i32, [ 0 x i32 ] }* 
  %_tmp30393041 = alloca i32
  store i32 50, i32* %_tmp30393041
  %_tmp30413043 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array3039, { i32, [ 0 x i32 ] }** %_tmp30413043
  %i3044 = alloca i32
  store i32 0, i32* %i3044
  br label %__cond565

__cond565:
  %_lhs3045 = load i32* %i3044
  %_lhs3046 = load i32* %_tmp30393041
  %bop3047 = icmp slt i32 %_lhs3045, %_lhs3046
  br i1 %bop3047, label %__body564, label %__post563

__fresh582:
  br label %__body564

__body564:
  %_lhs3048 = load i32* %i3044
  %bound_ptr3050 = getelementptr { i32, [ 0 x i32 ] }** %_tmp30413043, i32 0, i32 0
  %bound3051 = load i32* %bound_ptr3050
  call void @oat_array_bounds_check( i32 %bound3051, i32 %_lhs3048 )
  %elt3049 = getelementptr { i32, [ 0 x i32 ] }** %_tmp30413043, i32 0, i32 1, i32 %_lhs3048
  store i32 0, i32* %elt3049
  %_lhs3052 = load i32* %i3044
  %bop3053 = add i32 %_lhs3052, 1
  store i32 %bop3053, i32* %i3044
  br label %__cond565

__fresh583:
  br label %__post563

__post563:
  %c3054 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array3039, { i32, [ 0 x i32 ] }** %c3054
  %_lhs3055 = load i32* %low_slot3032
  store i32 %_lhs3055, i32* %i3035
  %_lhs3056 = load i32* %mid_slot3028
  %bop3057 = add i32 %_lhs3056, 1
  store i32 %bop3057, i32* %j3036
  %_lhs3058 = load i32* %low_slot3032
  store i32 %_lhs3058, i32* %k3037
  br label %__cond568

__cond568:
  %_lhs3059 = load i32* %i3035
  %_lhs3060 = load i32* %mid_slot3028
  %bop3061 = icmp sle i32 %_lhs3059, %_lhs3060
  %_lhs3062 = load i32* %j3036
  %_lhs3063 = load i32* %high_slot3030
  %bop3064 = icmp sle i32 %_lhs3062, %_lhs3063
  %bop3065 = and i1 %bop3061, %bop3064
  br i1 %bop3065, label %__body567, label %__post566

__fresh584:
  br label %__body567

__body567:
  %_lhs3066 = load i32* %i3035
  %bound_ptr3068 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3034, i32 0, i32 0
  %bound3069 = load i32* %bound_ptr3068
  call void @oat_array_bounds_check( i32 %bound3069, i32 %_lhs3066 )
  %elt3067 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3034, i32 0, i32 1, i32 %_lhs3066
  %_lhs3070 = load i32* %elt3067
  %_lhs3071 = load i32* %j3036
  %bound_ptr3073 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3034, i32 0, i32 0
  %bound3074 = load i32* %bound_ptr3073
  call void @oat_array_bounds_check( i32 %bound3074, i32 %_lhs3071 )
  %elt3072 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3034, i32 0, i32 1, i32 %_lhs3071
  %_lhs3075 = load i32* %elt3072
  %bop3076 = icmp slt i32 %_lhs3070, %_lhs3075
  br i1 %bop3076, label %__then571, label %__else570

__fresh585:
  br label %__then571

__then571:
  %_lhs3077 = load i32* %k3037
  %bound_ptr3079 = getelementptr { i32, [ 0 x i32 ] }** %c3054, i32 0, i32 0
  %bound3080 = load i32* %bound_ptr3079
  call void @oat_array_bounds_check( i32 %bound3080, i32 %_lhs3077 )
  %elt3078 = getelementptr { i32, [ 0 x i32 ] }** %c3054, i32 0, i32 1, i32 %_lhs3077
  %_lhs3081 = load i32* %i3035
  %bound_ptr3083 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3034, i32 0, i32 0
  %bound3084 = load i32* %bound_ptr3083
  call void @oat_array_bounds_check( i32 %bound3084, i32 %_lhs3081 )
  %elt3082 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3034, i32 0, i32 1, i32 %_lhs3081
  %_lhs3085 = load i32* %elt3082
  store i32 %_lhs3085, i32* %elt3078
  %_lhs3086 = load i32* %k3037
  %bop3087 = add i32 %_lhs3086, 1
  store i32 %bop3087, i32* %k3037
  %_lhs3088 = load i32* %i3035
  %bop3089 = add i32 %_lhs3088, 1
  store i32 %bop3089, i32* %i3035
  br label %__merge569

__fresh586:
  br label %__else570

__else570:
  %_lhs3090 = load i32* %k3037
  %bound_ptr3092 = getelementptr { i32, [ 0 x i32 ] }** %c3054, i32 0, i32 0
  %bound3093 = load i32* %bound_ptr3092
  call void @oat_array_bounds_check( i32 %bound3093, i32 %_lhs3090 )
  %elt3091 = getelementptr { i32, [ 0 x i32 ] }** %c3054, i32 0, i32 1, i32 %_lhs3090
  %_lhs3094 = load i32* %j3036
  %bound_ptr3096 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3034, i32 0, i32 0
  %bound3097 = load i32* %bound_ptr3096
  call void @oat_array_bounds_check( i32 %bound3097, i32 %_lhs3094 )
  %elt3095 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3034, i32 0, i32 1, i32 %_lhs3094
  %_lhs3098 = load i32* %elt3095
  store i32 %_lhs3098, i32* %elt3091
  %_lhs3099 = load i32* %k3037
  %bop3100 = add i32 %_lhs3099, 1
  store i32 %bop3100, i32* %k3037
  %_lhs3101 = load i32* %j3036
  %bop3102 = add i32 %_lhs3101, 1
  store i32 %bop3102, i32* %j3036
  br label %__merge569

__merge569:
  br label %__cond568

__fresh587:
  br label %__post566

__post566:
  br label %__cond574

__cond574:
  %_lhs3103 = load i32* %i3035
  %_lhs3104 = load i32* %mid_slot3028
  %bop3105 = icmp sle i32 %_lhs3103, %_lhs3104
  br i1 %bop3105, label %__body573, label %__post572

__fresh588:
  br label %__body573

__body573:
  %_lhs3106 = load i32* %k3037
  %bound_ptr3108 = getelementptr { i32, [ 0 x i32 ] }** %c3054, i32 0, i32 0
  %bound3109 = load i32* %bound_ptr3108
  call void @oat_array_bounds_check( i32 %bound3109, i32 %_lhs3106 )
  %elt3107 = getelementptr { i32, [ 0 x i32 ] }** %c3054, i32 0, i32 1, i32 %_lhs3106
  %_lhs3110 = load i32* %i3035
  %bound_ptr3112 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3034, i32 0, i32 0
  %bound3113 = load i32* %bound_ptr3112
  call void @oat_array_bounds_check( i32 %bound3113, i32 %_lhs3110 )
  %elt3111 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3034, i32 0, i32 1, i32 %_lhs3110
  %_lhs3114 = load i32* %elt3111
  store i32 %_lhs3114, i32* %elt3107
  %_lhs3115 = load i32* %k3037
  %bop3116 = add i32 %_lhs3115, 1
  store i32 %bop3116, i32* %k3037
  %_lhs3117 = load i32* %i3035
  %bop3118 = add i32 %_lhs3117, 1
  store i32 %bop3118, i32* %i3035
  br label %__cond574

__fresh589:
  br label %__post572

__post572:
  br label %__cond577

__cond577:
  %_lhs3119 = load i32* %j3036
  %_lhs3120 = load i32* %high_slot3030
  %bop3121 = icmp sle i32 %_lhs3119, %_lhs3120
  br i1 %bop3121, label %__body576, label %__post575

__fresh590:
  br label %__body576

__body576:
  %_lhs3122 = load i32* %k3037
  %bound_ptr3124 = getelementptr { i32, [ 0 x i32 ] }** %c3054, i32 0, i32 0
  %bound3125 = load i32* %bound_ptr3124
  call void @oat_array_bounds_check( i32 %bound3125, i32 %_lhs3122 )
  %elt3123 = getelementptr { i32, [ 0 x i32 ] }** %c3054, i32 0, i32 1, i32 %_lhs3122
  %_lhs3126 = load i32* %j3036
  %bound_ptr3128 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3034, i32 0, i32 0
  %bound3129 = load i32* %bound_ptr3128
  call void @oat_array_bounds_check( i32 %bound3129, i32 %_lhs3126 )
  %elt3127 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3034, i32 0, i32 1, i32 %_lhs3126
  %_lhs3130 = load i32* %elt3127
  store i32 %_lhs3130, i32* %elt3123
  %_lhs3131 = load i32* %k3037
  %bop3132 = add i32 %_lhs3131, 1
  store i32 %bop3132, i32* %k3037
  %_lhs3133 = load i32* %j3036
  %bop3134 = add i32 %_lhs3133, 1
  store i32 %bop3134, i32* %j3036
  br label %__cond577

__fresh591:
  br label %__post575

__post575:
  %_lhs3135 = load i32* %low_slot3032
  store i32 %_lhs3135, i32* %i3035
  br label %__cond580

__cond580:
  %_lhs3136 = load i32* %i3035
  %_lhs3137 = load i32* %k3037
  %bop3138 = icmp slt i32 %_lhs3136, %_lhs3137
  br i1 %bop3138, label %__body579, label %__post578

__fresh592:
  br label %__body579

__body579:
  %_lhs3139 = load i32* %i3035
  %bound_ptr3141 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3034, i32 0, i32 0
  %bound3142 = load i32* %bound_ptr3141
  call void @oat_array_bounds_check( i32 %bound3142, i32 %_lhs3139 )
  %elt3140 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3034, i32 0, i32 1, i32 %_lhs3139
  %_lhs3143 = load i32* %i3035
  %bound_ptr3145 = getelementptr { i32, [ 0 x i32 ] }** %c3054, i32 0, i32 0
  %bound3146 = load i32* %bound_ptr3145
  call void @oat_array_bounds_check( i32 %bound3146, i32 %_lhs3143 )
  %elt3144 = getelementptr { i32, [ 0 x i32 ] }** %c3054, i32 0, i32 1, i32 %_lhs3143
  %_lhs3147 = load i32* %elt3144
  store i32 %_lhs3147, i32* %elt3140
  %_lhs3148 = load i32* %i3035
  %bop3149 = add i32 %_lhs3148, 1
  store i32 %bop3149, i32* %i3035
  br label %__cond580

__fresh593:
  br label %__post578

__post578:
  ret void
}


define void @oat_mergesort ({ i32, [ 0 x i32 ] }* %a3006, i32 %low3004, i32 %high3002){

__fresh560:
  %a_slot3007 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %a3006, { i32, [ 0 x i32 ] }** %a_slot3007
  %low_slot3005 = alloca i32
  store i32 %low3004, i32* %low_slot3005
  %high_slot3003 = alloca i32
  store i32 %high3002, i32* %high_slot3003
  %mid3008 = alloca i32
  store i32 0, i32* %mid3008
  %_lhs3009 = load i32* %low_slot3005
  %_lhs3010 = load i32* %high_slot3003
  %bop3011 = icmp slt i32 %_lhs3009, %_lhs3010
  br i1 %bop3011, label %__then559, label %__else558

__fresh561:
  br label %__then559

__then559:
  %_lhs3012 = load i32* %low_slot3005
  %_lhs3013 = load i32* %high_slot3003
  %bop3014 = add i32 %_lhs3012, %_lhs3013
  %bop3015 = ashr i32 %bop3014, 1
  store i32 %bop3015, i32* %mid3008
  %_lhs3018 = load i32* %mid3008
  %_lhs3017 = load i32* %low_slot3005
  %_lhs3016 = load { i32, [ 0 x i32 ] }** %a_slot3007
  call void @oat_mergesort( { i32, [ 0 x i32 ] }* %_lhs3016, i32 %_lhs3017, i32 %_lhs3018 )
  %_lhs3022 = load i32* %high_slot3003
  %_lhs3020 = load i32* %mid3008
  %bop3021 = add i32 %_lhs3020, 1
  %_lhs3019 = load { i32, [ 0 x i32 ] }** %a_slot3007
  call void @oat_mergesort( { i32, [ 0 x i32 ] }* %_lhs3019, i32 %bop3021, i32 %_lhs3022 )
  %_lhs3026 = load i32* %mid3008
  %_lhs3025 = load i32* %high_slot3003
  %_lhs3024 = load i32* %low_slot3005
  %_lhs3023 = load { i32, [ 0 x i32 ] }** %a_slot3007
  call void @merge( { i32, [ 0 x i32 ] }* %_lhs3023, i32 %_lhs3024, i32 %_lhs3025, i32 %_lhs3026 )
  br label %__merge557

__fresh562:
  br label %__else558

__else558:
  br label %__merge557

__merge557:
  ret void
}


define i32 @program (i32 %argc2987, { i32, [ 0 x i8* ] }* %argv2985){

__fresh556:
  %argc_slot2988 = alloca i32
  store i32 %argc2987, i32* %argc_slot2988
  %argv_slot2986 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv2985, { i32, [ 0 x i8* ] }** %argv_slot2986
  %i2989 = alloca i32
  store i32 0, i32* %i2989
  %_lhs2990 = load { i32, [ 0 x i32 ] }** @a2984
  %ret2991 = call i8* @string_of_array ( { i32, [ 0 x i32 ] }* %_lhs2990 )
  call void @print_string( i8* %ret2991 )
  %_lhs2992 = load { i32, [ 0 x i32 ] }** @a2984
  call void @oat_mergesort( { i32, [ 0 x i32 ] }* %_lhs2992, i32 0, i32 9 )
  %strval2994 = load i8** @_oat_string2993
  call void @print_string( i8* %strval2994 )
  %_lhs2995 = load { i32, [ 0 x i32 ] }** @a2984
  %ret2996 = call i8* @string_of_array ( { i32, [ 0 x i32 ] }* %_lhs2995 )
  call void @print_string( i8* %ret2996 )
  %strval2998 = load i8** @_oat_string2997
  call void @print_string( i8* %strval2998 )
  %_lhs2999 = load i32* %i2989
  ret i32 %_lhs2999
}


define void @a2984.init (){

__fresh555:
  %array_ptr2972 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 10 )
  %array2973 = bitcast { i32, [ 0 x i32 ] }* %array_ptr2972 to { i32, [ 0 x i32 ] }* 
  %index_ptr2974 = getelementptr { i32, [ 0 x i32 ] }* %array2973, i32 0, i32 1, i32 0
  store i32 126, i32* %index_ptr2974
  %index_ptr2975 = getelementptr { i32, [ 0 x i32 ] }* %array2973, i32 0, i32 1, i32 1
  store i32 125, i32* %index_ptr2975
  %index_ptr2976 = getelementptr { i32, [ 0 x i32 ] }* %array2973, i32 0, i32 1, i32 2
  store i32 124, i32* %index_ptr2976
  %index_ptr2977 = getelementptr { i32, [ 0 x i32 ] }* %array2973, i32 0, i32 1, i32 3
  store i32 123, i32* %index_ptr2977
  %index_ptr2978 = getelementptr { i32, [ 0 x i32 ] }* %array2973, i32 0, i32 1, i32 4
  store i32 122, i32* %index_ptr2978
  %index_ptr2979 = getelementptr { i32, [ 0 x i32 ] }* %array2973, i32 0, i32 1, i32 5
  store i32 121, i32* %index_ptr2979
  %index_ptr2980 = getelementptr { i32, [ 0 x i32 ] }* %array2973, i32 0, i32 1, i32 6
  store i32 120, i32* %index_ptr2980
  %index_ptr2981 = getelementptr { i32, [ 0 x i32 ] }* %array2973, i32 0, i32 1, i32 7
  store i32 119, i32* %index_ptr2981
  %index_ptr2982 = getelementptr { i32, [ 0 x i32 ] }* %array2973, i32 0, i32 1, i32 8
  store i32 118, i32* %index_ptr2982
  %index_ptr2983 = getelementptr { i32, [ 0 x i32 ] }* %array2973, i32 0, i32 1, i32 9
  store i32 117, i32* %index_ptr2983
  store { i32, [ 0 x i32 ] }* %array2973, { i32, [ 0 x i32 ] }** @a2984
  ret void
}


