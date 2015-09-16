%A = type { %_A_vtable*, i8*, i1 }
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
@_const_str35.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str35 = alias bitcast([ 2 x i8 ]* @_const_str35.str. to i8*)@_const_str34.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str34 = alias bitcast([ 7 x i8 ]* @_const_str34.str. to i8*)@_A_vtable33 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable32, i8* (%Object*)* @_Object_get_name}, align 4
@_Object_vtable32 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh71:
  ret void
}


define i32 @program (i32 %argc205, { i32, [ 0 x i8* ] }* %argv203){
__fresh68:
  %argc_slot206 = alloca i32
  store i32 %argc205, i32* %argc_slot206
  %argv_slot204 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv203, { i32, [ 0 x i8* ] }** %argv_slot204
  %mem_ptr207 = call i32* @oat_malloc ( i32 12 )
  %obj208 = bitcast i32* %mem_ptr207 to %A* 
  %new_obj209 = call %A* @_A_ctor ( %A* %obj208 )
  %vdecl_slot210 = alloca %A*
  store %A* %new_obj209, %A** %vdecl_slot210
  %vdecl_slot211 = alloca i32
  store i32 0, i32* %vdecl_slot211
  %lhs_or_call212 = load %A** %vdecl_slot210
  %path213 = getelementptr %A* %lhs_or_call212, i32 0, i32 2
  %lhs_or_call214 = load i1* %path213
  br i1 %lhs_or_call214, label %__then67, label %__else66

__fresh69:
  br label %__then67

__then67:
  store i32 1, i32* %vdecl_slot211
  br label %__merge65

__fresh70:
  br label %__else66

__else66:
  store i32 0, i32* %vdecl_slot211
  br label %__merge65

__merge65:
  %lhs_or_call215 = load i32* %vdecl_slot211
  ret i32 %lhs_or_call215
}


define %A* @_A_ctor (%A* %_this1){
__fresh64:
  %cast_op198 = bitcast %A* %_this1 to %Object* 
  %dummy199 = call %Object* @_Object_ctor ( %Object* %cast_op198 )
  %path200 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str35, i8** %path200
  %vt_slot201 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable33, %_A_vtable** %vt_slot201
  %path202 = getelementptr %A* %_this1, i32 0, i32 2
  store i1 1, i1* %path202
  ret %A* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh63:
  %path196 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call197 = load i8** %path196
  ret i8* %lhs_or_call197
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh62:
  %path194 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str34, i8** %path194
  %vt_slot195 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable32, %_Object_vtable** %vt_slot195
  ret %Object* %_this1
}


