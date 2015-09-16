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
@_const_str115.str. = private unnamed_addr constant [ 2 x i8 ] c "B\00", align 4
@_const_str115 = alias bitcast([ 2 x i8 ]* @_const_str115.str. to i8*)@_const_str114.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str114 = alias bitcast([ 2 x i8 ]* @_const_str114.str. to i8*)@_const_str113.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str113 = alias bitcast([ 7 x i8 ]* @_const_str113.str. to i8*)@_B_vtable112 = private constant %_B_vtable {%_A_vtable* @_A_vtable111, i8* (%Object*)* @_Object_get_name}, align 4
@_A_vtable111 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable110, i8* (%Object*)* @_Object_get_name}, align 4
@_Object_vtable110 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh193:
  ret void
}


define i32 @program (i32 %argc665, { i32, [ 0 x i8* ] }* %argv663){
__fresh192:
  %argc_slot666 = alloca i32
  store i32 %argc665, i32* %argc_slot666
  %argv_slot664 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv663, { i32, [ 0 x i8* ] }** %argv_slot664
  %mem_ptr667 = call i32* @oat_malloc ( i32 12 )
  %obj668 = bitcast i32* %mem_ptr667 to %B* 
  %new_obj669 = call %B* @_B_ctor ( %B* %obj668, i32 4, i32 109 )
  %vdecl_slot670 = alloca %B*
  store %B* %new_obj669, %B** %vdecl_slot670
  %lhs_or_call671 = load %B** %vdecl_slot670
  %path672 = getelementptr %B* %lhs_or_call671, i32 0, i32 2
  %lhs_or_call673 = load { i32, [ 0 x i32 ] }** %path672
  %ret674 = call i8* @string_of_array ( { i32, [ 0 x i32 ] }* %lhs_or_call673 )
  call void @print_string( i8* %ret674 )
  ret i32 0
}


define %B* @_B_ctor (%B* %_this1, i32 %n653, i32 %c651){
__fresh191:
  %n_slot654 = alloca i32
  store i32 %n653, i32* %n_slot654
  %c_slot652 = alloca i32
  store i32 %c651, i32* %c_slot652
  %lhs_or_call655 = load i32* %c_slot652
  %bop656 = add i32 %lhs_or_call655, 1
  %lhs_or_call657 = load i32* %n_slot654
  %bop658 = add i32 %lhs_or_call657, 1
  %cast_op659 = bitcast %B* %_this1 to %A* 
  %dummy660 = call %A* @_A_ctor ( %A* %cast_op659, i32 %bop658, i32 %bop656 )
  %path661 = getelementptr %B* %_this1, i32 0, i32 1
  store i8* @_const_str115, i8** %path661
  %vt_slot662 = getelementptr %B* %_this1, i32 0, i32 0
  store %_B_vtable* @_B_vtable112, %_B_vtable** %vt_slot662
  ret %B* %_this1
}


define %A* @_A_ctor (%A* %_this1, i32 %n627, i32 %c625){
__fresh188:
  %n_slot628 = alloca i32
  store i32 %n627, i32* %n_slot628
  %c_slot626 = alloca i32
  store i32 %c625, i32* %c_slot626
  %cast_op629 = bitcast %A* %_this1 to %Object* 
  %dummy630 = call %Object* @_Object_ctor ( %Object* %cast_op629 )
  %path631 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str114, i8** %path631
  %path632 = getelementptr %A* %_this1, i32 0, i32 2
  %lhs_or_call633 = load i32* %n_slot628
  %array_ptr634 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 %lhs_or_call633 )
  %array635 = bitcast { i32, [ 0 x i32 ] }* %array_ptr634 to { i32, [ 0 x i32 ] }* 
  %_tmp115636 = alloca i32
  store i32 %lhs_or_call633, i32* %_tmp115636
  %_tmp116637 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array635, { i32, [ 0 x i32 ] }** %_tmp116637
  %vdecl_slot638 = alloca i32
  store i32 0, i32* %vdecl_slot638
  br label %__cond187

__cond187:
  %lhs_or_call639 = load i32* %vdecl_slot638
  %lhs_or_call640 = load i32* %_tmp115636
  %bop641 = icmp slt i32 %lhs_or_call639, %lhs_or_call640
  br i1 %bop641, label %__body186, label %__post185

__fresh189:
  br label %__body186

__body186:
  %lhs_or_call642 = load { i32, [ 0 x i32 ] }** %_tmp116637
  %lhs_or_call643 = load i32* %vdecl_slot638
  %bound_ptr645 = getelementptr { i32, [ 0 x i32 ] }* %lhs_or_call642, i32 0, i32 0
  %bound646 = load i32* %bound_ptr645
  call void @oat_array_bounds_check( i32 %bound646, i32 %lhs_or_call643 )
  %elt644 = getelementptr { i32, [ 0 x i32 ] }* %lhs_or_call642, i32 0, i32 1, i32 %lhs_or_call643
  %lhs_or_call647 = load i32* %c_slot626
  store i32 %lhs_or_call647, i32* %elt644
  %lhs_or_call648 = load i32* %vdecl_slot638
  %bop649 = add i32 %lhs_or_call648, 1
  store i32 %bop649, i32* %vdecl_slot638
  br label %__cond187

__fresh190:
  br label %__post185

__post185:
  store { i32, [ 0 x i32 ] }* %array635, { i32, [ 0 x i32 ] }** %path632
  %vt_slot650 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable111, %_A_vtable** %vt_slot650
  ret %A* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh184:
  %path623 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call624 = load i8** %path623
  ret i8* %lhs_or_call624
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh183:
  %path621 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str113, i8** %path621
  %vt_slot622 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable110, %_Object_vtable** %vt_slot622
  ret %Object* %_this1
}


