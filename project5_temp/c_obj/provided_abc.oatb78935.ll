%C2 = type { %_C2_vtable*, i8* }
%_C2_vtable = type { %_B_vtable*, i8* (%Object*)* }
%C1 = type { %_C1_vtable*, i8* }
%_C1_vtable = type { %_B_vtable*, i8* (%Object*)* }
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
@_const_str566.str. = private unnamed_addr constant [ 3 x i8 ] c "C2\00", align 4
@_const_str566 = alias bitcast([ 3 x i8 ]* @_const_str566.str. to i8*)@_const_str565.str. = private unnamed_addr constant [ 3 x i8 ] c "C1\00", align 4
@_const_str565 = alias bitcast([ 3 x i8 ]* @_const_str565.str. to i8*)@_const_str564.str. = private unnamed_addr constant [ 2 x i8 ] c "B\00", align 4
@_const_str564 = alias bitcast([ 2 x i8 ]* @_const_str564.str. to i8*)@_const_str563.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str563 = alias bitcast([ 2 x i8 ]* @_const_str563.str. to i8*)@_const_str562.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str562 = alias bitcast([ 7 x i8 ]* @_const_str562.str. to i8*)@_C2_vtable561 = private constant %_C2_vtable {%_B_vtable* @_B_vtable559, i8* (%Object*)* @_Object_get_name}, align 4
@_C1_vtable560 = private constant %_C1_vtable {%_B_vtable* @_B_vtable559, i8* (%Object*)* @_Object_get_name}, align 4
@_B_vtable559 = private constant %_B_vtable {%_A_vtable* @_A_vtable558, i8* (%Object*)* @_Object_get_name}, align 4
@_A_vtable558 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable557, i8* (%Object*)* @_Object_get_name}, align 4
@_Object_vtable557 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh931:
  ret void
}


define i32 @program (i32 %argc3197, { i32, [ 0 x i8* ] }* %argv3195){
__fresh930:
  %argc_slot3198 = alloca i32
  store i32 %argc3197, i32* %argc_slot3198
  %argv_slot3196 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv3195, { i32, [ 0 x i8* ] }** %argv_slot3196
  %mem_ptr3199 = call i32* @oat_malloc ( i32 8 )
  %obj3200 = bitcast i32* %mem_ptr3199 to %A* 
  %new_obj3201 = call %A* @_A_ctor ( %A* %obj3200 )
  %vdecl_slot3202 = alloca %A*
  store %A* %new_obj3201, %A** %vdecl_slot3202
  %mem_ptr3203 = call i32* @oat_malloc ( i32 8 )
  %obj3204 = bitcast i32* %mem_ptr3203 to %B* 
  %new_obj3205 = call %B* @_B_ctor ( %B* %obj3204 )
  %vdecl_slot3206 = alloca %B*
  store %B* %new_obj3205, %B** %vdecl_slot3206
  %mem_ptr3207 = call i32* @oat_malloc ( i32 8 )
  %obj3208 = bitcast i32* %mem_ptr3207 to %C1* 
  %new_obj3209 = call %C1* @_C1_ctor ( %C1* %obj3208 )
  %vdecl_slot3210 = alloca %C1*
  store %C1* %new_obj3209, %C1** %vdecl_slot3210
  %mem_ptr3211 = call i32* @oat_malloc ( i32 8 )
  %obj3212 = bitcast i32* %mem_ptr3211 to %C2* 
  %new_obj3213 = call %C2* @_C2_ctor ( %C2* %obj3212 )
  %vdecl_slot3214 = alloca %C2*
  store %C2* %new_obj3213, %C2** %vdecl_slot3214
  ret i32 0
}


define %C2* @_C2_ctor (%C2* %_this1){
__fresh929:
  %cast_op3191 = bitcast %C2* %_this1 to %B* 
  %dummy3192 = call %B* @_B_ctor ( %B* %cast_op3191 )
  %path3193 = getelementptr %C2* %_this1, i32 0, i32 1
  store i8* @_const_str566, i8** %path3193
  %vt_slot3194 = getelementptr %C2* %_this1, i32 0, i32 0
  store %_C2_vtable* @_C2_vtable561, %_C2_vtable** %vt_slot3194
  ret %C2* %_this1
}


define %C1* @_C1_ctor (%C1* %_this1){
__fresh928:
  %cast_op3187 = bitcast %C1* %_this1 to %B* 
  %dummy3188 = call %B* @_B_ctor ( %B* %cast_op3187 )
  %path3189 = getelementptr %C1* %_this1, i32 0, i32 1
  store i8* @_const_str565, i8** %path3189
  %vt_slot3190 = getelementptr %C1* %_this1, i32 0, i32 0
  store %_C1_vtable* @_C1_vtable560, %_C1_vtable** %vt_slot3190
  ret %C1* %_this1
}


define %B* @_B_ctor (%B* %_this1){
__fresh927:
  %cast_op3183 = bitcast %B* %_this1 to %A* 
  %dummy3184 = call %A* @_A_ctor ( %A* %cast_op3183 )
  %path3185 = getelementptr %B* %_this1, i32 0, i32 1
  store i8* @_const_str564, i8** %path3185
  %vt_slot3186 = getelementptr %B* %_this1, i32 0, i32 0
  store %_B_vtable* @_B_vtable559, %_B_vtable** %vt_slot3186
  ret %B* %_this1
}


define %A* @_A_ctor (%A* %_this1){
__fresh926:
  %cast_op3179 = bitcast %A* %_this1 to %Object* 
  %dummy3180 = call %Object* @_Object_ctor ( %Object* %cast_op3179 )
  %path3181 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str563, i8** %path3181
  %vt_slot3182 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable558, %_A_vtable** %vt_slot3182
  ret %A* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh925:
  %path3177 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call3178 = load i8** %path3177
  ret i8* %lhs_or_call3178
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh924:
  %path3175 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str562, i8** %path3175
  %vt_slot3176 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable557, %_Object_vtable** %vt_slot3176
  ret %Object* %_this1
}


