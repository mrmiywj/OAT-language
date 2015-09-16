%C = type { %_C_vtable*, i8*, i32 }
%_C_vtable = type { %_B_vtable*, i8* (%Object*)* }
%B = type { %_B_vtable*, i8*, i32 }
%_B_vtable = type { %_A_vtable*, i8* (%Object*)* }
%A = type { %_A_vtable*, i8*, i32 }
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
@_const_str202.str. = private unnamed_addr constant [ 3 x i8 ] c "no\00", align 4
@_const_str202 = alias bitcast([ 3 x i8 ]* @_const_str202.str. to i8*)@_const_str203.str. = private unnamed_addr constant [ 4 x i8 ] c "yes\00", align 4
@_const_str203 = alias bitcast([ 4 x i8 ]* @_const_str203.str. to i8*)@_const_str201.str. = private unnamed_addr constant [ 2 x i8 ] c "C\00", align 4
@_const_str201 = alias bitcast([ 2 x i8 ]* @_const_str201.str. to i8*)@_const_str200.str. = private unnamed_addr constant [ 2 x i8 ] c "B\00", align 4
@_const_str200 = alias bitcast([ 2 x i8 ]* @_const_str200.str. to i8*)@_const_str199.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str199 = alias bitcast([ 2 x i8 ]* @_const_str199.str. to i8*)@_const_str198.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str198 = alias bitcast([ 7 x i8 ]* @_const_str198.str. to i8*)@_C_vtable197 = private constant %_C_vtable {%_B_vtable* @_B_vtable196, i8* (%Object*)* @_Object_get_name}, align 4
@_B_vtable196 = private constant %_B_vtable {%_A_vtable* @_A_vtable195, i8* (%Object*)* @_Object_get_name}, align 4
@_A_vtable195 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable194, i8* (%Object*)* @_Object_get_name}, align 4
@_Object_vtable194 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh326:
  ret void
}


define i32 @program (i32 %argc1026, { i32, [ 0 x i8* ] }* %argv1024){
__fresh321:
  %argc_slot1027 = alloca i32
  store i32 %argc1026, i32* %argc_slot1027
  %argv_slot1025 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv1024, { i32, [ 0 x i8* ] }** %argv_slot1025
  %mem_ptr1028 = call i32* @oat_malloc ( i32 12 )
  %obj1029 = bitcast i32* %mem_ptr1028 to %B* 
  %new_obj1030 = call %B* @_B_ctor ( %B* %obj1029 )
  %cast_op1031 = bitcast %B* %new_obj1030 to %A* 
  %vdecl_slot1032 = alloca %A*
  store %A* %cast_op1031, %A** %vdecl_slot1032
  %unop1033 = sub i32 0, 1
  %vdecl_slot1034 = alloca i32
  store i32 %unop1033, i32* %vdecl_slot1034
  %lhs_or_call1035 = load %A** %vdecl_slot1032
  %cast_op1036 = bitcast %A* %lhs_or_call1035 to %B* 
  %cast_op1037 = bitcast %B* %cast_op1036 to i8** 
  %cast_op1038 = bitcast %_B_vtable* @_B_vtable196 to i8* 
  %vt_ptr_slot1039 = alloca i8*
  %tmp01041 = load i8** %cast_op1037
  store i8* %tmp01041, i8** %vt_ptr_slot1039
  br label %__loop320

__loop320:
  %tmp11042 = load i8** %vt_ptr_slot1039
  %guard11046 = icmp eq i8* %tmp11042, %cast_op1038
  br i1 %guard11046, label %__then317, label %__fall1319

__fresh322:
  br label %__fall1319

__fall1319:
  %guard21047 = icmp eq i8* %tmp11042, null
  br i1 %guard21047, label %__else316, label %__fall2318

__fresh323:
  br label %__fall2318

__fall2318:
  %tmp21043 = load i8** %vt_ptr_slot1039
  %tmp31044 = bitcast i8* %tmp21043 to i8** 
  %tmp41045 = load i8** %tmp31044
  store i8* %tmp41045, i8** %vt_ptr_slot1039
  br label %__loop320

__fresh324:
  br label %__then317

__then317:
  %var_slot1040 = alloca %B*
  store %B* %cast_op1036, %B** %var_slot1040
  call void @print_string( i8* @_const_str203 )
  %lhs_or_call1051 = load %B** %var_slot1040
  %path1052 = getelementptr %B* %lhs_or_call1051, i32 0, i32 2
  %lhs_or_call1053 = load i32* %path1052
  store i32 %lhs_or_call1053, i32* %vdecl_slot1034
  br label %__done315

__fresh325:
  br label %__else316

__else316:
  call void @print_string( i8* @_const_str202 )
  %lhs_or_call1048 = load %A** %vdecl_slot1032
  %path1049 = getelementptr %A* %lhs_or_call1048, i32 0, i32 2
  %lhs_or_call1050 = load i32* %path1049
  store i32 %lhs_or_call1050, i32* %vdecl_slot1034
  br label %__done315

__done315:
  %lhs_or_call1054 = load i32* %vdecl_slot1034
  ret i32 %lhs_or_call1054
}


define %C* @_C_ctor (%C* %_this1){
__fresh314:
  %cast_op1019 = bitcast %C* %_this1 to %B* 
  %dummy1020 = call %B* @_B_ctor ( %B* %cast_op1019 )
  %path1021 = getelementptr %C* %_this1, i32 0, i32 1
  store i8* @_const_str201, i8** %path1021
  %vt_slot1022 = getelementptr %C* %_this1, i32 0, i32 0
  store %_C_vtable* @_C_vtable197, %_C_vtable** %vt_slot1022
  %path1023 = getelementptr %C* %_this1, i32 0, i32 2
  store i32 2, i32* %path1023
  ret %C* %_this1
}


define %B* @_B_ctor (%B* %_this1){
__fresh313:
  %cast_op1014 = bitcast %B* %_this1 to %A* 
  %dummy1015 = call %A* @_A_ctor ( %A* %cast_op1014 )
  %path1016 = getelementptr %B* %_this1, i32 0, i32 1
  store i8* @_const_str200, i8** %path1016
  %vt_slot1017 = getelementptr %B* %_this1, i32 0, i32 0
  store %_B_vtable* @_B_vtable196, %_B_vtable** %vt_slot1017
  %path1018 = getelementptr %B* %_this1, i32 0, i32 2
  store i32 1, i32* %path1018
  ret %B* %_this1
}


define %A* @_A_ctor (%A* %_this1){
__fresh312:
  %cast_op1009 = bitcast %A* %_this1 to %Object* 
  %dummy1010 = call %Object* @_Object_ctor ( %Object* %cast_op1009 )
  %path1011 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str199, i8** %path1011
  %vt_slot1012 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable195, %_A_vtable** %vt_slot1012
  %path1013 = getelementptr %A* %_this1, i32 0, i32 2
  store i32 0, i32* %path1013
  ret %A* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh311:
  %path1007 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call1008 = load i8** %path1007
  ret i8* %lhs_or_call1008
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh310:
  %path1005 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str198, i8** %path1005
  %vt_slot1006 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable194, %_Object_vtable** %vt_slot1006
  ret %Object* %_this1
}


