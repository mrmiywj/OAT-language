%B = type { %_B_vtable*, i8*, i8* }
%_B_vtable = type { %_A_vtable*, i8* (%Object*)*, void (%A*)* }
%A = type { %_A_vtable*, i8*, i8* }
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
@_const_str130.str. = private unnamed_addr constant [ 2 x i8 ] c "B\00", align 4
@_const_str130 = alias bitcast([ 2 x i8 ]* @_const_str130.str. to i8*)@_const_str129.str. = private unnamed_addr constant [ 2 x i8 ] c "B\00", align 4
@_const_str129 = alias bitcast([ 2 x i8 ]* @_const_str129.str. to i8*)@_const_str128.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str128 = alias bitcast([ 2 x i8 ]* @_const_str128.str. to i8*)@_const_str127.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str127 = alias bitcast([ 2 x i8 ]* @_const_str127.str. to i8*)@_const_str126.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str126 = alias bitcast([ 7 x i8 ]* @_const_str126.str. to i8*)@_B_vtable125 = private constant %_B_vtable {%_A_vtable* @_A_vtable124, i8* (%Object*)* @_Object_get_name, void (%A*)* @_A_f}, align 4
@_A_vtable124 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable123, i8* (%Object*)* @_Object_get_name, void (%A*)* @_A_f}, align 4
@_Object_vtable123 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh207:
  ret void
}


define i32 @program (i32 %argc719, { i32, [ 0 x i8* ] }* %argv717){
__fresh206:
  %argc_slot720 = alloca i32
  store i32 %argc719, i32* %argc_slot720
  %argv_slot718 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv717, { i32, [ 0 x i8* ] }** %argv_slot718
  %mem_ptr721 = call i32* @oat_malloc ( i32 12 )
  %obj722 = bitcast i32* %mem_ptr721 to %B* 
  %new_obj723 = call %B* @_B_ctor ( %B* %obj722 )
  %vdecl_slot724 = alloca %B*
  store %B* %new_obj723, %B** %vdecl_slot724
  %lhs_or_call725 = load %B** %vdecl_slot724
  %vtmp727 = getelementptr %B* %lhs_or_call725, i32 0, i32 0
  %vtable726 = load %_B_vtable** %vtmp727
  %fptmp728 = getelementptr %_B_vtable* %vtable726, i32 0, i32 2
  %method729 = load void (%A*)** %fptmp728
  %cast_op730 = bitcast %B* %lhs_or_call725 to %A* 
  call void %method729( %A* %cast_op730 )
  ret i32 0
}


define %B* @_B_ctor (%B* %_this1){
__fresh205:
  %cast_op712 = bitcast %B* %_this1 to %A* 
  %dummy713 = call %A* @_A_ctor ( %A* %cast_op712 )
  %path714 = getelementptr %B* %_this1, i32 0, i32 1
  store i8* @_const_str129, i8** %path714
  %path715 = getelementptr %B* %_this1, i32 0, i32 2
  store i8* @_const_str130, i8** %path715
  %vt_slot716 = getelementptr %B* %_this1, i32 0, i32 0
  store %_B_vtable* @_B_vtable125, %_B_vtable** %vt_slot716
  ret %B* %_this1
}


define void @_A_f (%A* %_this1){
__fresh204:
  %path710 = getelementptr %A* %_this1, i32 0, i32 2
  %lhs_or_call711 = load i8** %path710
  call void @print_string( i8* %lhs_or_call711 )
  ret void
}


define %A* @_A_ctor (%A* %_this1){
__fresh203:
  %cast_op705 = bitcast %A* %_this1 to %Object* 
  %dummy706 = call %Object* @_Object_ctor ( %Object* %cast_op705 )
  %path707 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str127, i8** %path707
  %path708 = getelementptr %A* %_this1, i32 0, i32 2
  store i8* @_const_str128, i8** %path708
  %vt_slot709 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable124, %_A_vtable** %vt_slot709
  ret %A* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh202:
  %path703 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call704 = load i8** %path703
  ret i8* %lhs_or_call704
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh201:
  %path701 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str126, i8** %path701
  %vt_slot702 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable123, %_Object_vtable** %vt_slot702
  ret %Object* %_this1
}


