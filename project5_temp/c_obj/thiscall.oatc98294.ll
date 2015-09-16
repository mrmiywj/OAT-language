%A = type { %_A_vtable*, i8*, i32 }
%_A_vtable = type { %_Object_vtable*, i8* (%Object*)*, i32 (%A*, i32)* }
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
@_const_str55.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str55 = alias bitcast([ 2 x i8 ]* @_const_str55.str. to i8*)@_const_str54.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str54 = alias bitcast([ 7 x i8 ]* @_const_str54.str. to i8*)@_A_vtable53 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable52, i8* (%Object*)* @_Object_get_name, i32 (%A*, i32)* @_A_addToMine}, align 4
@_Object_vtable52 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh99:
  ret void
}


define i32 @program (i32 %argc321, { i32, [ 0 x i8* ] }* %argv319){
__fresh98:
  %argc_slot322 = alloca i32
  store i32 %argc321, i32* %argc_slot322
  %argv_slot320 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv319, { i32, [ 0 x i8* ] }** %argv_slot320
  %mem_ptr323 = call i32* @oat_malloc ( i32 12 )
  %obj324 = bitcast i32* %mem_ptr323 to %A* 
  %new_obj325 = call %A* @_A_ctor ( %A* %obj324, i32 1 )
  %vdecl_slot326 = alloca %A*
  store %A* %new_obj325, %A** %vdecl_slot326
  %lhs_or_call327 = load %A** %vdecl_slot326
  %vtmp329 = getelementptr %A* %lhs_or_call327, i32 0, i32 0
  %vtable328 = load %_A_vtable** %vtmp329
  %fptmp330 = getelementptr %_A_vtable* %vtable328, i32 0, i32 2
  %method331 = load i32 (%A*, i32)** %fptmp330
  %ret332 = call i32 %method331 ( %A* %lhs_or_call327, i32 2 )
  ret i32 %ret332
}


define i32 @_A_addToMine (%A* %_this1, i32 %n313){
__fresh97:
  %n_slot314 = alloca i32
  store i32 %n313, i32* %n_slot314
  %path315 = getelementptr %A* %_this1, i32 0, i32 2
  %lhs_or_call316 = load i32* %path315
  %lhs_or_call317 = load i32* %n_slot314
  %bop318 = add i32 %lhs_or_call316, %lhs_or_call317
  ret i32 %bop318
}


define %A* @_A_ctor (%A* %_this1, i32 %v305){
__fresh96:
  %v_slot306 = alloca i32
  store i32 %v305, i32* %v_slot306
  %cast_op307 = bitcast %A* %_this1 to %Object* 
  %dummy308 = call %Object* @_Object_ctor ( %Object* %cast_op307 )
  %path309 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str55, i8** %path309
  %vt_slot310 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable53, %_A_vtable** %vt_slot310
  %path311 = getelementptr %A* %_this1, i32 0, i32 2
  %lhs_or_call312 = load i32* %v_slot306
  store i32 %lhs_or_call312, i32* %path311
  ret %A* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh95:
  %path303 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call304 = load i8** %path303
  ret i8* %lhs_or_call304
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh94:
  %path301 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str54, i8** %path301
  %vt_slot302 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable52, %_Object_vtable** %vt_slot302
  ret %Object* %_this1
}


