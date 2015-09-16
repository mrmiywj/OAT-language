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
@o26 = global %Object* zeroinitializer, align 4		; initialized by @o26.init27
@_const_str25.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str25 = alias bitcast([ 7 x i8 ]* @_const_str25.str. to i8*)@_Object_vtable24 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh56:
  call void @o26.init27(  )
  ret void
}


define i32 @program (i32 %argc168, { i32, [ 0 x i8* ] }* %argv166){
__fresh55:
  %argc_slot169 = alloca i32
  store i32 %argc168, i32* %argc_slot169
  %argv_slot167 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv166, { i32, [ 0 x i8* ] }** %argv_slot167
  %mem_ptr170 = call i32* @oat_malloc ( i32 8 )
  %obj171 = bitcast i32* %mem_ptr170 to %Object* 
  %new_obj172 = call %Object* @_Object_ctor ( %Object* %obj171 )
  %vdecl_slot173 = alloca %Object*
  store %Object* %new_obj172, %Object** %vdecl_slot173
  call void @f(  )
  ret i32 0
}


define void @f (){
__fresh54:
  %mem_ptr162 = call i32* @oat_malloc ( i32 8 )
  %obj163 = bitcast i32* %mem_ptr162 to %Object* 
  %new_obj164 = call %Object* @_Object_ctor ( %Object* %obj163 )
  %vdecl_slot165 = alloca %Object*
  store %Object* %new_obj164, %Object** %vdecl_slot165
  ret void
}


define void @o26.init27 (){
__fresh53:
  %mem_ptr159 = call i32* @oat_malloc ( i32 8 )
  %obj160 = bitcast i32* %mem_ptr159 to %Object* 
  %new_obj161 = call %Object* @_Object_ctor ( %Object* %obj160 )
  store %Object* %new_obj161, %Object** @o26
  ret void
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh52:
  %path157 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call158 = load i8** %path157
  ret i8* %lhs_or_call158
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh51:
  %path155 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str25, i8** %path155
  %vt_slot156 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable24, %_Object_vtable** %vt_slot156
  ret %Object* %_this1
}


