declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh758:
  ret void
}


define i32 @program (i32 %argc3868, { i32, [ 0 x i8* ] }* %argv3866){

__fresh753:
  %argc_slot3869 = alloca i32
  store i32 %argc3868, i32* %argc_slot3869
  %argv_slot3867 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv3866, { i32, [ 0 x i8* ] }** %argv_slot3867
  %x3870 = alloca i32
  store i32 10, i32* %x3870
  %array_ptr3871 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 3 )
  %array3872 = bitcast { i32, [ 0 x i32 ] }* %array_ptr3871 to { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* 
  %_tmp38723874 = alloca i32
  store i32 3, i32* %_tmp38723874
  %_tmp38743876 = alloca { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }*
  store { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array3872, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %_tmp38743876
  %i3877 = alloca i32
  store i32 0, i32* %i3877
  br label %__cond749

__cond749:
  %_lhs3878 = load i32* %i3877
  %_lhs3879 = load i32* %_tmp38723874
  %bop3880 = icmp slt i32 %_lhs3878, %_lhs3879
  br i1 %bop3880, label %__body748, label %__post747

__fresh754:
  br label %__body748

__body748:
  %_lhs3881 = load i32* %i3877
  %bound_ptr3883 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %_tmp38743876, i32 0, i32 0
  %bound3884 = load i32* %bound_ptr3883
  call void @oat_array_bounds_check( i32 %bound3884, i32 %_lhs3881 )
  %elt3882 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %_tmp38743876, i32 0, i32 1, i32 %_lhs3881
  %array_ptr3885 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 3 )
  %array3886 = bitcast { i32, [ 0 x i32 ] }* %array_ptr3885 to { i32, [ 0 x i32 ] }* 
  %_tmp38863888 = alloca i32
  store i32 3, i32* %_tmp38863888
  %_tmp38883890 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array3886, { i32, [ 0 x i32 ] }** %_tmp38883890
  %j3891 = alloca i32
  store i32 0, i32* %j3891
  br label %__cond752

__cond752:
  %_lhs3892 = load i32* %j3891
  %_lhs3893 = load i32* %_tmp38863888
  %bop3894 = icmp slt i32 %_lhs3892, %_lhs3893
  br i1 %bop3894, label %__body751, label %__post750

__fresh755:
  br label %__body751

__body751:
  %_lhs3895 = load i32* %j3891
  %bound_ptr3897 = getelementptr { i32, [ 0 x i32 ] }** %_tmp38883890, i32 0, i32 0
  %bound3898 = load i32* %bound_ptr3897
  call void @oat_array_bounds_check( i32 %bound3898, i32 %_lhs3895 )
  %elt3896 = getelementptr { i32, [ 0 x i32 ] }** %_tmp38883890, i32 0, i32 1, i32 %_lhs3895
  %_lhs3899 = load i32* %x3870
  %_lhs3900 = load i32* %i3877
  %bop3901 = add i32 %_lhs3899, %_lhs3900
  %_lhs3902 = load i32* %j3891
  %bop3903 = add i32 %bop3901, %_lhs3902
  store i32 %bop3903, i32* %elt3896
  %_lhs3904 = load i32* %j3891
  %bop3905 = add i32 %_lhs3904, 1
  store i32 %bop3905, i32* %j3891
  br label %__cond752

__fresh756:
  br label %__post750

__post750:
  store { i32, [ 0 x i32 ] }* %array3886, { i32, [ 0 x i32 ] }** %elt3882
  %_lhs3906 = load i32* %i3877
  %bop3907 = add i32 %_lhs3906, 1
  store i32 %bop3907, i32* %i3877
  br label %__cond749

__fresh757:
  br label %__post747

__post747:
  %a3908 = alloca { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }*
  store { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array3872, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a3908
  %_lhs3909 = load { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a3908
  %b3910 = alloca { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }*
  store { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %_lhs3909, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %b3910
  %bound_ptr3912 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %b3910, i32 0, i32 0
  %bound3913 = load i32* %bound_ptr3912
  call void @oat_array_bounds_check( i32 %bound3913, i32 2 )
  %elt3911 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %b3910, i32 0, i32 1, i32 2
  %bound_ptr3915 = getelementptr { i32, [ 0 x i32 ] }** %elt3911, i32 0, i32 0
  %bound3916 = load i32* %bound_ptr3915
  call void @oat_array_bounds_check( i32 %bound3916, i32 3 )
  %elt3914 = getelementptr { i32, [ 0 x i32 ] }** %elt3911, i32 0, i32 1, i32 3
  %_lhs3917 = load i32* %elt3914
  ret i32 %_lhs3917
}


