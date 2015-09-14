declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh212:
  ret void
}


define i32 @program (i32 %argc894, { i32, [ 0 x i8* ] }* %argv892){

__fresh205:
  %argc_slot895 = alloca i32
  store i32 %argc894, i32* %argc_slot895
  %argv_slot893 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv892, { i32, [ 0 x i8* ] }** %argv_slot893
  %array_ptr896 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 3 )
  %array897 = bitcast { i32, [ 0 x i32 ] }* %array_ptr896 to { i32, [ 0 x i32 ] }* 
  %_tmp897899 = alloca i32
  store i32 3, i32* %_tmp897899
  %_tmp899901 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array897, { i32, [ 0 x i32 ] }** %_tmp899901
  %i902 = alloca i32
  store i32 0, i32* %i902
  br label %__cond198

__cond198:
  %_lhs903 = load i32* %i902
  %_lhs904 = load i32* %_tmp897899
  %bop905 = icmp slt i32 %_lhs903, %_lhs904
  br i1 %bop905, label %__body197, label %__post196

__fresh206:
  br label %__body197

__body197:
  %_lhs906 = load i32* %i902
  %bound_ptr908 = getelementptr { i32, [ 0 x i32 ] }** %_tmp899901, i32 0, i32 0
  %bound909 = load i32* %bound_ptr908
  call void @oat_array_bounds_check( i32 %bound909, i32 %_lhs906 )
  %elt907 = getelementptr { i32, [ 0 x i32 ] }** %_tmp899901, i32 0, i32 1, i32 %_lhs906
  %_lhs910 = load i32* %i902
  store i32 %_lhs910, i32* %elt907
  %_lhs911 = load i32* %i902
  %bop912 = add i32 %_lhs911, 1
  store i32 %bop912, i32* %i902
  br label %__cond198

__fresh207:
  br label %__post196

__post196:
  %a913 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array897, { i32, [ 0 x i32 ] }** %a913
  %array_ptr914 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 4 )
  %array915 = bitcast { i32, [ 0 x i32 ] }* %array_ptr914 to { i32, [ 0 x i32 ] }* 
  %_tmp915917 = alloca i32
  store i32 4, i32* %_tmp915917
  %_tmp917919 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array915, { i32, [ 0 x i32 ] }** %_tmp917919
  %i920 = alloca i32
  store i32 0, i32* %i920
  br label %__cond201

__cond201:
  %_lhs921 = load i32* %i920
  %_lhs922 = load i32* %_tmp915917
  %bop923 = icmp slt i32 %_lhs921, %_lhs922
  br i1 %bop923, label %__body200, label %__post199

__fresh208:
  br label %__body200

__body200:
  %_lhs924 = load i32* %i920
  %bound_ptr926 = getelementptr { i32, [ 0 x i32 ] }** %_tmp917919, i32 0, i32 0
  %bound927 = load i32* %bound_ptr926
  call void @oat_array_bounds_check( i32 %bound927, i32 %_lhs924 )
  %elt925 = getelementptr { i32, [ 0 x i32 ] }** %_tmp917919, i32 0, i32 1, i32 %_lhs924
  %_lhs928 = load i32* %i920
  %_lhs929 = load i32* %i920
  %bop930 = mul i32 %_lhs928, %_lhs929
  store i32 %bop930, i32* %elt925
  %_lhs931 = load i32* %i920
  %bop932 = add i32 %_lhs931, 1
  store i32 %bop932, i32* %i920
  br label %__cond201

__fresh209:
  br label %__post199

__post199:
  %arr933 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array915, { i32, [ 0 x i32 ] }** %arr933
  %bound_ptr935 = getelementptr { i32, [ 0 x i32 ] }** %arr933, i32 0, i32 0
  %bound936 = load i32* %bound_ptr935
  call void @oat_array_bounds_check( i32 %bound936, i32 3 )
  %elt934 = getelementptr { i32, [ 0 x i32 ] }** %arr933, i32 0, i32 1, i32 3
  %_lhs937 = load i32* %elt934
  %bound_ptr939 = getelementptr { i32, [ 0 x i32 ] }** %a913, i32 0, i32 0
  %bound940 = load i32* %bound_ptr939
  call void @oat_array_bounds_check( i32 %bound940, i32 1 )
  %elt938 = getelementptr { i32, [ 0 x i32 ] }** %a913, i32 0, i32 1, i32 1
  %_lhs941 = load i32* %elt938
  %bop942 = add i32 %_lhs937, %_lhs941
  %array_ptr943 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 3 )
  %array944 = bitcast { i32, [ 0 x i32 ] }* %array_ptr943 to { i32, [ 0 x i32 ] }* 
  %_tmp944946 = alloca i32
  store i32 3, i32* %_tmp944946
  %_tmp946948 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array944, { i32, [ 0 x i32 ] }** %_tmp946948
  %i949 = alloca i32
  store i32 0, i32* %i949
  br label %__cond204

__cond204:
  %_lhs950 = load i32* %i949
  %_lhs951 = load i32* %_tmp944946
  %bop952 = icmp slt i32 %_lhs950, %_lhs951
  br i1 %bop952, label %__body203, label %__post202

__fresh210:
  br label %__body203

__body203:
  %_lhs953 = load i32* %i949
  %bound_ptr955 = getelementptr { i32, [ 0 x i32 ] }** %_tmp946948, i32 0, i32 0
  %bound956 = load i32* %bound_ptr955
  call void @oat_array_bounds_check( i32 %bound956, i32 %_lhs953 )
  %elt954 = getelementptr { i32, [ 0 x i32 ] }** %_tmp946948, i32 0, i32 1, i32 %_lhs953
  %_lhs957 = load i32* %i949
  %bop958 = mul i32 2, %_lhs957
  store i32 %bop958, i32* %elt954
  %_lhs959 = load i32* %i949
  %bop960 = add i32 %_lhs959, 1
  store i32 %bop960, i32* %i949
  br label %__cond204

__fresh211:
  br label %__post202

__post202:
  %ret961 = call i32 @f ( { i32, [ 0 x i32 ] }* %array944 )
  %bop962 = add i32 %bop942, %ret961
  %ret963 = call i32 @g ( i32 4 )
  %bop964 = add i32 %bop962, %ret963
  ret i32 %bop964
}


define i32 @g (i32 %x868){

__fresh193:
  %x_slot869 = alloca i32
  store i32 %x868, i32* %x_slot869
  %array_ptr870 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 3 )
  %array871 = bitcast { i32, [ 0 x i32 ] }* %array_ptr870 to { i32, [ 0 x i32 ] }* 
  %_tmp871873 = alloca i32
  store i32 3, i32* %_tmp871873
  %_tmp873875 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array871, { i32, [ 0 x i32 ] }** %_tmp873875
  %i876 = alloca i32
  store i32 0, i32* %i876
  br label %__cond192

__cond192:
  %_lhs877 = load i32* %i876
  %_lhs878 = load i32* %_tmp871873
  %bop879 = icmp slt i32 %_lhs877, %_lhs878
  br i1 %bop879, label %__body191, label %__post190

__fresh194:
  br label %__body191

__body191:
  %_lhs880 = load i32* %i876
  %bound_ptr882 = getelementptr { i32, [ 0 x i32 ] }** %_tmp873875, i32 0, i32 0
  %bound883 = load i32* %bound_ptr882
  call void @oat_array_bounds_check( i32 %bound883, i32 %_lhs880 )
  %elt881 = getelementptr { i32, [ 0 x i32 ] }** %_tmp873875, i32 0, i32 1, i32 %_lhs880
  %_lhs884 = load i32* %x_slot869
  store i32 %_lhs884, i32* %elt881
  %_lhs885 = load i32* %i876
  %bop886 = add i32 %_lhs885, 1
  store i32 %bop886, i32* %i876
  br label %__cond192

__fresh195:
  br label %__post190

__post190:
  %arr887 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array871, { i32, [ 0 x i32 ] }** %arr887
  %bound_ptr889 = getelementptr { i32, [ 0 x i32 ] }** %arr887, i32 0, i32 0
  %bound890 = load i32* %bound_ptr889
  call void @oat_array_bounds_check( i32 %bound890, i32 1 )
  %elt888 = getelementptr { i32, [ 0 x i32 ] }** %arr887, i32 0, i32 1, i32 1
  %_lhs891 = load i32* %elt888
  ret i32 %_lhs891
}


define i32 @f ({ i32, [ 0 x i32 ] }* %a862){

__fresh189:
  %a_slot863 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %a862, { i32, [ 0 x i32 ] }** %a_slot863
  %bound_ptr865 = getelementptr { i32, [ 0 x i32 ] }** %a_slot863, i32 0, i32 0
  %bound866 = load i32* %bound_ptr865
  call void @oat_array_bounds_check( i32 %bound866, i32 1 )
  %elt864 = getelementptr { i32, [ 0 x i32 ] }** %a_slot863, i32 0, i32 1, i32 1
  %_lhs867 = load i32* %elt864
  ret i32 %_lhs867
}


