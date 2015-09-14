declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh381:
  ret void
}


define i32 @program (i32 %argc2192, { i32, [ 0 x i8* ] }* %argv2190){

__fresh380:
  %argc_slot2193 = alloca i32
  store i32 %argc2192, i32* %argc_slot2193
  %argv_slot2191 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv2190, { i32, [ 0 x i8* ] }** %argv_slot2191
  %array_ptr2194 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 3 )
  %array2195 = bitcast { i32, [ 0 x i32 ] }* %array_ptr2194 to { i32, [ 0 x i32 ] }* 
  %index_ptr2196 = getelementptr { i32, [ 0 x i32 ] }* %array2195, i32 0, i32 1, i32 0
  store i32 0, i32* %index_ptr2196
  %index_ptr2197 = getelementptr { i32, [ 0 x i32 ] }* %array2195, i32 0, i32 1, i32 1
  store i32 1, i32* %index_ptr2197
  %index_ptr2198 = getelementptr { i32, [ 0 x i32 ] }* %array2195, i32 0, i32 1, i32 2
  store i32 2, i32* %index_ptr2198
  %arr2199 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array2195, { i32, [ 0 x i32 ] }** %arr2199
  %_lhs2200 = load { i32, [ 0 x i32 ] }** %arr2199
  %len_ptr2201 = getelementptr { i32, [ 0 x i32 ] }* %_lhs2200, i32 0, i32 0
  %len2202 = load i32* %len_ptr2201
  %len2203 = alloca i32
  store i32 %len2202, i32* %len2203
  %_lhs2204 = load i32* %len2203
  ret i32 %_lhs2204
}


