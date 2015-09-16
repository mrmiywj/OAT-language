%B = type { %_B_vtable*, i8*, i32, i32 }
%_B_vtable = type { %_A_vtable*, i8* (%Object*)*, i32 (%A*)*, void (%A*)*, i32 (%B*)* }
%A = type { %_A_vtable*, i8*, i32, i32 }
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
@_const_str6.str. = private unnamed_addr constant [ 2 x i8 ] c "B\00", align 4
@_const_str6 = alias bitcast([ 2 x i8 ]* @_const_str6.str. to i8*)@_const_str5.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str5 = alias bitcast([ 2 x i8 ]* @_const_str5.str. to i8*)@_const_str4.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str4 = alias bitcast([ 7 x i8 ]* @_const_str4.str. to i8*)@_B_vtable3 = private constant %_B_vtable {%_A_vtable* @_A_vtable2, i8* (%Object*)* @_Object_get_name, i32 (%A*)* @_A_f, void (%A*)* @_A_p, i32 (%B*)* @_B_g}, align 4
@_A_vtable2 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable1, i8* (%Object*)* @_Object_get_name, i32 (%A*)* @_A_f, void (%A*)* @_A_p}, align 4
@_Object_vtable1 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh23:
  ret void
}


define i32 @program (i32 %argc21, { i32, [ 0 x i8* ] }* %argv19){
__fresh16:
  %argc_slot22 = alloca i32
  store i32 %argc21, i32* %argc_slot22
  %argv_slot20 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv19, { i32, [ 0 x i8* ] }** %argv_slot20
  %mem_ptr23 = call i32* @oat_malloc ( i32 16 )
  %obj24 = bitcast i32* %mem_ptr23 to %A* 
  %new_obj25 = call %A* @_A_ctor ( %A* %obj24 )
  %vdecl_slot26 = alloca %A*
  store %A* %new_obj25, %A** %vdecl_slot26
  %vdecl_slot27 = alloca i32
  store i32 0, i32* %vdecl_slot27
  %lhs_or_call28 = load %A** %vdecl_slot26
  %ifnull_slot29 = alloca %A*
  store %A* %lhs_or_call28, %A** %ifnull_slot29
  %ifnull_guard30 = icmp ne %A* %lhs_or_call28, null
  br i1 %ifnull_guard30, label %__then15, label %__else14

__fresh17:
  br label %__then15

__then15:
  %lhs_or_call31 = load %A** %ifnull_slot29
  %cast_op32 = bitcast %A* %lhs_or_call31 to i8** 
  %cast_op33 = bitcast %_A_vtable* @_A_vtable2 to i8* 
  %vt_ptr_slot34 = alloca i8*
  %tmp036 = load i8** %cast_op32
  store i8* %tmp036, i8** %vt_ptr_slot34
  br label %__loop12

__loop12:
  %tmp137 = load i8** %vt_ptr_slot34
  %guard141 = icmp eq i8* %tmp137, %cast_op33
  br i1 %guard141, label %__then9, label %__fall111

__fresh18:
  br label %__fall111

__fall111:
  %guard242 = icmp eq i8* %tmp137, null
  br i1 %guard242, label %__else8, label %__fall210

__fresh19:
  br label %__fall210

__fall210:
  %tmp238 = load i8** %vt_ptr_slot34
  %tmp339 = bitcast i8* %tmp238 to i8** 
  %tmp440 = load i8** %tmp339
  store i8* %tmp440, i8** %vt_ptr_slot34
  br label %__loop12

__fresh20:
  br label %__then9

__then9:
  %var_slot35 = alloca %A*
  store %A* %lhs_or_call31, %A** %var_slot35
  %lhs_or_call43 = load %A** %var_slot35
  %vtmp45 = getelementptr %A* %lhs_or_call43, i32 0, i32 0
  %vtable44 = load %_A_vtable** %vtmp45
  %fptmp46 = getelementptr %_A_vtable* %vtable44, i32 0, i32 2
  %method47 = load i32 (%A*)** %fptmp46
  %ret48 = call i32 %method47 ( %A* %lhs_or_call43 )
  store i32 %ret48, i32* %vdecl_slot27
  %lhs_or_call49 = load %A** %ifnull_slot29
  %path50 = getelementptr %A* %lhs_or_call49, i32 0, i32 2
  %lhs_or_call51 = load i32* %path50
  %lhs_or_call52 = load i32* %vdecl_slot27
  %bop53 = add i32 %lhs_or_call51, %lhs_or_call52
  store i32 %bop53, i32* %vdecl_slot27
  br label %__done7

__fresh21:
  br label %__else8

__else8:
  br label %__done7

__done7:
  br label %__merge13

__fresh22:
  br label %__else14

__else14:
  br label %__merge13

__merge13:
  %lhs_or_call54 = load i32* %vdecl_slot27
  ret i32 %lhs_or_call54
}


define i32 @_B_g (%B* %_this1){
__fresh6:
  %cast_op17 = bitcast %B* %_this1 to %A* 
  %ret18 = call i32 @_A_f ( %A* %cast_op17 )
  ret i32 %ret18
}


define %B* @_B_ctor (%B* %_this1){
__fresh5:
  %cast_op13 = bitcast %B* %_this1 to %A* 
  %dummy14 = call %A* @_A_ctor ( %A* %cast_op13 )
  %path15 = getelementptr %B* %_this1, i32 0, i32 1
  store i8* @_const_str6, i8** %path15
  %vt_slot16 = getelementptr %B* %_this1, i32 0, i32 0
  store %_B_vtable* @_B_vtable3, %_B_vtable** %vt_slot16
  ret %B* %_this1
}


define void @_A_p (%A* %_this1){
__fresh4:
  ret void
}


define i32 @_A_f (%A* %_this1){
__fresh3:
  %path11 = getelementptr %A* %_this1, i32 0, i32 2
  %lhs_or_call12 = load i32* %path11
  ret i32 %lhs_or_call12
}


define %A* @_A_ctor (%A* %_this1){
__fresh2:
  %cast_op6 = bitcast %A* %_this1 to %Object* 
  %dummy7 = call %Object* @_Object_ctor ( %Object* %cast_op6 )
  %path8 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str5, i8** %path8
  %vt_slot9 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable2, %_A_vtable** %vt_slot9
  %path10 = getelementptr %A* %_this1, i32 0, i32 2
  store i32 10, i32* %path10
  ret %A* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh1:
  %path4 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call5 = load i8** %path4
  ret i8* %lhs_or_call5
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh0:
  %path2 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str4, i8** %path2
  %vt_slot3 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable1, %_Object_vtable** %vt_slot3
  ret %Object* %_this1
}


