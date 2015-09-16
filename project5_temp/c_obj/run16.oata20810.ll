%B = type { %_B_vtable*, i8*, { i32, [ 0 x i32 ] }* }
%_B_vtable = type { %_A_vtable*, i8* (%Object*)* }
%A = type { %_A_vtable*, i8*, { i32, [ 0 x i32 ] }* }
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
@_const_str102.str. = private unnamed_addr constant [ 2 x i8 ] c "B\00", align 4
@_const_str102 = alias bitcast([ 2 x i8 ]* @_const_str102.str. to i8*)@_const_str101.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str101 = alias bitcast([ 2 x i8 ]* @_const_str101.str. to i8*)@_const_str100.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str100 = alias bitcast([ 7 x i8 ]* @_const_str100.str. to i8*)@_B_vtable99 = private constant %_B_vtable {%_A_vtable* @_A_vtable98, i8* (%Object*)* @_Object_get_name}, align 4
@_A_vtable98 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable97, i8* (%Object*)* @_Object_get_name}, align 4
@_Object_vtable97 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh176:
  ret void
}


define i32 @program (i32 %argc581, { i32, [ 0 x i8* ] }* %argv579){
__fresh175:
  %argc_slot582 = alloca i32
  store i32 %argc581, i32* %argc_slot582
  %argv_slot580 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv579, { i32, [ 0 x i8* ] }** %argv_slot580
  %mem_ptr583 = call i32* @oat_malloc ( i32 12 )
  %obj584 = bitcast i32* %mem_ptr583 to %B* 
  %new_obj585 = call %B* @_B_ctor ( %B* %obj584 )
  %vdecl_slot586 = alloca %B*
  store %B* %new_obj585, %B** %vdecl_slot586
  %lhs_or_call587 = load %B** %vdecl_slot586
  %path588 = getelementptr %B* %lhs_or_call587, i32 0, i32 2
  %lhs_or_call589 = load { i32, [ 0 x i32 ] }** %path588
  %ret590 = call i8* @string_of_array ( { i32, [ 0 x i32 ] }* %lhs_or_call589 )
  call void @print_string( i8* %ret590 )
  ret i32 0
}


define %B* @_B_ctor (%B* %_this1){
__fresh174:
  %cast_op575 = bitcast %B* %_this1 to %A* 
  %dummy576 = call %A* @_A_ctor ( %A* %cast_op575 )
  %path577 = getelementptr %B* %_this1, i32 0, i32 1
  store i8* @_const_str102, i8** %path577
  %vt_slot578 = getelementptr %B* %_this1, i32 0, i32 0
  store %_B_vtable* @_B_vtable99, %_B_vtable** %vt_slot578
  ret %B* %_this1
}


define %A* @_A_ctor (%A* %_this1){
__fresh171:
  %cast_op555 = bitcast %A* %_this1 to %Object* 
  %dummy556 = call %Object* @_Object_ctor ( %Object* %cast_op555 )
  %path557 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str101, i8** %path557
  %path558 = getelementptr %A* %_this1, i32 0, i32 2
  %array_ptr559 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 10 )
  %array560 = bitcast { i32, [ 0 x i32 ] }* %array_ptr559 to { i32, [ 0 x i32 ] }* 
  %_tmp100561 = alloca i32
  store i32 10, i32* %_tmp100561
  %_tmp101562 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array560, { i32, [ 0 x i32 ] }** %_tmp101562
  %vdecl_slot563 = alloca i32
  store i32 0, i32* %vdecl_slot563
  br label %__cond170

__cond170:
  %lhs_or_call564 = load i32* %vdecl_slot563
  %lhs_or_call565 = load i32* %_tmp100561
  %bop566 = icmp slt i32 %lhs_or_call564, %lhs_or_call565
  br i1 %bop566, label %__body169, label %__post168

__fresh172:
  br label %__body169

__body169:
  %lhs_or_call567 = load { i32, [ 0 x i32 ] }** %_tmp101562
  %lhs_or_call568 = load i32* %vdecl_slot563
  %bound_ptr570 = getelementptr { i32, [ 0 x i32 ] }* %lhs_or_call567, i32 0, i32 0
  %bound571 = load i32* %bound_ptr570
  call void @oat_array_bounds_check( i32 %bound571, i32 %lhs_or_call568 )
  %elt569 = getelementptr { i32, [ 0 x i32 ] }* %lhs_or_call567, i32 0, i32 1, i32 %lhs_or_call568
  store i32 110, i32* %elt569
  %lhs_or_call572 = load i32* %vdecl_slot563
  %bop573 = add i32 %lhs_or_call572, 1
  store i32 %bop573, i32* %vdecl_slot563
  br label %__cond170

__fresh173:
  br label %__post168

__post168:
  store { i32, [ 0 x i32 ] }* %array560, { i32, [ 0 x i32 ] }** %path558
  %vt_slot574 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable98, %_A_vtable** %vt_slot574
  ret %A* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh167:
  %path553 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call554 = load i8** %path553
  ret i8* %lhs_or_call554
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh166:
  %path551 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str100, i8** %path551
  %vt_slot552 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable97, %_Object_vtable** %vt_slot552
  ret %Object* %_this1
}


