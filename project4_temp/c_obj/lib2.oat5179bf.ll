declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh383:
  ret void
}


define i32 @program (i32 %argc2207, { i32, [ 0 x i8* ] }* %argv2205){

__fresh382:
  %argc_slot2208 = alloca i32
  store i32 %argc2207, i32* %argc_slot2208
  %argv_slot2206 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv2205, { i32, [ 0 x i8* ] }** %argv_slot2206
  %array_ptr2209 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 4 )
  %array2210 = bitcast { i32, [ 0 x i32 ] }* %array_ptr2209 to { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* 
  %array_ptr2211 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 2 )
  %array2212 = bitcast { i32, [ 0 x i32 ] }* %array_ptr2211 to { i32, [ 0 x i32 ] }* 
  %index_ptr2213 = getelementptr { i32, [ 0 x i32 ] }* %array2212, i32 0, i32 1, i32 0
  store i32 0, i32* %index_ptr2213
  %index_ptr2214 = getelementptr { i32, [ 0 x i32 ] }* %array2212, i32 0, i32 1, i32 1
  store i32 0, i32* %index_ptr2214
  %index_ptr2215 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array2210, i32 0, i32 1, i32 0
  store { i32, [ 0 x i32 ] }* %array2212, { i32, [ 0 x i32 ] }** %index_ptr2215
  %array_ptr2216 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 2 )
  %array2217 = bitcast { i32, [ 0 x i32 ] }* %array_ptr2216 to { i32, [ 0 x i32 ] }* 
  %index_ptr2218 = getelementptr { i32, [ 0 x i32 ] }* %array2217, i32 0, i32 1, i32 0
  store i32 1, i32* %index_ptr2218
  %index_ptr2219 = getelementptr { i32, [ 0 x i32 ] }* %array2217, i32 0, i32 1, i32 1
  store i32 1, i32* %index_ptr2219
  %index_ptr2220 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array2210, i32 0, i32 1, i32 1
  store { i32, [ 0 x i32 ] }* %array2217, { i32, [ 0 x i32 ] }** %index_ptr2220
  %array_ptr2221 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 2 )
  %array2222 = bitcast { i32, [ 0 x i32 ] }* %array_ptr2221 to { i32, [ 0 x i32 ] }* 
  %index_ptr2223 = getelementptr { i32, [ 0 x i32 ] }* %array2222, i32 0, i32 1, i32 0
  store i32 2, i32* %index_ptr2223
  %index_ptr2224 = getelementptr { i32, [ 0 x i32 ] }* %array2222, i32 0, i32 1, i32 1
  store i32 2, i32* %index_ptr2224
  %index_ptr2225 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array2210, i32 0, i32 1, i32 2
  store { i32, [ 0 x i32 ] }* %array2222, { i32, [ 0 x i32 ] }** %index_ptr2225
  %array_ptr2226 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 2 )
  %array2227 = bitcast { i32, [ 0 x i32 ] }* %array_ptr2226 to { i32, [ 0 x i32 ] }* 
  %index_ptr2228 = getelementptr { i32, [ 0 x i32 ] }* %array2227, i32 0, i32 1, i32 0
  store i32 3, i32* %index_ptr2228
  %index_ptr2229 = getelementptr { i32, [ 0 x i32 ] }* %array2227, i32 0, i32 1, i32 1
  store i32 3, i32* %index_ptr2229
  %index_ptr2230 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array2210, i32 0, i32 1, i32 3
  store { i32, [ 0 x i32 ] }* %array2227, { i32, [ 0 x i32 ] }** %index_ptr2230
  %arr2231 = alloca { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }*
  store { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array2210, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %arr2231
  %bound_ptr2233 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %arr2231, i32 0, i32 0
  %bound2234 = load i32* %bound_ptr2233
  call void @oat_array_bounds_check( i32 %bound2234, i32 2 )
  %elt2232 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %arr2231, i32 0, i32 1, i32 2
  %_lhs2235 = load { i32, [ 0 x i32 ] }** %elt2232
  %len_ptr2236 = getelementptr { i32, [ 0 x i32 ] }* %_lhs2235, i32 0, i32 0
  %len2237 = load i32* %len_ptr2236
  %len2238 = alloca i32
  store i32 %len2237, i32* %len2238
  %_lhs2239 = load i32* %len2238
  ret i32 %_lhs2239
}


