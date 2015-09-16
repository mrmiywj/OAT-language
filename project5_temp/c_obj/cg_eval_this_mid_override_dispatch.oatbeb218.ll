%C = type { %_C_vtable*, i8* }
%_C_vtable = type { %_B_vtable*, i8* (%Object*)*, i32 (%B*, i32)*, i32 (%C*, i32)*, i32 (%C*)* }
%B = type { %_B_vtable*, i8* }
%_B_vtable = type { %_A_vtable*, i8* (%Object*)*, i32 (%B*, i32)* }
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
@_const_str464.str. = private unnamed_addr constant [ 2 x i8 ] c "C\00", align 4
@_const_str464 = alias bitcast([ 2 x i8 ]* @_const_str464.str. to i8*)@_const_str463.str. = private unnamed_addr constant [ 2 x i8 ] c "B\00", align 4
@_const_str463 = alias bitcast([ 2 x i8 ]* @_const_str463.str. to i8*)@_const_str462.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str462 = alias bitcast([ 2 x i8 ]* @_const_str462.str. to i8*)@_const_str461.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str461 = alias bitcast([ 7 x i8 ]* @_const_str461.str. to i8*)@_C_vtable460 = private constant %_C_vtable {%_B_vtable* @_B_vtable459, i8* (%Object*)* @_Object_get_name, i32 (%B*, i32)* @_B_over, i32 (%C*, i32)* @_C_notover, i32 (%C*)* @_C_call}, align 4
@_B_vtable459 = private constant %_B_vtable {%_A_vtable* @_A_vtable458, i8* (%Object*)* @_Object_get_name, i32 (%B*, i32)* @_B_over}, align 4
@_A_vtable458 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable457, i8* (%Object*)* @_Object_get_name, i32 (%A*, i32)* @_A_over}, align 4
@_Object_vtable457 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh725:
  ret void
}


define i32 @program (i32 %argc2571, { i32, [ 0 x i8* ] }* %argv2569){
__fresh724:
  %argc_slot2572 = alloca i32
  store i32 %argc2571, i32* %argc_slot2572
  %argv_slot2570 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv2569, { i32, [ 0 x i8* ] }** %argv_slot2570
  %mem_ptr2573 = call i32* @oat_malloc ( i32 8 )
  %obj2574 = bitcast i32* %mem_ptr2573 to %C* 
  %new_obj2575 = call %C* @_C_ctor ( %C* %obj2574 )
  %vdecl_slot2576 = alloca %C*
  store %C* %new_obj2575, %C** %vdecl_slot2576
  %lhs_or_call2577 = load %C** %vdecl_slot2576
  %vtmp2579 = getelementptr %C* %lhs_or_call2577, i32 0, i32 0
  %vtable2578 = load %_C_vtable** %vtmp2579
  %fptmp2580 = getelementptr %_C_vtable* %vtable2578, i32 0, i32 4
  %method2581 = load i32 (%C*)** %fptmp2580
  %ret2582 = call i32 %method2581 ( %C* %lhs_or_call2577 )
  ret i32 %ret2582
}


define i32 @_C_call (%C* %_this1){
__fresh723:
  %vtmp2564 = getelementptr %C* %_this1, i32 0, i32 0
  %vtable2563 = load %_C_vtable** %vtmp2564
  %fptmp2565 = getelementptr %_C_vtable* %vtable2563, i32 0, i32 2
  %method2566 = load i32 (%B*, i32)** %fptmp2565
  %cast_op2567 = bitcast %C* %_this1 to %B* 
  %ret2568 = call i32 %method2566 ( %B* %cast_op2567, i32 3 )
  ret i32 %ret2568
}


define i32 @_C_notover (%C* %_this1, i32 %x2559){
__fresh722:
  %x_slot2560 = alloca i32
  store i32 %x2559, i32* %x_slot2560
  %lhs_or_call2561 = load i32* %x_slot2560
  %bop2562 = add i32 %lhs_or_call2561, 1
  ret i32 %bop2562
}


define %C* @_C_ctor (%C* %_this1){
__fresh721:
  %cast_op2555 = bitcast %C* %_this1 to %B* 
  %dummy2556 = call %B* @_B_ctor ( %B* %cast_op2555 )
  %path2557 = getelementptr %C* %_this1, i32 0, i32 1
  store i8* @_const_str464, i8** %path2557
  %vt_slot2558 = getelementptr %C* %_this1, i32 0, i32 0
  store %_C_vtable* @_C_vtable460, %_C_vtable** %vt_slot2558
  ret %C* %_this1
}


define i32 @_B_over (%B* %_this1, i32 %x2551){
__fresh720:
  %x_slot2552 = alloca i32
  store i32 %x2551, i32* %x_slot2552
  %lhs_or_call2553 = load i32* %x_slot2552
  %bop2554 = add i32 %lhs_or_call2553, 2
  ret i32 %bop2554
}


define %B* @_B_ctor (%B* %_this1){
__fresh719:
  %cast_op2547 = bitcast %B* %_this1 to %A* 
  %dummy2548 = call %A* @_A_ctor ( %A* %cast_op2547 )
  %path2549 = getelementptr %B* %_this1, i32 0, i32 1
  store i8* @_const_str463, i8** %path2549
  %vt_slot2550 = getelementptr %B* %_this1, i32 0, i32 0
  store %_B_vtable* @_B_vtable459, %_B_vtable** %vt_slot2550
  ret %B* %_this1
}


define i32 @_A_over (%A* %_this1, i32 %x2543){
__fresh718:
  %x_slot2544 = alloca i32
  store i32 %x2543, i32* %x_slot2544
  %lhs_or_call2545 = load i32* %x_slot2544
  %bop2546 = add i32 %lhs_or_call2545, 1
  ret i32 %bop2546
}


define %A* @_A_ctor (%A* %_this1){
__fresh717:
  %cast_op2539 = bitcast %A* %_this1 to %Object* 
  %dummy2540 = call %Object* @_Object_ctor ( %Object* %cast_op2539 )
  %path2541 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str462, i8** %path2541
  %vt_slot2542 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable458, %_A_vtable** %vt_slot2542
  ret %A* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh716:
  %path2537 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call2538 = load i8** %path2537
  ret i8* %lhs_or_call2538
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh715:
  %path2535 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str461, i8** %path2535
  %vt_slot2536 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable457, %_Object_vtable** %vt_slot2536
  ret %Object* %_this1
}


