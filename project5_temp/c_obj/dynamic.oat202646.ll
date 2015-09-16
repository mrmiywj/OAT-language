%Owl = type { %_Owl_vtable*, i8* }
%_Owl_vtable = type { %_Wl_vtable*, i8* (%Object*)*, i8* (%Owl*)*, i32 (%Wl*)*, i32 (%Owl*)*, i32 (%Owl*)* }
%Wl = type { %_Wl_vtable*, i8* }
%_Wl_vtable = type { %_Object_vtable*, i8* (%Object*)*, i8* (%Wl*)*, i32 (%Wl*)*, i32 (%Wl*)* }
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
@o483 = global %Owl* zeroinitializer, align 4		; initialized by @o483.init484
@_const_str482.str. = private unnamed_addr constant [ 6 x i8 ] c "hoot!\00", align 4
@_const_str482 = alias bitcast([ 6 x i8 ]* @_const_str482.str. to i8*)@_const_str481.str. = private unnamed_addr constant [ 4 x i8 ] c "Owl\00", align 4
@_const_str481 = alias bitcast([ 4 x i8 ]* @_const_str481.str. to i8*)@_const_str480.str. = private unnamed_addr constant [ 5 x i8 ] c "oot!\00", align 4
@_const_str480 = alias bitcast([ 5 x i8 ]* @_const_str480.str. to i8*)@_const_str479.str. = private unnamed_addr constant [ 3 x i8 ] c "Wl\00", align 4
@_const_str479 = alias bitcast([ 3 x i8 ]* @_const_str479.str. to i8*)@_const_str478.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str478 = alias bitcast([ 7 x i8 ]* @_const_str478.str. to i8*)@_Owl_vtable477 = private constant %_Owl_vtable {%_Wl_vtable* @_Wl_vtable476, i8* (%Object*)* @_Object_get_name, i8* (%Owl*)* @_Owl_noise, i32 (%Wl*)* @_Wl_parentmethod, i32 (%Owl*)* @_Owl_secondoverride, i32 (%Owl*)* @_Owl_childmethod}, align 4
@_Wl_vtable476 = private constant %_Wl_vtable {%_Object_vtable* @_Object_vtable475, i8* (%Object*)* @_Object_get_name, i8* (%Wl*)* @_Wl_noise, i32 (%Wl*)* @_Wl_parentmethod, i32 (%Wl*)* @_Wl_secondoverride}, align 4
@_Object_vtable475 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh754:
  call void @o483.init484(  )
  ret void
}


define i32 @program (i32 %argc2664, { i32, [ 0 x i8* ] }* %argv2662){
__fresh753:
  %argc_slot2665 = alloca i32
  store i32 %argc2664, i32* %argc_slot2665
  %argv_slot2663 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv2662, { i32, [ 0 x i8* ] }** %argv_slot2663
  %lhs_or_call2666 = load %Owl** @o483
  %cast_op2667 = bitcast %Owl* %lhs_or_call2666 to %Wl* 
  %ret2668 = call i8* @getNoise ( %Wl* %cast_op2667 )
  call void @print_string( i8* %ret2668 )
  %lhs_or_call2669 = load %Owl** @o483
  %vtmp2671 = getelementptr %Owl* %lhs_or_call2669, i32 0, i32 0
  %vtable2670 = load %_Owl_vtable** %vtmp2671
  %fptmp2672 = getelementptr %_Owl_vtable* %vtable2670, i32 0, i32 5
  %method2673 = load i32 (%Owl*)** %fptmp2672
  %ret2674 = call i32 %method2673 ( %Owl* %lhs_or_call2669 )
  %lhs_or_call2675 = load %Owl** @o483
  %vtmp2677 = getelementptr %Owl* %lhs_or_call2675, i32 0, i32 0
  %vtable2676 = load %_Owl_vtable** %vtmp2677
  %fptmp2678 = getelementptr %_Owl_vtable* %vtable2676, i32 0, i32 3
  %method2679 = load i32 (%Wl*)** %fptmp2678
  %cast_op2680 = bitcast %Owl* %lhs_or_call2675 to %Wl* 
  %ret2681 = call i32 %method2679 ( %Wl* %cast_op2680 )
  %bop2682 = add i32 %ret2674, %ret2681
  %lhs_or_call2683 = load %Owl** @o483
  %vtmp2685 = getelementptr %Owl* %lhs_or_call2683, i32 0, i32 0
  %vtable2684 = load %_Owl_vtable** %vtmp2685
  %fptmp2686 = getelementptr %_Owl_vtable* %vtable2684, i32 0, i32 4
  %method2687 = load i32 (%Owl*)** %fptmp2686
  %ret2688 = call i32 %method2687 ( %Owl* %lhs_or_call2683 )
  %bop2689 = add i32 %bop2682, %ret2688
  ret i32 %bop2689
}


define void @o483.init484 (){
__fresh752:
  %mem_ptr2659 = call i32* @oat_malloc ( i32 8 )
  %obj2660 = bitcast i32* %mem_ptr2659 to %Owl* 
  %new_obj2661 = call %Owl* @_Owl_ctor ( %Owl* %obj2660 )
  store %Owl* %new_obj2661, %Owl** @o483
  ret void
}


define i8* @getNoise (%Wl* %thing2651){
__fresh751:
  %thing_slot2652 = alloca %Wl*
  store %Wl* %thing2651, %Wl** %thing_slot2652
  %lhs_or_call2653 = load %Wl** %thing_slot2652
  %vtmp2655 = getelementptr %Wl* %lhs_or_call2653, i32 0, i32 0
  %vtable2654 = load %_Wl_vtable** %vtmp2655
  %fptmp2656 = getelementptr %_Wl_vtable* %vtable2654, i32 0, i32 2
  %method2657 = load i8* (%Wl*)** %fptmp2656
  %ret2658 = call i8* %method2657 ( %Wl* %lhs_or_call2653 )
  ret i8* %ret2658
}


define i32 @_Owl_secondoverride (%Owl* %_this1){
__fresh750:
  %cast_op2648 = bitcast %Owl* %_this1 to %Wl* 
  %ret2649 = call i32 @_Wl_secondoverride ( %Wl* %cast_op2648 )
  %bop2650 = add i32 %ret2649, 1
  ret i32 %bop2650
}


define i32 @_Owl_childmethod (%Owl* %_this1){
__fresh749:
  ret i32 3
}


define i8* @_Owl_noise (%Owl* %_this1){
__fresh748:
  ret i8* @_const_str482
}


define %Owl* @_Owl_ctor (%Owl* %_this1){
__fresh747:
  %cast_op2644 = bitcast %Owl* %_this1 to %Wl* 
  %dummy2645 = call %Wl* @_Wl_ctor ( %Wl* %cast_op2644 )
  %path2646 = getelementptr %Owl* %_this1, i32 0, i32 1
  store i8* @_const_str481, i8** %path2646
  %vt_slot2647 = getelementptr %Owl* %_this1, i32 0, i32 0
  store %_Owl_vtable* @_Owl_vtable477, %_Owl_vtable** %vt_slot2647
  ret %Owl* %_this1
}


define i32 @_Wl_secondoverride (%Wl* %_this1){
__fresh746:
  %unop2643 = sub i32 0, 2
  ret i32 %unop2643
}


define i32 @_Wl_parentmethod (%Wl* %_this1){
__fresh745:
  ret i32 40
}


define i8* @_Wl_noise (%Wl* %_this1){
__fresh744:
  ret i8* @_const_str480
}


define %Wl* @_Wl_ctor (%Wl* %_this1){
__fresh743:
  %cast_op2639 = bitcast %Wl* %_this1 to %Object* 
  %dummy2640 = call %Object* @_Object_ctor ( %Object* %cast_op2639 )
  %path2641 = getelementptr %Wl* %_this1, i32 0, i32 1
  store i8* @_const_str479, i8** %path2641
  %vt_slot2642 = getelementptr %Wl* %_this1, i32 0, i32 0
  store %_Wl_vtable* @_Wl_vtable476, %_Wl_vtable** %vt_slot2642
  ret %Wl* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh742:
  %path2637 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call2638 = load i8** %path2637
  ret i8* %lhs_or_call2638
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh741:
  %path2635 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str478, i8** %path2635
  %vt_slot2636 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable475, %_Object_vtable** %vt_slot2636
  ret %Object* %_this1
}


