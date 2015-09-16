%A = type { %_A_vtable*, i8* }
%_A_vtable = type { %_Object_vtable*, i8* (%Object*)*, void (%A*)*, void (%A*)* }
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
@_const_str23.str. = private unnamed_addr constant [ 2 x i8 ] c "g\00", align 4
@_const_str23 = alias bitcast([ 2 x i8 ]* @_const_str23.str. to i8*)@_const_str22.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str22 = alias bitcast([ 2 x i8 ]* @_const_str22.str. to i8*)@_const_str21.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str21 = alias bitcast([ 7 x i8 ]* @_const_str21.str. to i8*)@_A_vtable20 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable19, i8* (%Object*)* @_Object_get_name, void (%A*)* @_A_f, void (%A*)* @_A_g}, align 4
@_Object_vtable19 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh50:
  ret void
}


define i32 @program (i32 %argc144, { i32, [ 0 x i8* ] }* %argv142){
__fresh49:
  %argc_slot145 = alloca i32
  store i32 %argc144, i32* %argc_slot145
  %argv_slot143 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv142, { i32, [ 0 x i8* ] }** %argv_slot143
  %mem_ptr146 = call i32* @oat_malloc ( i32 8 )
  %obj147 = bitcast i32* %mem_ptr146 to %A* 
  %new_obj148 = call %A* @_A_ctor ( %A* %obj147 )
  %vdecl_slot149 = alloca %A*
  store %A* %new_obj148, %A** %vdecl_slot149
  %lhs_or_call150 = load %A** %vdecl_slot149
  %vtmp152 = getelementptr %A* %lhs_or_call150, i32 0, i32 0
  %vtable151 = load %_A_vtable** %vtmp152
  %fptmp153 = getelementptr %_A_vtable* %vtable151, i32 0, i32 3
  %method154 = load void (%A*)** %fptmp153
  call void %method154( %A* %lhs_or_call150 )
  ret i32 0
}


define void @_A_g (%A* %_this1){
__fresh48:
  call void @print_string( i8* @_const_str23 )
  ret void
}


define void @_A_f (%A* %_this1){
__fresh47:
  ret void
}


define %A* @_A_ctor (%A* %_this1){
__fresh46:
  %cast_op138 = bitcast %A* %_this1 to %Object* 
  %dummy139 = call %Object* @_Object_ctor ( %Object* %cast_op138 )
  %path140 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str22, i8** %path140
  %vt_slot141 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable20, %_A_vtable** %vt_slot141
  ret %A* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh45:
  %path136 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call137 = load i8** %path136
  ret i8* %lhs_or_call137
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh44:
  %path134 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str21, i8** %path134
  %vt_slot135 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable19, %_Object_vtable** %vt_slot135
  ret %Object* %_this1
}


