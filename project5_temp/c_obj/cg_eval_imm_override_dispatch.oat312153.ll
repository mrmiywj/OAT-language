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
@a419 = global %A* zeroinitializer, align 4		; initialized by @a419.init420
@_const_str418.str. = private unnamed_addr constant [ 2 x i8 ] c "B\00", align 4
@_const_str418 = alias bitcast([ 2 x i8 ]* @_const_str418.str. to i8*)@_const_str417.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str417 = alias bitcast([ 2 x i8 ]* @_const_str417.str. to i8*)@_const_str416.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str416 = alias bitcast([ 7 x i8 ]* @_const_str416.str. to i8*)@_B_vtable415 = private constant %_B_vtable {%_A_vtable* @_A_vtable414, i8* (%Object*)* @_Object_get_name, i32 (%B*, i32)* @_B_over}, align 4
@_A_vtable414 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable413, i8* (%Object*)* @_Object_get_name, i32 (%A*, i32)* @_A_over}, align 4
@_Object_vtable413 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh671:
  call void @a419.init420(  )
  ret void
}


define i32 @program (i32 %argc2354, { i32, [ 0 x i8* ] }* %argv2352){
__fresh670:
  %argc_slot2355 = alloca i32
  store i32 %argc2354, i32* %argc_slot2355
  %argv_slot2353 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv2352, { i32, [ 0 x i8* ] }** %argv_slot2353
  %lhs_or_call2356 = load %A** @a419
  %vtmp2358 = getelementptr %A* %lhs_or_call2356, i32 0, i32 0
  %vtable2357 = load %_A_vtable** %vtmp2358
  %fptmp2359 = getelementptr %_A_vtable* %vtable2357, i32 0, i32 2
  %method2360 = load i32 (%A*, i32)** %fptmp2359
  %ret2361 = call i32 %method2360 ( %A* %lhs_or_call2356, i32 3 )
  ret i32 %ret2361
}


define void @a419.init420 (){
__fresh669:
  %mem_ptr2348 = call i32* @oat_malloc ( i32 8 )
  %obj2349 = bitcast i32* %mem_ptr2348 to %B* 
  %new_obj2350 = call %B* @_B_ctor ( %B* %obj2349 )
  %cast_op2351 = bitcast %B* %new_obj2350 to %A* 
  store %A* %cast_op2351, %A** @a419
  ret void
}


define i32 @_B_over (%B* %_this1, i32 %x2344){
__fresh668:
  %x_slot2345 = alloca i32
  store i32 %x2344, i32* %x_slot2345
  %lhs_or_call2346 = load i32* %x_slot2345
  %bop2347 = add i32 %lhs_or_call2346, 2
  ret i32 %bop2347
}


define %B* @_B_ctor (%B* %_this1){
__fresh667:
  %cast_op2340 = bitcast %B* %_this1 to %A* 
  %dummy2341 = call %A* @_A_ctor ( %A* %cast_op2340 )
  %path2342 = getelementptr %B* %_this1, i32 0, i32 1
  store i8* @_const_str418, i8** %path2342
  %vt_slot2343 = getelementptr %B* %_this1, i32 0, i32 0
  store %_B_vtable* @_B_vtable415, %_B_vtable** %vt_slot2343
  ret %B* %_this1
}


define i32 @_A_over (%A* %_this1, i32 %x2336){
__fresh666:
  %x_slot2337 = alloca i32
  store i32 %x2336, i32* %x_slot2337
  %lhs_or_call2338 = load i32* %x_slot2337
  %bop2339 = add i32 %lhs_or_call2338, 1
  ret i32 %bop2339
}


define %A* @_A_ctor (%A* %_this1){
__fresh665:
  %cast_op2332 = bitcast %A* %_this1 to %Object* 
  %dummy2333 = call %Object* @_Object_ctor ( %Object* %cast_op2332 )
  %path2334 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str417, i8** %path2334
  %vt_slot2335 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable414, %_A_vtable** %vt_slot2335
  ret %A* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh664:
  %path2330 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call2331 = load i8** %path2330
  ret i8* %lhs_or_call2331
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh663:
  %path2328 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str416, i8** %path2328
  %vt_slot2329 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable413, %_Object_vtable** %vt_slot2329
  ret %Object* %_this1
}


