%A = type { %_A_vtable*, i8*, i8* }
%_A_vtable = type { %_Object_vtable*, i8* (%Object*)*, i8* (%A*)* }
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
@_const_str73.str. = private unnamed_addr constant [ 6 x i8 ] c "hello\00", align 4
@_const_str73 = alias bitcast([ 6 x i8 ]* @_const_str73.str. to i8*)@_const_str72.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str72 = alias bitcast([ 2 x i8 ]* @_const_str72.str. to i8*)@_const_str71.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str71 = alias bitcast([ 7 x i8 ]* @_const_str71.str. to i8*)@_A_vtable70 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable69, i8* (%Object*)* @_Object_get_name, i8* (%A*)* @_A_f}, align 4
@_Object_vtable69 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh126:
  ret void
}


define i32 @program (i32 %argc418, { i32, [ 0 x i8* ] }* %argv416){
__fresh123:
  %argc_slot419 = alloca i32
  store i32 %argc418, i32* %argc_slot419
  %argv_slot417 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv416, { i32, [ 0 x i8* ] }** %argv_slot417
  %mem_ptr420 = call i32* @oat_malloc ( i32 12 )
  %obj421 = bitcast i32* %mem_ptr420 to %A* 
  %new_obj422 = call %A* @_A_ctor ( %A* %obj421 )
  %vdecl_slot423 = alloca %A*
  store %A* %new_obj422, %A** %vdecl_slot423
  %lhs_or_call424 = load %A** %vdecl_slot423
  %vtmp426 = getelementptr %A* %lhs_or_call424, i32 0, i32 0
  %vtable425 = load %_A_vtable** %vtmp426
  %fptmp427 = getelementptr %_A_vtable* %vtable425, i32 0, i32 2
  %method428 = load i8* (%A*)** %fptmp427
  %ret429 = call i8* %method428 ( %A* %lhs_or_call424 )
  %ifnull_slot430 = alloca i8*
  store i8* %ret429, i8** %ifnull_slot430
  %ifnull_guard431 = icmp ne i8* %ret429, null
  br i1 %ifnull_guard431, label %__then122, label %__else121

__fresh124:
  br label %__then122

__then122:
  %lhs_or_call432 = load i8** %ifnull_slot430
  call void @print_string( i8* %lhs_or_call432 )
  br label %__merge120

__fresh125:
  br label %__else121

__else121:
  br label %__merge120

__merge120:
  ret i32 0
}


define i8* @_A_f (%A* %_this1){
__fresh119:
  %path413 = getelementptr %A* %_this1, i32 0, i32 2
  store i8* @_const_str73, i8** %path413
  %path414 = getelementptr %A* %_this1, i32 0, i32 2
  %lhs_or_call415 = load i8** %path414
  ret i8* %lhs_or_call415
}


define %A* @_A_ctor (%A* %_this1){
__fresh118:
  %cast_op409 = bitcast %A* %_this1 to %Object* 
  %dummy410 = call %Object* @_Object_ctor ( %Object* %cast_op409 )
  %path411 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str72, i8** %path411
  %vt_slot412 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable70, %_A_vtable** %vt_slot412
  ret %A* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh117:
  %path407 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call408 = load i8** %path407
  ret i8* %lhs_or_call408
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh116:
  %path405 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str71, i8** %path405
  %vt_slot406 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable69, %_Object_vtable** %vt_slot406
  ret %Object* %_this1
}


