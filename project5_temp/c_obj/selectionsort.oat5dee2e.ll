%Array = type { %_Array_vtable*, i8*, i32, %ArrayItem* }
%_Array_vtable = type { %_Object_vtable*, i8* (%Object*)*, i32 (%Array*, i32)*, void (%Array*, i32, i32)*, void (%Array*, i32)*, i32 (%Array*)* }
%ArrayItem = type { %_ArrayItem_vtable*, i8*, i32, %ArrayItem* }
%_ArrayItem_vtable = type { %_Object_vtable*, i8* (%Object*)*, void (%ArrayItem*, i32)* }
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
@_const_str633.str. = private unnamed_addr constant [ 24 x i8 ] c "get error: out of range\00", align 4
@_const_str633 = alias bitcast([ 24 x i8 ]* @_const_str633.str. to i8*)@_const_str632.str. = private unnamed_addr constant [ 24 x i8 ] c "get error: out of range\00", align 4
@_const_str632 = alias bitcast([ 24 x i8 ]* @_const_str632.str. to i8*)@_const_str631.str. = private unnamed_addr constant [ 6 x i8 ] c "Array\00", align 4
@_const_str631 = alias bitcast([ 6 x i8 ]* @_const_str631.str. to i8*)@_const_str630.str. = private unnamed_addr constant [ 10 x i8 ] c "ArrayItem\00", align 4
@_const_str630 = alias bitcast([ 10 x i8 ]* @_const_str630.str. to i8*)@_const_str629.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str629 = alias bitcast([ 7 x i8 ]* @_const_str629.str. to i8*)@_Array_vtable628 = private constant %_Array_vtable {%_Object_vtable* @_Object_vtable626, i8* (%Object*)* @_Object_get_name, i32 (%Array*, i32)* @_Array_getElement, void (%Array*, i32, i32)* @_Array_setElement, void (%Array*, i32)* @_Array_addElement, i32 (%Array*)* @_Array_getLength}, align 4
@_ArrayItem_vtable627 = private constant %_ArrayItem_vtable {%_Object_vtable* @_Object_vtable626, i8* (%Object*)* @_Object_get_name, void (%ArrayItem*, i32)* @_ArrayItem_set}, align 4
@_Object_vtable626 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh1165:
  ret void
}


define i32 @program (i32 %argc3835, { i32, [ 0 x i8* ] }* %argv3833){
__fresh1152:
  %argc_slot3836 = alloca i32
  store i32 %argc3835, i32* %argc_slot3836
  %argv_slot3834 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv3833, { i32, [ 0 x i8* ] }** %argv_slot3834
  %mem_ptr3837 = call i32* @oat_malloc ( i32 16 )
  %obj3838 = bitcast i32* %mem_ptr3837 to %Array* 
  %new_obj3839 = call %Array* @_Array_ctor ( %Array* %obj3838 )
  %vdecl_slot3840 = alloca %Array*
  store %Array* %new_obj3839, %Array** %vdecl_slot3840
  %vdecl_slot3841 = alloca i32
  store i32 0, i32* %vdecl_slot3841
  %vdecl_slot3842 = alloca i32
  store i32 0, i32* %vdecl_slot3842
  %lhs_or_call3843 = load %Array** %vdecl_slot3840
  %vtmp3845 = getelementptr %Array* %lhs_or_call3843, i32 0, i32 0
  %vtable3844 = load %_Array_vtable** %vtmp3845
  %fptmp3846 = getelementptr %_Array_vtable* %vtable3844, i32 0, i32 4
  %method3847 = load void (%Array*, i32)** %fptmp3846
  call void %method3847( %Array* %lhs_or_call3843, i32 79 )
  %lhs_or_call3848 = load %Array** %vdecl_slot3840
  %vtmp3850 = getelementptr %Array* %lhs_or_call3848, i32 0, i32 0
  %vtable3849 = load %_Array_vtable** %vtmp3850
  %fptmp3851 = getelementptr %_Array_vtable* %vtable3849, i32 0, i32 5
  %method3852 = load i32 (%Array*)** %fptmp3851
  %ret3853 = call i32 %method3852 ( %Array* %lhs_or_call3848 )
  store i32 %ret3853, i32* %vdecl_slot3841
  %vdecl_slot3854 = alloca i32
  store i32 1, i32* %vdecl_slot3854
  br label %__cond1136

__cond1136:
  %lhs_or_call3855 = load i32* %vdecl_slot3854
  %lhs_or_call3856 = load i32* %vdecl_slot3841
  %bop3857 = icmp slt i32 %lhs_or_call3855, %lhs_or_call3856
  br i1 %bop3857, label %__body1135, label %__post1134

__fresh1153:
  br label %__body1135

__body1135:
  %lhs_or_call3858 = load i32* %vdecl_slot3854
  %vdecl_slot3859 = alloca i32
  store i32 %lhs_or_call3858, i32* %vdecl_slot3859
  %lhs_or_call3860 = load i32* %vdecl_slot3854
  %bop3861 = add i32 %lhs_or_call3860, 1
  %vdecl_slot3862 = alloca i32
  store i32 %bop3861, i32* %vdecl_slot3862
  br label %__cond1139

__cond1139:
  %lhs_or_call3863 = load i32* %vdecl_slot3862
  %lhs_or_call3864 = load i32* %vdecl_slot3841
  %bop3865 = icmp sle i32 %lhs_or_call3863, %lhs_or_call3864
  br i1 %bop3865, label %__body1138, label %__post1137

__fresh1154:
  br label %__body1138

__body1138:
  %lhs_or_call3867 = load %Array** %vdecl_slot3840
  %vtmp3869 = getelementptr %Array* %lhs_or_call3867, i32 0, i32 0
  %vtable3868 = load %_Array_vtable** %vtmp3869
  %fptmp3870 = getelementptr %_Array_vtable* %vtable3868, i32 0, i32 2
  %method3871 = load i32 (%Array*, i32)** %fptmp3870
  %lhs_or_call3866 = load i32* %vdecl_slot3862
  %ret3872 = call i32 %method3871 ( %Array* %lhs_or_call3867, i32 %lhs_or_call3866 )
  %vdecl_slot3873 = alloca i32
  store i32 %ret3872, i32* %vdecl_slot3873
  %lhs_or_call3875 = load %Array** %vdecl_slot3840
  %vtmp3877 = getelementptr %Array* %lhs_or_call3875, i32 0, i32 0
  %vtable3876 = load %_Array_vtable** %vtmp3877
  %fptmp3878 = getelementptr %_Array_vtable* %vtable3876, i32 0, i32 2
  %method3879 = load i32 (%Array*, i32)** %fptmp3878
  %lhs_or_call3874 = load i32* %vdecl_slot3859
  %ret3880 = call i32 %method3879 ( %Array* %lhs_or_call3875, i32 %lhs_or_call3874 )
  %vdecl_slot3881 = alloca i32
  store i32 %ret3880, i32* %vdecl_slot3881
  %lhs_or_call3882 = load i32* %vdecl_slot3873
  %lhs_or_call3883 = load i32* %vdecl_slot3881
  %bop3884 = icmp slt i32 %lhs_or_call3882, %lhs_or_call3883
  br i1 %bop3884, label %__then1142, label %__else1141

__fresh1155:
  br label %__then1142

__then1142:
  %lhs_or_call3885 = load i32* %vdecl_slot3862
  store i32 %lhs_or_call3885, i32* %vdecl_slot3859
  br label %__merge1140

__fresh1156:
  br label %__else1141

__else1141:
  br label %__merge1140

__merge1140:
  %lhs_or_call3886 = load i32* %vdecl_slot3862
  %bop3887 = add i32 %lhs_or_call3886, 1
  store i32 %bop3887, i32* %vdecl_slot3862
  br label %__cond1139

__fresh1157:
  br label %__post1137

__post1137:
  %lhs_or_call3888 = load i32* %vdecl_slot3859
  %lhs_or_call3889 = load i32* %vdecl_slot3854
  %bop3890 = icmp ne i32 %lhs_or_call3888, %lhs_or_call3889
  br i1 %bop3890, label %__then1145, label %__else1144

__fresh1158:
  br label %__then1145

__then1145:
  %lhs_or_call3892 = load %Array** %vdecl_slot3840
  %vtmp3894 = getelementptr %Array* %lhs_or_call3892, i32 0, i32 0
  %vtable3893 = load %_Array_vtable** %vtmp3894
  %fptmp3895 = getelementptr %_Array_vtable* %vtable3893, i32 0, i32 2
  %method3896 = load i32 (%Array*, i32)** %fptmp3895
  %lhs_or_call3891 = load i32* %vdecl_slot3859
  %ret3897 = call i32 %method3896 ( %Array* %lhs_or_call3892, i32 %lhs_or_call3891 )
  %vdecl_slot3898 = alloca i32
  store i32 %ret3897, i32* %vdecl_slot3898
  %lhs_or_call3900 = load %Array** %vdecl_slot3840
  %vtmp3902 = getelementptr %Array* %lhs_or_call3900, i32 0, i32 0
  %vtable3901 = load %_Array_vtable** %vtmp3902
  %fptmp3903 = getelementptr %_Array_vtable* %vtable3901, i32 0, i32 2
  %method3904 = load i32 (%Array*, i32)** %fptmp3903
  %lhs_or_call3899 = load i32* %vdecl_slot3854
  %ret3905 = call i32 %method3904 ( %Array* %lhs_or_call3900, i32 %lhs_or_call3899 )
  %vdecl_slot3906 = alloca i32
  store i32 %ret3905, i32* %vdecl_slot3906
  %lhs_or_call3909 = load %Array** %vdecl_slot3840
  %vtmp3911 = getelementptr %Array* %lhs_or_call3909, i32 0, i32 0
  %vtable3910 = load %_Array_vtable** %vtmp3911
  %fptmp3912 = getelementptr %_Array_vtable* %vtable3910, i32 0, i32 3
  %method3913 = load void (%Array*, i32, i32)** %fptmp3912
  %lhs_or_call3907 = load i32* %vdecl_slot3898
  %lhs_or_call3908 = load i32* %vdecl_slot3854
  call void %method3913( %Array* %lhs_or_call3909, i32 %lhs_or_call3908, i32 %lhs_or_call3907 )
  %lhs_or_call3916 = load %Array** %vdecl_slot3840
  %vtmp3918 = getelementptr %Array* %lhs_or_call3916, i32 0, i32 0
  %vtable3917 = load %_Array_vtable** %vtmp3918
  %fptmp3919 = getelementptr %_Array_vtable* %vtable3917, i32 0, i32 3
  %method3920 = load void (%Array*, i32, i32)** %fptmp3919
  %lhs_or_call3914 = load i32* %vdecl_slot3906
  %lhs_or_call3915 = load i32* %vdecl_slot3859
  call void %method3920( %Array* %lhs_or_call3916, i32 %lhs_or_call3915, i32 %lhs_or_call3914 )
  br label %__merge1143

__fresh1159:
  br label %__else1144

__else1144:
  br label %__merge1143

__merge1143:
  %lhs_or_call3921 = load i32* %vdecl_slot3854
  %bop3922 = add i32 %lhs_or_call3921, 1
  store i32 %bop3922, i32* %vdecl_slot3854
  br label %__cond1136

__fresh1160:
  br label %__post1134

__post1134:
  %vdecl_slot3923 = alloca i32
  store i32 1, i32* %vdecl_slot3923
  br label %__cond1148

__cond1148:
  %lhs_or_call3924 = load i32* %vdecl_slot3923
  %lhs_or_call3925 = load i32* %vdecl_slot3841
  %bop3926 = icmp slt i32 %lhs_or_call3924, %lhs_or_call3925
  br i1 %bop3926, label %__body1147, label %__post1146

__fresh1161:
  br label %__body1147

__body1147:
  %lhs_or_call3928 = load %Array** %vdecl_slot3840
  %vtmp3930 = getelementptr %Array* %lhs_or_call3928, i32 0, i32 0
  %vtable3929 = load %_Array_vtable** %vtmp3930
  %fptmp3931 = getelementptr %_Array_vtable* %vtable3929, i32 0, i32 2
  %method3932 = load i32 (%Array*, i32)** %fptmp3931
  %lhs_or_call3927 = load i32* %vdecl_slot3923
  %ret3933 = call i32 %method3932 ( %Array* %lhs_or_call3928, i32 %lhs_or_call3927 )
  %vdecl_slot3934 = alloca i32
  store i32 %ret3933, i32* %vdecl_slot3934
  %lhs_or_call3937 = load %Array** %vdecl_slot3840
  %vtmp3939 = getelementptr %Array* %lhs_or_call3937, i32 0, i32 0
  %vtable3938 = load %_Array_vtable** %vtmp3939
  %fptmp3940 = getelementptr %_Array_vtable* %vtable3938, i32 0, i32 2
  %method3941 = load i32 (%Array*, i32)** %fptmp3940
  %lhs_or_call3935 = load i32* %vdecl_slot3923
  %bop3936 = add i32 %lhs_or_call3935, 1
  %ret3942 = call i32 %method3941 ( %Array* %lhs_or_call3937, i32 %bop3936 )
  %vdecl_slot3943 = alloca i32
  store i32 %ret3942, i32* %vdecl_slot3943
  %lhs_or_call3944 = load i32* %vdecl_slot3934
  %lhs_or_call3945 = load i32* %vdecl_slot3943
  %bop3946 = icmp sgt i32 %lhs_or_call3944, %lhs_or_call3945
  br i1 %bop3946, label %__then1151, label %__else1150

__fresh1162:
  br label %__then1151

__then1151:
  %lhs_or_call3947 = load i32* %vdecl_slot3842
  %bop3948 = add i32 %lhs_or_call3947, 1
  store i32 %bop3948, i32* %vdecl_slot3842
  br label %__merge1149

__fresh1163:
  br label %__else1150

__else1150:
  br label %__merge1149

__merge1149:
  %lhs_or_call3949 = load i32* %vdecl_slot3923
  %bop3950 = add i32 %lhs_or_call3949, 1
  store i32 %bop3950, i32* %vdecl_slot3923
  br label %__cond1148

__fresh1164:
  br label %__post1146

__post1146:
  %lhs_or_call3951 = load i32* %vdecl_slot3842
  ret i32 %lhs_or_call3951
}


define i32 @_Array_getLength (%Array* %_this1){
__fresh1133:
  %path3831 = getelementptr %Array* %_this1, i32 0, i32 2
  %lhs_or_call3832 = load i32* %path3831
  ret i32 %lhs_or_call3832
}


define void @_Array_addElement (%Array* %_this1, i32 %key3794){
__fresh1124:
  %key_slot3795 = alloca i32
  store i32 %key3794, i32* %key_slot3795
  %path3796 = getelementptr %Array* %_this1, i32 0, i32 2
  %lhs_or_call3797 = load i32* %path3796
  %bop3798 = icmp eq i32 %lhs_or_call3797, 0
  br i1 %bop3798, label %__then1123, label %__else1122

__fresh1125:
  br label %__then1123

__then1123:
  %path3799 = getelementptr %Array* %_this1, i32 0, i32 3
  %lhs_or_call3800 = load i32* %key_slot3795
  %mem_ptr3801 = call i32* @oat_malloc ( i32 16 )
  %obj3802 = bitcast i32* %mem_ptr3801 to %ArrayItem* 
  %new_obj3803 = call %ArrayItem* @_ArrayItem_ctor ( %ArrayItem* %obj3802, i32 %lhs_or_call3800 )
  store %ArrayItem* %new_obj3803, %ArrayItem** %path3799
  br label %__merge1121

__fresh1126:
  br label %__else1122

__else1122:
  %path3804 = getelementptr %Array* %_this1, i32 0, i32 3
  %lhs_or_call3805 = load %ArrayItem** %path3804
  %ifnull_slot3806 = alloca %ArrayItem*
  store %ArrayItem* %lhs_or_call3805, %ArrayItem** %ifnull_slot3806
  %ifnull_guard3807 = icmp ne %ArrayItem* %lhs_or_call3805, null
  br i1 %ifnull_guard3807, label %__then1120, label %__else1119

__fresh1127:
  br label %__then1120

__then1120:
  %vdecl_slot3808 = alloca i32
  store i32 1, i32* %vdecl_slot3808
  br label %__cond1114

__cond1114:
  %lhs_or_call3809 = load i32* %vdecl_slot3808
  %path3810 = getelementptr %Array* %_this1, i32 0, i32 2
  %lhs_or_call3811 = load i32* %path3810
  %bop3812 = icmp ne i32 %lhs_or_call3809, %lhs_or_call3811
  br i1 %bop3812, label %__body1113, label %__post1112

__fresh1128:
  br label %__body1113

__body1113:
  %lhs_or_call3813 = load %ArrayItem** %ifnull_slot3806
  %path3814 = getelementptr %ArrayItem* %lhs_or_call3813, i32 0, i32 3
  %lhs_or_call3815 = load %ArrayItem** %path3814
  %ifnull_slot3816 = alloca %ArrayItem*
  store %ArrayItem* %lhs_or_call3815, %ArrayItem** %ifnull_slot3816
  %ifnull_guard3817 = icmp ne %ArrayItem* %lhs_or_call3815, null
  br i1 %ifnull_guard3817, label %__then1117, label %__else1116

__fresh1129:
  br label %__then1117

__then1117:
  %lhs_or_call3818 = load %ArrayItem** %ifnull_slot3816
  store %ArrayItem* %lhs_or_call3818, %ArrayItem** %ifnull_slot3806
  br label %__merge1115

__fresh1130:
  br label %__else1116

__else1116:
  br label %__merge1115

__merge1115:
  %lhs_or_call3819 = load i32* %vdecl_slot3808
  %bop3820 = add i32 %lhs_or_call3819, 1
  store i32 %bop3820, i32* %vdecl_slot3808
  br label %__cond1114

__fresh1131:
  br label %__post1112

__post1112:
  %lhs_or_call3821 = load %ArrayItem** %ifnull_slot3806
  %path3822 = getelementptr %ArrayItem* %lhs_or_call3821, i32 0, i32 3
  %lhs_or_call3823 = load i32* %key_slot3795
  %mem_ptr3824 = call i32* @oat_malloc ( i32 16 )
  %obj3825 = bitcast i32* %mem_ptr3824 to %ArrayItem* 
  %new_obj3826 = call %ArrayItem* @_ArrayItem_ctor ( %ArrayItem* %obj3825, i32 %lhs_or_call3823 )
  store %ArrayItem* %new_obj3826, %ArrayItem** %path3822
  br label %__merge1118

__fresh1132:
  br label %__else1119

__else1119:
  br label %__merge1118

__merge1118:
  br label %__merge1121

__merge1121:
  %path3827 = getelementptr %Array* %_this1, i32 0, i32 2
  %path3828 = getelementptr %Array* %_this1, i32 0, i32 2
  %lhs_or_call3829 = load i32* %path3828
  %bop3830 = add i32 %lhs_or_call3829, 1
  store i32 %bop3830, i32* %path3827
  ret void
}


define void @_Array_setElement (%Array* %_this1, i32 %index3773, i32 %key3771){
__fresh1105:
  %index_slot3774 = alloca i32
  store i32 %index3773, i32* %index_slot3774
  %key_slot3772 = alloca i32
  store i32 %key3771, i32* %key_slot3772
  %path3775 = getelementptr %Array* %_this1, i32 0, i32 3
  %lhs_or_call3776 = load %ArrayItem** %path3775
  %ifnull_slot3777 = alloca %ArrayItem*
  store %ArrayItem* %lhs_or_call3776, %ArrayItem** %ifnull_slot3777
  %ifnull_guard3778 = icmp ne %ArrayItem* %lhs_or_call3776, null
  br i1 %ifnull_guard3778, label %__then1104, label %__else1103

__fresh1106:
  br label %__then1104

__then1104:
  %vdecl_slot3779 = alloca i32
  store i32 1, i32* %vdecl_slot3779
  br label %__cond1098

__cond1098:
  %lhs_or_call3780 = load i32* %vdecl_slot3779
  %lhs_or_call3781 = load i32* %index_slot3774
  %bop3782 = icmp ne i32 %lhs_or_call3780, %lhs_or_call3781
  br i1 %bop3782, label %__body1097, label %__post1096

__fresh1107:
  br label %__body1097

__body1097:
  %lhs_or_call3783 = load %ArrayItem** %ifnull_slot3777
  %path3784 = getelementptr %ArrayItem* %lhs_or_call3783, i32 0, i32 3
  %lhs_or_call3785 = load %ArrayItem** %path3784
  %ifnull_slot3786 = alloca %ArrayItem*
  store %ArrayItem* %lhs_or_call3785, %ArrayItem** %ifnull_slot3786
  %ifnull_guard3787 = icmp ne %ArrayItem* %lhs_or_call3785, null
  br i1 %ifnull_guard3787, label %__then1101, label %__else1100

__fresh1108:
  br label %__then1101

__then1101:
  %lhs_or_call3788 = load %ArrayItem** %ifnull_slot3786
  store %ArrayItem* %lhs_or_call3788, %ArrayItem** %ifnull_slot3777
  br label %__merge1099

__fresh1109:
  br label %__else1100

__else1100:
  br label %__merge1099

__merge1099:
  %lhs_or_call3789 = load i32* %vdecl_slot3779
  %bop3790 = add i32 %lhs_or_call3789, 1
  store i32 %bop3790, i32* %vdecl_slot3779
  br label %__cond1098

__fresh1110:
  br label %__post1096

__post1096:
  %lhs_or_call3791 = load %ArrayItem** %ifnull_slot3777
  %path3792 = getelementptr %ArrayItem* %lhs_or_call3791, i32 0, i32 2
  %lhs_or_call3793 = load i32* %key_slot3772
  store i32 %lhs_or_call3793, i32* %path3792
  br label %__merge1102

__fresh1111:
  br label %__else1103

__else1103:
  call void @print_string( i8* @_const_str633 )
  call void @oat_abort( i32 -1 )
  br label %__merge1102

__merge1102:
  ret void
}


define i32 @_Array_getElement (%Array* %_this1, i32 %index3748){
__fresh1089:
  %index_slot3749 = alloca i32
  store i32 %index3748, i32* %index_slot3749
  %vdecl_slot3750 = alloca i32
  store i32 0, i32* %vdecl_slot3750
  %path3751 = getelementptr %Array* %_this1, i32 0, i32 3
  %lhs_or_call3752 = load %ArrayItem** %path3751
  %ifnull_slot3753 = alloca %ArrayItem*
  store %ArrayItem* %lhs_or_call3752, %ArrayItem** %ifnull_slot3753
  %ifnull_guard3754 = icmp ne %ArrayItem* %lhs_or_call3752, null
  br i1 %ifnull_guard3754, label %__then1088, label %__else1087

__fresh1090:
  br label %__then1088

__then1088:
  %vdecl_slot3755 = alloca i32
  store i32 1, i32* %vdecl_slot3755
  br label %__cond1082

__cond1082:
  %lhs_or_call3756 = load i32* %vdecl_slot3755
  %lhs_or_call3757 = load i32* %index_slot3749
  %bop3758 = icmp ne i32 %lhs_or_call3756, %lhs_or_call3757
  br i1 %bop3758, label %__body1081, label %__post1080

__fresh1091:
  br label %__body1081

__body1081:
  %lhs_or_call3759 = load %ArrayItem** %ifnull_slot3753
  %path3760 = getelementptr %ArrayItem* %lhs_or_call3759, i32 0, i32 3
  %lhs_or_call3761 = load %ArrayItem** %path3760
  %ifnull_slot3762 = alloca %ArrayItem*
  store %ArrayItem* %lhs_or_call3761, %ArrayItem** %ifnull_slot3762
  %ifnull_guard3763 = icmp ne %ArrayItem* %lhs_or_call3761, null
  br i1 %ifnull_guard3763, label %__then1085, label %__else1084

__fresh1092:
  br label %__then1085

__then1085:
  %lhs_or_call3764 = load %ArrayItem** %ifnull_slot3762
  store %ArrayItem* %lhs_or_call3764, %ArrayItem** %ifnull_slot3753
  br label %__merge1083

__fresh1093:
  br label %__else1084

__else1084:
  br label %__merge1083

__merge1083:
  %lhs_or_call3765 = load i32* %vdecl_slot3755
  %bop3766 = add i32 %lhs_or_call3765, 1
  store i32 %bop3766, i32* %vdecl_slot3755
  br label %__cond1082

__fresh1094:
  br label %__post1080

__post1080:
  %lhs_or_call3767 = load %ArrayItem** %ifnull_slot3753
  %path3768 = getelementptr %ArrayItem* %lhs_or_call3767, i32 0, i32 2
  %lhs_or_call3769 = load i32* %path3768
  store i32 %lhs_or_call3769, i32* %vdecl_slot3750
  br label %__merge1086

__fresh1095:
  br label %__else1087

__else1087:
  call void @print_string( i8* @_const_str632 )
  call void @oat_abort( i32 -1 )
  br label %__merge1086

__merge1086:
  %lhs_or_call3770 = load i32* %vdecl_slot3750
  ret i32 %lhs_or_call3770
}


define %Array* @_Array_ctor (%Array* %_this1){
__fresh1079:
  %cast_op3743 = bitcast %Array* %_this1 to %Object* 
  %dummy3744 = call %Object* @_Object_ctor ( %Object* %cast_op3743 )
  %path3745 = getelementptr %Array* %_this1, i32 0, i32 1
  store i8* @_const_str631, i8** %path3745
  %vt_slot3746 = getelementptr %Array* %_this1, i32 0, i32 0
  store %_Array_vtable* @_Array_vtable628, %_Array_vtable** %vt_slot3746
  %path3747 = getelementptr %Array* %_this1, i32 0, i32 2
  store i32 0, i32* %path3747
  ret %Array* %_this1
}


define void @_ArrayItem_set (%ArrayItem* %_this1, i32 %x3739){
__fresh1078:
  %x_slot3740 = alloca i32
  store i32 %x3739, i32* %x_slot3740
  %path3741 = getelementptr %ArrayItem* %_this1, i32 0, i32 2
  %lhs_or_call3742 = load i32* %x_slot3740
  store i32 %lhs_or_call3742, i32* %path3741
  ret void
}


define %ArrayItem* @_ArrayItem_ctor (%ArrayItem* %_this1, i32 %x3729){
__fresh1077:
  %x_slot3730 = alloca i32
  store i32 %x3729, i32* %x_slot3730
  %cast_op3731 = bitcast %ArrayItem* %_this1 to %Object* 
  %dummy3732 = call %Object* @_Object_ctor ( %Object* %cast_op3731 )
  %path3733 = getelementptr %ArrayItem* %_this1, i32 0, i32 1
  store i8* @_const_str630, i8** %path3733
  %vt_slot3734 = getelementptr %ArrayItem* %_this1, i32 0, i32 0
  store %_ArrayItem_vtable* @_ArrayItem_vtable627, %_ArrayItem_vtable** %vt_slot3734
  %path3735 = getelementptr %ArrayItem* %_this1, i32 0, i32 2
  %lhs_or_call3736 = load i32* %x_slot3730
  store i32 %lhs_or_call3736, i32* %path3735
  %path3737 = getelementptr %ArrayItem* %_this1, i32 0, i32 3
  %cast_op3738 = bitcast i8* null to %ArrayItem* 
  store %ArrayItem* %cast_op3738, %ArrayItem** %path3737
  ret %ArrayItem* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh1076:
  %path3727 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call3728 = load i8** %path3727
  ret i8* %lhs_or_call3728
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh1075:
  %path3725 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str629, i8** %path3725
  %vt_slot3726 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable626, %_Object_vtable** %vt_slot3726
  ret %Object* %_this1
}


