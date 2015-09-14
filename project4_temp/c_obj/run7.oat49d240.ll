declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@arr3854 = global { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* zeroinitializer, align 4		; initialized by arr3854.init
define void @oat_init (){

__fresh746:
  call void @arr3854.init(  )
  ret void
}


define i32 @program (i32 %argc3857, { i32, [ 0 x i8* ] }* %argv3855){

__fresh745:
  %argc_slot3858 = alloca i32
  store i32 %argc3857, i32* %argc_slot3858
  %argv_slot3856 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv3855, { i32, [ 0 x i8* ] }** %argv_slot3856
  %bound_ptr3860 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** @arr3854, i32 0, i32 0
  %bound3861 = load i32* %bound_ptr3860
  call void @oat_array_bounds_check( i32 %bound3861, i32 3 )
  %elt3859 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** @arr3854, i32 0, i32 1, i32 3
  %bound_ptr3863 = getelementptr { i32, [ 0 x i32 ] }** %elt3859, i32 0, i32 0
  %bound3864 = load i32* %bound_ptr3863
  call void @oat_array_bounds_check( i32 %bound3864, i32 0 )
  %elt3862 = getelementptr { i32, [ 0 x i32 ] }** %elt3859, i32 0, i32 1, i32 0
  %_lhs3865 = load i32* %elt3862
  ret i32 %_lhs3865
}


define void @arr3854.init (){

__fresh744:
  %array_ptr3842 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 2 )
  %array3843 = bitcast { i32, [ 0 x i32 ] }* %array_ptr3842 to { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* 
  %array_ptr3844 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 2 )
  %array3845 = bitcast { i32, [ 0 x i32 ] }* %array_ptr3844 to { i32, [ 0 x i32 ] }* 
  %index_ptr3846 = getelementptr { i32, [ 0 x i32 ] }* %array3845, i32 0, i32 1, i32 0
  store i32 1, i32* %index_ptr3846
  %index_ptr3847 = getelementptr { i32, [ 0 x i32 ] }* %array3845, i32 0, i32 1, i32 1
  store i32 2, i32* %index_ptr3847
  %index_ptr3848 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array3843, i32 0, i32 1, i32 0
  store { i32, [ 0 x i32 ] }* %array3845, { i32, [ 0 x i32 ] }** %index_ptr3848
  %array_ptr3849 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 2 )
  %array3850 = bitcast { i32, [ 0 x i32 ] }* %array_ptr3849 to { i32, [ 0 x i32 ] }* 
  %index_ptr3851 = getelementptr { i32, [ 0 x i32 ] }* %array3850, i32 0, i32 1, i32 0
  store i32 3, i32* %index_ptr3851
  %index_ptr3852 = getelementptr { i32, [ 0 x i32 ] }* %array3850, i32 0, i32 1, i32 1
  store i32 4, i32* %index_ptr3852
  %index_ptr3853 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array3843, i32 0, i32 1, i32 1
  store { i32, [ 0 x i32 ] }* %array3850, { i32, [ 0 x i32 ] }** %index_ptr3853
  store { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array3843, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** @arr3854
  ret void
}


