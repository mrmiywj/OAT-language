declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh385:
  ret void
}


define i32 @program (i32 %argc2242, { i32, [ 0 x i8* ] }* %argv2240){

__fresh384:
  %argc_slot2243 = alloca i32
  store i32 %argc2242, i32* %argc_slot2243
  %argv_slot2241 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv2240, { i32, [ 0 x i8* ] }** %argv_slot2241
  %array_ptr2244 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 4 )
  %array2245 = bitcast { i32, [ 0 x i32 ] }* %array_ptr2244 to { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* 
  %array_ptr2246 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 4 )
  %array2247 = bitcast { i32, [ 0 x i32 ] }* %array_ptr2246 to { i32, [ 0 x i32 ] }* 
  %index_ptr2248 = getelementptr { i32, [ 0 x i32 ] }* %array2247, i32 0, i32 1, i32 0
  store i32 0, i32* %index_ptr2248
  %index_ptr2249 = getelementptr { i32, [ 0 x i32 ] }* %array2247, i32 0, i32 1, i32 1
  store i32 0, i32* %index_ptr2249
  %index_ptr2250 = getelementptr { i32, [ 0 x i32 ] }* %array2247, i32 0, i32 1, i32 2
  store i32 0, i32* %index_ptr2250
  %index_ptr2251 = getelementptr { i32, [ 0 x i32 ] }* %array2247, i32 0, i32 1, i32 3
  store i32 0, i32* %index_ptr2251
  %index_ptr2252 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array2245, i32 0, i32 1, i32 0
  store { i32, [ 0 x i32 ] }* %array2247, { i32, [ 0 x i32 ] }** %index_ptr2252
  %array_ptr2253 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 2 )
  %array2254 = bitcast { i32, [ 0 x i32 ] }* %array_ptr2253 to { i32, [ 0 x i32 ] }* 
  %index_ptr2255 = getelementptr { i32, [ 0 x i32 ] }* %array2254, i32 0, i32 1, i32 0
  store i32 1, i32* %index_ptr2255
  %index_ptr2256 = getelementptr { i32, [ 0 x i32 ] }* %array2254, i32 0, i32 1, i32 1
  store i32 1, i32* %index_ptr2256
  %index_ptr2257 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array2245, i32 0, i32 1, i32 1
  store { i32, [ 0 x i32 ] }* %array2254, { i32, [ 0 x i32 ] }** %index_ptr2257
  %array_ptr2258 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 2 )
  %array2259 = bitcast { i32, [ 0 x i32 ] }* %array_ptr2258 to { i32, [ 0 x i32 ] }* 
  %index_ptr2260 = getelementptr { i32, [ 0 x i32 ] }* %array2259, i32 0, i32 1, i32 0
  store i32 2, i32* %index_ptr2260
  %index_ptr2261 = getelementptr { i32, [ 0 x i32 ] }* %array2259, i32 0, i32 1, i32 1
  store i32 2, i32* %index_ptr2261
  %index_ptr2262 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array2245, i32 0, i32 1, i32 2
  store { i32, [ 0 x i32 ] }* %array2259, { i32, [ 0 x i32 ] }** %index_ptr2262
  %array_ptr2263 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 2 )
  %array2264 = bitcast { i32, [ 0 x i32 ] }* %array_ptr2263 to { i32, [ 0 x i32 ] }* 
  %index_ptr2265 = getelementptr { i32, [ 0 x i32 ] }* %array2264, i32 0, i32 1, i32 0
  store i32 3, i32* %index_ptr2265
  %index_ptr2266 = getelementptr { i32, [ 0 x i32 ] }* %array2264, i32 0, i32 1, i32 1
  store i32 3, i32* %index_ptr2266
  %index_ptr2267 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array2245, i32 0, i32 1, i32 3
  store { i32, [ 0 x i32 ] }* %array2264, { i32, [ 0 x i32 ] }** %index_ptr2267
  %arr2268 = alloca { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }*
  store { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array2245, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %arr2268
  %bound_ptr2270 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %arr2268, i32 0, i32 0
  %bound2271 = load i32* %bound_ptr2270
  call void @oat_array_bounds_check( i32 %bound2271, i32 0 )
  %elt2269 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %arr2268, i32 0, i32 1, i32 0
  %_lhs2272 = load { i32, [ 0 x i32 ] }** %elt2269
  %len_ptr2273 = getelementptr { i32, [ 0 x i32 ] }* %_lhs2272, i32 0, i32 0
  %len2274 = load i32* %len_ptr2273
  %len2275 = alloca i32
  store i32 %len2274, i32* %len2275
  %_lhs2276 = load i32* %len2275
  ret i32 %_lhs2276
}


