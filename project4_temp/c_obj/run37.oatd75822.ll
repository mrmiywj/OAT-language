declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh762:
  ret void
}


define i32 @program (i32 %argc3934, { i32, [ 0 x i8* ] }* %argv3932){

__fresh761:
  %argc_slot3935 = alloca i32
  store i32 %argc3934, i32* %argc_slot3935
  %argv_slot3933 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv3932, { i32, [ 0 x i8* ] }** %argv_slot3933
  %array_ptr3936 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 2 )
  %array3937 = bitcast { i32, [ 0 x i32 ] }* %array_ptr3936 to { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* 
  %array_ptr3938 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 2 )
  %array3939 = bitcast { i32, [ 0 x i32 ] }* %array_ptr3938 to { i32, [ 0 x i32 ] }* 
  %index_ptr3940 = getelementptr { i32, [ 0 x i32 ] }* %array3939, i32 0, i32 1, i32 0
  store i32 0, i32* %index_ptr3940
  %index_ptr3941 = getelementptr { i32, [ 0 x i32 ] }* %array3939, i32 0, i32 1, i32 1
  store i32 0, i32* %index_ptr3941
  %index_ptr3942 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array3937, i32 0, i32 1, i32 0
  store { i32, [ 0 x i32 ] }* %array3939, { i32, [ 0 x i32 ] }** %index_ptr3942
  %array_ptr3943 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 2 )
  %array3944 = bitcast { i32, [ 0 x i32 ] }* %array_ptr3943 to { i32, [ 0 x i32 ] }* 
  %index_ptr3945 = getelementptr { i32, [ 0 x i32 ] }* %array3944, i32 0, i32 1, i32 0
  store i32 0, i32* %index_ptr3945
  %index_ptr3946 = getelementptr { i32, [ 0 x i32 ] }* %array3944, i32 0, i32 1, i32 1
  store i32 0, i32* %index_ptr3946
  %index_ptr3947 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array3937, i32 0, i32 1, i32 1
  store { i32, [ 0 x i32 ] }* %array3944, { i32, [ 0 x i32 ] }** %index_ptr3947
  %a3948 = alloca { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }*
  store { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array3937, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a3948
  %bound_ptr3950 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a3948, i32 0, i32 0
  %bound3951 = load i32* %bound_ptr3950
  call void @oat_array_bounds_check( i32 %bound3951, i32 1 )
  %elt3949 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a3948, i32 0, i32 1, i32 1
  %bound_ptr3953 = getelementptr { i32, [ 0 x i32 ] }** %elt3949, i32 0, i32 0
  %bound3954 = load i32* %bound_ptr3953
  call void @oat_array_bounds_check( i32 %bound3954, i32 3 )
  %elt3952 = getelementptr { i32, [ 0 x i32 ] }** %elt3949, i32 0, i32 1, i32 3
  %_lhs3955 = load i32* %elt3952
  ret i32 %_lhs3955
}


