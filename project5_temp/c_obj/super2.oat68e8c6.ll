%C = type { %_C_vtable*, i8* }
%_C_vtable = type { %_B_vtable*, i8* (%Object*)*, i32 (%C*)*, void (%C*)* }
%B = type { %_B_vtable*, i8* }
%_B_vtable = type { %_A_vtable*, i8* (%Object*)*, i32 (%B*)*, void (%B*)* }
%A = type { %_A_vtable*, i8* }
%_A_vtable = type { %_Object_vtable*, i8* (%Object*)*, i32 (%A*)*, void (%A*)* }
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
@_const_str556.str. = private unnamed_addr constant [ 2 x i8 ] c "C\00", align 4
@_const_str556 = alias bitcast([ 2 x i8 ]* @_const_str556.str. to i8*)@_const_str555.str. = private unnamed_addr constant [ 2 x i8 ] c "C\00", align 4
@_const_str555 = alias bitcast([ 2 x i8 ]* @_const_str555.str. to i8*)@_const_str554.str. = private unnamed_addr constant [ 2 x i8 ] c "B\00", align 4
@_const_str554 = alias bitcast([ 2 x i8 ]* @_const_str554.str. to i8*)@_const_str553.str. = private unnamed_addr constant [ 2 x i8 ] c "B\00", align 4
@_const_str553 = alias bitcast([ 2 x i8 ]* @_const_str553.str. to i8*)@_const_str552.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str552 = alias bitcast([ 2 x i8 ]* @_const_str552.str. to i8*)@_const_str551.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str551 = alias bitcast([ 2 x i8 ]* @_const_str551.str. to i8*)@_const_str550.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str550 = alias bitcast([ 7 x i8 ]* @_const_str550.str. to i8*)@_C_vtable549 = private constant %_C_vtable {%_B_vtable* @_B_vtable548, i8* (%Object*)* @_Object_get_name, i32 (%C*)* @_C_six, void (%C*)* @_C_f}, align 4
@_B_vtable548 = private constant %_B_vtable {%_A_vtable* @_A_vtable547, i8* (%Object*)* @_Object_get_name, i32 (%B*)* @_B_six, void (%B*)* @_B_f}, align 4
@_A_vtable547 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable546, i8* (%Object*)* @_Object_get_name, i32 (%A*)* @_A_six, void (%A*)* @_A_f}, align 4
@_Object_vtable546 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh923:
  ret void
}


define i32 @program (i32 %argc3156, { i32, [ 0 x i8* ] }* %argv3154){
__fresh922:
  %argc_slot3157 = alloca i32
  store i32 %argc3156, i32* %argc_slot3157
  %argv_slot3155 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv3154, { i32, [ 0 x i8* ] }** %argv_slot3155
  %mem_ptr3158 = call i32* @oat_malloc ( i32 8 )
  %obj3159 = bitcast i32* %mem_ptr3158 to %C* 
  %new_obj3160 = call %C* @_C_ctor ( %C* %obj3159 )
  %vdecl_slot3161 = alloca %C*
  store %C* %new_obj3160, %C** %vdecl_slot3161
  %lhs_or_call3162 = load %C** %vdecl_slot3161
  %vtmp3164 = getelementptr %C* %lhs_or_call3162, i32 0, i32 0
  %vtable3163 = load %_C_vtable** %vtmp3164
  %fptmp3165 = getelementptr %_C_vtable* %vtable3163, i32 0, i32 2
  %method3166 = load i32 (%C*)** %fptmp3165
  %ret3167 = call i32 %method3166 ( %C* %lhs_or_call3162 )
  %vdecl_slot3168 = alloca i32
  store i32 %ret3167, i32* %vdecl_slot3168
  %lhs_or_call3169 = load %C** %vdecl_slot3161
  %vtmp3171 = getelementptr %C* %lhs_or_call3169, i32 0, i32 0
  %vtable3170 = load %_C_vtable** %vtmp3171
  %fptmp3172 = getelementptr %_C_vtable* %vtable3170, i32 0, i32 3
  %method3173 = load void (%C*)** %fptmp3172
  call void %method3173( %C* %lhs_or_call3169 )
  %lhs_or_call3174 = load i32* %vdecl_slot3168
  ret i32 %lhs_or_call3174
}


define void @_C_f (%C* %_this1){
__fresh921:
  call void @print_string( i8* @_const_str556 )
  ret void
}


define i32 @_C_six (%C* %_this1){
__fresh920:
  %cast_op3151 = bitcast %C* %_this1 to %B* 
  %ret3152 = call i32 @_B_six ( %B* %cast_op3151 )
  %bop3153 = add i32 %ret3152, 3
  ret i32 %bop3153
}


define %C* @_C_ctor (%C* %_this1){
__fresh919:
  %cast_op3147 = bitcast %C* %_this1 to %B* 
  %dummy3148 = call %B* @_B_ctor ( %B* %cast_op3147 )
  %path3149 = getelementptr %C* %_this1, i32 0, i32 1
  store i8* @_const_str555, i8** %path3149
  %vt_slot3150 = getelementptr %C* %_this1, i32 0, i32 0
  store %_C_vtable* @_C_vtable549, %_C_vtable** %vt_slot3150
  ret %C* %_this1
}


define void @_B_f (%B* %_this1){
__fresh918:
  call void @print_string( i8* @_const_str554 )
  ret void
}


define i32 @_B_six (%B* %_this1){
__fresh917:
  %cast_op3144 = bitcast %B* %_this1 to %A* 
  %ret3145 = call i32 @_A_six ( %A* %cast_op3144 )
  %bop3146 = add i32 %ret3145, 2
  ret i32 %bop3146
}


define %B* @_B_ctor (%B* %_this1){
__fresh916:
  %cast_op3140 = bitcast %B* %_this1 to %A* 
  %dummy3141 = call %A* @_A_ctor ( %A* %cast_op3140 )
  %path3142 = getelementptr %B* %_this1, i32 0, i32 1
  store i8* @_const_str553, i8** %path3142
  %vt_slot3143 = getelementptr %B* %_this1, i32 0, i32 0
  store %_B_vtable* @_B_vtable548, %_B_vtable** %vt_slot3143
  ret %B* %_this1
}


define void @_A_f (%A* %_this1){
__fresh915:
  call void @print_string( i8* @_const_str552 )
  ret void
}


define i32 @_A_six (%A* %_this1){
__fresh914:
  ret i32 1
}


define %A* @_A_ctor (%A* %_this1){
__fresh913:
  %cast_op3136 = bitcast %A* %_this1 to %Object* 
  %dummy3137 = call %Object* @_Object_ctor ( %Object* %cast_op3136 )
  %path3138 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str551, i8** %path3138
  %vt_slot3139 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable547, %_A_vtable** %vt_slot3139
  ret %A* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh912:
  %path3134 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call3135 = load i8** %path3134
  ret i8* %lhs_or_call3135
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh911:
  %path3132 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str550, i8** %path3132
  %vt_slot3133 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable546, %_Object_vtable** %vt_slot3133
  ret %Object* %_this1
}


