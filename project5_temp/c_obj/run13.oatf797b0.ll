%B = type { %_B_vtable*, i8*, i1 }
%_B_vtable = type { %_A_vtable*, i8* (%Object*)* }
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
@_const_str83.str. = private unnamed_addr constant [ 2 x i8 ] c "B\00", align 4
@_const_str83 = alias bitcast([ 2 x i8 ]* @_const_str83.str. to i8*)@_const_str82.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str82 = alias bitcast([ 2 x i8 ]* @_const_str82.str. to i8*)@_const_str81.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str81 = alias bitcast([ 7 x i8 ]* @_const_str81.str. to i8*)@_B_vtable80 = private constant %_B_vtable {%_A_vtable* @_A_vtable79, i8* (%Object*)* @_Object_get_name}, align 4
@_A_vtable79 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable78, i8* (%Object*)* @_Object_get_name}, align 4
@_Object_vtable78 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh153:
  ret void
}


define i32 @program (i32 %argc492, { i32, [ 0 x i8* ] }* %argv490){
__fresh150:
  %argc_slot493 = alloca i32
  store i32 %argc492, i32* %argc_slot493
  %argv_slot491 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv490, { i32, [ 0 x i8* ] }** %argv_slot491
  %mem_ptr494 = call i32* @oat_malloc ( i32 12 )
  %obj495 = bitcast i32* %mem_ptr494 to %B* 
  %new_obj496 = call %B* @_B_ctor ( %B* %obj495 )
  %vdecl_slot497 = alloca %B*
  store %B* %new_obj496, %B** %vdecl_slot497
  %vdecl_slot498 = alloca i32
  store i32 0, i32* %vdecl_slot498
  %lhs_or_call499 = load %B** %vdecl_slot497
  %path500 = getelementptr %B* %lhs_or_call499, i32 0, i32 2
  %lhs_or_call501 = load i1* %path500
  br i1 %lhs_or_call501, label %__then149, label %__else148

__fresh151:
  br label %__then149

__then149:
  store i32 1, i32* %vdecl_slot498
  br label %__merge147

__fresh152:
  br label %__else148

__else148:
  store i32 0, i32* %vdecl_slot498
  br label %__merge147

__merge147:
  %lhs_or_call502 = load i32* %vdecl_slot498
  ret i32 %lhs_or_call502
}


define %B* @_B_ctor (%B* %_this1){
__fresh146:
  %cast_op486 = bitcast %B* %_this1 to %A* 
  %dummy487 = call %A* @_A_ctor ( %A* %cast_op486 )
  %path488 = getelementptr %B* %_this1, i32 0, i32 1
  store i8* @_const_str83, i8** %path488
  %vt_slot489 = getelementptr %B* %_this1, i32 0, i32 0
  store %_B_vtable* @_B_vtable80, %_B_vtable** %vt_slot489
  ret %B* %_this1
}


define %A* @_A_ctor (%A* %_this1){
__fresh145:
  %cast_op481 = bitcast %A* %_this1 to %Object* 
  %dummy482 = call %Object* @_Object_ctor ( %Object* %cast_op481 )
  %path483 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str82, i8** %path483
  %vt_slot484 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable79, %_A_vtable** %vt_slot484
  %path485 = getelementptr %A* %_this1, i32 0, i32 2
  store i1 1, i1* %path485
  ret %A* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh144:
  %path479 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call480 = load i8** %path479
  ret i8* %lhs_or_call480
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh143:
  %path477 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str81, i8** %path477
  %vt_slot478 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable78, %_Object_vtable** %vt_slot478
  ret %Object* %_this1
}


