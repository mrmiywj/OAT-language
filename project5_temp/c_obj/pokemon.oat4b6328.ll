%Charmander = type { %_Charmander_vtable*, i8*, i32, i8*, i32 }
%_Charmander_vtable = type { %_Pokemon_vtable*, i8* (%Object*)*, void (%Pokemon*, i32)*, void (%Charmander*, %Pikachu*)*, void (%Charmander*)* }
%Pikachu = type { %_Pikachu_vtable*, i8*, i32, i8*, i32 }
%_Pikachu_vtable = type { %_Pokemon_vtable*, i8* (%Object*)*, void (%Pokemon*, i32)*, void (%Pikachu*, %Charmander*)*, void (%Pikachu*)* }
%Pokemon = type { %_Pokemon_vtable*, i8*, i32, i8* }
%_Pokemon_vtable = type { %_Object_vtable*, i8* (%Object*)*, void (%Pokemon*, i32)* }
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
@_const_str608.str. = private unnamed_addr constant [ 2 x i8 ] c "6\00", align 4
@_const_str608 = alias bitcast([ 2 x i8 ]* @_const_str608.str. to i8*)@c606 = global %Charmander* zeroinitializer, align 4		; initialized by @c606.init607
@p604 = global %Pikachu* zeroinitializer, align 4		; initialized by @p604.init605
@_const_str603.str. = private unnamed_addr constant [ 2 x i8 ] c "5\00", align 4
@_const_str603 = alias bitcast([ 2 x i8 ]* @_const_str603.str. to i8*)@_const_str602.str. = private unnamed_addr constant [ 2 x i8 ] c "4\00", align 4
@_const_str602 = alias bitcast([ 2 x i8 ]* @_const_str602.str. to i8*)@_const_str601.str. = private unnamed_addr constant [ 11 x i8 ] c "Charmander\00", align 4
@_const_str601 = alias bitcast([ 11 x i8 ]* @_const_str601.str. to i8*)@_const_str600.str. = private unnamed_addr constant [ 2 x i8 ] c "3\00", align 4
@_const_str600 = alias bitcast([ 2 x i8 ]* @_const_str600.str. to i8*)@_const_str599.str. = private unnamed_addr constant [ 2 x i8 ] c "2\00", align 4
@_const_str599 = alias bitcast([ 2 x i8 ]* @_const_str599.str. to i8*)@_const_str598.str. = private unnamed_addr constant [ 8 x i8 ] c "Pikachu\00", align 4
@_const_str598 = alias bitcast([ 8 x i8 ]* @_const_str598.str. to i8*)@_const_str597.str. = private unnamed_addr constant [ 2 x i8 ] c "9\00", align 4
@_const_str597 = alias bitcast([ 2 x i8 ]* @_const_str597.str. to i8*)@_const_str596.str. = private unnamed_addr constant [ 8 x i8 ] c "Pokemon\00", align 4
@_const_str596 = alias bitcast([ 8 x i8 ]* @_const_str596.str. to i8*)@_const_str595.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str595 = alias bitcast([ 7 x i8 ]* @_const_str595.str. to i8*)@_Charmander_vtable594 = private constant %_Charmander_vtable {%_Pokemon_vtable* @_Pokemon_vtable592, i8* (%Object*)* @_Object_get_name, void (%Pokemon*, i32)* @_Pokemon_gethit, void (%Charmander*, %Pikachu*)* @_Charmander_attack, void (%Charmander*)* @_Charmander_noise}, align 4
@_Pikachu_vtable593 = private constant %_Pikachu_vtable {%_Pokemon_vtable* @_Pokemon_vtable592, i8* (%Object*)* @_Object_get_name, void (%Pokemon*, i32)* @_Pokemon_gethit, void (%Pikachu*, %Charmander*)* @_Pikachu_attack, void (%Pikachu*)* @_Pikachu_noise}, align 4
@_Pokemon_vtable592 = private constant %_Pokemon_vtable {%_Object_vtable* @_Object_vtable591, i8* (%Object*)* @_Object_get_name, void (%Pokemon*, i32)* @_Pokemon_gethit}, align 4
@_Object_vtable591 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh1049:
  call void @p604.init605(  )
  call void @c606.init607(  )
  ret void
}


define i32 @program (i32 %argc3596, { i32, [ 0 x i8* ] }* %argv3594){
__fresh1048:
  %argc_slot3597 = alloca i32
  store i32 %argc3596, i32* %argc_slot3597
  %argv_slot3595 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv3594, { i32, [ 0 x i8* ] }** %argv_slot3595
  %lhs_or_call3599 = load %Charmander** @c606
  %vtmp3601 = getelementptr %Charmander* %lhs_or_call3599, i32 0, i32 0
  %vtable3600 = load %_Charmander_vtable** %vtmp3601
  %fptmp3602 = getelementptr %_Charmander_vtable* %vtable3600, i32 0, i32 3
  %method3603 = load void (%Charmander*, %Pikachu*)** %fptmp3602
  %lhs_or_call3598 = load %Pikachu** @p604
  call void %method3603( %Charmander* %lhs_or_call3599, %Pikachu* %lhs_or_call3598 )
  %lhs_or_call3605 = load %Pikachu** @p604
  %vtmp3607 = getelementptr %Pikachu* %lhs_or_call3605, i32 0, i32 0
  %vtable3606 = load %_Pikachu_vtable** %vtmp3607
  %fptmp3608 = getelementptr %_Pikachu_vtable* %vtable3606, i32 0, i32 3
  %method3609 = load void (%Pikachu*, %Charmander*)** %fptmp3608
  %lhs_or_call3604 = load %Charmander** @c606
  call void %method3609( %Pikachu* %lhs_or_call3605, %Charmander* %lhs_or_call3604 )
  %lhs_or_call3611 = load %Charmander** @c606
  %vtmp3613 = getelementptr %Charmander* %lhs_or_call3611, i32 0, i32 0
  %vtable3612 = load %_Charmander_vtable** %vtmp3613
  %fptmp3614 = getelementptr %_Charmander_vtable* %vtable3612, i32 0, i32 3
  %method3615 = load void (%Charmander*, %Pikachu*)** %fptmp3614
  %lhs_or_call3610 = load %Pikachu** @p604
  call void %method3615( %Charmander* %lhs_or_call3611, %Pikachu* %lhs_or_call3610 )
  %lhs_or_call3617 = load %Pikachu** @p604
  %vtmp3619 = getelementptr %Pikachu* %lhs_or_call3617, i32 0, i32 0
  %vtable3618 = load %_Pikachu_vtable** %vtmp3619
  %fptmp3620 = getelementptr %_Pikachu_vtable* %vtable3618, i32 0, i32 3
  %method3621 = load void (%Pikachu*, %Charmander*)** %fptmp3620
  %lhs_or_call3616 = load %Charmander** @c606
  call void %method3621( %Pikachu* %lhs_or_call3617, %Charmander* %lhs_or_call3616 )
  %lhs_or_call3623 = load %Charmander** @c606
  %vtmp3625 = getelementptr %Charmander* %lhs_or_call3623, i32 0, i32 0
  %vtable3624 = load %_Charmander_vtable** %vtmp3625
  %fptmp3626 = getelementptr %_Charmander_vtable* %vtable3624, i32 0, i32 3
  %method3627 = load void (%Charmander*, %Pikachu*)** %fptmp3626
  %lhs_or_call3622 = load %Pikachu** @p604
  call void %method3627( %Charmander* %lhs_or_call3623, %Pikachu* %lhs_or_call3622 )
  %lhs_or_call3629 = load %Pikachu** @p604
  %vtmp3631 = getelementptr %Pikachu* %lhs_or_call3629, i32 0, i32 0
  %vtable3630 = load %_Pikachu_vtable** %vtmp3631
  %fptmp3632 = getelementptr %_Pikachu_vtable* %vtable3630, i32 0, i32 3
  %method3633 = load void (%Pikachu*, %Charmander*)** %fptmp3632
  %lhs_or_call3628 = load %Charmander** @c606
  call void %method3633( %Pikachu* %lhs_or_call3629, %Charmander* %lhs_or_call3628 )
  %lhs_or_call3635 = load %Charmander** @c606
  %vtmp3637 = getelementptr %Charmander* %lhs_or_call3635, i32 0, i32 0
  %vtable3636 = load %_Charmander_vtable** %vtmp3637
  %fptmp3638 = getelementptr %_Charmander_vtable* %vtable3636, i32 0, i32 3
  %method3639 = load void (%Charmander*, %Pikachu*)** %fptmp3638
  %lhs_or_call3634 = load %Pikachu** @p604
  call void %method3639( %Charmander* %lhs_or_call3635, %Pikachu* %lhs_or_call3634 )
  %lhs_or_call3641 = load %Pikachu** @p604
  %vtmp3643 = getelementptr %Pikachu* %lhs_or_call3641, i32 0, i32 0
  %vtable3642 = load %_Pikachu_vtable** %vtmp3643
  %fptmp3644 = getelementptr %_Pikachu_vtable* %vtable3642, i32 0, i32 3
  %method3645 = load void (%Pikachu*, %Charmander*)** %fptmp3644
  %lhs_or_call3640 = load %Charmander** @c606
  call void %method3645( %Pikachu* %lhs_or_call3641, %Charmander* %lhs_or_call3640 )
  %lhs_or_call3647 = load %Charmander** @c606
  %vtmp3649 = getelementptr %Charmander* %lhs_or_call3647, i32 0, i32 0
  %vtable3648 = load %_Charmander_vtable** %vtmp3649
  %fptmp3650 = getelementptr %_Charmander_vtable* %vtable3648, i32 0, i32 3
  %method3651 = load void (%Charmander*, %Pikachu*)** %fptmp3650
  %lhs_or_call3646 = load %Pikachu** @p604
  call void %method3651( %Charmander* %lhs_or_call3647, %Pikachu* %lhs_or_call3646 )
  call void @print_string( i8* @_const_str608 )
  ret i32 0
}


define void @c606.init607 (){
__fresh1047:
  %mem_ptr3591 = call i32* @oat_malloc ( i32 20 )
  %obj3592 = bitcast i32* %mem_ptr3591 to %Charmander* 
  %new_obj3593 = call %Charmander* @_Charmander_ctor ( %Charmander* %obj3592 )
  store %Charmander* %new_obj3593, %Charmander** @c606
  ret void
}


define void @p604.init605 (){
__fresh1046:
  %mem_ptr3588 = call i32* @oat_malloc ( i32 20 )
  %obj3589 = bitcast i32* %mem_ptr3588 to %Pikachu* 
  %new_obj3590 = call %Pikachu* @_Pikachu_ctor ( %Pikachu* %obj3589 )
  store %Pikachu* %new_obj3590, %Pikachu** @p604
  ret void
}


define void @_Charmander_noise (%Charmander* %_this1){
__fresh1045:
  %path3586 = getelementptr %Charmander* %_this1, i32 0, i32 3
  %lhs_or_call3587 = load i8** %path3586
  call void @print_string( i8* %lhs_or_call3587 )
  ret void
}


define void @_Charmander_attack (%Charmander* %_this1, %Pikachu* %pi3574){
__fresh1044:
  %pi_slot3575 = alloca %Pikachu*
  store %Pikachu* %pi3574, %Pikachu** %pi_slot3575
  call void @print_string( i8* @_const_str603 )
  %path3576 = getelementptr %Charmander* %_this1, i32 0, i32 3
  %lhs_or_call3577 = load i8** %path3576
  call void @print_string( i8* %lhs_or_call3577 )
  %lhs_or_call3580 = load %Pikachu** %pi_slot3575
  %vtmp3582 = getelementptr %Pikachu* %lhs_or_call3580, i32 0, i32 0
  %vtable3581 = load %_Pikachu_vtable** %vtmp3582
  %fptmp3583 = getelementptr %_Pikachu_vtable* %vtable3581, i32 0, i32 2
  %method3584 = load void (%Pokemon*, i32)** %fptmp3583
  %path3578 = getelementptr %Charmander* %_this1, i32 0, i32 4
  %lhs_or_call3579 = load i32* %path3578
  %cast_op3585 = bitcast %Pikachu* %lhs_or_call3580 to %Pokemon* 
  call void %method3584( %Pokemon* %cast_op3585, i32 %lhs_or_call3579 )
  ret void
}


define %Charmander* @_Charmander_ctor (%Charmander* %_this1){
__fresh1043:
  %cast_op3568 = bitcast %Charmander* %_this1 to %Pokemon* 
  %dummy3569 = call %Pokemon* @_Pokemon_ctor ( %Pokemon* %cast_op3568 )
  %path3570 = getelementptr %Charmander* %_this1, i32 0, i32 1
  store i8* @_const_str601, i8** %path3570
  %path3571 = getelementptr %Charmander* %_this1, i32 0, i32 3
  store i8* @_const_str602, i8** %path3571
  %vt_slot3572 = getelementptr %Charmander* %_this1, i32 0, i32 0
  store %_Charmander_vtable* @_Charmander_vtable594, %_Charmander_vtable** %vt_slot3572
  %path3573 = getelementptr %Charmander* %_this1, i32 0, i32 4
  store i32 16, i32* %path3573
  ret %Charmander* %_this1
}


define void @_Pikachu_noise (%Pikachu* %_this1){
__fresh1042:
  %path3566 = getelementptr %Pikachu* %_this1, i32 0, i32 3
  %lhs_or_call3567 = load i8** %path3566
  call void @print_string( i8* %lhs_or_call3567 )
  ret void
}


define void @_Pikachu_attack (%Pikachu* %_this1, %Charmander* %ch3554){
__fresh1041:
  %ch_slot3555 = alloca %Charmander*
  store %Charmander* %ch3554, %Charmander** %ch_slot3555
  call void @print_string( i8* @_const_str600 )
  %path3556 = getelementptr %Pikachu* %_this1, i32 0, i32 3
  %lhs_or_call3557 = load i8** %path3556
  call void @print_string( i8* %lhs_or_call3557 )
  %lhs_or_call3560 = load %Charmander** %ch_slot3555
  %vtmp3562 = getelementptr %Charmander* %lhs_or_call3560, i32 0, i32 0
  %vtable3561 = load %_Charmander_vtable** %vtmp3562
  %fptmp3563 = getelementptr %_Charmander_vtable* %vtable3561, i32 0, i32 2
  %method3564 = load void (%Pokemon*, i32)** %fptmp3563
  %path3558 = getelementptr %Pikachu* %_this1, i32 0, i32 4
  %lhs_or_call3559 = load i32* %path3558
  %cast_op3565 = bitcast %Charmander* %lhs_or_call3560 to %Pokemon* 
  call void %method3564( %Pokemon* %cast_op3565, i32 %lhs_or_call3559 )
  ret void
}


define %Pikachu* @_Pikachu_ctor (%Pikachu* %_this1){
__fresh1040:
  %cast_op3548 = bitcast %Pikachu* %_this1 to %Pokemon* 
  %dummy3549 = call %Pokemon* @_Pokemon_ctor ( %Pokemon* %cast_op3548 )
  %path3550 = getelementptr %Pikachu* %_this1, i32 0, i32 1
  store i8* @_const_str598, i8** %path3550
  %vt_slot3551 = getelementptr %Pikachu* %_this1, i32 0, i32 0
  store %_Pikachu_vtable* @_Pikachu_vtable593, %_Pikachu_vtable** %vt_slot3551
  %path3552 = getelementptr %Pikachu* %_this1, i32 0, i32 4
  store i32 25, i32* %path3552
  %path3553 = getelementptr %Pikachu* %_this1, i32 0, i32 3
  store i8* @_const_str599, i8** %path3553
  ret %Pikachu* %_this1
}


define void @_Pokemon_gethit (%Pokemon* %_this1, i32 %s3539){
__fresh1039:
  %s_slot3540 = alloca i32
  store i32 %s3539, i32* %s_slot3540
  %path3541 = getelementptr %Pokemon* %_this1, i32 0, i32 2
  %path3542 = getelementptr %Pokemon* %_this1, i32 0, i32 2
  %lhs_or_call3543 = load i32* %path3542
  %lhs_or_call3544 = load i32* %s_slot3540
  %bop3545 = sub i32 %lhs_or_call3543, %lhs_or_call3544
  store i32 %bop3545, i32* %path3541
  %path3546 = getelementptr %Pokemon* %_this1, i32 0, i32 3
  %lhs_or_call3547 = load i8** %path3546
  call void @print_string( i8* %lhs_or_call3547 )
  ret void
}


define %Pokemon* @_Pokemon_ctor (%Pokemon* %_this1){
__fresh1038:
  %cast_op3533 = bitcast %Pokemon* %_this1 to %Object* 
  %dummy3534 = call %Object* @_Object_ctor ( %Object* %cast_op3533 )
  %path3535 = getelementptr %Pokemon* %_this1, i32 0, i32 1
  store i8* @_const_str596, i8** %path3535
  %path3536 = getelementptr %Pokemon* %_this1, i32 0, i32 3
  store i8* @_const_str597, i8** %path3536
  %vt_slot3537 = getelementptr %Pokemon* %_this1, i32 0, i32 0
  store %_Pokemon_vtable* @_Pokemon_vtable592, %_Pokemon_vtable** %vt_slot3537
  %path3538 = getelementptr %Pokemon* %_this1, i32 0, i32 2
  store i32 100, i32* %path3538
  ret %Pokemon* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh1037:
  %path3531 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call3532 = load i8** %path3531
  ret i8* %lhs_or_call3532
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh1036:
  %path3529 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str595, i8** %path3529
  %vt_slot3530 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable591, %_Object_vtable** %vt_slot3530
  ret %Object* %_this1
}


