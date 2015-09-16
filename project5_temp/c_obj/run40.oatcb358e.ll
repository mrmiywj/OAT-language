%C = type { %_C_vtable*, i8*, %B* }
%_C_vtable = type { %_Object_vtable*, i8* (%Object*)*, void (%C*)* }
%B = type { %_B_vtable*, i8*, %A* }
%_B_vtable = type { %_Object_vtable*, i8* (%Object*)*, void (%B*)* }
%A = type { %_A_vtable*, i8* }
%_A_vtable = type { %_Object_vtable*, i8* (%Object*)*, void (%A*)* }
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
@_const_str272.str. = private unnamed_addr constant [ 2 x i8 ] c "C\00", align 4
@_const_str272 = alias bitcast([ 2 x i8 ]* @_const_str272.str. to i8*)@_const_str271.str. = private unnamed_addr constant [ 2 x i8 ] c "C\00", align 4
@_const_str271 = alias bitcast([ 2 x i8 ]* @_const_str271.str. to i8*)@_const_str270.str. = private unnamed_addr constant [ 2 x i8 ] c "B\00", align 4
@_const_str270 = alias bitcast([ 2 x i8 ]* @_const_str270.str. to i8*)@_const_str269.str. = private unnamed_addr constant [ 2 x i8 ] c "B\00", align 4
@_const_str269 = alias bitcast([ 2 x i8 ]* @_const_str269.str. to i8*)@_const_str268.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str268 = alias bitcast([ 2 x i8 ]* @_const_str268.str. to i8*)@_const_str267.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str267 = alias bitcast([ 2 x i8 ]* @_const_str267.str. to i8*)@_const_str266.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str266 = alias bitcast([ 7 x i8 ]* @_const_str266.str. to i8*)@_C_vtable265 = private constant %_C_vtable {%_Object_vtable* @_Object_vtable262, i8* (%Object*)* @_Object_get_name, void (%C*)* @_C_f}, align 4
@_B_vtable264 = private constant %_B_vtable {%_Object_vtable* @_Object_vtable262, i8* (%Object*)* @_Object_get_name, void (%B*)* @_B_f}, align 4
@_A_vtable263 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable262, i8* (%Object*)* @_Object_get_name, void (%A*)* @_A_f}, align 4
@_Object_vtable262 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh458:
  ret void
}


define i32 @program (i32 %argc1382, { i32, [ 0 x i8* ] }* %argv1380){
__fresh457:
  %argc_slot1383 = alloca i32
  store i32 %argc1382, i32* %argc_slot1383
  %argv_slot1381 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv1380, { i32, [ 0 x i8* ] }** %argv_slot1381
  %mem_ptr1384 = call i32* @oat_malloc ( i32 12 )
  %obj1385 = bitcast i32* %mem_ptr1384 to %C* 
  %new_obj1386 = call %C* @_C_ctor ( %C* %obj1385 )
  %vdecl_slot1387 = alloca %C*
  store %C* %new_obj1386, %C** %vdecl_slot1387
  %lhs_or_call1388 = load %C** %vdecl_slot1387
  %vtmp1390 = getelementptr %C* %lhs_or_call1388, i32 0, i32 0
  %vtable1389 = load %_C_vtable** %vtmp1390
  %fptmp1391 = getelementptr %_C_vtable* %vtable1389, i32 0, i32 2
  %method1392 = load void (%C*)** %fptmp1391
  call void %method1392( %C* %lhs_or_call1388 )
  %lhs_or_call1393 = load %C** %vdecl_slot1387
  %path1394 = getelementptr %C* %lhs_or_call1393, i32 0, i32 2
  %lhs_or_call1395 = load %B** %path1394
  %vtmp1397 = getelementptr %B* %lhs_or_call1395, i32 0, i32 0
  %vtable1396 = load %_B_vtable** %vtmp1397
  %fptmp1398 = getelementptr %_B_vtable* %vtable1396, i32 0, i32 2
  %method1399 = load void (%B*)** %fptmp1398
  call void %method1399( %B* %lhs_or_call1395 )
  %lhs_or_call1400 = load %C** %vdecl_slot1387
  %path1401 = getelementptr %C* %lhs_or_call1400, i32 0, i32 2
  %lhs_or_call1402 = load %B** %path1401
  %path1403 = getelementptr %B* %lhs_or_call1402, i32 0, i32 2
  %lhs_or_call1404 = load %A** %path1403
  %vtmp1406 = getelementptr %A* %lhs_or_call1404, i32 0, i32 0
  %vtable1405 = load %_A_vtable** %vtmp1406
  %fptmp1407 = getelementptr %_A_vtable* %vtable1405, i32 0, i32 2
  %method1408 = load void (%A*)** %fptmp1407
  call void %method1408( %A* %lhs_or_call1404 )
  ret i32 0
}


define void @_C_f (%C* %_this1){
__fresh456:
  call void @print_string( i8* @_const_str272 )
  ret void
}


define %C* @_C_ctor (%C* %_this1){
__fresh455:
  %cast_op1372 = bitcast %C* %_this1 to %Object* 
  %dummy1373 = call %Object* @_Object_ctor ( %Object* %cast_op1372 )
  %path1374 = getelementptr %C* %_this1, i32 0, i32 1
  store i8* @_const_str271, i8** %path1374
  %path1375 = getelementptr %C* %_this1, i32 0, i32 2
  %mem_ptr1376 = call i32* @oat_malloc ( i32 12 )
  %obj1377 = bitcast i32* %mem_ptr1376 to %B* 
  %new_obj1378 = call %B* @_B_ctor ( %B* %obj1377 )
  store %B* %new_obj1378, %B** %path1375
  %vt_slot1379 = getelementptr %C* %_this1, i32 0, i32 0
  store %_C_vtable* @_C_vtable265, %_C_vtable** %vt_slot1379
  ret %C* %_this1
}


define void @_B_f (%B* %_this1){
__fresh454:
  call void @print_string( i8* @_const_str270 )
  ret void
}


define %B* @_B_ctor (%B* %_this1){
__fresh453:
  %cast_op1364 = bitcast %B* %_this1 to %Object* 
  %dummy1365 = call %Object* @_Object_ctor ( %Object* %cast_op1364 )
  %path1366 = getelementptr %B* %_this1, i32 0, i32 1
  store i8* @_const_str269, i8** %path1366
  %path1367 = getelementptr %B* %_this1, i32 0, i32 2
  %mem_ptr1368 = call i32* @oat_malloc ( i32 8 )
  %obj1369 = bitcast i32* %mem_ptr1368 to %A* 
  %new_obj1370 = call %A* @_A_ctor ( %A* %obj1369 )
  store %A* %new_obj1370, %A** %path1367
  %vt_slot1371 = getelementptr %B* %_this1, i32 0, i32 0
  store %_B_vtable* @_B_vtable264, %_B_vtable** %vt_slot1371
  ret %B* %_this1
}


define void @_A_f (%A* %_this1){
__fresh452:
  call void @print_string( i8* @_const_str268 )
  ret void
}


define %A* @_A_ctor (%A* %_this1){
__fresh451:
  %cast_op1360 = bitcast %A* %_this1 to %Object* 
  %dummy1361 = call %Object* @_Object_ctor ( %Object* %cast_op1360 )
  %path1362 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str267, i8** %path1362
  %vt_slot1363 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable263, %_A_vtable** %vt_slot1363
  ret %A* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh450:
  %path1358 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call1359 = load i8** %path1358
  ret i8* %lhs_or_call1359
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh449:
  %path1356 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str266, i8** %path1356
  %vt_slot1357 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable262, %_Object_vtable** %vt_slot1357
  ret %Object* %_this1
}


