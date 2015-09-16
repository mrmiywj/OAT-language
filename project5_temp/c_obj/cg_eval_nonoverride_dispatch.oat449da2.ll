%C = type { %_C_vtable*, i8* }
%_C_vtable = type { %_B_vtable*, i8* (%Object*)*, i32 (%B*, i32)*, i32 (%A*, i32)*, i32 (%C*, i32)* }
%B = type { %_B_vtable*, i8* }
%_B_vtable = type { %_A_vtable*, i8* (%Object*)*, i32 (%B*, i32)*, i32 (%A*, i32)* }
%A = type { %_A_vtable*, i8* }
%_A_vtable = type { %_Object_vtable*, i8* (%Object*)*, i32 (%A*, i32)*, i32 (%A*, i32)* }
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
@a439 = global %A* zeroinitializer, align 4		; initialized by @a439.init440
@_const_str438.str. = private unnamed_addr constant [ 2 x i8 ] c "C\00", align 4
@_const_str438 = alias bitcast([ 2 x i8 ]* @_const_str438.str. to i8*)@_const_str437.str. = private unnamed_addr constant [ 2 x i8 ] c "B\00", align 4
@_const_str437 = alias bitcast([ 2 x i8 ]* @_const_str437.str. to i8*)@_const_str436.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str436 = alias bitcast([ 2 x i8 ]* @_const_str436.str. to i8*)@_const_str435.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str435 = alias bitcast([ 7 x i8 ]* @_const_str435.str. to i8*)@_C_vtable434 = private constant %_C_vtable {%_B_vtable* @_B_vtable433, i8* (%Object*)* @_Object_get_name, i32 (%B*, i32)* @_B_over, i32 (%A*, i32)* @_A_foo, i32 (%C*, i32)* @_C_notover}, align 4
@_B_vtable433 = private constant %_B_vtable {%_A_vtable* @_A_vtable432, i8* (%Object*)* @_Object_get_name, i32 (%B*, i32)* @_B_over, i32 (%A*, i32)* @_A_foo}, align 4
@_A_vtable432 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable431, i8* (%Object*)* @_Object_get_name, i32 (%A*, i32)* @_A_over, i32 (%A*, i32)* @_A_foo}, align 4
@_Object_vtable431 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh694:
  call void @a439.init440(  )
  ret void
}


define i32 @program (i32 %argc2442, { i32, [ 0 x i8* ] }* %argv2440){
__fresh693:
  %argc_slot2443 = alloca i32
  store i32 %argc2442, i32* %argc_slot2443
  %argv_slot2441 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv2440, { i32, [ 0 x i8* ] }** %argv_slot2441
  %lhs_or_call2444 = load %A** @a439
  %vtmp2446 = getelementptr %A* %lhs_or_call2444, i32 0, i32 0
  %vtable2445 = load %_A_vtable** %vtmp2446
  %fptmp2447 = getelementptr %_A_vtable* %vtable2445, i32 0, i32 3
  %method2448 = load i32 (%A*, i32)** %fptmp2447
  %ret2449 = call i32 %method2448 ( %A* %lhs_or_call2444, i32 3 )
  ret i32 %ret2449
}


define void @a439.init440 (){
__fresh692:
  %mem_ptr2436 = call i32* @oat_malloc ( i32 8 )
  %obj2437 = bitcast i32* %mem_ptr2436 to %C* 
  %new_obj2438 = call %C* @_C_ctor ( %C* %obj2437 )
  %cast_op2439 = bitcast %C* %new_obj2438 to %A* 
  store %A* %cast_op2439, %A** @a439
  ret void
}


define i32 @_C_notover (%C* %_this1, i32 %x2432){
__fresh691:
  %x_slot2433 = alloca i32
  store i32 %x2432, i32* %x_slot2433
  %lhs_or_call2434 = load i32* %x_slot2433
  %bop2435 = add i32 %lhs_or_call2434, 1
  ret i32 %bop2435
}


define %C* @_C_ctor (%C* %_this1){
__fresh690:
  %cast_op2428 = bitcast %C* %_this1 to %B* 
  %dummy2429 = call %B* @_B_ctor ( %B* %cast_op2428 )
  %path2430 = getelementptr %C* %_this1, i32 0, i32 1
  store i8* @_const_str438, i8** %path2430
  %vt_slot2431 = getelementptr %C* %_this1, i32 0, i32 0
  store %_C_vtable* @_C_vtable434, %_C_vtable** %vt_slot2431
  ret %C* %_this1
}


define i32 @_B_over (%B* %_this1, i32 %x2424){
__fresh689:
  %x_slot2425 = alloca i32
  store i32 %x2424, i32* %x_slot2425
  %lhs_or_call2426 = load i32* %x_slot2425
  %bop2427 = add i32 %lhs_or_call2426, 2
  ret i32 %bop2427
}


define %B* @_B_ctor (%B* %_this1){
__fresh688:
  %cast_op2420 = bitcast %B* %_this1 to %A* 
  %dummy2421 = call %A* @_A_ctor ( %A* %cast_op2420 )
  %path2422 = getelementptr %B* %_this1, i32 0, i32 1
  store i8* @_const_str437, i8** %path2422
  %vt_slot2423 = getelementptr %B* %_this1, i32 0, i32 0
  store %_B_vtable* @_B_vtable433, %_B_vtable** %vt_slot2423
  ret %B* %_this1
}


define i32 @_A_foo (%A* %_this1, i32 %x2416){
__fresh687:
  %x_slot2417 = alloca i32
  store i32 %x2416, i32* %x_slot2417
  %lhs_or_call2418 = load i32* %x_slot2417
  %bop2419 = add i32 %lhs_or_call2418, 8
  ret i32 %bop2419
}


define i32 @_A_over (%A* %_this1, i32 %x2412){
__fresh686:
  %x_slot2413 = alloca i32
  store i32 %x2412, i32* %x_slot2413
  %lhs_or_call2414 = load i32* %x_slot2413
  %bop2415 = add i32 %lhs_or_call2414, 1
  ret i32 %bop2415
}


define %A* @_A_ctor (%A* %_this1){
__fresh685:
  %cast_op2408 = bitcast %A* %_this1 to %Object* 
  %dummy2409 = call %Object* @_Object_ctor ( %Object* %cast_op2408 )
  %path2410 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str436, i8** %path2410
  %vt_slot2411 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable432, %_A_vtable** %vt_slot2411
  ret %A* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh684:
  %path2406 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call2407 = load i8** %path2406
  ret i8* %lhs_or_call2407
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh683:
  %path2404 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str435, i8** %path2404
  %vt_slot2405 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable431, %_Object_vtable** %vt_slot2405
  ret %Object* %_this1
}


