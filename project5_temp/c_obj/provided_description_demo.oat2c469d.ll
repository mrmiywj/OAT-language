%Cow = type { %_Cow_vtable*, i8*, i8* }
%_Cow_vtable = type { %_Animal_vtable*, i8* (%Object*)*, i8* (%Cow*)* }
%Dog = type { %_Dog_vtable*, i8*, i8*, i8* }
%_Dog_vtable = type { %_Animal_vtable*, i8* (%Object*)*, i8* (%Dog*)* }
%Animal = type { %_Animal_vtable*, i8*, i8* }
%_Animal_vtable = type { %_Object_vtable*, i8* (%Object*)*, i8* (%Animal*)* }
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
@_const_str625.str. = private unnamed_addr constant [ 19 x i8 ] c "This dog is stray!\00", align 4
@_const_str625 = alias bitcast([ 19 x i8 ]* @_const_str625.str. to i8*)@_const_str624.str. = private unnamed_addr constant [ 6 x i8 ] c "Timmy\00", align 4
@_const_str624 = alias bitcast([ 6 x i8 ]* @_const_str624.str. to i8*)@_const_str623.str. = private unnamed_addr constant [ 22 x i8 ] c "This dog is owned by \00", align 4
@_const_str623 = alias bitcast([ 22 x i8 ]* @_const_str623.str. to i8*)@_const_str622.str. = private unnamed_addr constant [ 12 x i8 ] c "Example Cow\00", align 4
@_const_str622 = alias bitcast([ 12 x i8 ]* @_const_str622.str. to i8*)@_const_str621.str. = private unnamed_addr constant [ 5 x i8 ] c "Spot\00", align 4
@_const_str621 = alias bitcast([ 5 x i8 ]* @_const_str621.str. to i8*)@_const_str620.str. = private unnamed_addr constant [ 4 x i8 ] c "moo\00", align 4
@_const_str620 = alias bitcast([ 4 x i8 ]* @_const_str620.str. to i8*)@_const_str619.str. = private unnamed_addr constant [ 4 x i8 ] c "Cow\00", align 4
@_const_str619 = alias bitcast([ 4 x i8 ]* @_const_str619.str. to i8*)@_const_str618.str. = private unnamed_addr constant [ 4 x i8 ] c "arf\00", align 4
@_const_str618 = alias bitcast([ 4 x i8 ]* @_const_str618.str. to i8*)@_const_str617.str. = private unnamed_addr constant [ 4 x i8 ] c "Dog\00", align 4
@_const_str617 = alias bitcast([ 4 x i8 ]* @_const_str617.str. to i8*)@_const_str616.str. = private unnamed_addr constant [ 4 x i8 ] c "???\00", align 4
@_const_str616 = alias bitcast([ 4 x i8 ]* @_const_str616.str. to i8*)@_const_str615.str. = private unnamed_addr constant [ 4 x i8 ] c "???\00", align 4
@_const_str615 = alias bitcast([ 4 x i8 ]* @_const_str615.str. to i8*)@_const_str614.str. = private unnamed_addr constant [ 7 x i8 ] c "Animal\00", align 4
@_const_str614 = alias bitcast([ 7 x i8 ]* @_const_str614.str. to i8*)@_const_str613.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str613 = alias bitcast([ 7 x i8 ]* @_const_str613.str. to i8*)@_Cow_vtable612 = private constant %_Cow_vtable {%_Animal_vtable* @_Animal_vtable610, i8* (%Object*)* @_Object_get_name, i8* (%Cow*)* @_Cow_noise}, align 4
@_Dog_vtable611 = private constant %_Dog_vtable {%_Animal_vtable* @_Animal_vtable610, i8* (%Object*)* @_Object_get_name, i8* (%Dog*)* @_Dog_noise}, align 4
@_Animal_vtable610 = private constant %_Animal_vtable {%_Object_vtable* @_Object_vtable609, i8* (%Object*)* @_Object_get_name, i8* (%Animal*)* @_Animal_noise}, align 4
@_Object_vtable609 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh1074:
  ret void
}


define i32 @program (i32 %argc3680, { i32, [ 0 x i8* ] }* %argv3678){
__fresh1067:
  %argc_slot3681 = alloca i32
  store i32 %argc3680, i32* %argc_slot3681
  %argv_slot3679 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv3678, { i32, [ 0 x i8* ] }** %argv_slot3679
  %mem_ptr3682 = call i32* @oat_malloc ( i32 16 )
  %obj3683 = bitcast i32* %mem_ptr3682 to %Dog* 
  %new_obj3684 = call %Dog* @_Dog_ctor ( %Dog* %obj3683, i8* @_const_str621 )
  %cast_op3685 = bitcast %Dog* %new_obj3684 to %Animal* 
  %vdecl_slot3686 = alloca %Animal*
  store %Animal* %cast_op3685, %Animal** %vdecl_slot3686
  %mem_ptr3687 = call i32* @oat_malloc ( i32 12 )
  %obj3688 = bitcast i32* %mem_ptr3687 to %Cow* 
  %new_obj3689 = call %Cow* @_Cow_ctor ( %Cow* %obj3688, i8* @_const_str622 )
  %cast_op3690 = bitcast %Cow* %new_obj3689 to %Animal* 
  %vdecl_slot3691 = alloca %Animal*
  store %Animal* %cast_op3690, %Animal** %vdecl_slot3691
  %lhs_or_call3692 = load %Animal** %vdecl_slot3686
  %vtmp3694 = getelementptr %Animal* %lhs_or_call3692, i32 0, i32 0
  %vtable3693 = load %_Animal_vtable** %vtmp3694
  %fptmp3695 = getelementptr %_Animal_vtable* %vtable3693, i32 0, i32 2
  %method3696 = load i8* (%Animal*)** %fptmp3695
  %ret3697 = call i8* %method3696 ( %Animal* %lhs_or_call3692 )
  call void @print_string( i8* %ret3697 )
  %lhs_or_call3698 = load %Animal** %vdecl_slot3691
  %vtmp3700 = getelementptr %Animal* %lhs_or_call3698, i32 0, i32 0
  %vtable3699 = load %_Animal_vtable** %vtmp3700
  %fptmp3701 = getelementptr %_Animal_vtable* %vtable3699, i32 0, i32 2
  %method3702 = load i8* (%Animal*)** %fptmp3701
  %ret3703 = call i8* %method3702 ( %Animal* %lhs_or_call3698 )
  call void @print_string( i8* %ret3703 )
  %lhs_or_call3704 = load %Animal** %vdecl_slot3686
  %cast_op3705 = bitcast %Animal* %lhs_or_call3704 to %Dog* 
  %cast_op3706 = bitcast %Dog* %cast_op3705 to i8** 
  %cast_op3707 = bitcast %_Dog_vtable* @_Dog_vtable611 to i8* 
  %vt_ptr_slot3708 = alloca i8*
  %tmp03710 = load i8** %cast_op3706
  store i8* %tmp03710, i8** %vt_ptr_slot3708
  br label %__loop1063

__loop1063:
  %tmp13711 = load i8** %vt_ptr_slot3708
  %guard13715 = icmp eq i8* %tmp13711, %cast_op3707
  br i1 %guard13715, label %__then1060, label %__fall11062

__fresh1068:
  br label %__fall11062

__fall11062:
  %guard23716 = icmp eq i8* %tmp13711, null
  br i1 %guard23716, label %__else1059, label %__fall21061

__fresh1069:
  br label %__fall21061

__fall21061:
  %tmp23712 = load i8** %vt_ptr_slot3708
  %tmp33713 = bitcast i8* %tmp23712 to i8** 
  %tmp43714 = load i8** %tmp33713
  store i8* %tmp43714, i8** %vt_ptr_slot3708
  br label %__loop1063

__fresh1070:
  br label %__then1060

__then1060:
  %var_slot3709 = alloca %Dog*
  store %Dog* %cast_op3705, %Dog** %var_slot3709
  %lhs_or_call3717 = load %Dog** %var_slot3709
  %path3718 = getelementptr %Dog* %lhs_or_call3717, i32 0, i32 3
  %lhs_or_call3719 = load i8** %path3718
  %ifnull_slot3720 = alloca i8*
  store i8* %lhs_or_call3719, i8** %ifnull_slot3720
  %ifnull_guard3721 = icmp ne i8* %lhs_or_call3719, null
  br i1 %ifnull_guard3721, label %__then1066, label %__else1065

__fresh1071:
  br label %__then1066

__then1066:
  call void @print_string( i8* @_const_str623 )
  %lhs_or_call3722 = load i8** %ifnull_slot3720
  call void @print_string( i8* %lhs_or_call3722 )
  br label %__merge1064

__fresh1072:
  br label %__else1065

__else1065:
  %lhs_or_call3723 = load %Dog** %var_slot3709
  %path3724 = getelementptr %Dog* %lhs_or_call3723, i32 0, i32 3
  store i8* @_const_str624, i8** %path3724
  call void @print_string( i8* @_const_str625 )
  br label %__merge1064

__merge1064:
  br label %__done1058

__fresh1073:
  br label %__else1059

__else1059:
  br label %__done1058

__done1058:
  ret i32 0
}


define i8* @_Cow_noise (%Cow* %_this1){
__fresh1057:
  ret i8* @_const_str620
}


define %Cow* @_Cow_ctor (%Cow* %_this1, i8* %name3671){
__fresh1056:
  %name_slot3672 = alloca i8*
  store i8* %name3671, i8** %name_slot3672
  %lhs_or_call3673 = load i8** %name_slot3672
  %cast_op3674 = bitcast %Cow* %_this1 to %Animal* 
  %dummy3675 = call %Animal* @_Animal_ctor ( %Animal* %cast_op3674, i8* %lhs_or_call3673 )
  %path3676 = getelementptr %Cow* %_this1, i32 0, i32 1
  store i8* @_const_str619, i8** %path3676
  %vt_slot3677 = getelementptr %Cow* %_this1, i32 0, i32 0
  store %_Cow_vtable* @_Cow_vtable612, %_Cow_vtable** %vt_slot3677
  ret %Cow* %_this1
}


define i8* @_Dog_noise (%Dog* %_this1){
__fresh1055:
  ret i8* @_const_str618
}


define %Dog* @_Dog_ctor (%Dog* %_this1, i8* %name3664){
__fresh1054:
  %name_slot3665 = alloca i8*
  store i8* %name3664, i8** %name_slot3665
  %lhs_or_call3666 = load i8** %name_slot3665
  %cast_op3667 = bitcast %Dog* %_this1 to %Animal* 
  %dummy3668 = call %Animal* @_Animal_ctor ( %Animal* %cast_op3667, i8* %lhs_or_call3666 )
  %path3669 = getelementptr %Dog* %_this1, i32 0, i32 1
  store i8* @_const_str617, i8** %path3669
  %vt_slot3670 = getelementptr %Dog* %_this1, i32 0, i32 0
  store %_Dog_vtable* @_Dog_vtable611, %_Dog_vtable** %vt_slot3670
  ret %Dog* %_this1
}


define i8* @_Animal_noise (%Animal* %_this1){
__fresh1053:
  call void @print_string( i8* @_const_str615 )
  call void @oat_abort( i32 -1 )
  ret i8* @_const_str616
}


define %Animal* @_Animal_ctor (%Animal* %_this1, i8* %name3656){
__fresh1052:
  %name_slot3657 = alloca i8*
  store i8* %name3656, i8** %name_slot3657
  %cast_op3658 = bitcast %Animal* %_this1 to %Object* 
  %dummy3659 = call %Object* @_Object_ctor ( %Object* %cast_op3658 )
  %path3660 = getelementptr %Animal* %_this1, i32 0, i32 1
  store i8* @_const_str614, i8** %path3660
  %path3661 = getelementptr %Animal* %_this1, i32 0, i32 2
  %lhs_or_call3662 = load i8** %name_slot3657
  store i8* %lhs_or_call3662, i8** %path3661
  %vt_slot3663 = getelementptr %Animal* %_this1, i32 0, i32 0
  store %_Animal_vtable* @_Animal_vtable610, %_Animal_vtable** %vt_slot3663
  ret %Animal* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh1051:
  %path3654 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call3655 = load i8** %path3654
  ret i8* %lhs_or_call3655
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh1050:
  %path3652 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str613, i8** %path3652
  %vt_slot3653 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable609, %_Object_vtable** %vt_slot3653
  ret %Object* %_this1
}


