declare i8* @string_of_array({ i32, [ 0 x i32 ] })
declare { i32, [ 0 x i32 ] } @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] } @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh358:
  ret void
}


define i32 @program (i32 %argc2257, { i32, [ 0 x i8* ] } %argv2255){

__fresh355:
  %argc_slot2258 = alloca i32
  store i32 %argc2257, i32* %argc_slot2258
  %argv_slot2256 = alloca { i32, [ 0 x i8* ] }
  store { i32, [ 0 x i8* ] } %argv2255, { i32, [ 0 x i8* ] }* %argv_slot2256
  %array_ptr2259 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 15 )
  %array2260 = bitcast { i32, [ 0 x i32 ] } %array_ptr2259 to { i32, [ 0 x i32 ] } 
  %index_ptr2261 = getelementptr { i32, [ 0 x i32 ] } %array2260, i32 0, i32 1, i32 0
  store i32 1, i32* %index_ptr2261
  %index_ptr2262 = getelementptr { i32, [ 0 x i32 ] } %array2260, i32 0, i32 1, i32 1
  store i32 4, i32* %index_ptr2262
  %index_ptr2263 = getelementptr { i32, [ 0 x i32 ] } %array2260, i32 0, i32 1, i32 2
  store i32 5, i32* %index_ptr2263
  %index_ptr2264 = getelementptr { i32, [ 0 x i32 ] } %array2260, i32 0, i32 1, i32 3
  store i32 3, i32* %index_ptr2264
  %unop2265 = sub i32 0, 6
  %index_ptr2266 = getelementptr { i32, [ 0 x i32 ] } %array2260, i32 0, i32 1, i32 4
  store i32 %unop2265, i32* %index_ptr2266
  %index_ptr2267 = getelementptr { i32, [ 0 x i32 ] } %array2260, i32 0, i32 1, i32 5
  store i32 3, i32* %index_ptr2267
  %index_ptr2268 = getelementptr { i32, [ 0 x i32 ] } %array2260, i32 0, i32 1, i32 6
  store i32 7, i32* %index_ptr2268
  %index_ptr2269 = getelementptr { i32, [ 0 x i32 ] } %array2260, i32 0, i32 1, i32 7
  store i32 10, i32* %index_ptr2269
  %unop2270 = sub i32 0, 2
  %index_ptr2271 = getelementptr { i32, [ 0 x i32 ] } %array2260, i32 0, i32 1, i32 8
  store i32 %unop2270, i32* %index_ptr2271
  %unop2272 = sub i32 0, 5
  %index_ptr2273 = getelementptr { i32, [ 0 x i32 ] } %array2260, i32 0, i32 1, i32 9
  store i32 %unop2272, i32* %index_ptr2273
  %index_ptr2274 = getelementptr { i32, [ 0 x i32 ] } %array2260, i32 0, i32 1, i32 10
  store i32 7, i32* %index_ptr2274
  %index_ptr2275 = getelementptr { i32, [ 0 x i32 ] } %array2260, i32 0, i32 1, i32 11
  store i32 5, i32* %index_ptr2275
  %index_ptr2276 = getelementptr { i32, [ 0 x i32 ] } %array2260, i32 0, i32 1, i32 12
  store i32 9, i32* %index_ptr2276
  %unop2277 = sub i32 0, 3
  %index_ptr2278 = getelementptr { i32, [ 0 x i32 ] } %array2260, i32 0, i32 1, i32 13
  store i32 %unop2277, i32* %index_ptr2278
  %index_ptr2279 = getelementptr { i32, [ 0 x i32 ] } %array2260, i32 0, i32 1, i32 14
  store i32 7, i32* %index_ptr2279
  %nums2280 = alloca { i32, [ 0 x i32 ] }
  store { i32, [ 0 x i32 ] } %array2260, { i32, [ 0 x i32 ] }* %nums2280
  %i2281 = alloca i32
  store i32 0, i32* %i2281
  %_lhs2282 = load { i32, [ 0 x i32 ] }* %nums2280
  %len_ptr2283 = getelementptr { i32, [ 0 x i32 ] } %_lhs2282, i32 0, i32 0
  %len2284 = load i32* %len_ptr2283
  %n2285 = alloca i32
  store i32 %len2284, i32* %n2285
  %_lhs2287 = load i32* %n2285
  %bop2288 = sub i32 %_lhs2287, 1
  %_lhs2286 = load { i32, [ 0 x i32 ] }* %nums2280
  call void @stoogeSort( { i32, [ 0 x i32 ] } %_lhs2286, i32 0, i32 %bop2288 )
  store i32 0, i32* %i2281
  br label %__cond354

__cond354:
  %_lhs2289 = load i32* %i2281
  %_lhs2290 = load i32* %n2285
  %bop2291 = sub i32 %_lhs2290, 1
  %bop2292 = icmp sle i32 %_lhs2289, %bop2291
  br i1 %bop2292, label %__body353, label %__post352

__fresh356:
  br label %__body353

__body353:
  %_lhs2293 = load i32* %i2281
  %bound_ptr2295 = getelementptr { i32, [ 0 x i32 ] }* %nums2280, i32 0, i32 0
  %bound2296 = load i32* %bound_ptr2295
  call void @oat_array_bounds_check( i32 %bound2296, i32 %_lhs2293 )
  %elt2294 = getelementptr { i32, [ 0 x i32 ] }* %nums2280, i32 0, i32 1, i32 %_lhs2293
  %_lhs2297 = load i32* %elt2294
  call void @print_int( i32 %_lhs2297 )
  %_lhs2298 = load i32* %i2281
  %bop2299 = add i32 %_lhs2298, 1
  store i32 %bop2299, i32* %i2281
  br label %__cond354

__fresh357:
  br label %__post352

__post352:
  ret i32 0
}


define void @stoogeSort ({ i32, [ 0 x i32 ] } %a2198, i32 %i2196, i32 %j2194){

__fresh347:
  %a_slot2199 = alloca { i32, [ 0 x i32 ] }
  store { i32, [ 0 x i32 ] } %a2198, { i32, [ 0 x i32 ] }* %a_slot2199
  %i_slot2197 = alloca i32
  store i32 %i2196, i32* %i_slot2197
  %j_slot2195 = alloca i32
  store i32 %j2194, i32* %j_slot2195
  %t2200 = alloca i32
  store i32 0, i32* %t2200
  %_lhs2201 = load i32* %j_slot2195
  %bound_ptr2203 = getelementptr { i32, [ 0 x i32 ] }* %a_slot2199, i32 0, i32 0
  %bound2204 = load i32* %bound_ptr2203
  call void @oat_array_bounds_check( i32 %bound2204, i32 %_lhs2201 )
  %elt2202 = getelementptr { i32, [ 0 x i32 ] }* %a_slot2199, i32 0, i32 1, i32 %_lhs2201
  %_lhs2205 = load i32* %elt2202
  %_lhs2206 = load i32* %i_slot2197
  %bound_ptr2208 = getelementptr { i32, [ 0 x i32 ] }* %a_slot2199, i32 0, i32 0
  %bound2209 = load i32* %bound_ptr2208
  call void @oat_array_bounds_check( i32 %bound2209, i32 %_lhs2206 )
  %elt2207 = getelementptr { i32, [ 0 x i32 ] }* %a_slot2199, i32 0, i32 1, i32 %_lhs2206
  %_lhs2210 = load i32* %elt2207
  %bop2211 = icmp slt i32 %_lhs2205, %_lhs2210
  br i1 %bop2211, label %__then343, label %__else342

__fresh348:
  br label %__then343

__then343:
  %_lhs2212 = load i32* %i_slot2197
  %bound_ptr2214 = getelementptr { i32, [ 0 x i32 ] }* %a_slot2199, i32 0, i32 0
  %bound2215 = load i32* %bound_ptr2214
  call void @oat_array_bounds_check( i32 %bound2215, i32 %_lhs2212 )
  %elt2213 = getelementptr { i32, [ 0 x i32 ] }* %a_slot2199, i32 0, i32 1, i32 %_lhs2212
  %_lhs2216 = load i32* %elt2213
  store i32 %_lhs2216, i32* %t2200
  %_lhs2217 = load i32* %i_slot2197
  %bound_ptr2219 = getelementptr { i32, [ 0 x i32 ] }* %a_slot2199, i32 0, i32 0
  %bound2220 = load i32* %bound_ptr2219
  call void @oat_array_bounds_check( i32 %bound2220, i32 %_lhs2217 )
  %elt2218 = getelementptr { i32, [ 0 x i32 ] }* %a_slot2199, i32 0, i32 1, i32 %_lhs2217
  %_lhs2221 = load i32* %j_slot2195
  %bound_ptr2223 = getelementptr { i32, [ 0 x i32 ] }* %a_slot2199, i32 0, i32 0
  %bound2224 = load i32* %bound_ptr2223
  call void @oat_array_bounds_check( i32 %bound2224, i32 %_lhs2221 )
  %elt2222 = getelementptr { i32, [ 0 x i32 ] }* %a_slot2199, i32 0, i32 1, i32 %_lhs2221
  %_lhs2225 = load i32* %elt2222
  store i32 %_lhs2225, i32* %elt2218
  %_lhs2226 = load i32* %j_slot2195
  %bound_ptr2228 = getelementptr { i32, [ 0 x i32 ] }* %a_slot2199, i32 0, i32 0
  %bound2229 = load i32* %bound_ptr2228
  call void @oat_array_bounds_check( i32 %bound2229, i32 %_lhs2226 )
  %elt2227 = getelementptr { i32, [ 0 x i32 ] }* %a_slot2199, i32 0, i32 1, i32 %_lhs2226
  %_lhs2230 = load i32* %t2200
  store i32 %_lhs2230, i32* %elt2227
  br label %__merge341

__fresh349:
  br label %__else342

__else342:
  br label %__merge341

__merge341:
  %_lhs2231 = load i32* %j_slot2195
  %_lhs2232 = load i32* %i_slot2197
  %bop2233 = sub i32 %_lhs2231, %_lhs2232
  %bop2234 = icmp sgt i32 %bop2233, 1
  br i1 %bop2234, label %__then346, label %__else345

__fresh350:
  br label %__then346

__then346:
  %_lhs2235 = load i32* %j_slot2195
  %_lhs2236 = load i32* %i_slot2197
  %bop2237 = sub i32 %_lhs2235, %_lhs2236
  %bop2238 = add i32 %bop2237, 1
  %bop2239 = ashr i32 %bop2238, 1
  store i32 %bop2239, i32* %t2200
  %_lhs2242 = load i32* %j_slot2195
  %_lhs2243 = load i32* %t2200
  %bop2244 = sub i32 %_lhs2242, %_lhs2243
  %_lhs2241 = load i32* %i_slot2197
  %_lhs2240 = load { i32, [ 0 x i32 ] }* %a_slot2199
  call void @stoogeSort( { i32, [ 0 x i32 ] } %_lhs2240, i32 %_lhs2241, i32 %bop2244 )
  %_lhs2249 = load i32* %j_slot2195
  %_lhs2246 = load i32* %i_slot2197
  %_lhs2247 = load i32* %t2200
  %bop2248 = add i32 %_lhs2246, %_lhs2247
  %_lhs2245 = load { i32, [ 0 x i32 ] }* %a_slot2199
  call void @stoogeSort( { i32, [ 0 x i32 ] } %_lhs2245, i32 %bop2248, i32 %_lhs2249 )
  %_lhs2252 = load i32* %j_slot2195
  %_lhs2253 = load i32* %t2200
  %bop2254 = sub i32 %_lhs2252, %_lhs2253
  %_lhs2251 = load i32* %i_slot2197
  %_lhs2250 = load { i32, [ 0 x i32 ] }* %a_slot2199
  call void @stoogeSort( { i32, [ 0 x i32 ] } %_lhs2250, i32 %_lhs2251, i32 %bop2254 )
  br label %__merge344

__fresh351:
  br label %__else345

__else345:
  br label %__merge344

__merge344:
  ret void
}


