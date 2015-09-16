%C = type { %_C_vtable*, i8* }
%_C_vtable = type { %_B_vtable*, i8* (%Object*)*, i32 (%C*)* }
%B = type { %_B_vtable*, i8* }
%_B_vtable = type { %_A_vtable*, i8* (%Object*)*, i32 (%B*)* }
%A = type { %_A_vtable*, i8* }
%_A_vtable = type { %_Object_vtable*, i8* (%Object*)*, i32 (%A*)* }
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
@_const_str545.str. = private unnamed_addr constant [ 2 x i8 ] c "C\00", align 4
@_const_str545 = alias bitcast([ 2 x i8 ]* @_const_str545.str. to i8*)@_const_str544.str. = private unnamed_addr constant [ 2 x i8 ] c "B\00", align 4
@_const_str544 = alias bitcast([ 2 x i8 ]* @_const_str544.str. to i8*)@_const_str543.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str543 = alias bitcast([ 2 x i8 ]* @_const_str543.str. to i8*)@_const_str542.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str542 = alias bitcast([ 7 x i8 ]* @_const_str542.str. to i8*)@_C_vtable541 = private constant %_C_vtable {%_B_vtable* @_B_vtable540, i8* (%Object*)* @_Object_get_name, i32 (%C*)* @_C_six}, align 4
@_B_vtable540 = private constant %_B_vtable {%_A_vtable* @_A_vtable539, i8* (%Object*)* @_Object_get_name, i32 (%B*)* @_B_six}, align 4
@_A_vtable539 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable538, i8* (%Object*)* @_Object_get_name, i32 (%A*)* @_A_six}, align 4
@_Object_vtable538 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh910:
  ret void
}


define i32 @program (i32 %argc3120, { i32, [ 0 x i8* ] }* %argv3118){
__fresh909:
  %argc_slot3121 = alloca i32
  store i32 %argc3120, i32* %argc_slot3121
  %argv_slot3119 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv3118, { i32, [ 0 x i8* ] }** %argv_slot3119
  %mem_ptr3122 = call i32* @oat_malloc ( i32 8 )
  %obj3123 = bitcast i32* %mem_ptr3122 to %C* 
  %new_obj3124 = call %C* @_C_ctor ( %C* %obj3123 )
  %vdecl_slot3125 = alloca %C*
  store %C* %new_obj3124, %C** %vdecl_slot3125
  %lhs_or_call3126 = load %C** %vdecl_slot3125
  %vtmp3128 = getelementptr %C* %lhs_or_call3126, i32 0, i32 0
  %vtable3127 = load %_C_vtable** %vtmp3128
  %fptmp3129 = getelementptr %_C_vtable* %vtable3127, i32 0, i32 2
  %method3130 = load i32 (%C*)** %fptmp3129
  %ret3131 = call i32 %method3130 ( %C* %lhs_or_call3126 )
  ret i32 %ret3131
}


define i32 @_C_six (%C* %_this1){
__fresh908:
  %cast_op3115 = bitcast %C* %_this1 to %B* 
  %ret3116 = call i32 @_B_six ( %B* %cast_op3115 )
  %bop3117 = add i32 %ret3116, 3
  ret i32 %bop3117
}


define %C* @_C_ctor (%C* %_this1){
__fresh907:
  %cast_op3111 = bitcast %C* %_this1 to %B* 
  %dummy3112 = call %B* @_B_ctor ( %B* %cast_op3111 )
  %path3113 = getelementptr %C* %_this1, i32 0, i32 1
  store i8* @_const_str545, i8** %path3113
  %vt_slot3114 = getelementptr %C* %_this1, i32 0, i32 0
  store %_C_vtable* @_C_vtable541, %_C_vtable** %vt_slot3114
  ret %C* %_this1
}


define i32 @_B_six (%B* %_this1){
__fresh906:
  %cast_op3108 = bitcast %B* %_this1 to %A* 
  %ret3109 = call i32 @_A_six ( %A* %cast_op3108 )
  %bop3110 = add i32 %ret3109, 2
  ret i32 %bop3110
}


define %B* @_B_ctor (%B* %_this1){
__fresh905:
  %cast_op3104 = bitcast %B* %_this1 to %A* 
  %dummy3105 = call %A* @_A_ctor ( %A* %cast_op3104 )
  %path3106 = getelementptr %B* %_this1, i32 0, i32 1
  store i8* @_const_str544, i8** %path3106
  %vt_slot3107 = getelementptr %B* %_this1, i32 0, i32 0
  store %_B_vtable* @_B_vtable540, %_B_vtable** %vt_slot3107
  ret %B* %_this1
}


define i32 @_A_six (%A* %_this1){
__fresh904:
  ret i32 1
}


define %A* @_A_ctor (%A* %_this1){
__fresh903:
  %cast_op3100 = bitcast %A* %_this1 to %Object* 
  %dummy3101 = call %Object* @_Object_ctor ( %Object* %cast_op3100 )
  %path3102 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str543, i8** %path3102
  %vt_slot3103 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable539, %_A_vtable** %vt_slot3103
  ret %A* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh902:
  %path3098 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call3099 = load i8** %path3098
  ret i8* %lhs_or_call3099
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh901:
  %path3096 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str542, i8** %path3096
  %vt_slot3097 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable538, %_Object_vtable** %vt_slot3097
  ret %Object* %_this1
}


