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
@_const_str89.str. = private unnamed_addr constant [ 2 x i8 ] c "B\00", align 4
@_const_str89 = alias bitcast([ 2 x i8 ]* @_const_str89.str. to i8*)@_const_str88.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str88 = alias bitcast([ 2 x i8 ]* @_const_str88.str. to i8*)@_const_str87.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str87 = alias bitcast([ 7 x i8 ]* @_const_str87.str. to i8*)@_B_vtable86 = private constant %_B_vtable {%_A_vtable* @_A_vtable85, i8* (%Object*)* @_Object_get_name}, align 4
@_A_vtable85 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable84, i8* (%Object*)* @_Object_get_name}, align 4
@_Object_vtable84 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh159:
  ret void
}


define i32 @program (i32 %argc518, { i32, [ 0 x i8* ] }* %argv516){
__fresh158:
  %argc_slot519 = alloca i32
  store i32 %argc518, i32* %argc_slot519
  %argv_slot517 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv516, { i32, [ 0 x i8* ] }** %argv_slot517
  %mem_ptr520 = call i32* @oat_malloc ( i32 12 )
  %obj521 = bitcast i32* %mem_ptr520 to %B* 
  %new_obj522 = call %B* @_B_ctor ( %B* %obj521 )
  %vdecl_slot523 = alloca %B*
  store %B* %new_obj522, %B** %vdecl_slot523
  %lhs_or_call524 = load %B** %vdecl_slot523
  %path525 = getelementptr %B* %lhs_or_call524, i32 0, i32 2
  %lhs_or_call526 = load i32* %path525
  ret i32 %lhs_or_call526
}


define %B* @_B_ctor (%B* %_this1){
__fresh157:
  %cast_op512 = bitcast %B* %_this1 to %A* 
  %dummy513 = call %A* @_A_ctor ( %A* %cast_op512 )
  %path514 = getelementptr %B* %_this1, i32 0, i32 1
  store i8* @_const_str89, i8** %path514
  %vt_slot515 = getelementptr %B* %_this1, i32 0, i32 0
  store %_B_vtable* @_B_vtable86, %_B_vtable** %vt_slot515
  ret %B* %_this1
}


define %A* @_A_ctor (%A* %_this1){
__fresh156:
  %cast_op507 = bitcast %A* %_this1 to %Object* 
  %dummy508 = call %Object* @_Object_ctor ( %Object* %cast_op507 )
  %path509 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str88, i8** %path509
  %vt_slot510 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable85, %_A_vtable** %vt_slot510
  %path511 = getelementptr %A* %_this1, i32 0, i32 2
  store i32 10, i32* %path511
  ret %A* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh155:
  %path505 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call506 = load i8** %path505
  ret i8* %lhs_or_call506
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh154:
  %path503 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str87, i8** %path503
  %vt_slot504 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable84, %_Object_vtable** %vt_slot504
  ret %Object* %_this1
}


