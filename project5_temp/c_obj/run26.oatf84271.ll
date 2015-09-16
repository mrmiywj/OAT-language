%B = type { %_B_vtable*, i8* }
%_B_vtable = type { %_A_vtable*, i8* (%Object*)*, void (%A*)*, void (%B*)* }
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
@_const_str145.str. = private unnamed_addr constant [ 2 x i8 ] c "B\00", align 4
@_const_str145 = alias bitcast([ 2 x i8 ]* @_const_str145.str. to i8*)@_const_str144.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str144 = alias bitcast([ 2 x i8 ]* @_const_str144.str. to i8*)@_const_str143.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str143 = alias bitcast([ 2 x i8 ]* @_const_str143.str. to i8*)@_const_str142.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str142 = alias bitcast([ 7 x i8 ]* @_const_str142.str. to i8*)@_B_vtable141 = private constant %_B_vtable {%_A_vtable* @_A_vtable140, i8* (%Object*)* @_Object_get_name, void (%A*)* @_A_f, void (%B*)* @_B_g}, align 4
@_A_vtable140 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable139, i8* (%Object*)* @_Object_get_name, void (%A*)* @_A_f}, align 4
@_Object_vtable139 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh223:
  ret void
}


define i32 @program (i32 %argc771, { i32, [ 0 x i8* ] }* %argv769){
__fresh222:
  %argc_slot772 = alloca i32
  store i32 %argc771, i32* %argc_slot772
  %argv_slot770 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv769, { i32, [ 0 x i8* ] }** %argv_slot770
  %mem_ptr773 = call i32* @oat_malloc ( i32 8 )
  %obj774 = bitcast i32* %mem_ptr773 to %B* 
  %new_obj775 = call %B* @_B_ctor ( %B* %obj774 )
  %vdecl_slot776 = alloca %B*
  store %B* %new_obj775, %B** %vdecl_slot776
  %lhs_or_call777 = load %B** %vdecl_slot776
  %vtmp779 = getelementptr %B* %lhs_or_call777, i32 0, i32 0
  %vtable778 = load %_B_vtable** %vtmp779
  %fptmp780 = getelementptr %_B_vtable* %vtable778, i32 0, i32 3
  %method781 = load void (%B*)** %fptmp780
  call void %method781( %B* %lhs_or_call777 )
  ret i32 0
}


define void @_B_g (%B* %_this1){
__fresh221:
  %cast_op768 = bitcast %B* %_this1 to %A* 
  call void @_A_f( %A* %cast_op768 )
  ret void
}


define %B* @_B_ctor (%B* %_this1){
__fresh220:
  %cast_op764 = bitcast %B* %_this1 to %A* 
  %dummy765 = call %A* @_A_ctor ( %A* %cast_op764 )
  %path766 = getelementptr %B* %_this1, i32 0, i32 1
  store i8* @_const_str145, i8** %path766
  %vt_slot767 = getelementptr %B* %_this1, i32 0, i32 0
  store %_B_vtable* @_B_vtable141, %_B_vtable** %vt_slot767
  ret %B* %_this1
}


define void @_A_f (%A* %_this1){
__fresh219:
  call void @print_string( i8* @_const_str144 )
  ret void
}


define %A* @_A_ctor (%A* %_this1){
__fresh218:
  %cast_op760 = bitcast %A* %_this1 to %Object* 
  %dummy761 = call %Object* @_Object_ctor ( %Object* %cast_op760 )
  %path762 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str143, i8** %path762
  %vt_slot763 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable140, %_A_vtable** %vt_slot763
  ret %A* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh217:
  %path758 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call759 = load i8** %path758
  ret i8* %lhs_or_call759
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh216:
  %path756 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str142, i8** %path756
  %vt_slot757 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable139, %_Object_vtable** %vt_slot757
  ret %Object* %_this1
}


