%Array = type { %_Array_vtable*, i8*, { i32, [ 0 x %Array* ] }*, i32, i32 }
%_Array_vtable = type { %_Object_vtable*, i8* (%Object*)*, void (%Array*, i32)*, void (%Array*)*, void (%Array*)*, i32 (%Array*)* }
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
@a589 = global %Array* zeroinitializer, align 4		; initialized by @a589.init590
@_const_str588.str. = private unnamed_addr constant [ 6 x i8 ] c "Array\00", align 4
@_const_str588 = alias bitcast([ 6 x i8 ]* @_const_str588.str. to i8*)@_const_str587.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str587 = alias bitcast([ 7 x i8 ]* @_const_str587.str. to i8*)@_Array_vtable586 = private constant %_Array_vtable {%_Object_vtable* @_Object_vtable585, i8* (%Object*)* @_Object_get_name, void (%Array*, i32)* @_Array_set_length, void (%Array*)* @_Array_add_dimension, void (%Array*)* @_Array_fill_random_bits, i32 (%Array*)* @_Array_total}, align 4
@_Object_vtable585 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh1035:
  call void @a589.init590(  )
  ret void
}


define i32 @program (i32 %argc3496, { i32, [ 0 x i8* ] }* %argv3494){
__fresh1034:
  %argc_slot3497 = alloca i32
  store i32 %argc3496, i32* %argc_slot3497
  %argv_slot3495 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv3494, { i32, [ 0 x i8* ] }** %argv_slot3495
  %lhs_or_call3498 = load %Array** @a589
  %vtmp3500 = getelementptr %Array* %lhs_or_call3498, i32 0, i32 0
  %vtable3499 = load %_Array_vtable** %vtmp3500
  %fptmp3501 = getelementptr %_Array_vtable* %vtable3499, i32 0, i32 2
  %method3502 = load void (%Array*, i32)** %fptmp3501
  call void %method3502( %Array* %lhs_or_call3498, i32 5 )
  %lhs_or_call3503 = load %Array** @a589
  %vtmp3505 = getelementptr %Array* %lhs_or_call3503, i32 0, i32 0
  %vtable3504 = load %_Array_vtable** %vtmp3505
  %fptmp3506 = getelementptr %_Array_vtable* %vtable3504, i32 0, i32 3
  %method3507 = load void (%Array*)** %fptmp3506
  call void %method3507( %Array* %lhs_or_call3503 )
  %lhs_or_call3508 = load %Array** @a589
  %vtmp3510 = getelementptr %Array* %lhs_or_call3508, i32 0, i32 0
  %vtable3509 = load %_Array_vtable** %vtmp3510
  %fptmp3511 = getelementptr %_Array_vtable* %vtable3509, i32 0, i32 3
  %method3512 = load void (%Array*)** %fptmp3511
  call void %method3512( %Array* %lhs_or_call3508 )
  %lhs_or_call3513 = load %Array** @a589
  %vtmp3515 = getelementptr %Array* %lhs_or_call3513, i32 0, i32 0
  %vtable3514 = load %_Array_vtable** %vtmp3515
  %fptmp3516 = getelementptr %_Array_vtable* %vtable3514, i32 0, i32 3
  %method3517 = load void (%Array*)** %fptmp3516
  call void %method3517( %Array* %lhs_or_call3513 )
  %lhs_or_call3518 = load %Array** @a589
  %vtmp3520 = getelementptr %Array* %lhs_or_call3518, i32 0, i32 0
  %vtable3519 = load %_Array_vtable** %vtmp3520
  %fptmp3521 = getelementptr %_Array_vtable* %vtable3519, i32 0, i32 4
  %method3522 = load void (%Array*)** %fptmp3521
  call void %method3522( %Array* %lhs_or_call3518 )
  %lhs_or_call3523 = load %Array** @a589
  %vtmp3525 = getelementptr %Array* %lhs_or_call3523, i32 0, i32 0
  %vtable3524 = load %_Array_vtable** %vtmp3525
  %fptmp3526 = getelementptr %_Array_vtable* %vtable3524, i32 0, i32 5
  %method3527 = load i32 (%Array*)** %fptmp3526
  %ret3528 = call i32 %method3527 ( %Array* %lhs_or_call3523 )
  ret i32 %ret3528
}


define void @a589.init590 (){
__fresh1033:
  %mem_ptr3491 = call i32* @oat_malloc ( i32 20 )
  %obj3492 = bitcast i32* %mem_ptr3491 to %Array* 
  %new_obj3493 = call %Array* @_Array_ctor ( %Array* %obj3492 )
  store %Array* %new_obj3493, %Array** @a589
  ret void
}


define i32 @_Array_total (%Array* %_this1){
__fresh1030:
  %path3466 = getelementptr %Array* %_this1, i32 0, i32 4
  %lhs_or_call3467 = load i32* %path3466
  %vdecl_slot3468 = alloca i32
  store i32 %lhs_or_call3467, i32* %vdecl_slot3468
  %vdecl_slot3469 = alloca i32
  store i32 0, i32* %vdecl_slot3469
  br label %__cond1029

__cond1029:
  %lhs_or_call3470 = load i32* %vdecl_slot3469
  %path3471 = getelementptr %Array* %_this1, i32 0, i32 3
  %lhs_or_call3472 = load i32* %path3471
  %bop3473 = icmp slt i32 %lhs_or_call3470, %lhs_or_call3472
  br i1 %bop3473, label %__body1028, label %__post1027

__fresh1031:
  br label %__body1028

__body1028:
  %lhs_or_call3474 = load i32* %vdecl_slot3468
  %path3475 = getelementptr %Array* %_this1, i32 0, i32 2
  %lhs_or_call3476 = load { i32, [ 0 x %Array* ] }** %path3475
  %lhs_or_call3477 = load i32* %vdecl_slot3469
  %bound_ptr3479 = getelementptr { i32, [ 0 x %Array* ] }* %lhs_or_call3476, i32 0, i32 0
  %bound3480 = load i32* %bound_ptr3479
  call void @oat_array_bounds_check( i32 %bound3480, i32 %lhs_or_call3477 )
  %elt3478 = getelementptr { i32, [ 0 x %Array* ] }* %lhs_or_call3476, i32 0, i32 1, i32 %lhs_or_call3477
  %lhs_or_call3481 = load %Array** %elt3478
  %vtmp3483 = getelementptr %Array* %lhs_or_call3481, i32 0, i32 0
  %vtable3482 = load %_Array_vtable** %vtmp3483
  %fptmp3484 = getelementptr %_Array_vtable* %vtable3482, i32 0, i32 5
  %method3485 = load i32 (%Array*)** %fptmp3484
  %ret3486 = call i32 %method3485 ( %Array* %lhs_or_call3481 )
  %bop3487 = add i32 %lhs_or_call3474, %ret3486
  store i32 %bop3487, i32* %vdecl_slot3468
  %lhs_or_call3488 = load i32* %vdecl_slot3469
  %bop3489 = add i32 %lhs_or_call3488, 1
  store i32 %bop3489, i32* %vdecl_slot3469
  br label %__cond1029

__fresh1032:
  br label %__post1027

__post1027:
  %lhs_or_call3490 = load i32* %vdecl_slot3468
  ret i32 %lhs_or_call3490
}


define void @_Array_fill_random_bits (%Array* %_this1){
__fresh1024:
  %vdecl_slot3447 = alloca i32
  store i32 0, i32* %vdecl_slot3447
  br label %__cond1023

__cond1023:
  %lhs_or_call3448 = load i32* %vdecl_slot3447
  %path3449 = getelementptr %Array* %_this1, i32 0, i32 3
  %lhs_or_call3450 = load i32* %path3449
  %bop3451 = icmp slt i32 %lhs_or_call3448, %lhs_or_call3450
  br i1 %bop3451, label %__body1022, label %__post1021

__fresh1025:
  br label %__body1022

__body1022:
  %path3452 = getelementptr %Array* %_this1, i32 0, i32 2
  %lhs_or_call3453 = load { i32, [ 0 x %Array* ] }** %path3452
  %lhs_or_call3454 = load i32* %vdecl_slot3447
  %bound_ptr3456 = getelementptr { i32, [ 0 x %Array* ] }* %lhs_or_call3453, i32 0, i32 0
  %bound3457 = load i32* %bound_ptr3456
  call void @oat_array_bounds_check( i32 %bound3457, i32 %lhs_or_call3454 )
  %elt3455 = getelementptr { i32, [ 0 x %Array* ] }* %lhs_or_call3453, i32 0, i32 1, i32 %lhs_or_call3454
  %lhs_or_call3458 = load %Array** %elt3455
  %vtmp3460 = getelementptr %Array* %lhs_or_call3458, i32 0, i32 0
  %vtable3459 = load %_Array_vtable** %vtmp3460
  %fptmp3461 = getelementptr %_Array_vtable* %vtable3459, i32 0, i32 4
  %method3462 = load void (%Array*)** %fptmp3461
  call void %method3462( %Array* %lhs_or_call3458 )
  %lhs_or_call3463 = load i32* %vdecl_slot3447
  %bop3464 = add i32 %lhs_or_call3463, 1
  store i32 %bop3464, i32* %vdecl_slot3447
  br label %__cond1023

__fresh1026:
  br label %__post1021

__post1021:
  %path3465 = getelementptr %Array* %_this1, i32 0, i32 4
  store i32 2, i32* %path3465
  ret void
}


define void @_Array_add_dimension (%Array* %_this1){
__fresh1016:
  %path3406 = getelementptr %Array* %_this1, i32 0, i32 2
  %path3407 = getelementptr %Array* %_this1, i32 0, i32 3
  %lhs_or_call3408 = load i32* %path3407
  %array_ptr3409 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 %lhs_or_call3408 )
  %array3410 = bitcast { i32, [ 0 x i32 ] }* %array_ptr3409 to { i32, [ 0 x %Array* ] }* 
  %_tmp5623411 = alloca i32
  store i32 %lhs_or_call3408, i32* %_tmp5623411
  %_tmp5633412 = alloca { i32, [ 0 x %Array* ] }*
  store { i32, [ 0 x %Array* ] }* %array3410, { i32, [ 0 x %Array* ] }** %_tmp5633412
  %vdecl_slot3413 = alloca i32
  store i32 0, i32* %vdecl_slot3413
  br label %__cond1012

__cond1012:
  %lhs_or_call3414 = load i32* %vdecl_slot3413
  %lhs_or_call3415 = load i32* %_tmp5623411
  %bop3416 = icmp slt i32 %lhs_or_call3414, %lhs_or_call3415
  br i1 %bop3416, label %__body1011, label %__post1010

__fresh1017:
  br label %__body1011

__body1011:
  %lhs_or_call3417 = load { i32, [ 0 x %Array* ] }** %_tmp5633412
  %lhs_or_call3418 = load i32* %vdecl_slot3413
  %bound_ptr3420 = getelementptr { i32, [ 0 x %Array* ] }* %lhs_or_call3417, i32 0, i32 0
  %bound3421 = load i32* %bound_ptr3420
  call void @oat_array_bounds_check( i32 %bound3421, i32 %lhs_or_call3418 )
  %elt3419 = getelementptr { i32, [ 0 x %Array* ] }* %lhs_or_call3417, i32 0, i32 1, i32 %lhs_or_call3418
  %mem_ptr3422 = call i32* @oat_malloc ( i32 20 )
  %obj3423 = bitcast i32* %mem_ptr3422 to %Array* 
  %new_obj3424 = call %Array* @_Array_ctor ( %Array* %obj3423 )
  store %Array* %new_obj3424, %Array** %elt3419
  %lhs_or_call3425 = load i32* %vdecl_slot3413
  %bop3426 = add i32 %lhs_or_call3425, 1
  store i32 %bop3426, i32* %vdecl_slot3413
  br label %__cond1012

__fresh1018:
  br label %__post1010

__post1010:
  store { i32, [ 0 x %Array* ] }* %array3410, { i32, [ 0 x %Array* ] }** %path3406
  %vdecl_slot3427 = alloca i32
  store i32 0, i32* %vdecl_slot3427
  br label %__cond1015

__cond1015:
  %lhs_or_call3428 = load i32* %vdecl_slot3427
  %path3429 = getelementptr %Array* %_this1, i32 0, i32 3
  %lhs_or_call3430 = load i32* %path3429
  %bop3431 = icmp slt i32 %lhs_or_call3428, %lhs_or_call3430
  br i1 %bop3431, label %__body1014, label %__post1013

__fresh1019:
  br label %__body1014

__body1014:
  %path3434 = getelementptr %Array* %_this1, i32 0, i32 2
  %lhs_or_call3435 = load { i32, [ 0 x %Array* ] }** %path3434
  %lhs_or_call3436 = load i32* %vdecl_slot3427
  %bound_ptr3438 = getelementptr { i32, [ 0 x %Array* ] }* %lhs_or_call3435, i32 0, i32 0
  %bound3439 = load i32* %bound_ptr3438
  call void @oat_array_bounds_check( i32 %bound3439, i32 %lhs_or_call3436 )
  %elt3437 = getelementptr { i32, [ 0 x %Array* ] }* %lhs_or_call3435, i32 0, i32 1, i32 %lhs_or_call3436
  %lhs_or_call3440 = load %Array** %elt3437
  %vtmp3442 = getelementptr %Array* %lhs_or_call3440, i32 0, i32 0
  %vtable3441 = load %_Array_vtable** %vtmp3442
  %fptmp3443 = getelementptr %_Array_vtable* %vtable3441, i32 0, i32 2
  %method3444 = load void (%Array*, i32)** %fptmp3443
  %path3432 = getelementptr %Array* %_this1, i32 0, i32 3
  %lhs_or_call3433 = load i32* %path3432
  call void %method3444( %Array* %lhs_or_call3440, i32 %lhs_or_call3433 )
  %lhs_or_call3445 = load i32* %vdecl_slot3427
  %bop3446 = add i32 %lhs_or_call3445, 1
  store i32 %bop3446, i32* %vdecl_slot3427
  br label %__cond1015

__fresh1020:
  br label %__post1013

__post1013:
  ret void
}


define void @_Array_set_length (%Array* %_this1, i32 %l3381){
__fresh1007:
  %l_slot3382 = alloca i32
  store i32 %l3381, i32* %l_slot3382
  %path3383 = getelementptr %Array* %_this1, i32 0, i32 3
  %lhs_or_call3384 = load i32* %l_slot3382
  store i32 %lhs_or_call3384, i32* %path3383
  %path3385 = getelementptr %Array* %_this1, i32 0, i32 2
  %path3386 = getelementptr %Array* %_this1, i32 0, i32 3
  %lhs_or_call3387 = load i32* %path3386
  %array_ptr3388 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 %lhs_or_call3387 )
  %array3389 = bitcast { i32, [ 0 x i32 ] }* %array_ptr3388 to { i32, [ 0 x %Array* ] }* 
  %_tmp5603390 = alloca i32
  store i32 %lhs_or_call3387, i32* %_tmp5603390
  %_tmp5613391 = alloca { i32, [ 0 x %Array* ] }*
  store { i32, [ 0 x %Array* ] }* %array3389, { i32, [ 0 x %Array* ] }** %_tmp5613391
  %vdecl_slot3392 = alloca i32
  store i32 0, i32* %vdecl_slot3392
  br label %__cond1006

__cond1006:
  %lhs_or_call3393 = load i32* %vdecl_slot3392
  %lhs_or_call3394 = load i32* %_tmp5603390
  %bop3395 = icmp slt i32 %lhs_or_call3393, %lhs_or_call3394
  br i1 %bop3395, label %__body1005, label %__post1004

__fresh1008:
  br label %__body1005

__body1005:
  %lhs_or_call3396 = load { i32, [ 0 x %Array* ] }** %_tmp5613391
  %lhs_or_call3397 = load i32* %vdecl_slot3392
  %bound_ptr3399 = getelementptr { i32, [ 0 x %Array* ] }* %lhs_or_call3396, i32 0, i32 0
  %bound3400 = load i32* %bound_ptr3399
  call void @oat_array_bounds_check( i32 %bound3400, i32 %lhs_or_call3397 )
  %elt3398 = getelementptr { i32, [ 0 x %Array* ] }* %lhs_or_call3396, i32 0, i32 1, i32 %lhs_or_call3397
  %mem_ptr3401 = call i32* @oat_malloc ( i32 20 )
  %obj3402 = bitcast i32* %mem_ptr3401 to %Array* 
  %new_obj3403 = call %Array* @_Array_ctor ( %Array* %obj3402 )
  store %Array* %new_obj3403, %Array** %elt3398
  %lhs_or_call3404 = load i32* %vdecl_slot3392
  %bop3405 = add i32 %lhs_or_call3404, 1
  store i32 %bop3405, i32* %vdecl_slot3392
  br label %__cond1006

__fresh1009:
  br label %__post1004

__post1004:
  store { i32, [ 0 x %Array* ] }* %array3389, { i32, [ 0 x %Array* ] }** %path3385
  ret void
}


define %Array* @_Array_ctor (%Array* %_this1){
__fresh1001:
  %cast_op3356 = bitcast %Array* %_this1 to %Object* 
  %dummy3357 = call %Object* @_Object_ctor ( %Object* %cast_op3356 )
  %path3358 = getelementptr %Array* %_this1, i32 0, i32 1
  store i8* @_const_str588, i8** %path3358
  %path3359 = getelementptr %Array* %_this1, i32 0, i32 2
  %array_ptr3360 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 0 )
  %array3361 = bitcast { i32, [ 0 x i32 ] }* %array_ptr3360 to { i32, [ 0 x %Array* ] }* 
  %_tmp5573362 = alloca i32
  store i32 0, i32* %_tmp5573362
  %_tmp5583363 = alloca { i32, [ 0 x %Array* ] }*
  store { i32, [ 0 x %Array* ] }* %array3361, { i32, [ 0 x %Array* ] }** %_tmp5583363
  %vdecl_slot3364 = alloca i32
  store i32 0, i32* %vdecl_slot3364
  br label %__cond1000

__cond1000:
  %lhs_or_call3365 = load i32* %vdecl_slot3364
  %lhs_or_call3366 = load i32* %_tmp5573362
  %bop3367 = icmp slt i32 %lhs_or_call3365, %lhs_or_call3366
  br i1 %bop3367, label %__body999, label %__post998

__fresh1002:
  br label %__body999

__body999:
  %lhs_or_call3368 = load { i32, [ 0 x %Array* ] }** %_tmp5583363
  %lhs_or_call3369 = load i32* %vdecl_slot3364
  %bound_ptr3371 = getelementptr { i32, [ 0 x %Array* ] }* %lhs_or_call3368, i32 0, i32 0
  %bound3372 = load i32* %bound_ptr3371
  call void @oat_array_bounds_check( i32 %bound3372, i32 %lhs_or_call3369 )
  %elt3370 = getelementptr { i32, [ 0 x %Array* ] }* %lhs_or_call3368, i32 0, i32 1, i32 %lhs_or_call3369
  %mem_ptr3373 = call i32* @oat_malloc ( i32 20 )
  %obj3374 = bitcast i32* %mem_ptr3373 to %Array* 
  %new_obj3375 = call %Array* @_Array_ctor ( %Array* %obj3374 )
  store %Array* %new_obj3375, %Array** %elt3370
  %lhs_or_call3376 = load i32* %vdecl_slot3364
  %bop3377 = add i32 %lhs_or_call3376, 1
  store i32 %bop3377, i32* %vdecl_slot3364
  br label %__cond1000

__fresh1003:
  br label %__post998

__post998:
  store { i32, [ 0 x %Array* ] }* %array3361, { i32, [ 0 x %Array* ] }** %path3359
  %vt_slot3378 = getelementptr %Array* %_this1, i32 0, i32 0
  store %_Array_vtable* @_Array_vtable586, %_Array_vtable** %vt_slot3378
  %path3379 = getelementptr %Array* %_this1, i32 0, i32 4
  store i32 0, i32* %path3379
  %path3380 = getelementptr %Array* %_this1, i32 0, i32 3
  store i32 0, i32* %path3380
  ret %Array* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh997:
  %path3354 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call3355 = load i8** %path3354
  ret i8* %lhs_or_call3355
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh996:
  %path3352 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str587, i8** %path3352
  %vt_slot3353 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable585, %_Object_vtable** %vt_slot3353
  ret %Object* %_this1
}


