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
@_const_str44.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str44 = alias bitcast([ 2 x i8 ]* @_const_str44.str. to i8*)@_const_str43.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str43 = alias bitcast([ 7 x i8 ]* @_const_str43.str. to i8*)@_A_vtable42 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable41, i8* (%Object*)* @_Object_get_name}, align 4
@_Object_vtable41 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh86:
  ret void
}


define i32 @program (i32 %argc262, { i32, [ 0 x i8* ] }* %argv260){
__fresh85:
  %argc_slot263 = alloca i32
  store i32 %argc262, i32* %argc_slot263
  %argv_slot261 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv260, { i32, [ 0 x i8* ] }** %argv_slot261
  %mem_ptr264 = call i32* @oat_malloc ( i32 12 )
  %obj265 = bitcast i32* %mem_ptr264 to %A* 
  %new_obj266 = call %A* @_A_ctor ( %A* %obj265 )
  %vdecl_slot267 = alloca %A*
  store %A* %new_obj266, %A** %vdecl_slot267
  %lhs_or_call268 = load %A** %vdecl_slot267
  %path269 = getelementptr %A* %lhs_or_call268, i32 0, i32 2
  %lhs_or_call270 = load { i32, [ 0 x i32 ] }** %path269
  %ret271 = call i8* @string_of_array ( { i32, [ 0 x i32 ] }* %lhs_or_call270 )
  call void @print_string( i8* %ret271 )
  ret i32 0
}


define %A* @_A_ctor (%A* %_this1){
__fresh82:
  %cast_op240 = bitcast %A* %_this1 to %Object* 
  %dummy241 = call %Object* @_Object_ctor ( %Object* %cast_op240 )
  %path242 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str44, i8** %path242
  %path243 = getelementptr %A* %_this1, i32 0, i32 2
  %array_ptr244 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 10 )
  %array245 = bitcast { i32, [ 0 x i32 ] }* %array_ptr244 to { i32, [ 0 x i32 ] }* 
  %_tmp41246 = alloca i32
  store i32 10, i32* %_tmp41246
  %_tmp42247 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array245, { i32, [ 0 x i32 ] }** %_tmp42247
  %vdecl_slot248 = alloca i32
  store i32 0, i32* %vdecl_slot248
  br label %__cond81

__cond81:
  %lhs_or_call249 = load i32* %vdecl_slot248
  %lhs_or_call250 = load i32* %_tmp41246
  %bop251 = icmp slt i32 %lhs_or_call249, %lhs_or_call250
  br i1 %bop251, label %__body80, label %__post79

__fresh83:
  br label %__body80

__body80:
  %lhs_or_call252 = load { i32, [ 0 x i32 ] }** %_tmp42247
  %lhs_or_call253 = load i32* %vdecl_slot248
  %bound_ptr255 = getelementptr { i32, [ 0 x i32 ] }* %lhs_or_call252, i32 0, i32 0
  %bound256 = load i32* %bound_ptr255
  call void @oat_array_bounds_check( i32 %bound256, i32 %lhs_or_call253 )
  %elt254 = getelementptr { i32, [ 0 x i32 ] }* %lhs_or_call252, i32 0, i32 1, i32 %lhs_or_call253
  store i32 110, i32* %elt254
  %lhs_or_call257 = load i32* %vdecl_slot248
  %bop258 = add i32 %lhs_or_call257, 1
  store i32 %bop258, i32* %vdecl_slot248
  br label %__cond81

__fresh84:
  br label %__post79

__post79:
  store { i32, [ 0 x i32 ] }* %array245, { i32, [ 0 x i32 ] }** %path243
  %vt_slot259 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable42, %_A_vtable** %vt_slot259
  ret %A* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh78:
  %path238 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call239 = load i8** %path238
  ret i8* %lhs_or_call239
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh77:
  %path236 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str43, i8** %path236
  %vt_slot237 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable41, %_Object_vtable** %vt_slot237
  ret %Object* %_this1
}


