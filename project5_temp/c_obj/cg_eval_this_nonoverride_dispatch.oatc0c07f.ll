%C = type { %_C_vtable*, i8* }
%_C_vtable = type { %_B_vtable*, i8* (%Object*)*, i32 (%B*, i32)*, i32 (%A*, i32)*, i32 (%C*)*, i32 (%C*, i32)* }
%B = type { %_B_vtable*, i8* }
%_B_vtable = type { %_A_vtable*, i8* (%Object*)*, i32 (%B*, i32)*, i32 (%A*, i32)*, i32 (%B*)* }
%A = type { %_A_vtable*, i8* }
%_A_vtable = type { %_Object_vtable*, i8* (%Object*)*, i32 (%A*, i32)*, i32 (%A*, i32)*, i32 (%A*)* }
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
@a473 = global %A* zeroinitializer, align 4		; initialized by @a473.init474
@_const_str472.str. = private unnamed_addr constant [ 2 x i8 ] c "C\00", align 4
@_const_str472 = alias bitcast([ 2 x i8 ]* @_const_str472.str. to i8*)@_const_str471.str. = private unnamed_addr constant [ 2 x i8 ] c "B\00", align 4
@_const_str471 = alias bitcast([ 2 x i8 ]* @_const_str471.str. to i8*)@_const_str470.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str470 = alias bitcast([ 2 x i8 ]* @_const_str470.str. to i8*)@_const_str469.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str469 = alias bitcast([ 7 x i8 ]* @_const_str469.str. to i8*)@_C_vtable468 = private constant %_C_vtable {%_B_vtable* @_B_vtable467, i8* (%Object*)* @_Object_get_name, i32 (%B*, i32)* @_B_over, i32 (%A*, i32)* @_A_foo, i32 (%C*)* @_C_call, i32 (%C*, i32)* @_C_notover}, align 4
@_B_vtable467 = private constant %_B_vtable {%_A_vtable* @_A_vtable466, i8* (%Object*)* @_Object_get_name, i32 (%B*, i32)* @_B_over, i32 (%A*, i32)* @_A_foo, i32 (%B*)* @_B_call}, align 4
@_A_vtable466 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable465, i8* (%Object*)* @_Object_get_name, i32 (%A*, i32)* @_A_over, i32 (%A*, i32)* @_A_foo, i32 (%A*)* @_A_call}, align 4
@_Object_vtable465 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh740:
  call void @a473.init474(  )
  ret void
}


define i32 @program (i32 %argc2627, { i32, [ 0 x i8* ] }* %argv2625){
__fresh739:
  %argc_slot2628 = alloca i32
  store i32 %argc2627, i32* %argc_slot2628
  %argv_slot2626 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv2625, { i32, [ 0 x i8* ] }** %argv_slot2626
  %lhs_or_call2629 = load %A** @a473
  %vtmp2631 = getelementptr %A* %lhs_or_call2629, i32 0, i32 0
  %vtable2630 = load %_A_vtable** %vtmp2631
  %fptmp2632 = getelementptr %_A_vtable* %vtable2630, i32 0, i32 4
  %method2633 = load i32 (%A*)** %fptmp2632
  %ret2634 = call i32 %method2633 ( %A* %lhs_or_call2629 )
  ret i32 %ret2634
}


define void @a473.init474 (){
__fresh738:
  %mem_ptr2621 = call i32* @oat_malloc ( i32 8 )
  %obj2622 = bitcast i32* %mem_ptr2621 to %C* 
  %new_obj2623 = call %C* @_C_ctor ( %C* %obj2622 )
  %cast_op2624 = bitcast %C* %new_obj2623 to %A* 
  store %A* %cast_op2624, %A** @a473
  ret void
}


define i32 @_C_call (%C* %_this1){
__fresh737:
  %vtmp2616 = getelementptr %C* %_this1, i32 0, i32 0
  %vtable2615 = load %_C_vtable** %vtmp2616
  %fptmp2617 = getelementptr %_C_vtable* %vtable2615, i32 0, i32 3
  %method2618 = load i32 (%A*, i32)** %fptmp2617
  %cast_op2619 = bitcast %C* %_this1 to %A* 
  %ret2620 = call i32 %method2618 ( %A* %cast_op2619, i32 3 )
  ret i32 %ret2620
}


define i32 @_C_notover (%C* %_this1, i32 %x2611){
__fresh736:
  %x_slot2612 = alloca i32
  store i32 %x2611, i32* %x_slot2612
  %lhs_or_call2613 = load i32* %x_slot2612
  %bop2614 = add i32 %lhs_or_call2613, 1
  ret i32 %bop2614
}


define %C* @_C_ctor (%C* %_this1){
__fresh735:
  %cast_op2607 = bitcast %C* %_this1 to %B* 
  %dummy2608 = call %B* @_B_ctor ( %B* %cast_op2607 )
  %path2609 = getelementptr %C* %_this1, i32 0, i32 1
  store i8* @_const_str472, i8** %path2609
  %vt_slot2610 = getelementptr %C* %_this1, i32 0, i32 0
  store %_C_vtable* @_C_vtable468, %_C_vtable** %vt_slot2610
  ret %C* %_this1
}


define i32 @_B_call (%B* %_this1){
__fresh734:
  ret i32 0
}


define i32 @_B_over (%B* %_this1, i32 %x2603){
__fresh733:
  %x_slot2604 = alloca i32
  store i32 %x2603, i32* %x_slot2604
  %lhs_or_call2605 = load i32* %x_slot2604
  %bop2606 = add i32 %lhs_or_call2605, 2
  ret i32 %bop2606
}


define %B* @_B_ctor (%B* %_this1){
__fresh732:
  %cast_op2599 = bitcast %B* %_this1 to %A* 
  %dummy2600 = call %A* @_A_ctor ( %A* %cast_op2599 )
  %path2601 = getelementptr %B* %_this1, i32 0, i32 1
  store i8* @_const_str471, i8** %path2601
  %vt_slot2602 = getelementptr %B* %_this1, i32 0, i32 0
  store %_B_vtable* @_B_vtable467, %_B_vtable** %vt_slot2602
  ret %B* %_this1
}


define i32 @_A_call (%A* %_this1){
__fresh731:
  ret i32 0
}


define i32 @_A_foo (%A* %_this1, i32 %x2595){
__fresh730:
  %x_slot2596 = alloca i32
  store i32 %x2595, i32* %x_slot2596
  %lhs_or_call2597 = load i32* %x_slot2596
  %bop2598 = add i32 %lhs_or_call2597, 8
  ret i32 %bop2598
}


define i32 @_A_over (%A* %_this1, i32 %x2591){
__fresh729:
  %x_slot2592 = alloca i32
  store i32 %x2591, i32* %x_slot2592
  %lhs_or_call2593 = load i32* %x_slot2592
  %bop2594 = add i32 %lhs_or_call2593, 1
  ret i32 %bop2594
}


define %A* @_A_ctor (%A* %_this1){
__fresh728:
  %cast_op2587 = bitcast %A* %_this1 to %Object* 
  %dummy2588 = call %Object* @_Object_ctor ( %Object* %cast_op2587 )
  %path2589 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str470, i8** %path2589
  %vt_slot2590 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable466, %_A_vtable** %vt_slot2590
  ret %A* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh727:
  %path2585 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call2586 = load i8** %path2585
  ret i8* %lhs_or_call2586
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh726:
  %path2583 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str469, i8** %path2583
  %vt_slot2584 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable465, %_Object_vtable** %vt_slot2584
  ret %Object* %_this1
}


