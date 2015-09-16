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
@_const_str192.str. = private unnamed_addr constant [ 3 x i8 ] c "no\00", align 4
@_const_str192 = alias bitcast([ 3 x i8 ]* @_const_str192.str. to i8*)@_const_str193.str. = private unnamed_addr constant [ 4 x i8 ] c "yes\00", align 4
@_const_str193 = alias bitcast([ 4 x i8 ]* @_const_str193.str. to i8*)@_const_str191.str. = private unnamed_addr constant [ 2 x i8 ] c "C\00", align 4
@_const_str191 = alias bitcast([ 2 x i8 ]* @_const_str191.str. to i8*)@_const_str190.str. = private unnamed_addr constant [ 2 x i8 ] c "B\00", align 4
@_const_str190 = alias bitcast([ 2 x i8 ]* @_const_str190.str. to i8*)@_const_str189.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str189 = alias bitcast([ 2 x i8 ]* @_const_str189.str. to i8*)@_const_str188.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str188 = alias bitcast([ 7 x i8 ]* @_const_str188.str. to i8*)@_C_vtable187 = private constant %_C_vtable {%_B_vtable* @_B_vtable186, i8* (%Object*)* @_Object_get_name}, align 4
@_B_vtable186 = private constant %_B_vtable {%_A_vtable* @_A_vtable185, i8* (%Object*)* @_Object_get_name}, align 4
@_A_vtable185 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable184, i8* (%Object*)* @_Object_get_name}, align 4
@_Object_vtable184 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh309:
  ret void
}


define i32 @program (i32 %argc977, { i32, [ 0 x i8* ] }* %argv975){
__fresh304:
  %argc_slot978 = alloca i32
  store i32 %argc977, i32* %argc_slot978
  %argv_slot976 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv975, { i32, [ 0 x i8* ] }** %argv_slot976
  %mem_ptr979 = call i32* @oat_malloc ( i32 12 )
  %obj980 = bitcast i32* %mem_ptr979 to %A* 
  %new_obj981 = call %A* @_A_ctor ( %A* %obj980 )
  %vdecl_slot982 = alloca %A*
  store %A* %new_obj981, %A** %vdecl_slot982
  %unop983 = sub i32 0, 1
  %vdecl_slot984 = alloca i32
  store i32 %unop983, i32* %vdecl_slot984
  %lhs_or_call985 = load %A** %vdecl_slot982
  %cast_op986 = bitcast %A* %lhs_or_call985 to %B* 
  %cast_op987 = bitcast %B* %cast_op986 to i8** 
  %cast_op988 = bitcast %_B_vtable* @_B_vtable186 to i8* 
  %vt_ptr_slot989 = alloca i8*
  %tmp0991 = load i8** %cast_op987
  store i8* %tmp0991, i8** %vt_ptr_slot989
  br label %__loop303

__loop303:
  %tmp1992 = load i8** %vt_ptr_slot989
  %guard1996 = icmp eq i8* %tmp1992, %cast_op988
  br i1 %guard1996, label %__then300, label %__fall1302

__fresh305:
  br label %__fall1302

__fall1302:
  %guard2997 = icmp eq i8* %tmp1992, null
  br i1 %guard2997, label %__else299, label %__fall2301

__fresh306:
  br label %__fall2301

__fall2301:
  %tmp2993 = load i8** %vt_ptr_slot989
  %tmp3994 = bitcast i8* %tmp2993 to i8** 
  %tmp4995 = load i8** %tmp3994
  store i8* %tmp4995, i8** %vt_ptr_slot989
  br label %__loop303

__fresh307:
  br label %__then300

__then300:
  %var_slot990 = alloca %B*
  store %B* %cast_op986, %B** %var_slot990
  call void @print_string( i8* @_const_str193 )
  %lhs_or_call1001 = load %B** %var_slot990
  %path1002 = getelementptr %B* %lhs_or_call1001, i32 0, i32 2
  %lhs_or_call1003 = load i32* %path1002
  store i32 %lhs_or_call1003, i32* %vdecl_slot984
  br label %__done298

__fresh308:
  br label %__else299

__else299:
  call void @print_string( i8* @_const_str192 )
  %lhs_or_call998 = load %A** %vdecl_slot982
  %path999 = getelementptr %A* %lhs_or_call998, i32 0, i32 2
  %lhs_or_call1000 = load i32* %path999
  store i32 %lhs_or_call1000, i32* %vdecl_slot984
  br label %__done298

__done298:
  %lhs_or_call1004 = load i32* %vdecl_slot984
  ret i32 %lhs_or_call1004
}


define %C* @_C_ctor (%C* %_this1){
__fresh297:
  %cast_op970 = bitcast %C* %_this1 to %B* 
  %dummy971 = call %B* @_B_ctor ( %B* %cast_op970 )
  %path972 = getelementptr %C* %_this1, i32 0, i32 1
  store i8* @_const_str191, i8** %path972
  %vt_slot973 = getelementptr %C* %_this1, i32 0, i32 0
  store %_C_vtable* @_C_vtable187, %_C_vtable** %vt_slot973
  %path974 = getelementptr %C* %_this1, i32 0, i32 2
  store i32 2, i32* %path974
  ret %C* %_this1
}


define %B* @_B_ctor (%B* %_this1){
__fresh296:
  %cast_op965 = bitcast %B* %_this1 to %A* 
  %dummy966 = call %A* @_A_ctor ( %A* %cast_op965 )
  %path967 = getelementptr %B* %_this1, i32 0, i32 1
  store i8* @_const_str190, i8** %path967
  %vt_slot968 = getelementptr %B* %_this1, i32 0, i32 0
  store %_B_vtable* @_B_vtable186, %_B_vtable** %vt_slot968
  %path969 = getelementptr %B* %_this1, i32 0, i32 2
  store i32 1, i32* %path969
  ret %B* %_this1
}


define %A* @_A_ctor (%A* %_this1){
__fresh295:
  %cast_op960 = bitcast %A* %_this1 to %Object* 
  %dummy961 = call %Object* @_Object_ctor ( %Object* %cast_op960 )
  %path962 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str189, i8** %path962
  %vt_slot963 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable185, %_A_vtable** %vt_slot963
  %path964 = getelementptr %A* %_this1, i32 0, i32 2
  store i32 0, i32* %path964
  ret %A* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh294:
  %path958 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call959 = load i8** %path958
  ret i8* %lhs_or_call959
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh293:
  %path956 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str188, i8** %path956
  %vt_slot957 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable184, %_Object_vtable** %vt_slot957
  ret %Object* %_this1
}


