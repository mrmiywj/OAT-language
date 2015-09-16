%C = type { %_C_vtable*, i8* }
%_C_vtable = type { %_Object_vtable*, i8* (%Object*)*, void (%C*)* }
%B = type { %_B_vtable*, i8* }
%_B_vtable = type { %_A_vtable*, i8* (%Object*)*, %C* (%B*)*, void (%B*)* }
%A = type { %_A_vtable*, i8* }
%_A_vtable = type { %_Object_vtable*, i8* (%Object*)*, %Object* (%A*)*, void (%A*)* }
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
@_const_str305.str. = private unnamed_addr constant [ 2 x i8 ] c "C\00", align 4
@_const_str305 = alias bitcast([ 2 x i8 ]* @_const_str305.str. to i8*)@_const_str304.str. = private unnamed_addr constant [ 2 x i8 ] c "C\00", align 4
@_const_str304 = alias bitcast([ 2 x i8 ]* @_const_str304.str. to i8*)@_const_str303.str. = private unnamed_addr constant [ 2 x i8 ] c "B\00", align 4
@_const_str303 = alias bitcast([ 2 x i8 ]* @_const_str303.str. to i8*)@_const_str302.str. = private unnamed_addr constant [ 2 x i8 ] c "B\00", align 4
@_const_str302 = alias bitcast([ 2 x i8 ]* @_const_str302.str. to i8*)@_const_str301.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str301 = alias bitcast([ 2 x i8 ]* @_const_str301.str. to i8*)@_const_str300.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str300 = alias bitcast([ 2 x i8 ]* @_const_str300.str. to i8*)@_const_str299.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str299 = alias bitcast([ 7 x i8 ]* @_const_str299.str. to i8*)@_C_vtable298 = private constant %_C_vtable {%_Object_vtable* @_Object_vtable295, i8* (%Object*)* @_Object_get_name, void (%C*)* @_C_print}, align 4
@_B_vtable297 = private constant %_B_vtable {%_A_vtable* @_A_vtable296, i8* (%Object*)* @_Object_get_name, %C* (%B*)* @_B_f, void (%B*)* @_B_print}, align 4
@_A_vtable296 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable295, i8* (%Object*)* @_Object_get_name, %Object* (%A*)* @_A_f, void (%A*)* @_A_print}, align 4
@_Object_vtable295 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh532:
  ret void
}


define i32 @program (i32 %argc1648, { i32, [ 0 x i8* ] }* %argv1646){
__fresh531:
  %argc_slot1649 = alloca i32
  store i32 %argc1648, i32* %argc_slot1649
  %argv_slot1647 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv1646, { i32, [ 0 x i8* ] }** %argv_slot1647
  %mem_ptr1650 = call i32* @oat_malloc ( i32 8 )
  %obj1651 = bitcast i32* %mem_ptr1650 to %A* 
  %new_obj1652 = call %A* @_A_ctor ( %A* %obj1651 )
  %vdecl_slot1653 = alloca %A*
  store %A* %new_obj1652, %A** %vdecl_slot1653
  %mem_ptr1654 = call i32* @oat_malloc ( i32 8 )
  %obj1655 = bitcast i32* %mem_ptr1654 to %B* 
  %new_obj1656 = call %B* @_B_ctor ( %B* %obj1655 )
  %vdecl_slot1657 = alloca %B*
  store %B* %new_obj1656, %B** %vdecl_slot1657
  %mem_ptr1658 = call i32* @oat_malloc ( i32 8 )
  %obj1659 = bitcast i32* %mem_ptr1658 to %C* 
  %new_obj1660 = call %C* @_C_ctor ( %C* %obj1659 )
  %vdecl_slot1661 = alloca %C*
  store %C* %new_obj1660, %C** %vdecl_slot1661
  %lhs_or_call1662 = load %A** %vdecl_slot1653
  %vtmp1664 = getelementptr %A* %lhs_or_call1662, i32 0, i32 0
  %vtable1663 = load %_A_vtable** %vtmp1664
  %fptmp1665 = getelementptr %_A_vtable* %vtable1663, i32 0, i32 3
  %method1666 = load void (%A*)** %fptmp1665
  call void %method1666( %A* %lhs_or_call1662 )
  %lhs_or_call1667 = load %B** %vdecl_slot1657
  %vtmp1669 = getelementptr %B* %lhs_or_call1667, i32 0, i32 0
  %vtable1668 = load %_B_vtable** %vtmp1669
  %fptmp1670 = getelementptr %_B_vtable* %vtable1668, i32 0, i32 3
  %method1671 = load void (%B*)** %fptmp1670
  call void %method1671( %B* %lhs_or_call1667 )
  %lhs_or_call1672 = load %B** %vdecl_slot1657
  %vtmp1674 = getelementptr %B* %lhs_or_call1672, i32 0, i32 0
  %vtable1673 = load %_B_vtable** %vtmp1674
  %fptmp1675 = getelementptr %_B_vtable* %vtable1673, i32 0, i32 2
  %method1676 = load %C* (%B*)** %fptmp1675
  %ret1677 = call %C* %method1676 ( %B* %lhs_or_call1672 )
  %vtmp1679 = getelementptr %C* %ret1677, i32 0, i32 0
  %vtable1678 = load %_C_vtable** %vtmp1679
  %fptmp1680 = getelementptr %_C_vtable* %vtable1678, i32 0, i32 2
  %method1681 = load void (%C*)** %fptmp1680
  call void %method1681( %C* %ret1677 )
  %lhs_or_call1682 = load %C** %vdecl_slot1661
  %vtmp1684 = getelementptr %C* %lhs_or_call1682, i32 0, i32 0
  %vtable1683 = load %_C_vtable** %vtmp1684
  %fptmp1685 = getelementptr %_C_vtable* %vtable1683, i32 0, i32 2
  %method1686 = load void (%C*)** %fptmp1685
  call void %method1686( %C* %lhs_or_call1682 )
  ret i32 0
}


define void @_C_print (%C* %_this1){
__fresh530:
  call void @print_string( i8* @_const_str305 )
  ret void
}


define %C* @_C_ctor (%C* %_this1){
__fresh529:
  %cast_op1642 = bitcast %C* %_this1 to %Object* 
  %dummy1643 = call %Object* @_Object_ctor ( %Object* %cast_op1642 )
  %path1644 = getelementptr %C* %_this1, i32 0, i32 1
  store i8* @_const_str304, i8** %path1644
  %vt_slot1645 = getelementptr %C* %_this1, i32 0, i32 0
  store %_C_vtable* @_C_vtable298, %_C_vtable** %vt_slot1645
  ret %C* %_this1
}


define void @_B_print (%B* %_this1){
__fresh528:
  call void @print_string( i8* @_const_str303 )
  ret void
}


define %C* @_B_f (%B* %_this1){
__fresh527:
  %mem_ptr1639 = call i32* @oat_malloc ( i32 8 )
  %obj1640 = bitcast i32* %mem_ptr1639 to %C* 
  %new_obj1641 = call %C* @_C_ctor ( %C* %obj1640 )
  ret %C* %new_obj1641
}


define %B* @_B_ctor (%B* %_this1){
__fresh526:
  %cast_op1635 = bitcast %B* %_this1 to %A* 
  %dummy1636 = call %A* @_A_ctor ( %A* %cast_op1635 )
  %path1637 = getelementptr %B* %_this1, i32 0, i32 1
  store i8* @_const_str302, i8** %path1637
  %vt_slot1638 = getelementptr %B* %_this1, i32 0, i32 0
  store %_B_vtable* @_B_vtable297, %_B_vtable** %vt_slot1638
  ret %B* %_this1
}


define void @_A_print (%A* %_this1){
__fresh525:
  call void @print_string( i8* @_const_str301 )
  ret void
}


define %Object* @_A_f (%A* %_this1){
__fresh524:
  %mem_ptr1631 = call i32* @oat_malloc ( i32 8 )
  %obj1632 = bitcast i32* %mem_ptr1631 to %B* 
  %new_obj1633 = call %B* @_B_ctor ( %B* %obj1632 )
  %cast_op1634 = bitcast %B* %new_obj1633 to %Object* 
  ret %Object* %cast_op1634
}


define %A* @_A_ctor (%A* %_this1){
__fresh523:
  %cast_op1627 = bitcast %A* %_this1 to %Object* 
  %dummy1628 = call %Object* @_Object_ctor ( %Object* %cast_op1627 )
  %path1629 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str300, i8** %path1629
  %vt_slot1630 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable296, %_A_vtable** %vt_slot1630
  ret %A* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh522:
  %path1625 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call1626 = load i8** %path1625
  ret i8* %lhs_or_call1626
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh521:
  %path1623 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str299, i8** %path1623
  %vt_slot1624 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable295, %_Object_vtable** %vt_slot1624
  ret %Object* %_this1
}


