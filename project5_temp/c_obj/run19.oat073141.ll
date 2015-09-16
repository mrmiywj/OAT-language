%B = type { %_B_vtable*, i8*, i8* }
%_B_vtable = type { %_A_vtable*, i8* (%Object*)* }
%A = type { %_A_vtable*, i8*, i8* }
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
@_const_str109.str. = private unnamed_addr constant [ 7 x i8 ] c "cis341\00", align 4
@_const_str109 = alias bitcast([ 7 x i8 ]* @_const_str109.str. to i8*)@_const_str108.str. = private unnamed_addr constant [ 2 x i8 ] c "B\00", align 4
@_const_str108 = alias bitcast([ 2 x i8 ]* @_const_str108.str. to i8*)@_const_str107.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str107 = alias bitcast([ 2 x i8 ]* @_const_str107.str. to i8*)@_const_str106.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str106 = alias bitcast([ 7 x i8 ]* @_const_str106.str. to i8*)@_B_vtable105 = private constant %_B_vtable {%_A_vtable* @_A_vtable104, i8* (%Object*)* @_Object_get_name}, align 4
@_A_vtable104 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable103, i8* (%Object*)* @_Object_get_name}, align 4
@_Object_vtable103 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh182:
  ret void
}


define i32 @program (i32 %argc612, { i32, [ 0 x i8* ] }* %argv610){
__fresh181:
  %argc_slot613 = alloca i32
  store i32 %argc612, i32* %argc_slot613
  %argv_slot611 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv610, { i32, [ 0 x i8* ] }** %argv_slot611
  %mem_ptr614 = call i32* @oat_malloc ( i32 12 )
  %obj615 = bitcast i32* %mem_ptr614 to %B* 
  %new_obj616 = call %B* @_B_ctor ( %B* %obj615, i8* @_const_str109 )
  %vdecl_slot617 = alloca %B*
  store %B* %new_obj616, %B** %vdecl_slot617
  %lhs_or_call618 = load %B** %vdecl_slot617
  %path619 = getelementptr %B* %lhs_or_call618, i32 0, i32 2
  %lhs_or_call620 = load i8** %path619
  call void @print_string( i8* %lhs_or_call620 )
  ret i32 0
}


define %B* @_B_ctor (%B* %_this1, i8* %str603){
__fresh180:
  %str_slot604 = alloca i8*
  store i8* %str603, i8** %str_slot604
  %lhs_or_call605 = load i8** %str_slot604
  %cast_op606 = bitcast %B* %_this1 to %A* 
  %dummy607 = call %A* @_A_ctor ( %A* %cast_op606, i8* %lhs_or_call605 )
  %path608 = getelementptr %B* %_this1, i32 0, i32 1
  store i8* @_const_str108, i8** %path608
  %vt_slot609 = getelementptr %B* %_this1, i32 0, i32 0
  store %_B_vtable* @_B_vtable105, %_B_vtable** %vt_slot609
  ret %B* %_this1
}


define %A* @_A_ctor (%A* %_this1, i8* %str595){
__fresh179:
  %str_slot596 = alloca i8*
  store i8* %str595, i8** %str_slot596
  %cast_op597 = bitcast %A* %_this1 to %Object* 
  %dummy598 = call %Object* @_Object_ctor ( %Object* %cast_op597 )
  %path599 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str107, i8** %path599
  %path600 = getelementptr %A* %_this1, i32 0, i32 2
  %lhs_or_call601 = load i8** %str_slot596
  store i8* %lhs_or_call601, i8** %path600
  %vt_slot602 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable104, %_A_vtable** %vt_slot602
  ret %A* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh178:
  %path593 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call594 = load i8** %path593
  ret i8* %lhs_or_call594
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh177:
  %path591 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str106, i8** %path591
  %vt_slot592 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable103, %_Object_vtable** %vt_slot592
  ret %Object* %_this1
}


