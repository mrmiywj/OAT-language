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
@_const_str182.str. = private unnamed_addr constant [ 3 x i8 ] c "no\00", align 4
@_const_str182 = alias bitcast([ 3 x i8 ]* @_const_str182.str. to i8*)@_const_str183.str. = private unnamed_addr constant [ 4 x i8 ] c "yes\00", align 4
@_const_str183 = alias bitcast([ 4 x i8 ]* @_const_str183.str. to i8*)@_const_str181.str. = private unnamed_addr constant [ 2 x i8 ] c "C\00", align 4
@_const_str181 = alias bitcast([ 2 x i8 ]* @_const_str181.str. to i8*)@_const_str180.str. = private unnamed_addr constant [ 2 x i8 ] c "B\00", align 4
@_const_str180 = alias bitcast([ 2 x i8 ]* @_const_str180.str. to i8*)@_const_str179.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str179 = alias bitcast([ 2 x i8 ]* @_const_str179.str. to i8*)@_const_str178.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str178 = alias bitcast([ 7 x i8 ]* @_const_str178.str. to i8*)@_C_vtable177 = private constant %_C_vtable {%_B_vtable* @_B_vtable176, i8* (%Object*)* @_Object_get_name}, align 4
@_B_vtable176 = private constant %_B_vtable {%_A_vtable* @_A_vtable175, i8* (%Object*)* @_Object_get_name}, align 4
@_A_vtable175 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable174, i8* (%Object*)* @_Object_get_name}, align 4
@_Object_vtable174 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh292:
  ret void
}


define i32 @program (i32 %argc927, { i32, [ 0 x i8* ] }* %argv925){
__fresh287:
  %argc_slot928 = alloca i32
  store i32 %argc927, i32* %argc_slot928
  %argv_slot926 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv925, { i32, [ 0 x i8* ] }** %argv_slot926
  %mem_ptr929 = call i32* @oat_malloc ( i32 12 )
  %obj930 = bitcast i32* %mem_ptr929 to %C* 
  %new_obj931 = call %C* @_C_ctor ( %C* %obj930 )
  %cast_op932 = bitcast %C* %new_obj931 to %A* 
  %vdecl_slot933 = alloca %A*
  store %A* %cast_op932, %A** %vdecl_slot933
  %unop934 = sub i32 0, 1
  %vdecl_slot935 = alloca i32
  store i32 %unop934, i32* %vdecl_slot935
  %lhs_or_call936 = load %A** %vdecl_slot933
  %cast_op937 = bitcast %A* %lhs_or_call936 to %C* 
  %cast_op938 = bitcast %C* %cast_op937 to i8** 
  %cast_op939 = bitcast %_C_vtable* @_C_vtable177 to i8* 
  %vt_ptr_slot940 = alloca i8*
  %tmp0942 = load i8** %cast_op938
  store i8* %tmp0942, i8** %vt_ptr_slot940
  br label %__loop286

__loop286:
  %tmp1943 = load i8** %vt_ptr_slot940
  %guard1947 = icmp eq i8* %tmp1943, %cast_op939
  br i1 %guard1947, label %__then283, label %__fall1285

__fresh288:
  br label %__fall1285

__fall1285:
  %guard2948 = icmp eq i8* %tmp1943, null
  br i1 %guard2948, label %__else282, label %__fall2284

__fresh289:
  br label %__fall2284

__fall2284:
  %tmp2944 = load i8** %vt_ptr_slot940
  %tmp3945 = bitcast i8* %tmp2944 to i8** 
  %tmp4946 = load i8** %tmp3945
  store i8* %tmp4946, i8** %vt_ptr_slot940
  br label %__loop286

__fresh290:
  br label %__then283

__then283:
  %var_slot941 = alloca %C*
  store %C* %cast_op937, %C** %var_slot941
  call void @print_string( i8* @_const_str183 )
  %lhs_or_call952 = load %C** %var_slot941
  %path953 = getelementptr %C* %lhs_or_call952, i32 0, i32 2
  %lhs_or_call954 = load i32* %path953
  store i32 %lhs_or_call954, i32* %vdecl_slot935
  br label %__done281

__fresh291:
  br label %__else282

__else282:
  call void @print_string( i8* @_const_str182 )
  %lhs_or_call949 = load %A** %vdecl_slot933
  %path950 = getelementptr %A* %lhs_or_call949, i32 0, i32 2
  %lhs_or_call951 = load i32* %path950
  store i32 %lhs_or_call951, i32* %vdecl_slot935
  br label %__done281

__done281:
  %lhs_or_call955 = load i32* %vdecl_slot935
  ret i32 %lhs_or_call955
}


define %C* @_C_ctor (%C* %_this1){
__fresh280:
  %cast_op920 = bitcast %C* %_this1 to %B* 
  %dummy921 = call %B* @_B_ctor ( %B* %cast_op920 )
  %path922 = getelementptr %C* %_this1, i32 0, i32 1
  store i8* @_const_str181, i8** %path922
  %vt_slot923 = getelementptr %C* %_this1, i32 0, i32 0
  store %_C_vtable* @_C_vtable177, %_C_vtable** %vt_slot923
  %path924 = getelementptr %C* %_this1, i32 0, i32 2
  store i32 2, i32* %path924
  ret %C* %_this1
}


define %B* @_B_ctor (%B* %_this1){
__fresh279:
  %cast_op915 = bitcast %B* %_this1 to %A* 
  %dummy916 = call %A* @_A_ctor ( %A* %cast_op915 )
  %path917 = getelementptr %B* %_this1, i32 0, i32 1
  store i8* @_const_str180, i8** %path917
  %vt_slot918 = getelementptr %B* %_this1, i32 0, i32 0
  store %_B_vtable* @_B_vtable176, %_B_vtable** %vt_slot918
  %path919 = getelementptr %B* %_this1, i32 0, i32 2
  store i32 1, i32* %path919
  ret %B* %_this1
}


define %A* @_A_ctor (%A* %_this1){
__fresh278:
  %cast_op910 = bitcast %A* %_this1 to %Object* 
  %dummy911 = call %Object* @_Object_ctor ( %Object* %cast_op910 )
  %path912 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str179, i8** %path912
  %vt_slot913 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable175, %_A_vtable** %vt_slot913
  %path914 = getelementptr %A* %_this1, i32 0, i32 2
  store i32 0, i32* %path914
  ret %A* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh277:
  %path908 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call909 = load i8** %path908
  ret i8* %lhs_or_call909
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh276:
  %path906 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str178, i8** %path906
  %vt_slot907 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable174, %_Object_vtable** %vt_slot907
  ret %Object* %_this1
}


