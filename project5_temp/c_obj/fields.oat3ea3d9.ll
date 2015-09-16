%Fields = type { %_Fields_vtable*, i8*, i32, i32, i32 }
%_Fields_vtable = type { %_Object_vtable*, i8* (%Object*)*, %Fields* (%Fields*)* }
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
@_const_str488.str. = private unnamed_addr constant [ 7 x i8 ] c "Fields\00", align 4
@_const_str488 = alias bitcast([ 7 x i8 ]* @_const_str488.str. to i8*)@_const_str487.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str487 = alias bitcast([ 7 x i8 ]* @_const_str487.str. to i8*)@_Fields_vtable486 = private constant %_Fields_vtable {%_Object_vtable* @_Object_vtable485, i8* (%Object*)* @_Object_get_name, %Fields* (%Fields*)* @_Fields_sumab}, align 4
@_Object_vtable485 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh760:
  ret void
}


define i32 @program (i32 %argc2705, { i32, [ 0 x i8* ] }* %argv2703){
__fresh759:
  %argc_slot2706 = alloca i32
  store i32 %argc2705, i32* %argc_slot2706
  %argv_slot2704 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv2703, { i32, [ 0 x i8* ] }** %argv_slot2704
  %mem_ptr2707 = call i32* @oat_malloc ( i32 20 )
  %obj2708 = bitcast i32* %mem_ptr2707 to %Fields* 
  %new_obj2709 = call %Fields* @_Fields_ctor ( %Fields* %obj2708 )
  %vdecl_slot2710 = alloca %Fields*
  store %Fields* %new_obj2709, %Fields** %vdecl_slot2710
  %lhs_or_call2711 = load %Fields** %vdecl_slot2710
  %vtmp2713 = getelementptr %Fields* %lhs_or_call2711, i32 0, i32 0
  %vtable2712 = load %_Fields_vtable** %vtmp2713
  %fptmp2714 = getelementptr %_Fields_vtable* %vtable2712, i32 0, i32 2
  %method2715 = load %Fields* (%Fields*)** %fptmp2714
  %ret2716 = call %Fields* %method2715 ( %Fields* %lhs_or_call2711 )
  %vdecl_slot2717 = alloca %Fields*
  store %Fields* %ret2716, %Fields** %vdecl_slot2717
  %lhs_or_call2718 = load %Fields** %vdecl_slot2717
  %path2719 = getelementptr %Fields* %lhs_or_call2718, i32 0, i32 3
  %lhs_or_call2720 = load i32* %path2719
  ret i32 %lhs_or_call2720
}


define %Fields* @_Fields_sumab (%Fields* %_this1){
__fresh758:
  %path2699 = getelementptr %Fields* %_this1, i32 0, i32 3
  %path2700 = getelementptr %Fields* %_this1, i32 0, i32 2
  %lhs_or_call2701 = load i32* %path2700
  %bop2702 = add i32 1, %lhs_or_call2701
  store i32 %bop2702, i32* %path2699
  ret %Fields* %_this1
}


define %Fields* @_Fields_ctor (%Fields* %_this1){
__fresh757:
  %cast_op2694 = bitcast %Fields* %_this1 to %Object* 
  %dummy2695 = call %Object* @_Object_ctor ( %Object* %cast_op2694 )
  %path2696 = getelementptr %Fields* %_this1, i32 0, i32 1
  store i8* @_const_str488, i8** %path2696
  %vt_slot2697 = getelementptr %Fields* %_this1, i32 0, i32 0
  store %_Fields_vtable* @_Fields_vtable486, %_Fields_vtable** %vt_slot2697
  %path2698 = getelementptr %Fields* %_this1, i32 0, i32 2
  store i32 12, i32* %path2698
  ret %Fields* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh756:
  %path2692 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call2693 = load i8** %path2692
  ret i8* %lhs_or_call2693
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh755:
  %path2690 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str487, i8** %path2690
  %vt_slot2691 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable485, %_Object_vtable** %vt_slot2691
  ret %Object* %_this1
}


