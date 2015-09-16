%B = type { %_B_vtable*, i8* }
%_B_vtable = type { %_A_vtable*, i8* (%Object*)*, void (%B*)* }
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
@_const_str138.str. = private unnamed_addr constant [ 2 x i8 ] c "B\00", align 4
@_const_str138 = alias bitcast([ 2 x i8 ]* @_const_str138.str. to i8*)@_const_str137.str. = private unnamed_addr constant [ 2 x i8 ] c "B\00", align 4
@_const_str137 = alias bitcast([ 2 x i8 ]* @_const_str137.str. to i8*)@_const_str136.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str136 = alias bitcast([ 2 x i8 ]* @_const_str136.str. to i8*)@_const_str135.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str135 = alias bitcast([ 2 x i8 ]* @_const_str135.str. to i8*)@_const_str134.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str134 = alias bitcast([ 7 x i8 ]* @_const_str134.str. to i8*)@_B_vtable133 = private constant %_B_vtable {%_A_vtable* @_A_vtable132, i8* (%Object*)* @_Object_get_name, void (%B*)* @_B_f}, align 4
@_A_vtable132 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable131, i8* (%Object*)* @_Object_get_name, void (%A*)* @_A_f}, align 4
@_Object_vtable131 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh215:
  ret void
}


define i32 @program (i32 %argc745, { i32, [ 0 x i8* ] }* %argv743){
__fresh214:
  %argc_slot746 = alloca i32
  store i32 %argc745, i32* %argc_slot746
  %argv_slot744 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv743, { i32, [ 0 x i8* ] }** %argv_slot744
  %mem_ptr747 = call i32* @oat_malloc ( i32 8 )
  %obj748 = bitcast i32* %mem_ptr747 to %B* 
  %new_obj749 = call %B* @_B_ctor ( %B* %obj748 )
  %vdecl_slot750 = alloca %B*
  store %B* %new_obj749, %B** %vdecl_slot750
  %lhs_or_call751 = load %B** %vdecl_slot750
  %vtmp753 = getelementptr %B* %lhs_or_call751, i32 0, i32 0
  %vtable752 = load %_B_vtable** %vtmp753
  %fptmp754 = getelementptr %_B_vtable* %vtable752, i32 0, i32 2
  %method755 = load void (%B*)** %fptmp754
  call void %method755( %B* %lhs_or_call751 )
  ret i32 0
}


define void @_B_f (%B* %_this1){
__fresh213:
  call void @print_string( i8* @_const_str138 )
  ret void
}


define %B* @_B_ctor (%B* %_this1){
__fresh212:
  %cast_op739 = bitcast %B* %_this1 to %A* 
  %dummy740 = call %A* @_A_ctor ( %A* %cast_op739 )
  %path741 = getelementptr %B* %_this1, i32 0, i32 1
  store i8* @_const_str137, i8** %path741
  %vt_slot742 = getelementptr %B* %_this1, i32 0, i32 0
  store %_B_vtable* @_B_vtable133, %_B_vtable** %vt_slot742
  ret %B* %_this1
}


define void @_A_f (%A* %_this1){
__fresh211:
  call void @print_string( i8* @_const_str136 )
  ret void
}


define %A* @_A_ctor (%A* %_this1){
__fresh210:
  %cast_op735 = bitcast %A* %_this1 to %Object* 
  %dummy736 = call %Object* @_Object_ctor ( %Object* %cast_op735 )
  %path737 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str135, i8** %path737
  %vt_slot738 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable132, %_A_vtable** %vt_slot738
  ret %A* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh209:
  %path733 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call734 = load i8** %path733
  ret i8* %lhs_or_call734
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh208:
  %path731 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str134, i8** %path731
  %vt_slot732 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable131, %_Object_vtable** %vt_slot732
  ret %Object* %_this1
}


