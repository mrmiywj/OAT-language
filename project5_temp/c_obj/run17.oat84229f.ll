%A = type { %_A_vtable*, i8*, i32 }
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
@_const_str59.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str59 = alias bitcast([ 2 x i8 ]* @_const_str59.str. to i8*)@_const_str58.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str58 = alias bitcast([ 7 x i8 ]* @_const_str58.str. to i8*)@_A_vtable57 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable56, i8* (%Object*)* @_Object_get_name}, align 4
@_Object_vtable56 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh104:
  ret void
}


define i32 @program (i32 %argc347, { i32, [ 0 x i8* ] }* %argv345){
__fresh103:
  %argc_slot348 = alloca i32
  store i32 %argc347, i32* %argc_slot348
  %argv_slot346 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv345, { i32, [ 0 x i8* ] }** %argv_slot346
  %mem_ptr349 = call i32* @oat_malloc ( i32 12 )
  %obj350 = bitcast i32* %mem_ptr349 to %A* 
  %new_obj351 = call %A* @_A_ctor ( %A* %obj350, i32 10 )
  %vdecl_slot352 = alloca %A*
  store %A* %new_obj351, %A** %vdecl_slot352
  %lhs_or_call353 = load %A** %vdecl_slot352
  %path354 = getelementptr %A* %lhs_or_call353, i32 0, i32 2
  %lhs_or_call355 = load i32* %path354
  ret i32 %lhs_or_call355
}


define %A* @_A_ctor (%A* %_this1, i32 %i337){
__fresh102:
  %i_slot338 = alloca i32
  store i32 %i337, i32* %i_slot338
  %cast_op339 = bitcast %A* %_this1 to %Object* 
  %dummy340 = call %Object* @_Object_ctor ( %Object* %cast_op339 )
  %path341 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str59, i8** %path341
  %vt_slot342 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable57, %_A_vtable** %vt_slot342
  %path343 = getelementptr %A* %_this1, i32 0, i32 2
  %lhs_or_call344 = load i32* %i_slot338
  store i32 %lhs_or_call344, i32* %path343
  ret %A* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh101:
  %path335 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call336 = load i8** %path335
  ret i8* %lhs_or_call336
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh100:
  %path333 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str58, i8** %path333
  %vt_slot334 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable56, %_Object_vtable** %vt_slot334
  ret %Object* %_this1
}


