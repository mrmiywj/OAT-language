%A = type { %_A_vtable*, i8*, { i32, [ 0 x i32 ] }* }
%_A_vtable = type { %_Object_vtable*, i8* (%Object*)*, { i32, [ 0 x i32 ] }* (%A*)* }
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
@_const_str77.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str77 = alias bitcast([ 2 x i8 ]* @_const_str77.str. to i8*)@_const_str76.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str76 = alias bitcast([ 7 x i8 ]* @_const_str76.str. to i8*)@_A_vtable75 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable74, i8* (%Object*)* @_Object_get_name, { i32, [ 0 x i32 ] }* (%A*)* @_A_f}, align 4
@_Object_vtable74 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh142:
  ret void
}


define i32 @program (i32 %argc461, { i32, [ 0 x i8* ] }* %argv459){
__fresh139:
  %argc_slot462 = alloca i32
  store i32 %argc461, i32* %argc_slot462
  %argv_slot460 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv459, { i32, [ 0 x i8* ] }** %argv_slot460
  %mem_ptr463 = call i32* @oat_malloc ( i32 12 )
  %obj464 = bitcast i32* %mem_ptr463 to %A* 
  %new_obj465 = call %A* @_A_ctor ( %A* %obj464 )
  %vdecl_slot466 = alloca %A*
  store %A* %new_obj465, %A** %vdecl_slot466
  %lhs_or_call467 = load %A** %vdecl_slot466
  %vtmp469 = getelementptr %A* %lhs_or_call467, i32 0, i32 0
  %vtable468 = load %_A_vtable** %vtmp469
  %fptmp470 = getelementptr %_A_vtable* %vtable468, i32 0, i32 2
  %method471 = load { i32, [ 0 x i32 ] }* (%A*)** %fptmp470
  %ret472 = call { i32, [ 0 x i32 ] }* %method471 ( %A* %lhs_or_call467 )
  %ifnull_slot473 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %ret472, { i32, [ 0 x i32 ] }** %ifnull_slot473
  %ifnull_guard474 = icmp ne { i32, [ 0 x i32 ] }* %ret472, null
  br i1 %ifnull_guard474, label %__then138, label %__else137

__fresh140:
  br label %__then138

__then138:
  %lhs_or_call475 = load { i32, [ 0 x i32 ] }** %ifnull_slot473
  %ret476 = call i8* @string_of_array ( { i32, [ 0 x i32 ] }* %lhs_or_call475 )
  call void @print_string( i8* %ret476 )
  br label %__merge136

__fresh141:
  br label %__else137

__else137:
  br label %__merge136

__merge136:
  ret i32 0
}


define { i32, [ 0 x i32 ] }* @_A_f (%A* %_this1){
__fresh133:
  %path441 = getelementptr %A* %_this1, i32 0, i32 2
  %array_ptr442 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 5 )
  %array443 = bitcast { i32, [ 0 x i32 ] }* %array_ptr442 to { i32, [ 0 x i32 ] }* 
  %_tmp75444 = alloca i32
  store i32 5, i32* %_tmp75444
  %_tmp76445 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array443, { i32, [ 0 x i32 ] }** %_tmp76445
  %vdecl_slot446 = alloca i32
  store i32 0, i32* %vdecl_slot446
  br label %__cond132

__cond132:
  %lhs_or_call447 = load i32* %vdecl_slot446
  %lhs_or_call448 = load i32* %_tmp75444
  %bop449 = icmp slt i32 %lhs_or_call447, %lhs_or_call448
  br i1 %bop449, label %__body131, label %__post130

__fresh134:
  br label %__body131

__body131:
  %lhs_or_call450 = load { i32, [ 0 x i32 ] }** %_tmp76445
  %lhs_or_call451 = load i32* %vdecl_slot446
  %bound_ptr453 = getelementptr { i32, [ 0 x i32 ] }* %lhs_or_call450, i32 0, i32 0
  %bound454 = load i32* %bound_ptr453
  call void @oat_array_bounds_check( i32 %bound454, i32 %lhs_or_call451 )
  %elt452 = getelementptr { i32, [ 0 x i32 ] }* %lhs_or_call450, i32 0, i32 1, i32 %lhs_or_call451
  store i32 110, i32* %elt452
  %lhs_or_call455 = load i32* %vdecl_slot446
  %bop456 = add i32 %lhs_or_call455, 1
  store i32 %bop456, i32* %vdecl_slot446
  br label %__cond132

__fresh135:
  br label %__post130

__post130:
  store { i32, [ 0 x i32 ] }* %array443, { i32, [ 0 x i32 ] }** %path441
  %path457 = getelementptr %A* %_this1, i32 0, i32 2
  %lhs_or_call458 = load { i32, [ 0 x i32 ] }** %path457
  ret { i32, [ 0 x i32 ] }* %lhs_or_call458
}


define %A* @_A_ctor (%A* %_this1){
__fresh129:
  %cast_op437 = bitcast %A* %_this1 to %Object* 
  %dummy438 = call %Object* @_Object_ctor ( %Object* %cast_op437 )
  %path439 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str77, i8** %path439
  %vt_slot440 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable75, %_A_vtable** %vt_slot440
  ret %A* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh128:
  %path435 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call436 = load i8** %path435
  ret i8* %lhs_or_call436
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh127:
  %path433 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str76, i8** %path433
  %vt_slot434 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable74, %_Object_vtable** %vt_slot434
  ret %Object* %_this1
}


