declare i8* @string_of_array({ i32, [ 0 x i32 ] })
declare { i32, [ 0 x i32 ] } @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] } @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh382:
  ret void
}


define i32 @program (i32 %argc2372, { i32, [ 0 x i8* ] } %argv2370){

__fresh379:
  %argc_slot2373 = alloca i32
  store i32 %argc2372, i32* %argc_slot2373
  %argv_slot2371 = alloca { i32, [ 0 x i8* ] }
  store { i32, [ 0 x i8* ] } %argv2370, { i32, [ 0 x i8* ] }* %argv_slot2371
  %array_ptr2374 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 8 )
  %array2375 = bitcast { i32, [ 0 x i32 ] } %array_ptr2374 to { i32, [ 0 x i32 ] } 
  %index_ptr2376 = getelementptr { i32, [ 0 x i32 ] } %array2375, i32 0, i32 1, i32 0
  store i32 5, i32* %index_ptr2376
  %index_ptr2377 = getelementptr { i32, [ 0 x i32 ] } %array2375, i32 0, i32 1, i32 1
  store i32 200, i32* %index_ptr2377
  %index_ptr2378 = getelementptr { i32, [ 0 x i32 ] } %array2375, i32 0, i32 1, i32 2
  store i32 1, i32* %index_ptr2378
  %index_ptr2379 = getelementptr { i32, [ 0 x i32 ] } %array2375, i32 0, i32 1, i32 3
  store i32 65, i32* %index_ptr2379
  %index_ptr2380 = getelementptr { i32, [ 0 x i32 ] } %array2375, i32 0, i32 1, i32 4
  store i32 30, i32* %index_ptr2380
  %index_ptr2381 = getelementptr { i32, [ 0 x i32 ] } %array2375, i32 0, i32 1, i32 5
  store i32 99, i32* %index_ptr2381
  %index_ptr2382 = getelementptr { i32, [ 0 x i32 ] } %array2375, i32 0, i32 1, i32 6
  store i32 2, i32* %index_ptr2382
  %index_ptr2383 = getelementptr { i32, [ 0 x i32 ] } %array2375, i32 0, i32 1, i32 7
  store i32 0, i32* %index_ptr2383
  %ar2384 = alloca { i32, [ 0 x i32 ] }
  store { i32, [ 0 x i32 ] } %array2375, { i32, [ 0 x i32 ] }* %ar2384
  %_lhs2385 = load { i32, [ 0 x i32 ] }* %ar2384
  call void @selectionsort( { i32, [ 0 x i32 ] } %_lhs2385, i32 8 )
  %i2386 = alloca i32
  store i32 0, i32* %i2386
  br label %__cond378

__cond378:
  %_lhs2387 = load i32* %i2386
  %bop2388 = icmp slt i32 %_lhs2387, 8
  br i1 %bop2388, label %__body377, label %__post376

__fresh380:
  br label %__body377

__body377:
  %_lhs2389 = load i32* %i2386
  %bound_ptr2391 = getelementptr { i32, [ 0 x i32 ] }* %ar2384, i32 0, i32 0
  %bound2392 = load i32* %bound_ptr2391
  call void @oat_array_bounds_check( i32 %bound2392, i32 %_lhs2389 )
  %elt2390 = getelementptr { i32, [ 0 x i32 ] }* %ar2384, i32 0, i32 1, i32 %_lhs2389
  %_lhs2393 = load i32* %elt2390
  call void @print_int( i32 %_lhs2393 )
  %_lhs2394 = load i32* %i2386
  %bop2395 = add i32 %_lhs2394, 1
  store i32 %bop2395, i32* %i2386
  br label %__cond378

__fresh381:
  br label %__post376

__post376:
  ret i32 0
}


define void @selectionsort ({ i32, [ 0 x i32 ] } %a2337, i32 %s2335){

__fresh373:
  %a_slot2338 = alloca { i32, [ 0 x i32 ] }
  store { i32, [ 0 x i32 ] } %a2337, { i32, [ 0 x i32 ] }* %a_slot2338
  %s_slot2336 = alloca i32
  store i32 %s2335, i32* %s_slot2336
  %t2339 = alloca i32
  store i32 0, i32* %t2339
  %mi2340 = alloca i32
  store i32 0, i32* %mi2340
  %i2341 = alloca i32
  store i32 0, i32* %i2341
  br label %__cond372

__cond372:
  %_lhs2342 = load i32* %i2341
  %_lhs2343 = load i32* %s_slot2336
  %bop2344 = icmp slt i32 %_lhs2342, %_lhs2343
  br i1 %bop2344, label %__body371, label %__post370

__fresh374:
  br label %__body371

__body371:
  %_lhs2347 = load i32* %s_slot2336
  %_lhs2346 = load i32* %i2341
  %_lhs2345 = load { i32, [ 0 x i32 ] }* %a_slot2338
  %ret2348 = call i32 @getminindex ( { i32, [ 0 x i32 ] } %_lhs2345, i32 %_lhs2346, i32 %_lhs2347 )
  store i32 %ret2348, i32* %mi2340
  %_lhs2349 = load i32* %i2341
  %bound_ptr2351 = getelementptr { i32, [ 0 x i32 ] }* %a_slot2338, i32 0, i32 0
  %bound2352 = load i32* %bound_ptr2351
  call void @oat_array_bounds_check( i32 %bound2352, i32 %_lhs2349 )
  %elt2350 = getelementptr { i32, [ 0 x i32 ] }* %a_slot2338, i32 0, i32 1, i32 %_lhs2349
  %_lhs2353 = load i32* %elt2350
  store i32 %_lhs2353, i32* %t2339
  %_lhs2354 = load i32* %i2341
  %bound_ptr2356 = getelementptr { i32, [ 0 x i32 ] }* %a_slot2338, i32 0, i32 0
  %bound2357 = load i32* %bound_ptr2356
  call void @oat_array_bounds_check( i32 %bound2357, i32 %_lhs2354 )
  %elt2355 = getelementptr { i32, [ 0 x i32 ] }* %a_slot2338, i32 0, i32 1, i32 %_lhs2354
  %_lhs2358 = load i32* %mi2340
  %bound_ptr2360 = getelementptr { i32, [ 0 x i32 ] }* %a_slot2338, i32 0, i32 0
  %bound2361 = load i32* %bound_ptr2360
  call void @oat_array_bounds_check( i32 %bound2361, i32 %_lhs2358 )
  %elt2359 = getelementptr { i32, [ 0 x i32 ] }* %a_slot2338, i32 0, i32 1, i32 %_lhs2358
  %_lhs2362 = load i32* %elt2359
  store i32 %_lhs2362, i32* %elt2355
  %_lhs2363 = load i32* %mi2340
  %bound_ptr2365 = getelementptr { i32, [ 0 x i32 ] }* %a_slot2338, i32 0, i32 0
  %bound2366 = load i32* %bound_ptr2365
  call void @oat_array_bounds_check( i32 %bound2366, i32 %_lhs2363 )
  %elt2364 = getelementptr { i32, [ 0 x i32 ] }* %a_slot2338, i32 0, i32 1, i32 %_lhs2363
  %_lhs2367 = load i32* %t2339
  store i32 %_lhs2367, i32* %elt2364
  %_lhs2368 = load i32* %i2341
  %bop2369 = add i32 %_lhs2368, 1
  store i32 %bop2369, i32* %i2341
  br label %__cond372

__fresh375:
  br label %__post370

__post370:
  ret void
}


define i32 @getminindex ({ i32, [ 0 x i32 ] } %a2304, i32 %s2302, i32 %b2300){

__fresh365:
  %a_slot2305 = alloca { i32, [ 0 x i32 ] }
  store { i32, [ 0 x i32 ] } %a2304, { i32, [ 0 x i32 ] }* %a_slot2305
  %s_slot2303 = alloca i32
  store i32 %s2302, i32* %s_slot2303
  %b_slot2301 = alloca i32
  store i32 %b2300, i32* %b_slot2301
  %_lhs2306 = load i32* %s_slot2303
  %i2307 = alloca i32
  store i32 %_lhs2306, i32* %i2307
  %_lhs2308 = load i32* %s_slot2303
  %bound_ptr2310 = getelementptr { i32, [ 0 x i32 ] }* %a_slot2305, i32 0, i32 0
  %bound2311 = load i32* %bound_ptr2310
  call void @oat_array_bounds_check( i32 %bound2311, i32 %_lhs2308 )
  %elt2309 = getelementptr { i32, [ 0 x i32 ] }* %a_slot2305, i32 0, i32 1, i32 %_lhs2308
  %_lhs2312 = load i32* %elt2309
  %min2313 = alloca i32
  store i32 %_lhs2312, i32* %min2313
  %_lhs2314 = load i32* %s_slot2303
  %mi2315 = alloca i32
  store i32 %_lhs2314, i32* %mi2315
  br label %__cond361

__cond361:
  %_lhs2316 = load i32* %i2307
  %_lhs2317 = load i32* %b_slot2301
  %bop2318 = icmp slt i32 %_lhs2316, %_lhs2317
  br i1 %bop2318, label %__body360, label %__post359

__fresh366:
  br label %__body360

__body360:
  %_lhs2319 = load i32* %i2307
  %bound_ptr2321 = getelementptr { i32, [ 0 x i32 ] }* %a_slot2305, i32 0, i32 0
  %bound2322 = load i32* %bound_ptr2321
  call void @oat_array_bounds_check( i32 %bound2322, i32 %_lhs2319 )
  %elt2320 = getelementptr { i32, [ 0 x i32 ] }* %a_slot2305, i32 0, i32 1, i32 %_lhs2319
  %_lhs2323 = load i32* %elt2320
  %_lhs2324 = load i32* %min2313
  %bop2325 = icmp slt i32 %_lhs2323, %_lhs2324
  br i1 %bop2325, label %__then364, label %__else363

__fresh367:
  br label %__then364

__then364:
  %_lhs2326 = load i32* %i2307
  %bound_ptr2328 = getelementptr { i32, [ 0 x i32 ] }* %a_slot2305, i32 0, i32 0
  %bound2329 = load i32* %bound_ptr2328
  call void @oat_array_bounds_check( i32 %bound2329, i32 %_lhs2326 )
  %elt2327 = getelementptr { i32, [ 0 x i32 ] }* %a_slot2305, i32 0, i32 1, i32 %_lhs2326
  %_lhs2330 = load i32* %elt2327
  store i32 %_lhs2330, i32* %min2313
  %_lhs2331 = load i32* %i2307
  store i32 %_lhs2331, i32* %mi2315
  br label %__merge362

__fresh368:
  br label %__else363

__else363:
  br label %__merge362

__merge362:
  %_lhs2332 = load i32* %i2307
  %bop2333 = add i32 %_lhs2332, 1
  store i32 %bop2333, i32* %i2307
  br label %__cond361

__fresh369:
  br label %__post359

__post359:
  %_lhs2334 = load i32* %mi2315
  ret i32 %_lhs2334
}


