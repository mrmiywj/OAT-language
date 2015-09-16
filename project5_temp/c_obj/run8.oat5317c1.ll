%A = type { %_A_vtable*, i8*, i32 }
%_A_vtable = type { %_Object_vtable*, i8* (%Object*)*, i32 (%A*)* }
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
@_const_str68.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str68 = alias bitcast([ 2 x i8 ]* @_const_str68.str. to i8*)@_const_str67.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str67 = alias bitcast([ 7 x i8 ]* @_const_str67.str. to i8*)@_A_vtable66 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable65, i8* (%Object*)* @_Object_get_name, i32 (%A*)* @_A_f}, align 4
@_Object_vtable65 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh115:
  ret void
}


define i32 @program (i32 %argc393, { i32, [ 0 x i8* ] }* %argv391){
__fresh114:
  %argc_slot394 = alloca i32
  store i32 %argc393, i32* %argc_slot394
  %argv_slot392 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv391, { i32, [ 0 x i8* ] }** %argv_slot392
  %mem_ptr395 = call i32* @oat_malloc ( i32 12 )
  %obj396 = bitcast i32* %mem_ptr395 to %A* 
  %new_obj397 = call %A* @_A_ctor ( %A* %obj396 )
  %vdecl_slot398 = alloca %A*
  store %A* %new_obj397, %A** %vdecl_slot398
  %lhs_or_call399 = load %A** %vdecl_slot398
  %vtmp401 = getelementptr %A* %lhs_or_call399, i32 0, i32 0
  %vtable400 = load %_A_vtable** %vtmp401
  %fptmp402 = getelementptr %_A_vtable* %vtable400, i32 0, i32 2
  %method403 = load i32 (%A*)** %fptmp402
  %ret404 = call i32 %method403 ( %A* %lhs_or_call399 )
  ret i32 %ret404
}


define i32 @_A_f (%A* %_this1){
__fresh113:
  %path388 = getelementptr %A* %_this1, i32 0, i32 2
  %lhs_or_call389 = load i32* %path388
  %bop390 = add i32 %lhs_or_call389, 1
  ret i32 %bop390
}


define %A* @_A_ctor (%A* %_this1){
__fresh112:
  %cast_op383 = bitcast %A* %_this1 to %Object* 
  %dummy384 = call %Object* @_Object_ctor ( %Object* %cast_op383 )
  %path385 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str68, i8** %path385
  %vt_slot386 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable66, %_A_vtable** %vt_slot386
  %path387 = getelementptr %A* %_this1, i32 0, i32 2
  store i32 0, i32* %path387
  ret %A* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh111:
  %path381 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call382 = load i8** %path381
  ret i8* %lhs_or_call382
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh110:
  %path379 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str67, i8** %path379
  %vt_slot380 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable65, %_Object_vtable** %vt_slot380
  ret %Object* %_this1
}


