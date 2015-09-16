%B = type { %_B_vtable*, i8* }
%_B_vtable = type { %_A_vtable*, i8* (%Object*)*, i32 (%B*, i32)*, i32 (%B*)* }
%A = type { %_A_vtable*, i8* }
%_A_vtable = type { %_Object_vtable*, i8* (%Object*)*, i32 (%A*, i32)* }
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
@_const_str456.str. = private unnamed_addr constant [ 2 x i8 ] c "B\00", align 4
@_const_str456 = alias bitcast([ 2 x i8 ]* @_const_str456.str. to i8*)@_const_str455.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str455 = alias bitcast([ 2 x i8 ]* @_const_str455.str. to i8*)@_const_str454.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str454 = alias bitcast([ 7 x i8 ]* @_const_str454.str. to i8*)@_B_vtable453 = private constant %_B_vtable {%_A_vtable* @_A_vtable452, i8* (%Object*)* @_Object_get_name, i32 (%B*, i32)* @_B_over, i32 (%B*)* @_B_call}, align 4
@_A_vtable452 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable451, i8* (%Object*)* @_Object_get_name, i32 (%A*, i32)* @_A_over}, align 4
@_Object_vtable451 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh714:
  ret void
}


define i32 @program (i32 %argc2523, { i32, [ 0 x i8* ] }* %argv2521){
__fresh713:
  %argc_slot2524 = alloca i32
  store i32 %argc2523, i32* %argc_slot2524
  %argv_slot2522 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv2521, { i32, [ 0 x i8* ] }** %argv_slot2522
  %mem_ptr2525 = call i32* @oat_malloc ( i32 8 )
  %obj2526 = bitcast i32* %mem_ptr2525 to %B* 
  %new_obj2527 = call %B* @_B_ctor ( %B* %obj2526 )
  %vdecl_slot2528 = alloca %B*
  store %B* %new_obj2527, %B** %vdecl_slot2528
  %lhs_or_call2529 = load %B** %vdecl_slot2528
  %vtmp2531 = getelementptr %B* %lhs_or_call2529, i32 0, i32 0
  %vtable2530 = load %_B_vtable** %vtmp2531
  %fptmp2532 = getelementptr %_B_vtable* %vtable2530, i32 0, i32 3
  %method2533 = load i32 (%B*)** %fptmp2532
  %ret2534 = call i32 %method2533 ( %B* %lhs_or_call2529 )
  ret i32 %ret2534
}


define i32 @_B_call (%B* %_this1){
__fresh712:
  %vtmp2517 = getelementptr %B* %_this1, i32 0, i32 0
  %vtable2516 = load %_B_vtable** %vtmp2517
  %fptmp2518 = getelementptr %_B_vtable* %vtable2516, i32 0, i32 2
  %method2519 = load i32 (%B*, i32)** %fptmp2518
  %ret2520 = call i32 %method2519 ( %B* %_this1, i32 3 )
  ret i32 %ret2520
}


define i32 @_B_over (%B* %_this1, i32 %x2512){
__fresh711:
  %x_slot2513 = alloca i32
  store i32 %x2512, i32* %x_slot2513
  %lhs_or_call2514 = load i32* %x_slot2513
  %bop2515 = add i32 %lhs_or_call2514, 2
  ret i32 %bop2515
}


define %B* @_B_ctor (%B* %_this1){
__fresh710:
  %cast_op2508 = bitcast %B* %_this1 to %A* 
  %dummy2509 = call %A* @_A_ctor ( %A* %cast_op2508 )
  %path2510 = getelementptr %B* %_this1, i32 0, i32 1
  store i8* @_const_str456, i8** %path2510
  %vt_slot2511 = getelementptr %B* %_this1, i32 0, i32 0
  store %_B_vtable* @_B_vtable453, %_B_vtable** %vt_slot2511
  ret %B* %_this1
}


define i32 @_A_over (%A* %_this1, i32 %x2504){
__fresh709:
  %x_slot2505 = alloca i32
  store i32 %x2504, i32* %x_slot2505
  %lhs_or_call2506 = load i32* %x_slot2505
  %bop2507 = add i32 %lhs_or_call2506, 1
  ret i32 %bop2507
}


define %A* @_A_ctor (%A* %_this1){
__fresh708:
  %cast_op2500 = bitcast %A* %_this1 to %Object* 
  %dummy2501 = call %Object* @_Object_ctor ( %Object* %cast_op2500 )
  %path2502 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str455, i8** %path2502
  %vt_slot2503 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable452, %_A_vtable** %vt_slot2503
  ret %A* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh707:
  %path2498 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call2499 = load i8** %path2498
  ret i8* %lhs_or_call2499
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh706:
  %path2496 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str454, i8** %path2496
  %vt_slot2497 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable451, %_Object_vtable** %vt_slot2497
  ret %Object* %_this1
}


