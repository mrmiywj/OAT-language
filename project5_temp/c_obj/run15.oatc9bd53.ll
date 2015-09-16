%B = type { %_B_vtable*, i8*, i8* }
%_B_vtable = type { %_A_vtable*, i8* (%Object*)* }
%A = type { %_A_vtable*, i8*, i8* }
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
@_const_str96.str. = private unnamed_addr constant [ 2 x i8 ] c "B\00", align 4
@_const_str96 = alias bitcast([ 2 x i8 ]* @_const_str96.str. to i8*)@_const_str95.str. = private unnamed_addr constant [ 4 x i8 ] c "str\00", align 4
@_const_str95 = alias bitcast([ 4 x i8 ]* @_const_str95.str. to i8*)@_const_str94.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str94 = alias bitcast([ 2 x i8 ]* @_const_str94.str. to i8*)@_const_str93.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str93 = alias bitcast([ 7 x i8 ]* @_const_str93.str. to i8*)@_B_vtable92 = private constant %_B_vtable {%_A_vtable* @_A_vtable91, i8* (%Object*)* @_Object_get_name}, align 4
@_A_vtable91 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable90, i8* (%Object*)* @_Object_get_name}, align 4
@_Object_vtable90 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh165:
  ret void
}


define i32 @program (i32 %argc542, { i32, [ 0 x i8* ] }* %argv540){
__fresh164:
  %argc_slot543 = alloca i32
  store i32 %argc542, i32* %argc_slot543
  %argv_slot541 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv540, { i32, [ 0 x i8* ] }** %argv_slot541
  %mem_ptr544 = call i32* @oat_malloc ( i32 12 )
  %obj545 = bitcast i32* %mem_ptr544 to %B* 
  %new_obj546 = call %B* @_B_ctor ( %B* %obj545 )
  %vdecl_slot547 = alloca %B*
  store %B* %new_obj546, %B** %vdecl_slot547
  %lhs_or_call548 = load %B** %vdecl_slot547
  %path549 = getelementptr %B* %lhs_or_call548, i32 0, i32 2
  %lhs_or_call550 = load i8** %path549
  call void @print_string( i8* %lhs_or_call550 )
  ret i32 0
}


define %B* @_B_ctor (%B* %_this1){
__fresh163:
  %cast_op536 = bitcast %B* %_this1 to %A* 
  %dummy537 = call %A* @_A_ctor ( %A* %cast_op536 )
  %path538 = getelementptr %B* %_this1, i32 0, i32 1
  store i8* @_const_str96, i8** %path538
  %vt_slot539 = getelementptr %B* %_this1, i32 0, i32 0
  store %_B_vtable* @_B_vtable92, %_B_vtable** %vt_slot539
  ret %B* %_this1
}


define %A* @_A_ctor (%A* %_this1){
__fresh162:
  %cast_op531 = bitcast %A* %_this1 to %Object* 
  %dummy532 = call %Object* @_Object_ctor ( %Object* %cast_op531 )
  %path533 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str94, i8** %path533
  %path534 = getelementptr %A* %_this1, i32 0, i32 2
  store i8* @_const_str95, i8** %path534
  %vt_slot535 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable91, %_A_vtable** %vt_slot535
  ret %A* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh161:
  %path529 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call530 = load i8** %path529
  ret i8* %lhs_or_call530
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh160:
  %path527 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str93, i8** %path527
  %vt_slot528 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable90, %_Object_vtable** %vt_slot528
  ret %Object* %_this1
}


