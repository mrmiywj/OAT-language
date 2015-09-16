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
@s3518 = global i8* zeroinitializer, align 4		; initialized by @s3518.init519
@_const_str517.str. = private unnamed_addr constant [ 8 x i8 ] c "goodbye\00", align 4
@_const_str517 = alias bitcast([ 8 x i8 ]* @_const_str517.str. to i8*)@s2515 = global i8* zeroinitializer, align 4		; initialized by @s2515.init516
@s1513 = global i8* zeroinitializer, align 4		; initialized by @s1513.init514
@_const_str512.str. = private unnamed_addr constant [ 6 x i8 ] c "hello\00", align 4
@_const_str512 = alias bitcast([ 6 x i8 ]* @_const_str512.str. to i8*)@_const_str511.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str511 = alias bitcast([ 7 x i8 ]* @_const_str511.str. to i8*)@_Object_vtable510 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh794:
  call void @s1513.init514(  )
  call void @s2515.init516(  )
  call void @s3518.init519(  )
  ret void
}


define i32 @program (i32 %argc2858, { i32, [ 0 x i8* ] }* %argv2856){
__fresh787:
  %argc_slot2859 = alloca i32
  store i32 %argc2858, i32* %argc_slot2859
  %argv_slot2857 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv2856, { i32, [ 0 x i8* ] }** %argv_slot2857
  %vdecl_slot2860 = alloca i32
  store i32 0, i32* %vdecl_slot2860
  %lhs_or_call2861 = load i8** @s1513
  %ifnull_slot2862 = alloca i8*
  store i8* %lhs_or_call2861, i8** %ifnull_slot2862
  %ifnull_guard2863 = icmp ne i8* %lhs_or_call2861, null
  br i1 %ifnull_guard2863, label %__then780, label %__else779

__fresh788:
  br label %__then780

__then780:
  %lhs_or_call2864 = load i8** %ifnull_slot2862
  %ret2865 = call i32 @length_of_string ( i8* %lhs_or_call2864 )
  store i32 %ret2865, i32* %vdecl_slot2860
  br label %__merge778

__fresh789:
  br label %__else779

__else779:
  store i32 0, i32* %vdecl_slot2860
  br label %__merge778

__merge778:
  %lhs_or_call2866 = load i8** @s2515
  %ifnull_slot2867 = alloca i8*
  store i8* %lhs_or_call2866, i8** %ifnull_slot2867
  %ifnull_guard2868 = icmp ne i8* %lhs_or_call2866, null
  br i1 %ifnull_guard2868, label %__then783, label %__else782

__fresh790:
  br label %__then783

__then783:
  %lhs_or_call2869 = load i32* %vdecl_slot2860
  %lhs_or_call2870 = load i8** %ifnull_slot2867
  %ret2871 = call i32 @length_of_string ( i8* %lhs_or_call2870 )
  %bop2872 = add i32 %lhs_or_call2869, %ret2871
  store i32 %bop2872, i32* %vdecl_slot2860
  br label %__merge781

__fresh791:
  br label %__else782

__else782:
  %lhs_or_call2873 = load i32* %vdecl_slot2860
  %bop2874 = add i32 %lhs_or_call2873, 30
  store i32 %bop2874, i32* %vdecl_slot2860
  br label %__merge781

__merge781:
  %lhs_or_call2875 = load i8** @s3518
  %ifnull_slot2876 = alloca i8*
  store i8* %lhs_or_call2875, i8** %ifnull_slot2876
  %ifnull_guard2877 = icmp ne i8* %lhs_or_call2875, null
  br i1 %ifnull_guard2877, label %__then786, label %__else785

__fresh792:
  br label %__then786

__then786:
  %lhs_or_call2878 = load i32* %vdecl_slot2860
  %lhs_or_call2879 = load i8** %ifnull_slot2876
  %ret2880 = call i32 @length_of_string ( i8* %lhs_or_call2879 )
  %bop2881 = add i32 %lhs_or_call2878, %ret2880
  store i32 %bop2881, i32* %vdecl_slot2860
  br label %__merge784

__fresh793:
  br label %__else785

__else785:
  %lhs_or_call2882 = load i32* %vdecl_slot2860
  %bop2883 = add i32 %lhs_or_call2882, 41
  store i32 %bop2883, i32* %vdecl_slot2860
  br label %__merge784

__merge784:
  %lhs_or_call2884 = load i32* %vdecl_slot2860
  ret i32 %lhs_or_call2884
}


define void @s3518.init519 (){
__fresh777:
  store i8* @_const_str517, i8** @s3518
  ret void
}


define void @s2515.init516 (){
__fresh776:
  store i8* null, i8** @s2515
  ret void
}


define void @s1513.init514 (){
__fresh775:
  store i8* @_const_str512, i8** @s1513
  ret void
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh774:
  %path2854 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call2855 = load i8** %path2854
  ret i8* %lhs_or_call2855
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh773:
  %path2852 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str511, i8** %path2852
  %vt_slot2853 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable510, %_Object_vtable** %vt_slot2853
  ret %Object* %_this1
}


