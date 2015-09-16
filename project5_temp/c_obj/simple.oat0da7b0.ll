%A = type { %_A_vtable*, i8*, i32 }
%_A_vtable = type { %_Object_vtable*, i8* (%Object*)*, void (%A*)* }
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
@a50 = global %A* zeroinitializer, align 4		; initialized by @a50.init51
@_const_str49.str. = private unnamed_addr constant [ 6 x i8 ] c "A: x=\00", align 4
@_const_str49 = alias bitcast([ 6 x i8 ]* @_const_str49.str. to i8*)@_const_str48.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str48 = alias bitcast([ 2 x i8 ]* @_const_str48.str. to i8*)@_const_str47.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str47 = alias bitcast([ 7 x i8 ]* @_const_str47.str. to i8*)@_A_vtable46 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable45, i8* (%Object*)* @_Object_get_name, void (%A*)* @_A_print}, align 4
@_Object_vtable45 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh93:
  call void @a50.init51(  )
  ret void
}


define i32 @program (i32 %argc294, { i32, [ 0 x i8* ] }* %argv292){
__fresh92:
  %argc_slot295 = alloca i32
  store i32 %argc294, i32* %argc_slot295
  %argv_slot293 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv292, { i32, [ 0 x i8* ] }** %argv_slot293
  %lhs_or_call296 = load %A** @a50
  %vtmp298 = getelementptr %A* %lhs_or_call296, i32 0, i32 0
  %vtable297 = load %_A_vtable** %vtmp298
  %fptmp299 = getelementptr %_A_vtable* %vtable297, i32 0, i32 2
  %method300 = load void (%A*)** %fptmp299
  call void %method300( %A* %lhs_or_call296 )
  ret i32 0
}


define void @a50.init51 (){
__fresh91:
  %bop288 = add i32 1, 2
  %mem_ptr289 = call i32* @oat_malloc ( i32 12 )
  %obj290 = bitcast i32* %mem_ptr289 to %A* 
  %new_obj291 = call %A* @_A_ctor ( %A* %obj290, i32 %bop288 )
  store %A* %new_obj291, %A** @a50
  ret void
}


define void @_A_print (%A* %_this1){
__fresh90:
  %path284 = getelementptr %A* %_this1, i32 0, i32 2
  %lhs_or_call285 = load i32* %path284
  %ret286 = call i8* @string_of_int ( i32 %lhs_or_call285 )
  %ret287 = call i8* @string_cat ( i8* @_const_str49, i8* %ret286 )
  call void @print_string( i8* %ret287 )
  ret void
}


define %A* @_A_ctor (%A* %_this1, i32 %y276){
__fresh89:
  %y_slot277 = alloca i32
  store i32 %y276, i32* %y_slot277
  %cast_op278 = bitcast %A* %_this1 to %Object* 
  %dummy279 = call %Object* @_Object_ctor ( %Object* %cast_op278 )
  %path280 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str48, i8** %path280
  %path281 = getelementptr %A* %_this1, i32 0, i32 2
  %lhs_or_call282 = load i32* %y_slot277
  store i32 %lhs_or_call282, i32* %path281
  %vt_slot283 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable46, %_A_vtable** %vt_slot283
  ret %A* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh88:
  %path274 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call275 = load i8** %path274
  ret i8* %lhs_or_call275
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh87:
  %path272 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str47, i8** %path272
  %vt_slot273 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable45, %_Object_vtable** %vt_slot273
  ret %Object* %_this1
}


