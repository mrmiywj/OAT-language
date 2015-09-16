%B = type { %_B_vtable*, i8*, i32, i32 }
%_B_vtable = type { %_A_vtable*, i8* (%Object*)*, void (%A*)*, void (%A*)*, void (%B*)*, i32 (%B*, i32)* }
%A = type { %_A_vtable*, i8*, i32 }
%_A_vtable = type { %_Object_vtable*, i8* (%Object*)*, void (%A*)*, void (%A*)*, void (%A*)* }
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
@_const_str18.str. = private unnamed_addr constant [ 2 x i8 ] c "B\00", align 4
@_const_str18 = alias bitcast([ 2 x i8 ]* @_const_str18.str. to i8*)@_const_str17.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str17 = alias bitcast([ 2 x i8 ]* @_const_str17.str. to i8*)@_const_str16.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str16 = alias bitcast([ 7 x i8 ]* @_const_str16.str. to i8*)@_B_vtable15 = private constant %_B_vtable {%_A_vtable* @_A_vtable14, i8* (%Object*)* @_Object_get_name, void (%A*)* @_A_x, void (%A*)* @_A_g, void (%B*)* @_B_f, i32 (%B*, i32)* @_B_h}, align 4
@_A_vtable14 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable13, i8* (%Object*)* @_Object_get_name, void (%A*)* @_A_x, void (%A*)* @_A_g, void (%A*)* @_A_f}, align 4
@_Object_vtable13 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh43:
  ret void
}


define i32 @program (i32 %argc122, { i32, [ 0 x i8* ] }* %argv120){
__fresh42:
  %argc_slot123 = alloca i32
  store i32 %argc122, i32* %argc_slot123
  %argv_slot121 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv120, { i32, [ 0 x i8* ] }** %argv_slot121
  %mem_ptr124 = call i32* @oat_malloc ( i32 16 )
  %obj125 = bitcast i32* %mem_ptr124 to %B* 
  %new_obj126 = call %B* @_B_ctor ( %B* %obj125 )
  %vdecl_slot127 = alloca %B*
  store %B* %new_obj126, %B** %vdecl_slot127
  %lhs_or_call128 = load %B** %vdecl_slot127
  %vtmp130 = getelementptr %B* %lhs_or_call128, i32 0, i32 0
  %vtable129 = load %_B_vtable** %vtmp130
  %fptmp131 = getelementptr %_B_vtable* %vtable129, i32 0, i32 5
  %method132 = load i32 (%B*, i32)** %fptmp131
  %ret133 = call i32 %method132 ( %B* %lhs_or_call128, i32 3 )
  ret i32 %ret133
}


define i32 @_B_h (%B* %_this1, i32 %i106){
__fresh41:
  %i_slot107 = alloca i32
  store i32 %i106, i32* %i_slot107
  %vtmp109 = getelementptr %B* %_this1, i32 0, i32 0
  %vtable108 = load %_B_vtable** %vtmp109
  %fptmp110 = getelementptr %_B_vtable* %vtable108, i32 0, i32 4
  %method111 = load void (%B*)** %fptmp110
  call void %method111( %B* %_this1 )
  %cast_op112 = bitcast %B* %_this1 to %A* 
  call void @_A_g( %A* %cast_op112 )
  %path113 = getelementptr %B* %_this1, i32 0, i32 2
  %lhs_or_call114 = load i32* %path113
  %path115 = getelementptr %B* %_this1, i32 0, i32 3
  %lhs_or_call116 = load i32* %path115
  %bop117 = add i32 %lhs_or_call114, %lhs_or_call116
  %lhs_or_call118 = load i32* %i_slot107
  %bop119 = add i32 %bop117, %lhs_or_call118
  ret i32 %bop119
}


define void @_B_f (%B* %_this1){
__fresh40:
  %path102 = getelementptr %B* %_this1, i32 0, i32 3
  %path103 = getelementptr %B* %_this1, i32 0, i32 3
  %lhs_or_call104 = load i32* %path103
  %bop105 = add i32 %lhs_or_call104, 1
  store i32 %bop105, i32* %path102
  ret void
}


define %B* @_B_ctor (%B* %_this1){
__fresh39:
  %cast_op97 = bitcast %B* %_this1 to %A* 
  %dummy98 = call %A* @_A_ctor ( %A* %cast_op97 )
  %path99 = getelementptr %B* %_this1, i32 0, i32 1
  store i8* @_const_str18, i8** %path99
  %vt_slot100 = getelementptr %B* %_this1, i32 0, i32 0
  store %_B_vtable* @_B_vtable15, %_B_vtable** %vt_slot100
  %path101 = getelementptr %B* %_this1, i32 0, i32 3
  store i32 2, i32* %path101
  ret %B* %_this1
}


define void @_A_f (%A* %_this1){
__fresh38:
  %path96 = getelementptr %A* %_this1, i32 0, i32 2
  store i32 999, i32* %path96
  ret void
}


define void @_A_g (%A* %_this1){
__fresh37:
  %vtmp89 = getelementptr %A* %_this1, i32 0, i32 0
  %vtable88 = load %_A_vtable** %vtmp89
  %fptmp90 = getelementptr %_A_vtable* %vtable88, i32 0, i32 2
  %method91 = load void (%A*)** %fptmp90
  call void %method91( %A* %_this1 )
  %path92 = getelementptr %A* %_this1, i32 0, i32 2
  %path93 = getelementptr %A* %_this1, i32 0, i32 2
  %lhs_or_call94 = load i32* %path93
  %bop95 = add i32 %lhs_or_call94, 1
  store i32 %bop95, i32* %path92
  ret void
}


define void @_A_x (%A* %_this1){
__fresh36:
  %path84 = getelementptr %A* %_this1, i32 0, i32 2
  %path85 = getelementptr %A* %_this1, i32 0, i32 2
  %lhs_or_call86 = load i32* %path85
  %bop87 = add i32 %lhs_or_call86, 1
  store i32 %bop87, i32* %path84
  ret void
}


define %A* @_A_ctor (%A* %_this1){
__fresh35:
  %cast_op79 = bitcast %A* %_this1 to %Object* 
  %dummy80 = call %Object* @_Object_ctor ( %Object* %cast_op79 )
  %path81 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str17, i8** %path81
  %vt_slot82 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable14, %_A_vtable** %vt_slot82
  %path83 = getelementptr %A* %_this1, i32 0, i32 2
  store i32 1, i32* %path83
  ret %A* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh34:
  %path77 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call78 = load i8** %path77
  ret i8* %lhs_or_call78
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh33:
  %path75 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str16, i8** %path75
  %vt_slot76 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable13, %_Object_vtable** %vt_slot76
  ret %Object* %_this1
}


