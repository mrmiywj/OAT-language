%C = type { %_C_vtable*, i8* }
%_C_vtable = type { %_B_vtable*, i8* (%Object*)*, i32 (%B*, i32)*, i32 (%C*, i32)* }
%B = type { %_B_vtable*, i8* }
%_B_vtable = type { %_A_vtable*, i8* (%Object*)*, i32 (%B*, i32)* }
%A = type { %_A_vtable*, i8* }
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
@a429 = global %A* zeroinitializer, align 4		; initialized by @a429.init430
@_const_str428.str. = private unnamed_addr constant [ 2 x i8 ] c "C\00", align 4
@_const_str428 = alias bitcast([ 2 x i8 ]* @_const_str428.str. to i8*)@_const_str427.str. = private unnamed_addr constant [ 2 x i8 ] c "B\00", align 4
@_const_str427 = alias bitcast([ 2 x i8 ]* @_const_str427.str. to i8*)@_const_str426.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str426 = alias bitcast([ 2 x i8 ]* @_const_str426.str. to i8*)@_const_str425.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str425 = alias bitcast([ 7 x i8 ]* @_const_str425.str. to i8*)@_C_vtable424 = private constant %_C_vtable {%_B_vtable* @_B_vtable423, i8* (%Object*)* @_Object_get_name, i32 (%B*, i32)* @_B_over, i32 (%C*, i32)* @_C_notover}, align 4
@_B_vtable423 = private constant %_B_vtable {%_A_vtable* @_A_vtable422, i8* (%Object*)* @_Object_get_name, i32 (%B*, i32)* @_B_over}, align 4
@_A_vtable422 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable421, i8* (%Object*)* @_Object_get_name, i32 (%A*, i32)* @_A_over}, align 4
@_Object_vtable421 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh682:
  call void @a429.init430(  )
  ret void
}


define i32 @program (i32 %argc2396, { i32, [ 0 x i8* ] }* %argv2394){
__fresh681:
  %argc_slot2397 = alloca i32
  store i32 %argc2396, i32* %argc_slot2397
  %argv_slot2395 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv2394, { i32, [ 0 x i8* ] }** %argv_slot2395
  %lhs_or_call2398 = load %A** @a429
  %vtmp2400 = getelementptr %A* %lhs_or_call2398, i32 0, i32 0
  %vtable2399 = load %_A_vtable** %vtmp2400
  %fptmp2401 = getelementptr %_A_vtable* %vtable2399, i32 0, i32 2
  %method2402 = load i32 (%A*, i32)** %fptmp2401
  %ret2403 = call i32 %method2402 ( %A* %lhs_or_call2398, i32 3 )
  ret i32 %ret2403
}


define void @a429.init430 (){
__fresh680:
  %mem_ptr2390 = call i32* @oat_malloc ( i32 8 )
  %obj2391 = bitcast i32* %mem_ptr2390 to %C* 
  %new_obj2392 = call %C* @_C_ctor ( %C* %obj2391 )
  %cast_op2393 = bitcast %C* %new_obj2392 to %A* 
  store %A* %cast_op2393, %A** @a429
  ret void
}


define i32 @_C_notover (%C* %_this1, i32 %x2386){
__fresh679:
  %x_slot2387 = alloca i32
  store i32 %x2386, i32* %x_slot2387
  %lhs_or_call2388 = load i32* %x_slot2387
  %bop2389 = add i32 %lhs_or_call2388, 1
  ret i32 %bop2389
}


define %C* @_C_ctor (%C* %_this1){
__fresh678:
  %cast_op2382 = bitcast %C* %_this1 to %B* 
  %dummy2383 = call %B* @_B_ctor ( %B* %cast_op2382 )
  %path2384 = getelementptr %C* %_this1, i32 0, i32 1
  store i8* @_const_str428, i8** %path2384
  %vt_slot2385 = getelementptr %C* %_this1, i32 0, i32 0
  store %_C_vtable* @_C_vtable424, %_C_vtable** %vt_slot2385
  ret %C* %_this1
}


define i32 @_B_over (%B* %_this1, i32 %x2378){
__fresh677:
  %x_slot2379 = alloca i32
  store i32 %x2378, i32* %x_slot2379
  %lhs_or_call2380 = load i32* %x_slot2379
  %bop2381 = add i32 %lhs_or_call2380, 2
  ret i32 %bop2381
}


define %B* @_B_ctor (%B* %_this1){
__fresh676:
  %cast_op2374 = bitcast %B* %_this1 to %A* 
  %dummy2375 = call %A* @_A_ctor ( %A* %cast_op2374 )
  %path2376 = getelementptr %B* %_this1, i32 0, i32 1
  store i8* @_const_str427, i8** %path2376
  %vt_slot2377 = getelementptr %B* %_this1, i32 0, i32 0
  store %_B_vtable* @_B_vtable423, %_B_vtable** %vt_slot2377
  ret %B* %_this1
}


define i32 @_A_over (%A* %_this1, i32 %x2370){
__fresh675:
  %x_slot2371 = alloca i32
  store i32 %x2370, i32* %x_slot2371
  %lhs_or_call2372 = load i32* %x_slot2371
  %bop2373 = add i32 %lhs_or_call2372, 1
  ret i32 %bop2373
}


define %A* @_A_ctor (%A* %_this1){
__fresh674:
  %cast_op2366 = bitcast %A* %_this1 to %Object* 
  %dummy2367 = call %Object* @_Object_ctor ( %Object* %cast_op2366 )
  %path2368 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str426, i8** %path2368
  %vt_slot2369 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable422, %_A_vtable** %vt_slot2369
  ret %A* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh673:
  %path2364 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call2365 = load i8** %path2364
  ret i8* %lhs_or_call2365
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh672:
  %path2362 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str425, i8** %path2362
  %vt_slot2363 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable421, %_Object_vtable** %vt_slot2363
  ret %Object* %_this1
}


