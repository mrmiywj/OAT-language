%C = type { %_C_vtable*, i8*, i32, i32, i32, i32 }
%_C_vtable = type { %_B_vtable*, i8* (%Object*)*, void (%C*)*, void (%C*, i32, i32)* }
%B = type { %_B_vtable*, i8*, i32, i32, i32 }
%_B_vtable = type { %_A_vtable*, i8* (%Object*)*, void (%B*)* }
%A = type { %_A_vtable*, i8*, i32 }
%_A_vtable = type { %_Object_vtable*, i8* (%Object*)*, void (%A*)* }
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
@x509 = global i32 0, align 4
@a507 = global %A* zeroinitializer, align 4		; initialized by @a507.init508
@_const_str506.str. = private unnamed_addr constant [ 6 x i8 ] c "C: w=\00", align 4
@_const_str506 = alias bitcast([ 6 x i8 ]* @_const_str506.str. to i8*)@_const_str505.str. = private unnamed_addr constant [ 6 x i8 ] c "C: z=\00", align 4
@_const_str505 = alias bitcast([ 6 x i8 ]* @_const_str505.str. to i8*)@_const_str504.str. = private unnamed_addr constant [ 6 x i8 ] c "C: y=\00", align 4
@_const_str504 = alias bitcast([ 6 x i8 ]* @_const_str504.str. to i8*)@_const_str503.str. = private unnamed_addr constant [ 6 x i8 ] c "C: x=\00", align 4
@_const_str503 = alias bitcast([ 6 x i8 ]* @_const_str503.str. to i8*)@_const_str502.str. = private unnamed_addr constant [ 10 x i8 ] c "C.foo: b=\00", align 4
@_const_str502 = alias bitcast([ 10 x i8 ]* @_const_str502.str. to i8*)@_const_str501.str. = private unnamed_addr constant [ 10 x i8 ] c "C.foo: a=\00", align 4
@_const_str501 = alias bitcast([ 10 x i8 ]* @_const_str501.str. to i8*)@_const_str500.str. = private unnamed_addr constant [ 2 x i8 ] c "C\00", align 4
@_const_str500 = alias bitcast([ 2 x i8 ]* @_const_str500.str. to i8*)@_const_str499.str. = private unnamed_addr constant [ 6 x i8 ] c "B: z=\00", align 4
@_const_str499 = alias bitcast([ 6 x i8 ]* @_const_str499.str. to i8*)@_const_str498.str. = private unnamed_addr constant [ 6 x i8 ] c "B: y=\00", align 4
@_const_str498 = alias bitcast([ 6 x i8 ]* @_const_str498.str. to i8*)@_const_str497.str. = private unnamed_addr constant [ 6 x i8 ] c "B: x=\00", align 4
@_const_str497 = alias bitcast([ 6 x i8 ]* @_const_str497.str. to i8*)@_const_str496.str. = private unnamed_addr constant [ 2 x i8 ] c "B\00", align 4
@_const_str496 = alias bitcast([ 2 x i8 ]* @_const_str496.str. to i8*)@_const_str495.str. = private unnamed_addr constant [ 6 x i8 ] c "A: x=\00", align 4
@_const_str495 = alias bitcast([ 6 x i8 ]* @_const_str495.str. to i8*)@_const_str494.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str494 = alias bitcast([ 2 x i8 ]* @_const_str494.str. to i8*)@_const_str493.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str493 = alias bitcast([ 7 x i8 ]* @_const_str493.str. to i8*)@_C_vtable492 = private constant %_C_vtable {%_B_vtable* @_B_vtable491, i8* (%Object*)* @_Object_get_name, void (%C*)* @_C_print, void (%C*, i32, i32)* @_C_foo}, align 4
@_B_vtable491 = private constant %_B_vtable {%_A_vtable* @_A_vtable490, i8* (%Object*)* @_Object_get_name, void (%B*)* @_B_print}, align 4
@_A_vtable490 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable489, i8* (%Object*)* @_Object_get_name, void (%A*)* @_A_print}, align 4
@_Object_vtable489 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh772:
  call void @a507.init508(  )
  ret void
}


define i32 @program (i32 %argc2812, { i32, [ 0 x i8* ] }* %argv2810){
__fresh771:
  %argc_slot2813 = alloca i32
  store i32 %argc2812, i32* %argc_slot2813
  %argv_slot2811 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv2810, { i32, [ 0 x i8* ] }** %argv_slot2811
  %lhs_or_call2814 = load i32* @x509
  %bop2815 = add i32 %lhs_or_call2814, 3
  %lhs_or_call2816 = load i32* @x509
  %bop2817 = add i32 %lhs_or_call2816, 2
  %lhs_or_call2818 = load i32* @x509
  %bop2819 = add i32 %lhs_or_call2818, 1
  %mem_ptr2820 = call i32* @oat_malloc ( i32 20 )
  %obj2821 = bitcast i32* %mem_ptr2820 to %B* 
  %new_obj2822 = call %B* @_B_ctor ( %B* %obj2821, i32 %bop2819, i32 %bop2817, i32 %bop2815 )
  %vdecl_slot2823 = alloca %B*
  store %B* %new_obj2822, %B** %vdecl_slot2823
  %mem_ptr2824 = call i32* @oat_malloc ( i32 24 )
  %obj2825 = bitcast i32* %mem_ptr2824 to %C* 
  %new_obj2826 = call %C* @_C_ctor ( %C* %obj2825, i32 1, i32 2, i32 3, i32 4 )
  %vdecl_slot2827 = alloca %C*
  store %C* %new_obj2826, %C** %vdecl_slot2827
  %lhs_or_call2828 = load %A** @a507
  %vtmp2830 = getelementptr %A* %lhs_or_call2828, i32 0, i32 0
  %vtable2829 = load %_A_vtable** %vtmp2830
  %fptmp2831 = getelementptr %_A_vtable* %vtable2829, i32 0, i32 2
  %method2832 = load void (%A*)** %fptmp2831
  call void %method2832( %A* %lhs_or_call2828 )
  %lhs_or_call2833 = load %B** %vdecl_slot2823
  %vtmp2835 = getelementptr %B* %lhs_or_call2833, i32 0, i32 0
  %vtable2834 = load %_B_vtable** %vtmp2835
  %fptmp2836 = getelementptr %_B_vtable* %vtable2834, i32 0, i32 2
  %method2837 = load void (%B*)** %fptmp2836
  call void %method2837( %B* %lhs_or_call2833 )
  %lhs_or_call2838 = load %C** %vdecl_slot2827
  %vtmp2840 = getelementptr %C* %lhs_or_call2838, i32 0, i32 0
  %vtable2839 = load %_C_vtable** %vtmp2840
  %fptmp2841 = getelementptr %_C_vtable* %vtable2839, i32 0, i32 2
  %method2842 = load void (%C*)** %fptmp2841
  call void %method2842( %C* %lhs_or_call2838 )
  %lhs_or_call2847 = load %C** %vdecl_slot2827
  %vtmp2849 = getelementptr %C* %lhs_or_call2847, i32 0, i32 0
  %vtable2848 = load %_C_vtable** %vtmp2849
  %fptmp2850 = getelementptr %_C_vtable* %vtable2848, i32 0, i32 3
  %method2851 = load void (%C*, i32, i32)** %fptmp2850
  %lhs_or_call2843 = load i32* @x509
  %bop2844 = add i32 %lhs_or_call2843, 2
  %lhs_or_call2845 = load i32* @x509
  %bop2846 = add i32 %lhs_or_call2845, 1
  call void %method2851( %C* %lhs_or_call2847, i32 %bop2846, i32 %bop2844 )
  ret i32 0
}


define void @a507.init508 (){
__fresh770:
  %mem_ptr2807 = call i32* @oat_malloc ( i32 12 )
  %obj2808 = bitcast i32* %mem_ptr2807 to %A* 
  %new_obj2809 = call %A* @_A_ctor ( %A* %obj2808, i32 3 )
  store %A* %new_obj2809, %A** @a507
  ret void
}


define void @_C_print (%C* %_this1){
__fresh769:
  %path2791 = getelementptr %C* %_this1, i32 0, i32 2
  %lhs_or_call2792 = load i32* %path2791
  %ret2793 = call i8* @string_of_int ( i32 %lhs_or_call2792 )
  %ret2794 = call i8* @string_cat ( i8* @_const_str503, i8* %ret2793 )
  call void @print_string( i8* %ret2794 )
  %path2795 = getelementptr %C* %_this1, i32 0, i32 3
  %lhs_or_call2796 = load i32* %path2795
  %ret2797 = call i8* @string_of_int ( i32 %lhs_or_call2796 )
  %ret2798 = call i8* @string_cat ( i8* @_const_str504, i8* %ret2797 )
  call void @print_string( i8* %ret2798 )
  %path2799 = getelementptr %C* %_this1, i32 0, i32 4
  %lhs_or_call2800 = load i32* %path2799
  %ret2801 = call i8* @string_of_int ( i32 %lhs_or_call2800 )
  %ret2802 = call i8* @string_cat ( i8* @_const_str505, i8* %ret2801 )
  call void @print_string( i8* %ret2802 )
  %path2803 = getelementptr %C* %_this1, i32 0, i32 5
  %lhs_or_call2804 = load i32* %path2803
  %ret2805 = call i8* @string_of_int ( i32 %lhs_or_call2804 )
  %ret2806 = call i8* @string_cat ( i8* @_const_str506, i8* %ret2805 )
  call void @print_string( i8* %ret2806 )
  ret void
}


define void @_C_foo (%C* %_this1, i32 %a2783, i32 %b2781){
__fresh768:
  %a_slot2784 = alloca i32
  store i32 %a2783, i32* %a_slot2784
  %b_slot2782 = alloca i32
  store i32 %b2781, i32* %b_slot2782
  %lhs_or_call2785 = load i32* %a_slot2784
  %ret2786 = call i8* @string_of_int ( i32 %lhs_or_call2785 )
  %ret2787 = call i8* @string_cat ( i8* @_const_str501, i8* %ret2786 )
  call void @print_string( i8* %ret2787 )
  %lhs_or_call2788 = load i32* %b_slot2782
  %ret2789 = call i8* @string_of_int ( i32 %lhs_or_call2788 )
  %ret2790 = call i8* @string_cat ( i8* @_const_str502, i8* %ret2789 )
  call void @print_string( i8* %ret2790 )
  ret void
}


define %C* @_C_ctor (%C* %_this1, i32 %x2770, i32 %y2768, i32 %z2766, i32 %w2764){
__fresh767:
  %x_slot2771 = alloca i32
  store i32 %x2770, i32* %x_slot2771
  %y_slot2769 = alloca i32
  store i32 %y2768, i32* %y_slot2769
  %z_slot2767 = alloca i32
  store i32 %z2766, i32* %z_slot2767
  %w_slot2765 = alloca i32
  store i32 %w2764, i32* %w_slot2765
  %lhs_or_call2772 = load i32* %z_slot2767
  %lhs_or_call2773 = load i32* %y_slot2769
  %lhs_or_call2774 = load i32* %x_slot2771
  %cast_op2775 = bitcast %C* %_this1 to %B* 
  %dummy2776 = call %B* @_B_ctor ( %B* %cast_op2775, i32 %lhs_or_call2774, i32 %lhs_or_call2773, i32 %lhs_or_call2772 )
  %path2777 = getelementptr %C* %_this1, i32 0, i32 1
  store i8* @_const_str500, i8** %path2777
  %vt_slot2778 = getelementptr %C* %_this1, i32 0, i32 0
  store %_C_vtable* @_C_vtable492, %_C_vtable** %vt_slot2778
  %path2779 = getelementptr %C* %_this1, i32 0, i32 5
  %lhs_or_call2780 = load i32* %w_slot2765
  store i32 %lhs_or_call2780, i32* %path2779
  ret %C* %_this1
}


define void @_B_print (%B* %_this1){
__fresh766:
  %path2752 = getelementptr %B* %_this1, i32 0, i32 2
  %lhs_or_call2753 = load i32* %path2752
  %ret2754 = call i8* @string_of_int ( i32 %lhs_or_call2753 )
  %ret2755 = call i8* @string_cat ( i8* @_const_str497, i8* %ret2754 )
  call void @print_string( i8* %ret2755 )
  %path2756 = getelementptr %B* %_this1, i32 0, i32 3
  %lhs_or_call2757 = load i32* %path2756
  %ret2758 = call i8* @string_of_int ( i32 %lhs_or_call2757 )
  %ret2759 = call i8* @string_cat ( i8* @_const_str498, i8* %ret2758 )
  call void @print_string( i8* %ret2759 )
  %path2760 = getelementptr %B* %_this1, i32 0, i32 4
  %lhs_or_call2761 = load i32* %path2760
  %ret2762 = call i8* @string_of_int ( i32 %lhs_or_call2761 )
  %ret2763 = call i8* @string_cat ( i8* @_const_str499, i8* %ret2762 )
  call void @print_string( i8* %ret2763 )
  ret void
}


define %B* @_B_ctor (%B* %_this1, i32 %x2741, i32 %y2739, i32 %z2737){
__fresh765:
  %x_slot2742 = alloca i32
  store i32 %x2741, i32* %x_slot2742
  %y_slot2740 = alloca i32
  store i32 %y2739, i32* %y_slot2740
  %z_slot2738 = alloca i32
  store i32 %z2737, i32* %z_slot2738
  %lhs_or_call2743 = load i32* %x_slot2742
  %cast_op2744 = bitcast %B* %_this1 to %A* 
  %dummy2745 = call %A* @_A_ctor ( %A* %cast_op2744, i32 %lhs_or_call2743 )
  %path2746 = getelementptr %B* %_this1, i32 0, i32 1
  store i8* @_const_str496, i8** %path2746
  %vt_slot2747 = getelementptr %B* %_this1, i32 0, i32 0
  store %_B_vtable* @_B_vtable491, %_B_vtable** %vt_slot2747
  %path2748 = getelementptr %B* %_this1, i32 0, i32 3
  %lhs_or_call2749 = load i32* %y_slot2740
  store i32 %lhs_or_call2749, i32* %path2748
  %path2750 = getelementptr %B* %_this1, i32 0, i32 4
  %lhs_or_call2751 = load i32* %z_slot2738
  store i32 %lhs_or_call2751, i32* %path2750
  ret %B* %_this1
}


define void @_A_print (%A* %_this1){
__fresh764:
  %path2733 = getelementptr %A* %_this1, i32 0, i32 2
  %lhs_or_call2734 = load i32* %path2733
  %ret2735 = call i8* @string_of_int ( i32 %lhs_or_call2734 )
  %ret2736 = call i8* @string_cat ( i8* @_const_str495, i8* %ret2735 )
  call void @print_string( i8* %ret2736 )
  ret void
}


define %A* @_A_ctor (%A* %_this1, i32 %x2725){
__fresh763:
  %x_slot2726 = alloca i32
  store i32 %x2725, i32* %x_slot2726
  %cast_op2727 = bitcast %A* %_this1 to %Object* 
  %dummy2728 = call %Object* @_Object_ctor ( %Object* %cast_op2727 )
  %path2729 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str494, i8** %path2729
  %vt_slot2730 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable490, %_A_vtable** %vt_slot2730
  %path2731 = getelementptr %A* %_this1, i32 0, i32 2
  %lhs_or_call2732 = load i32* %x_slot2726
  store i32 %lhs_or_call2732, i32* %path2731
  ret %A* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh762:
  %path2723 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call2724 = load i8** %path2723
  ret i8* %lhs_or_call2724
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh761:
  %path2721 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str493, i8** %path2721
  %vt_slot2722 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable489, %_Object_vtable** %vt_slot2722
  ret %Object* %_this1
}


