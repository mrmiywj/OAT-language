%B = type { %_B_vtable*, i8* }
%_B_vtable = type { %_A_vtable*, i8* (%Object*)*, void (%A*)* }
%A = type { %_A_vtable*, i8* }
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
@_const_str122.str. = private unnamed_addr constant [ 2 x i8 ] c "B\00", align 4
@_const_str122 = alias bitcast([ 2 x i8 ]* @_const_str122.str. to i8*)@_const_str121.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str121 = alias bitcast([ 2 x i8 ]* @_const_str121.str. to i8*)@_const_str120.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str120 = alias bitcast([ 2 x i8 ]* @_const_str120.str. to i8*)@_const_str119.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str119 = alias bitcast([ 7 x i8 ]* @_const_str119.str. to i8*)@_B_vtable118 = private constant %_B_vtable {%_A_vtable* @_A_vtable117, i8* (%Object*)* @_Object_get_name, void (%A*)* @_A_f}, align 4
@_A_vtable117 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable116, i8* (%Object*)* @_Object_get_name, void (%A*)* @_A_f}, align 4
@_Object_vtable116 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh200:
  ret void
}


define i32 @program (i32 %argc689, { i32, [ 0 x i8* ] }* %argv687){
__fresh199:
  %argc_slot690 = alloca i32
  store i32 %argc689, i32* %argc_slot690
  %argv_slot688 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv687, { i32, [ 0 x i8* ] }** %argv_slot688
  %mem_ptr691 = call i32* @oat_malloc ( i32 8 )
  %obj692 = bitcast i32* %mem_ptr691 to %B* 
  %new_obj693 = call %B* @_B_ctor ( %B* %obj692 )
  %vdecl_slot694 = alloca %B*
  store %B* %new_obj693, %B** %vdecl_slot694
  %lhs_or_call695 = load %B** %vdecl_slot694
  %vtmp697 = getelementptr %B* %lhs_or_call695, i32 0, i32 0
  %vtable696 = load %_B_vtable** %vtmp697
  %fptmp698 = getelementptr %_B_vtable* %vtable696, i32 0, i32 2
  %method699 = load void (%A*)** %fptmp698
  %cast_op700 = bitcast %B* %lhs_or_call695 to %A* 
  call void %method699( %A* %cast_op700 )
  ret i32 0
}


define %B* @_B_ctor (%B* %_this1){
__fresh198:
  %cast_op683 = bitcast %B* %_this1 to %A* 
  %dummy684 = call %A* @_A_ctor ( %A* %cast_op683 )
  %path685 = getelementptr %B* %_this1, i32 0, i32 1
  store i8* @_const_str122, i8** %path685
  %vt_slot686 = getelementptr %B* %_this1, i32 0, i32 0
  store %_B_vtable* @_B_vtable118, %_B_vtable** %vt_slot686
  ret %B* %_this1
}


define void @_A_f (%A* %_this1){
__fresh197:
  call void @print_string( i8* @_const_str121 )
  ret void
}


define %A* @_A_ctor (%A* %_this1){
__fresh196:
  %cast_op679 = bitcast %A* %_this1 to %Object* 
  %dummy680 = call %Object* @_Object_ctor ( %Object* %cast_op679 )
  %path681 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str120, i8** %path681
  %vt_slot682 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable117, %_A_vtable** %vt_slot682
  ret %A* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh195:
  %path677 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call678 = load i8** %path677
  ret i8* %lhs_or_call678
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh194:
  %path675 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str119, i8** %path675
  %vt_slot676 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable116, %_Object_vtable** %vt_slot676
  ret %Object* %_this1
}


