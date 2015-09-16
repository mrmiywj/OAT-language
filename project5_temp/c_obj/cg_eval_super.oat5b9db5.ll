%C = type { %_C_vtable*, i8* }
%_C_vtable = type { %_B_vtable*, i8* (%Object*)*, i32 (%C*, i32)* }
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
@a449 = global %A* zeroinitializer, align 4		; initialized by @a449.init450
@_const_str448.str. = private unnamed_addr constant [ 2 x i8 ] c "C\00", align 4
@_const_str448 = alias bitcast([ 2 x i8 ]* @_const_str448.str. to i8*)@_const_str447.str. = private unnamed_addr constant [ 2 x i8 ] c "B\00", align 4
@_const_str447 = alias bitcast([ 2 x i8 ]* @_const_str447.str. to i8*)@_const_str446.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str446 = alias bitcast([ 2 x i8 ]* @_const_str446.str. to i8*)@_const_str445.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str445 = alias bitcast([ 7 x i8 ]* @_const_str445.str. to i8*)@_C_vtable444 = private constant %_C_vtable {%_B_vtable* @_B_vtable443, i8* (%Object*)* @_Object_get_name, i32 (%C*, i32)* @_C_over}, align 4
@_B_vtable443 = private constant %_B_vtable {%_A_vtable* @_A_vtable442, i8* (%Object*)* @_Object_get_name, i32 (%B*, i32)* @_B_over}, align 4
@_A_vtable442 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable441, i8* (%Object*)* @_Object_get_name, i32 (%A*, i32)* @_A_over}, align 4
@_Object_vtable441 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh705:
  call void @a449.init450(  )
  ret void
}


define i32 @program (i32 %argc2488, { i32, [ 0 x i8* ] }* %argv2486){
__fresh704:
  %argc_slot2489 = alloca i32
  store i32 %argc2488, i32* %argc_slot2489
  %argv_slot2487 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv2486, { i32, [ 0 x i8* ] }** %argv_slot2487
  %lhs_or_call2490 = load %A** @a449
  %vtmp2492 = getelementptr %A* %lhs_or_call2490, i32 0, i32 0
  %vtable2491 = load %_A_vtable** %vtmp2492
  %fptmp2493 = getelementptr %_A_vtable* %vtable2491, i32 0, i32 2
  %method2494 = load i32 (%A*, i32)** %fptmp2493
  %ret2495 = call i32 %method2494 ( %A* %lhs_or_call2490, i32 3 )
  ret i32 %ret2495
}


define void @a449.init450 (){
__fresh703:
  %mem_ptr2482 = call i32* @oat_malloc ( i32 8 )
  %obj2483 = bitcast i32* %mem_ptr2482 to %C* 
  %new_obj2484 = call %C* @_C_ctor ( %C* %obj2483 )
  %cast_op2485 = bitcast %C* %new_obj2484 to %A* 
  store %A* %cast_op2485, %A** @a449
  ret void
}


define i32 @_C_over (%C* %_this1, i32 %x2474){
__fresh702:
  %x_slot2475 = alloca i32
  store i32 %x2474, i32* %x_slot2475
  %lhs_or_call2476 = load i32* %x_slot2475
  %bop2477 = add i32 %lhs_or_call2476, 1
  %lhs_or_call2478 = load i32* %x_slot2475
  %cast_op2479 = bitcast %C* %_this1 to %B* 
  %ret2480 = call i32 @_B_over ( %B* %cast_op2479, i32 %lhs_or_call2478 )
  %bop2481 = add i32 %bop2477, %ret2480
  ret i32 %bop2481
}


define %C* @_C_ctor (%C* %_this1){
__fresh701:
  %cast_op2470 = bitcast %C* %_this1 to %B* 
  %dummy2471 = call %B* @_B_ctor ( %B* %cast_op2470 )
  %path2472 = getelementptr %C* %_this1, i32 0, i32 1
  store i8* @_const_str448, i8** %path2472
  %vt_slot2473 = getelementptr %C* %_this1, i32 0, i32 0
  store %_C_vtable* @_C_vtable444, %_C_vtable** %vt_slot2473
  ret %C* %_this1
}


define i32 @_B_over (%B* %_this1, i32 %x2466){
__fresh700:
  %x_slot2467 = alloca i32
  store i32 %x2466, i32* %x_slot2467
  %lhs_or_call2468 = load i32* %x_slot2467
  %bop2469 = add i32 %lhs_or_call2468, 2
  ret i32 %bop2469
}


define %B* @_B_ctor (%B* %_this1){
__fresh699:
  %cast_op2462 = bitcast %B* %_this1 to %A* 
  %dummy2463 = call %A* @_A_ctor ( %A* %cast_op2462 )
  %path2464 = getelementptr %B* %_this1, i32 0, i32 1
  store i8* @_const_str447, i8** %path2464
  %vt_slot2465 = getelementptr %B* %_this1, i32 0, i32 0
  store %_B_vtable* @_B_vtable443, %_B_vtable** %vt_slot2465
  ret %B* %_this1
}


define i32 @_A_over (%A* %_this1, i32 %x2458){
__fresh698:
  %x_slot2459 = alloca i32
  store i32 %x2458, i32* %x_slot2459
  %lhs_or_call2460 = load i32* %x_slot2459
  %bop2461 = add i32 %lhs_or_call2460, 1
  ret i32 %bop2461
}


define %A* @_A_ctor (%A* %_this1){
__fresh697:
  %cast_op2454 = bitcast %A* %_this1 to %Object* 
  %dummy2455 = call %Object* @_Object_ctor ( %Object* %cast_op2454 )
  %path2456 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str446, i8** %path2456
  %vt_slot2457 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable442, %_A_vtable** %vt_slot2457
  ret %A* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh696:
  %path2452 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call2453 = load i8** %path2452
  ret i8* %lhs_or_call2453
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh695:
  %path2450 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str445, i8** %path2450
  %vt_slot2451 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable441, %_Object_vtable** %vt_slot2451
  ret %Object* %_this1
}


