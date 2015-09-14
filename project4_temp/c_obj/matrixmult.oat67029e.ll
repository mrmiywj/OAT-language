declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@_oat_string3799.str. = private unnamed_addr constant [ 2 x i8 ] c "
\00", align 4
@_oat_string3799 = global i8* getelementptr inbounds ([ 2 x i8 ]* @_oat_string3799.str., i32 0, i32 0), align 4
@_oat_string3795.str. = private unnamed_addr constant [ 2 x i8 ] c " \00", align 4
@_oat_string3795 = global i8* getelementptr inbounds ([ 2 x i8 ]* @_oat_string3795.str., i32 0, i32 0), align 4
define void @oat_init (){

__fresh737:
  ret void
}


define void @prnNx4 ({ i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %ar3777, i32 %n3775){

__fresh732:
  %ar_slot3778 = alloca { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }*
  store { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %ar3777, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %ar_slot3778
  %n_slot3776 = alloca i32
  store i32 %n3775, i32* %n_slot3776
  %i3779 = alloca i32
  store i32 0, i32* %i3779
  br label %__cond728

__cond728:
  %_lhs3780 = load i32* %i3779
  %_lhs3781 = load i32* %n_slot3776
  %bop3782 = icmp slt i32 %_lhs3780, %_lhs3781
  br i1 %bop3782, label %__body727, label %__post726

__fresh733:
  br label %__body727

__body727:
  %j3783 = alloca i32
  store i32 0, i32* %j3783
  br label %__cond731

__cond731:
  %_lhs3784 = load i32* %j3783
  %bop3785 = icmp slt i32 %_lhs3784, 4
  br i1 %bop3785, label %__body730, label %__post729

__fresh734:
  br label %__body730

__body730:
  %_lhs3787 = load i32* %i3779
  %bound_ptr3789 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %ar_slot3778, i32 0, i32 0
  %bound3790 = load i32* %bound_ptr3789
  call void @oat_array_bounds_check( i32 %bound3790, i32 %_lhs3787 )
  %elt3788 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %ar_slot3778, i32 0, i32 1, i32 %_lhs3787
  %_lhs3786 = load i32* %j3783
  %bound_ptr3792 = getelementptr { i32, [ 0 x i32 ] }** %elt3788, i32 0, i32 0
  %bound3793 = load i32* %bound_ptr3792
  call void @oat_array_bounds_check( i32 %bound3793, i32 %_lhs3786 )
  %elt3791 = getelementptr { i32, [ 0 x i32 ] }** %elt3788, i32 0, i32 1, i32 %_lhs3786
  %_lhs3794 = load i32* %elt3791
  call void @print_int( i32 %_lhs3794 )
  %strval3796 = load i8** @_oat_string3795
  call void @print_string( i8* %strval3796 )
  %_lhs3797 = load i32* %j3783
  %bop3798 = add i32 %_lhs3797, 1
  store i32 %bop3798, i32* %j3783
  br label %__cond731

__fresh735:
  br label %__post729

__post729:
  %strval3800 = load i8** @_oat_string3799
  call void @print_string( i8* %strval3800 )
  %_lhs3801 = load i32* %i3779
  %bop3802 = add i32 %_lhs3801, 1
  store i32 %bop3802, i32* %i3779
  br label %__cond728

__fresh736:
  br label %__post726

__post726:
  ret void
}


define i32 @dot3 ({ i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %a13745, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %a23743, i32 %row3741, i32 %col3739){

__fresh723:
  %a1_slot3746 = alloca { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }*
  store { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %a13745, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a1_slot3746
  %a2_slot3744 = alloca { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }*
  store { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %a23743, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a2_slot3744
  %row_slot3742 = alloca i32
  store i32 %row3741, i32* %row_slot3742
  %col_slot3740 = alloca i32
  store i32 %col3739, i32* %col_slot3740
  %sum3747 = alloca i32
  store i32 0, i32* %sum3747
  %k3748 = alloca i32
  store i32 0, i32* %k3748
  br label %__cond722

__cond722:
  %_lhs3749 = load i32* %k3748
  %bop3750 = icmp slt i32 %_lhs3749, 3
  br i1 %bop3750, label %__body721, label %__post720

__fresh724:
  br label %__body721

__body721:
  %_lhs3751 = load i32* %sum3747
  %_lhs3753 = load i32* %row_slot3742
  %bound_ptr3755 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a1_slot3746, i32 0, i32 0
  %bound3756 = load i32* %bound_ptr3755
  call void @oat_array_bounds_check( i32 %bound3756, i32 %_lhs3753 )
  %elt3754 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a1_slot3746, i32 0, i32 1, i32 %_lhs3753
  %_lhs3752 = load i32* %k3748
  %bound_ptr3758 = getelementptr { i32, [ 0 x i32 ] }** %elt3754, i32 0, i32 0
  %bound3759 = load i32* %bound_ptr3758
  call void @oat_array_bounds_check( i32 %bound3759, i32 %_lhs3752 )
  %elt3757 = getelementptr { i32, [ 0 x i32 ] }** %elt3754, i32 0, i32 1, i32 %_lhs3752
  %_lhs3760 = load i32* %elt3757
  %_lhs3762 = load i32* %k3748
  %bound_ptr3764 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a2_slot3744, i32 0, i32 0
  %bound3765 = load i32* %bound_ptr3764
  call void @oat_array_bounds_check( i32 %bound3765, i32 %_lhs3762 )
  %elt3763 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a2_slot3744, i32 0, i32 1, i32 %_lhs3762
  %_lhs3761 = load i32* %col_slot3740
  %bound_ptr3767 = getelementptr { i32, [ 0 x i32 ] }** %elt3763, i32 0, i32 0
  %bound3768 = load i32* %bound_ptr3767
  call void @oat_array_bounds_check( i32 %bound3768, i32 %_lhs3761 )
  %elt3766 = getelementptr { i32, [ 0 x i32 ] }** %elt3763, i32 0, i32 1, i32 %_lhs3761
  %_lhs3769 = load i32* %elt3766
  %bop3770 = mul i32 %_lhs3760, %_lhs3769
  %bop3771 = add i32 %_lhs3751, %bop3770
  store i32 %bop3771, i32* %sum3747
  %_lhs3772 = load i32* %k3748
  %bop3773 = add i32 %_lhs3772, 1
  store i32 %bop3773, i32* %k3748
  br label %__cond722

__fresh725:
  br label %__post720

__post720:
  %_lhs3774 = load i32* %sum3747
  ret i32 %_lhs3774
}


define void @matrix_MultAlt ({ i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %a13714, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %a23712, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %a33710){

__fresh715:
  %a1_slot3715 = alloca { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }*
  store { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %a13714, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a1_slot3715
  %a2_slot3713 = alloca { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }*
  store { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %a23712, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a2_slot3713
  %a3_slot3711 = alloca { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }*
  store { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %a33710, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a3_slot3711
  %i3716 = alloca i32
  store i32 0, i32* %i3716
  br label %__cond711

__cond711:
  %_lhs3717 = load i32* %i3716
  %bop3718 = icmp slt i32 %_lhs3717, 2
  br i1 %bop3718, label %__body710, label %__post709

__fresh716:
  br label %__body710

__body710:
  %j3719 = alloca i32
  store i32 0, i32* %j3719
  br label %__cond714

__cond714:
  %_lhs3720 = load i32* %j3719
  %bop3721 = icmp slt i32 %_lhs3720, 4
  br i1 %bop3721, label %__body713, label %__post712

__fresh717:
  br label %__body713

__body713:
  %_lhs3723 = load i32* %i3716
  %bound_ptr3725 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a3_slot3711, i32 0, i32 0
  %bound3726 = load i32* %bound_ptr3725
  call void @oat_array_bounds_check( i32 %bound3726, i32 %_lhs3723 )
  %elt3724 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a3_slot3711, i32 0, i32 1, i32 %_lhs3723
  %_lhs3722 = load i32* %j3719
  %bound_ptr3728 = getelementptr { i32, [ 0 x i32 ] }** %elt3724, i32 0, i32 0
  %bound3729 = load i32* %bound_ptr3728
  call void @oat_array_bounds_check( i32 %bound3729, i32 %_lhs3722 )
  %elt3727 = getelementptr { i32, [ 0 x i32 ] }** %elt3724, i32 0, i32 1, i32 %_lhs3722
  %_lhs3733 = load i32* %j3719
  %_lhs3732 = load i32* %i3716
  %_lhs3731 = load { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a2_slot3713
  %_lhs3730 = load { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a1_slot3715
  %ret3734 = call i32 @dot3 ( { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %_lhs3730, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %_lhs3731, i32 %_lhs3732, i32 %_lhs3733 )
  store i32 %ret3734, i32* %elt3727
  %_lhs3735 = load i32* %j3719
  %bop3736 = add i32 %_lhs3735, 1
  store i32 %bop3736, i32* %j3719
  br label %__cond714

__fresh718:
  br label %__post712

__post712:
  %_lhs3737 = load i32* %i3716
  %bop3738 = add i32 %_lhs3737, 1
  store i32 %bop3738, i32* %i3716
  br label %__cond711

__fresh719:
  br label %__post709

__post709:
  ret void
}


define void @matrix_Mult ({ i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %a13656, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %a23654, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %a33652){

__fresh702:
  %a1_slot3657 = alloca { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }*
  store { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %a13656, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a1_slot3657
  %a2_slot3655 = alloca { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }*
  store { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %a23654, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a2_slot3655
  %a3_slot3653 = alloca { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }*
  store { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %a33652, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a3_slot3653
  %i3658 = alloca i32
  store i32 0, i32* %i3658
  br label %__cond695

__cond695:
  %_lhs3659 = load i32* %i3658
  %bop3660 = icmp slt i32 %_lhs3659, 2
  br i1 %bop3660, label %__body694, label %__post693

__fresh703:
  br label %__body694

__body694:
  %j3661 = alloca i32
  store i32 0, i32* %j3661
  br label %__cond698

__cond698:
  %_lhs3662 = load i32* %j3661
  %bop3663 = icmp slt i32 %_lhs3662, 4
  br i1 %bop3663, label %__body697, label %__post696

__fresh704:
  br label %__body697

__body697:
  %k3664 = alloca i32
  store i32 0, i32* %k3664
  br label %__cond701

__cond701:
  %_lhs3665 = load i32* %k3664
  %bop3666 = icmp slt i32 %_lhs3665, 3
  br i1 %bop3666, label %__body700, label %__post699

__fresh705:
  br label %__body700

__body700:
  %_lhs3668 = load i32* %i3658
  %bound_ptr3670 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a3_slot3653, i32 0, i32 0
  %bound3671 = load i32* %bound_ptr3670
  call void @oat_array_bounds_check( i32 %bound3671, i32 %_lhs3668 )
  %elt3669 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a3_slot3653, i32 0, i32 1, i32 %_lhs3668
  %_lhs3667 = load i32* %j3661
  %bound_ptr3673 = getelementptr { i32, [ 0 x i32 ] }** %elt3669, i32 0, i32 0
  %bound3674 = load i32* %bound_ptr3673
  call void @oat_array_bounds_check( i32 %bound3674, i32 %_lhs3667 )
  %elt3672 = getelementptr { i32, [ 0 x i32 ] }** %elt3669, i32 0, i32 1, i32 %_lhs3667
  %_lhs3676 = load i32* %i3658
  %bound_ptr3678 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a3_slot3653, i32 0, i32 0
  %bound3679 = load i32* %bound_ptr3678
  call void @oat_array_bounds_check( i32 %bound3679, i32 %_lhs3676 )
  %elt3677 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a3_slot3653, i32 0, i32 1, i32 %_lhs3676
  %_lhs3675 = load i32* %j3661
  %bound_ptr3681 = getelementptr { i32, [ 0 x i32 ] }** %elt3677, i32 0, i32 0
  %bound3682 = load i32* %bound_ptr3681
  call void @oat_array_bounds_check( i32 %bound3682, i32 %_lhs3675 )
  %elt3680 = getelementptr { i32, [ 0 x i32 ] }** %elt3677, i32 0, i32 1, i32 %_lhs3675
  %_lhs3683 = load i32* %elt3680
  %_lhs3685 = load i32* %i3658
  %bound_ptr3687 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a1_slot3657, i32 0, i32 0
  %bound3688 = load i32* %bound_ptr3687
  call void @oat_array_bounds_check( i32 %bound3688, i32 %_lhs3685 )
  %elt3686 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a1_slot3657, i32 0, i32 1, i32 %_lhs3685
  %_lhs3684 = load i32* %k3664
  %bound_ptr3690 = getelementptr { i32, [ 0 x i32 ] }** %elt3686, i32 0, i32 0
  %bound3691 = load i32* %bound_ptr3690
  call void @oat_array_bounds_check( i32 %bound3691, i32 %_lhs3684 )
  %elt3689 = getelementptr { i32, [ 0 x i32 ] }** %elt3686, i32 0, i32 1, i32 %_lhs3684
  %_lhs3692 = load i32* %elt3689
  %_lhs3694 = load i32* %k3664
  %bound_ptr3696 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a2_slot3655, i32 0, i32 0
  %bound3697 = load i32* %bound_ptr3696
  call void @oat_array_bounds_check( i32 %bound3697, i32 %_lhs3694 )
  %elt3695 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a2_slot3655, i32 0, i32 1, i32 %_lhs3694
  %_lhs3693 = load i32* %j3661
  %bound_ptr3699 = getelementptr { i32, [ 0 x i32 ] }** %elt3695, i32 0, i32 0
  %bound3700 = load i32* %bound_ptr3699
  call void @oat_array_bounds_check( i32 %bound3700, i32 %_lhs3693 )
  %elt3698 = getelementptr { i32, [ 0 x i32 ] }** %elt3695, i32 0, i32 1, i32 %_lhs3693
  %_lhs3701 = load i32* %elt3698
  %bop3702 = mul i32 %_lhs3692, %_lhs3701
  %bop3703 = add i32 %_lhs3683, %bop3702
  store i32 %bop3703, i32* %elt3672
  %_lhs3704 = load i32* %k3664
  %bop3705 = add i32 %_lhs3704, 1
  store i32 %bop3705, i32* %k3664
  br label %__cond701

__fresh706:
  br label %__post699

__post699:
  %_lhs3706 = load i32* %j3661
  %bop3707 = add i32 %_lhs3706, 1
  store i32 %bop3707, i32* %j3661
  br label %__cond698

__fresh707:
  br label %__post696

__post696:
  %_lhs3708 = load i32* %i3658
  %bop3709 = add i32 %_lhs3708, 1
  store i32 %bop3709, i32* %i3658
  br label %__cond695

__fresh708:
  br label %__post693

__post693:
  ret void
}


define i32 @program (i32 %argc3586, { i32, [ 0 x i8* ] }* %argv3584){

__fresh692:
  %argc_slot3587 = alloca i32
  store i32 %argc3586, i32* %argc_slot3587
  %argv_slot3585 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv3584, { i32, [ 0 x i8* ] }** %argv_slot3585
  %array_ptr3588 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 2 )
  %array3589 = bitcast { i32, [ 0 x i32 ] }* %array_ptr3588 to { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* 
  %array_ptr3590 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 3 )
  %array3591 = bitcast { i32, [ 0 x i32 ] }* %array_ptr3590 to { i32, [ 0 x i32 ] }* 
  %index_ptr3592 = getelementptr { i32, [ 0 x i32 ] }* %array3591, i32 0, i32 1, i32 0
  store i32 1, i32* %index_ptr3592
  %index_ptr3593 = getelementptr { i32, [ 0 x i32 ] }* %array3591, i32 0, i32 1, i32 1
  store i32 3, i32* %index_ptr3593
  %index_ptr3594 = getelementptr { i32, [ 0 x i32 ] }* %array3591, i32 0, i32 1, i32 2
  store i32 4, i32* %index_ptr3594
  %index_ptr3595 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array3589, i32 0, i32 1, i32 0
  store { i32, [ 0 x i32 ] }* %array3591, { i32, [ 0 x i32 ] }** %index_ptr3595
  %array_ptr3596 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 3 )
  %array3597 = bitcast { i32, [ 0 x i32 ] }* %array_ptr3596 to { i32, [ 0 x i32 ] }* 
  %index_ptr3598 = getelementptr { i32, [ 0 x i32 ] }* %array3597, i32 0, i32 1, i32 0
  store i32 2, i32* %index_ptr3598
  %index_ptr3599 = getelementptr { i32, [ 0 x i32 ] }* %array3597, i32 0, i32 1, i32 1
  store i32 0, i32* %index_ptr3599
  %index_ptr3600 = getelementptr { i32, [ 0 x i32 ] }* %array3597, i32 0, i32 1, i32 2
  store i32 1, i32* %index_ptr3600
  %index_ptr3601 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array3589, i32 0, i32 1, i32 1
  store { i32, [ 0 x i32 ] }* %array3597, { i32, [ 0 x i32 ] }** %index_ptr3601
  %a3602 = alloca { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }*
  store { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array3589, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a3602
  %array_ptr3603 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 3 )
  %array3604 = bitcast { i32, [ 0 x i32 ] }* %array_ptr3603 to { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* 
  %array_ptr3605 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 4 )
  %array3606 = bitcast { i32, [ 0 x i32 ] }* %array_ptr3605 to { i32, [ 0 x i32 ] }* 
  %index_ptr3607 = getelementptr { i32, [ 0 x i32 ] }* %array3606, i32 0, i32 1, i32 0
  store i32 1, i32* %index_ptr3607
  %index_ptr3608 = getelementptr { i32, [ 0 x i32 ] }* %array3606, i32 0, i32 1, i32 1
  store i32 2, i32* %index_ptr3608
  %index_ptr3609 = getelementptr { i32, [ 0 x i32 ] }* %array3606, i32 0, i32 1, i32 2
  store i32 3, i32* %index_ptr3609
  %index_ptr3610 = getelementptr { i32, [ 0 x i32 ] }* %array3606, i32 0, i32 1, i32 3
  store i32 1, i32* %index_ptr3610
  %index_ptr3611 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array3604, i32 0, i32 1, i32 0
  store { i32, [ 0 x i32 ] }* %array3606, { i32, [ 0 x i32 ] }** %index_ptr3611
  %array_ptr3612 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 4 )
  %array3613 = bitcast { i32, [ 0 x i32 ] }* %array_ptr3612 to { i32, [ 0 x i32 ] }* 
  %index_ptr3614 = getelementptr { i32, [ 0 x i32 ] }* %array3613, i32 0, i32 1, i32 0
  store i32 2, i32* %index_ptr3614
  %index_ptr3615 = getelementptr { i32, [ 0 x i32 ] }* %array3613, i32 0, i32 1, i32 1
  store i32 2, i32* %index_ptr3615
  %index_ptr3616 = getelementptr { i32, [ 0 x i32 ] }* %array3613, i32 0, i32 1, i32 2
  store i32 2, i32* %index_ptr3616
  %index_ptr3617 = getelementptr { i32, [ 0 x i32 ] }* %array3613, i32 0, i32 1, i32 3
  store i32 2, i32* %index_ptr3617
  %index_ptr3618 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array3604, i32 0, i32 1, i32 1
  store { i32, [ 0 x i32 ] }* %array3613, { i32, [ 0 x i32 ] }** %index_ptr3618
  %array_ptr3619 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 4 )
  %array3620 = bitcast { i32, [ 0 x i32 ] }* %array_ptr3619 to { i32, [ 0 x i32 ] }* 
  %index_ptr3621 = getelementptr { i32, [ 0 x i32 ] }* %array3620, i32 0, i32 1, i32 0
  store i32 3, i32* %index_ptr3621
  %index_ptr3622 = getelementptr { i32, [ 0 x i32 ] }* %array3620, i32 0, i32 1, i32 1
  store i32 2, i32* %index_ptr3622
  %index_ptr3623 = getelementptr { i32, [ 0 x i32 ] }* %array3620, i32 0, i32 1, i32 2
  store i32 1, i32* %index_ptr3623
  %index_ptr3624 = getelementptr { i32, [ 0 x i32 ] }* %array3620, i32 0, i32 1, i32 3
  store i32 4, i32* %index_ptr3624
  %index_ptr3625 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array3604, i32 0, i32 1, i32 2
  store { i32, [ 0 x i32 ] }* %array3620, { i32, [ 0 x i32 ] }** %index_ptr3625
  %b3626 = alloca { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }*
  store { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array3604, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %b3626
  %array_ptr3627 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 2 )
  %array3628 = bitcast { i32, [ 0 x i32 ] }* %array_ptr3627 to { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* 
  %array_ptr3629 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 4 )
  %array3630 = bitcast { i32, [ 0 x i32 ] }* %array_ptr3629 to { i32, [ 0 x i32 ] }* 
  %index_ptr3631 = getelementptr { i32, [ 0 x i32 ] }* %array3630, i32 0, i32 1, i32 0
  store i32 0, i32* %index_ptr3631
  %index_ptr3632 = getelementptr { i32, [ 0 x i32 ] }* %array3630, i32 0, i32 1, i32 1
  store i32 0, i32* %index_ptr3632
  %index_ptr3633 = getelementptr { i32, [ 0 x i32 ] }* %array3630, i32 0, i32 1, i32 2
  store i32 0, i32* %index_ptr3633
  %index_ptr3634 = getelementptr { i32, [ 0 x i32 ] }* %array3630, i32 0, i32 1, i32 3
  store i32 0, i32* %index_ptr3634
  %index_ptr3635 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array3628, i32 0, i32 1, i32 0
  store { i32, [ 0 x i32 ] }* %array3630, { i32, [ 0 x i32 ] }** %index_ptr3635
  %array_ptr3636 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 4 )
  %array3637 = bitcast { i32, [ 0 x i32 ] }* %array_ptr3636 to { i32, [ 0 x i32 ] }* 
  %index_ptr3638 = getelementptr { i32, [ 0 x i32 ] }* %array3637, i32 0, i32 1, i32 0
  store i32 0, i32* %index_ptr3638
  %index_ptr3639 = getelementptr { i32, [ 0 x i32 ] }* %array3637, i32 0, i32 1, i32 1
  store i32 0, i32* %index_ptr3639
  %index_ptr3640 = getelementptr { i32, [ 0 x i32 ] }* %array3637, i32 0, i32 1, i32 2
  store i32 0, i32* %index_ptr3640
  %index_ptr3641 = getelementptr { i32, [ 0 x i32 ] }* %array3637, i32 0, i32 1, i32 3
  store i32 0, i32* %index_ptr3641
  %index_ptr3642 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array3628, i32 0, i32 1, i32 1
  store { i32, [ 0 x i32 ] }* %array3637, { i32, [ 0 x i32 ] }** %index_ptr3642
  %c3643 = alloca { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }*
  store { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array3628, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %c3643
  %_lhs3646 = load { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %c3643
  %_lhs3645 = load { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %b3626
  %_lhs3644 = load { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a3602
  call void @matrix_Mult( { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %_lhs3644, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %_lhs3645, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %_lhs3646 )
  %_lhs3647 = load { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %c3643
  call void @prnNx4( { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %_lhs3647, i32 2 )
  %_lhs3650 = load { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %c3643
  %_lhs3649 = load { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %b3626
  %_lhs3648 = load { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a3602
  call void @matrix_MultAlt( { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %_lhs3648, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %_lhs3649, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %_lhs3650 )
  %_lhs3651 = load { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %c3643
  call void @prnNx4( { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %_lhs3651, i32 2 )
  ret i32 0
}


