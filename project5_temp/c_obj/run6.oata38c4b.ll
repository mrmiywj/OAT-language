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
@_const_str40.str. = private unnamed_addr constant [ 4 x i8 ] c "str\00", align 4
@_const_str40 = alias bitcast([ 4 x i8 ]* @_const_str40.str. to i8*)@_const_str39.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str39 = alias bitcast([ 2 x i8 ]* @_const_str39.str. to i8*)@_const_str38.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str38 = alias bitcast([ 7 x i8 ]* @_const_str38.str. to i8*)@_A_vtable37 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable36, i8* (%Object*)* @_Object_get_name}, align 4
@_Object_vtable36 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh76:
  ret void
}


define i32 @program (i32 %argc227, { i32, [ 0 x i8* ] }* %argv225){
__fresh75:
  %argc_slot228 = alloca i32
  store i32 %argc227, i32* %argc_slot228
  %argv_slot226 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv225, { i32, [ 0 x i8* ] }** %argv_slot226
  %mem_ptr229 = call i32* @oat_malloc ( i32 12 )
  %obj230 = bitcast i32* %mem_ptr229 to %A* 
  %new_obj231 = call %A* @_A_ctor ( %A* %obj230 )
  %vdecl_slot232 = alloca %A*
  store %A* %new_obj231, %A** %vdecl_slot232
  %lhs_or_call233 = load %A** %vdecl_slot232
  %path234 = getelementptr %A* %lhs_or_call233, i32 0, i32 2
  %lhs_or_call235 = load i8** %path234
  call void @print_string( i8* %lhs_or_call235 )
  ret i32 0
}


define %A* @_A_ctor (%A* %_this1){
__fresh74:
  %cast_op220 = bitcast %A* %_this1 to %Object* 
  %dummy221 = call %Object* @_Object_ctor ( %Object* %cast_op220 )
  %path222 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str39, i8** %path222
  %path223 = getelementptr %A* %_this1, i32 0, i32 2
  store i8* @_const_str40, i8** %path223
  %vt_slot224 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable37, %_A_vtable** %vt_slot224
  ret %A* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh73:
  %path218 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call219 = load i8** %path218
  ret i8* %lhs_or_call219
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh72:
  %path216 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str38, i8** %path216
  %vt_slot217 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable36, %_Object_vtable** %vt_slot217
  ret %Object* %_this1
}


