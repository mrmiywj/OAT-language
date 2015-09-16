%C = type { %_C_vtable*, i8*, i32 }
%_C_vtable = type { %_A_vtable*, i8* (%Object*)* }
%B = type { %_B_vtable*, i8*, i32 }
%_B_vtable = type { %_A_vtable*, i8* (%Object*)* }
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
@_const_str280.str. = private unnamed_addr constant [ 2 x i8 ] c "C\00", align 4
@_const_str280 = alias bitcast([ 2 x i8 ]* @_const_str280.str. to i8*)@_const_str279.str. = private unnamed_addr constant [ 2 x i8 ] c "B\00", align 4
@_const_str279 = alias bitcast([ 2 x i8 ]* @_const_str279.str. to i8*)@_const_str278.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str278 = alias bitcast([ 2 x i8 ]* @_const_str278.str. to i8*)@_const_str277.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str277 = alias bitcast([ 7 x i8 ]* @_const_str277.str. to i8*)@_C_vtable276 = private constant %_C_vtable {%_A_vtable* @_A_vtable274, i8* (%Object*)* @_Object_get_name}, align 4
@_B_vtable275 = private constant %_B_vtable {%_A_vtable* @_A_vtable274, i8* (%Object*)* @_Object_get_name}, align 4
@_A_vtable274 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable273, i8* (%Object*)* @_Object_get_name}, align 4
@_Object_vtable273 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh470:
  ret void
}


define i32 @program (i32 %argc1430, { i32, [ 0 x i8* ] }* %argv1428){
__fresh467:
  %argc_slot1431 = alloca i32
  store i32 %argc1430, i32* %argc_slot1431
  %argv_slot1429 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv1428, { i32, [ 0 x i8* ] }** %argv_slot1429
  %array_ptr1432 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 3 )
  %array1433 = bitcast { i32, [ 0 x i32 ] }* %array_ptr1432 to { i32, [ 0 x %A* ] }* 
  %mem_ptr1434 = call i32* @oat_malloc ( i32 12 )
  %obj1435 = bitcast i32* %mem_ptr1434 to %A* 
  %new_obj1436 = call %A* @_A_ctor ( %A* %obj1435 )
  %index_ptr1437 = getelementptr { i32, [ 0 x %A* ] }* %array1433, i32 0, i32 1, i32 0
  store %A* %new_obj1436, %A** %index_ptr1437
  %mem_ptr1438 = call i32* @oat_malloc ( i32 12 )
  %obj1439 = bitcast i32* %mem_ptr1438 to %B* 
  %new_obj1440 = call %B* @_B_ctor ( %B* %obj1439 )
  %cast_op1441 = bitcast %B* %new_obj1440 to %A* 
  %index_ptr1442 = getelementptr { i32, [ 0 x %A* ] }* %array1433, i32 0, i32 1, i32 1
  store %A* %cast_op1441, %A** %index_ptr1442
  %mem_ptr1443 = call i32* @oat_malloc ( i32 12 )
  %obj1444 = bitcast i32* %mem_ptr1443 to %C* 
  %new_obj1445 = call %C* @_C_ctor ( %C* %obj1444 )
  %cast_op1446 = bitcast %C* %new_obj1445 to %A* 
  %index_ptr1447 = getelementptr { i32, [ 0 x %A* ] }* %array1433, i32 0, i32 1, i32 2
  store %A* %cast_op1446, %A** %index_ptr1447
  %vdecl_slot1448 = alloca { i32, [ 0 x %A* ] }*
  store { i32, [ 0 x %A* ] }* %array1433, { i32, [ 0 x %A* ] }** %vdecl_slot1448
  %vdecl_slot1449 = alloca i32
  store i32 0, i32* %vdecl_slot1449
  br label %__cond466

__cond466:
  %lhs_or_call1450 = load i32* %vdecl_slot1449
  %lhs_or_call1451 = load { i32, [ 0 x %A* ] }** %vdecl_slot1448
  %len_ptr1452 = getelementptr { i32, [ 0 x %A* ] }* %lhs_or_call1451, i32 0, i32 0
  %len1453 = load i32* %len_ptr1452
  %bop1454 = icmp slt i32 %lhs_or_call1450, %len1453
  br i1 %bop1454, label %__body465, label %__post464

__fresh468:
  br label %__body465

__body465:
  %lhs_or_call1455 = load { i32, [ 0 x %A* ] }** %vdecl_slot1448
  %lhs_or_call1456 = load i32* %vdecl_slot1449
  %bound_ptr1458 = getelementptr { i32, [ 0 x %A* ] }* %lhs_or_call1455, i32 0, i32 0
  %bound1459 = load i32* %bound_ptr1458
  call void @oat_array_bounds_check( i32 %bound1459, i32 %lhs_or_call1456 )
  %elt1457 = getelementptr { i32, [ 0 x %A* ] }* %lhs_or_call1455, i32 0, i32 1, i32 %lhs_or_call1456
  %lhs_or_call1460 = load %A** %elt1457
  %path1461 = getelementptr %A* %lhs_or_call1460, i32 0, i32 2
  %lhs_or_call1462 = load i32* %path1461
  call void @print_int( i32 %lhs_or_call1462 )
  %lhs_or_call1463 = load i32* %vdecl_slot1449
  %bop1464 = add i32 %lhs_or_call1463, 1
  store i32 %bop1464, i32* %vdecl_slot1449
  br label %__cond466

__fresh469:
  br label %__post464

__post464:
  ret i32 0
}


define %C* @_C_ctor (%C* %_this1){
__fresh463:
  %cast_op1423 = bitcast %C* %_this1 to %A* 
  %dummy1424 = call %A* @_A_ctor ( %A* %cast_op1423 )
  %path1425 = getelementptr %C* %_this1, i32 0, i32 1
  store i8* @_const_str280, i8** %path1425
  %vt_slot1426 = getelementptr %C* %_this1, i32 0, i32 0
  store %_C_vtable* @_C_vtable276, %_C_vtable** %vt_slot1426
  %path1427 = getelementptr %C* %_this1, i32 0, i32 2
  store i32 2, i32* %path1427
  ret %C* %_this1
}


define %B* @_B_ctor (%B* %_this1){
__fresh462:
  %cast_op1418 = bitcast %B* %_this1 to %A* 
  %dummy1419 = call %A* @_A_ctor ( %A* %cast_op1418 )
  %path1420 = getelementptr %B* %_this1, i32 0, i32 1
  store i8* @_const_str279, i8** %path1420
  %vt_slot1421 = getelementptr %B* %_this1, i32 0, i32 0
  store %_B_vtable* @_B_vtable275, %_B_vtable** %vt_slot1421
  %path1422 = getelementptr %B* %_this1, i32 0, i32 2
  store i32 1, i32* %path1422
  ret %B* %_this1
}


define %A* @_A_ctor (%A* %_this1){
__fresh461:
  %cast_op1413 = bitcast %A* %_this1 to %Object* 
  %dummy1414 = call %Object* @_Object_ctor ( %Object* %cast_op1413 )
  %path1415 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str278, i8** %path1415
  %vt_slot1416 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable274, %_A_vtable** %vt_slot1416
  %path1417 = getelementptr %A* %_this1, i32 0, i32 2
  store i32 0, i32* %path1417
  ret %A* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh460:
  %path1411 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call1412 = load i8** %path1411
  ret i8* %lhs_or_call1412
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh459:
  %path1409 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str277, i8** %path1409
  %vt_slot1410 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable273, %_Object_vtable** %vt_slot1410
  ret %Object* %_this1
}


