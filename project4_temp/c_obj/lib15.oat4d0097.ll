declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh770:
  ret void
}


define i32 @program (i32 %argc3994, { i32, [ 0 x i8* ] }* %argv3992){

__fresh769:
  %argc_slot3995 = alloca i32
  store i32 %argc3994, i32* %argc_slot3995
  %argv_slot3993 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv3992, { i32, [ 0 x i8* ] }** %argv_slot3993
  %bound_ptr3997 = getelementptr { i32, [ 0 x i8* ] }** %argv_slot3993, i32 0, i32 0
  %bound3998 = load i32* %bound_ptr3997
  call void @oat_array_bounds_check( i32 %bound3998, i32 1 )
  %elt3996 = getelementptr { i32, [ 0 x i8* ] }** %argv_slot3993, i32 0, i32 1, i32 1
  %_lhs3999 = load i8** %elt3996
  %ret4000 = call i8* @sub ( i8* %_lhs3999, i32 3, i32 5 )
  call void @print_string( i8* %ret4000 )
  ret i32 0
}


define i8* @sub (i8* %str3960, i32 %start3958, i32 %len3956){

__fresh766:
  %str_slot3961 = alloca i8*
  store i8* %str3960, i8** %str_slot3961
  %start_slot3959 = alloca i32
  store i32 %start3958, i32* %start_slot3959
  %len_slot3957 = alloca i32
  store i32 %len3956, i32* %len_slot3957
  %_lhs3962 = load i8** %str_slot3961
  %ret3963 = call { i32, [ 0 x i32 ] }* @array_of_string ( i8* %_lhs3962 )
  %arr3964 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %ret3963, { i32, [ 0 x i32 ] }** %arr3964
  %_lhs3965 = load i32* %len_slot3957
  %array_ptr3966 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 %_lhs3965 )
  %array3967 = bitcast { i32, [ 0 x i32 ] }* %array_ptr3966 to { i32, [ 0 x i32 ] }* 
  %_tmp39673969 = alloca i32
  store i32 %_lhs3965, i32* %_tmp39673969
  %_tmp39693971 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array3967, { i32, [ 0 x i32 ] }** %_tmp39693971
  %i3972 = alloca i32
  store i32 0, i32* %i3972
  br label %__cond765

__cond765:
  %_lhs3973 = load i32* %i3972
  %_lhs3974 = load i32* %_tmp39673969
  %bop3975 = icmp slt i32 %_lhs3973, %_lhs3974
  br i1 %bop3975, label %__body764, label %__post763

__fresh767:
  br label %__body764

__body764:
  %_lhs3976 = load i32* %i3972
  %bound_ptr3978 = getelementptr { i32, [ 0 x i32 ] }** %_tmp39693971, i32 0, i32 0
  %bound3979 = load i32* %bound_ptr3978
  call void @oat_array_bounds_check( i32 %bound3979, i32 %_lhs3976 )
  %elt3977 = getelementptr { i32, [ 0 x i32 ] }** %_tmp39693971, i32 0, i32 1, i32 %_lhs3976
  %_lhs3980 = load i32* %i3972
  %_lhs3981 = load i32* %start_slot3959
  %bop3982 = add i32 %_lhs3980, %_lhs3981
  %bound_ptr3984 = getelementptr { i32, [ 0 x i32 ] }** %arr3964, i32 0, i32 0
  %bound3985 = load i32* %bound_ptr3984
  call void @oat_array_bounds_check( i32 %bound3985, i32 %bop3982 )
  %elt3983 = getelementptr { i32, [ 0 x i32 ] }** %arr3964, i32 0, i32 1, i32 %bop3982
  %_lhs3986 = load i32* %elt3983
  store i32 %_lhs3986, i32* %elt3977
  %_lhs3987 = load i32* %i3972
  %bop3988 = add i32 %_lhs3987, 1
  store i32 %bop3988, i32* %i3972
  br label %__cond765

__fresh768:
  br label %__post763

__post763:
  %r3989 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array3967, { i32, [ 0 x i32 ] }** %r3989
  %_lhs3990 = load { i32, [ 0 x i32 ] }** %r3989
  %ret3991 = call i8* @string_of_array ( { i32, [ 0 x i32 ] }* %_lhs3990 )
  ret i8* %ret3991
}


