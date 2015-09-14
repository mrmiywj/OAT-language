declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@n3170 = global i32 8, align 4
@b3169 = global { i32, [ 0 x i32 ] }* zeroinitializer, align 4		; initialized by b3169.init
define void @oat_init (){

__fresh649:
  call void @b3169.init(  )
  ret void
}


define void @restoreHdown ({ i32, [ 0 x i32 ] }* %a3314, i32 %i3312, i32 %n3310){

__fresh640:
  %a_slot3315 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %a3314, { i32, [ 0 x i32 ] }** %a_slot3315
  %i_slot3313 = alloca i32
  store i32 %i3312, i32* %i_slot3313
  %n_slot3311 = alloca i32
  store i32 %n3310, i32* %n_slot3311
  %_lhs3316 = load i32* %i_slot3313
  %bound_ptr3318 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3315, i32 0, i32 0
  %bound3319 = load i32* %bound_ptr3318
  call void @oat_array_bounds_check( i32 %bound3319, i32 %_lhs3316 )
  %elt3317 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3315, i32 0, i32 1, i32 %_lhs3316
  %_lhs3320 = load i32* %elt3317
  %v3321 = alloca i32
  store i32 %_lhs3320, i32* %v3321
  %_lhs3322 = load i32* %i_slot3313
  %bop3323 = mul i32 %_lhs3322, 2
  %j3324 = alloca i32
  store i32 %bop3323, i32* %j3324
  %done3325 = alloca i32
  store i32 0, i32* %done3325
  br label %__cond630

__cond630:
  %_lhs3326 = load i32* %j3324
  %_lhs3327 = load i32* %n_slot3311
  %bop3328 = icmp sle i32 %_lhs3326, %_lhs3327
  %_lhs3329 = load i32* %done3325
  %bop3330 = icmp eq i32 %_lhs3329, 0
  %bop3331 = and i1 %bop3328, %bop3330
  br i1 %bop3331, label %__body629, label %__post628

__fresh641:
  br label %__body629

__body629:
  %_lhs3332 = load i32* %j3324
  %_lhs3333 = load i32* %n_slot3311
  %bop3334 = icmp slt i32 %_lhs3332, %_lhs3333
  %_lhs3335 = load i32* %j3324
  %bound_ptr3337 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3315, i32 0, i32 0
  %bound3338 = load i32* %bound_ptr3337
  call void @oat_array_bounds_check( i32 %bound3338, i32 %_lhs3335 )
  %elt3336 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3315, i32 0, i32 1, i32 %_lhs3335
  %_lhs3339 = load i32* %elt3336
  %_lhs3340 = load i32* %j3324
  %bop3341 = add i32 %_lhs3340, 1
  %bound_ptr3343 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3315, i32 0, i32 0
  %bound3344 = load i32* %bound_ptr3343
  call void @oat_array_bounds_check( i32 %bound3344, i32 %bop3341 )
  %elt3342 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3315, i32 0, i32 1, i32 %bop3341
  %_lhs3345 = load i32* %elt3342
  %bop3346 = icmp slt i32 %_lhs3339, %_lhs3345
  %bop3347 = and i1 %bop3334, %bop3346
  br i1 %bop3347, label %__then633, label %__else632

__fresh642:
  br label %__then633

__then633:
  %_lhs3348 = load i32* %j3324
  %bop3349 = add i32 %_lhs3348, 1
  store i32 %bop3349, i32* %j3324
  br label %__merge631

__fresh643:
  br label %__else632

__else632:
  br label %__merge631

__merge631:
  %_lhs3350 = load i32* %j3324
  %bound_ptr3352 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3315, i32 0, i32 0
  %bound3353 = load i32* %bound_ptr3352
  call void @oat_array_bounds_check( i32 %bound3353, i32 %_lhs3350 )
  %elt3351 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3315, i32 0, i32 1, i32 %_lhs3350
  %_lhs3354 = load i32* %elt3351
  %_lhs3355 = load i32* %j3324
  %bop3356 = ashr i32 %_lhs3355, 1
  %bound_ptr3358 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3315, i32 0, i32 0
  %bound3359 = load i32* %bound_ptr3358
  call void @oat_array_bounds_check( i32 %bound3359, i32 %bop3356 )
  %elt3357 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3315, i32 0, i32 1, i32 %bop3356
  %_lhs3360 = load i32* %elt3357
  %bop3361 = icmp slt i32 %_lhs3354, %_lhs3360
  br i1 %bop3361, label %__then636, label %__else635

__fresh644:
  br label %__then636

__then636:
  store i32 1, i32* %done3325
  br label %__merge634

__fresh645:
  br label %__else635

__else635:
  br label %__merge634

__merge634:
  %_lhs3362 = load i32* %done3325
  %bop3363 = icmp eq i32 %_lhs3362, 0
  br i1 %bop3363, label %__then639, label %__else638

__fresh646:
  br label %__then639

__then639:
  %_lhs3364 = load i32* %j3324
  %bop3365 = ashr i32 %_lhs3364, 1
  %bound_ptr3367 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3315, i32 0, i32 0
  %bound3368 = load i32* %bound_ptr3367
  call void @oat_array_bounds_check( i32 %bound3368, i32 %bop3365 )
  %elt3366 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3315, i32 0, i32 1, i32 %bop3365
  %_lhs3369 = load i32* %j3324
  %bound_ptr3371 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3315, i32 0, i32 0
  %bound3372 = load i32* %bound_ptr3371
  call void @oat_array_bounds_check( i32 %bound3372, i32 %_lhs3369 )
  %elt3370 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3315, i32 0, i32 1, i32 %_lhs3369
  %_lhs3373 = load i32* %elt3370
  store i32 %_lhs3373, i32* %elt3366
  %_lhs3374 = load i32* %j3324
  %bop3375 = mul i32 %_lhs3374, 2
  store i32 %bop3375, i32* %j3324
  br label %__merge637

__fresh647:
  br label %__else638

__else638:
  br label %__merge637

__merge637:
  br label %__cond630

__fresh648:
  br label %__post628

__post628:
  %_lhs3376 = load i32* %j3324
  %bop3377 = ashr i32 %_lhs3376, 1
  %bound_ptr3379 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3315, i32 0, i32 0
  %bound3380 = load i32* %bound_ptr3379
  call void @oat_array_bounds_check( i32 %bound3380, i32 %bop3377 )
  %elt3378 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3315, i32 0, i32 1, i32 %bop3377
  %_lhs3381 = load i32* %v3321
  store i32 %_lhs3381, i32* %elt3378
  ret void
}


define void @restoreHup ({ i32, [ 0 x i32 ] }* %a3274, i32 %i3272){

__fresh625:
  %a_slot3275 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %a3274, { i32, [ 0 x i32 ] }** %a_slot3275
  %i_slot3273 = alloca i32
  store i32 %i3272, i32* %i_slot3273
  %_lhs3276 = load i32* %i_slot3273
  %bound_ptr3278 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3275, i32 0, i32 0
  %bound3279 = load i32* %bound_ptr3278
  call void @oat_array_bounds_check( i32 %bound3279, i32 %_lhs3276 )
  %elt3277 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3275, i32 0, i32 1, i32 %_lhs3276
  %_lhs3280 = load i32* %elt3277
  %v3281 = alloca i32
  store i32 %_lhs3280, i32* %v3281
  br label %__cond624

__cond624:
  %_lhs3282 = load i32* %i_slot3273
  %bop3283 = icmp sgt i32 %_lhs3282, 1
  %_lhs3284 = load i32* %i_slot3273
  %bop3285 = ashr i32 %_lhs3284, 1
  %bound_ptr3287 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3275, i32 0, i32 0
  %bound3288 = load i32* %bound_ptr3287
  call void @oat_array_bounds_check( i32 %bound3288, i32 %bop3285 )
  %elt3286 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3275, i32 0, i32 1, i32 %bop3285
  %_lhs3289 = load i32* %elt3286
  %_lhs3290 = load i32* %v3281
  %bop3291 = icmp slt i32 %_lhs3289, %_lhs3290
  %bop3292 = and i1 %bop3283, %bop3291
  br i1 %bop3292, label %__body623, label %__post622

__fresh626:
  br label %__body623

__body623:
  %_lhs3293 = load i32* %i_slot3273
  %bound_ptr3295 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3275, i32 0, i32 0
  %bound3296 = load i32* %bound_ptr3295
  call void @oat_array_bounds_check( i32 %bound3296, i32 %_lhs3293 )
  %elt3294 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3275, i32 0, i32 1, i32 %_lhs3293
  %_lhs3297 = load i32* %i_slot3273
  %bop3298 = ashr i32 %_lhs3297, 1
  %bound_ptr3300 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3275, i32 0, i32 0
  %bound3301 = load i32* %bound_ptr3300
  call void @oat_array_bounds_check( i32 %bound3301, i32 %bop3298 )
  %elt3299 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3275, i32 0, i32 1, i32 %bop3298
  %_lhs3302 = load i32* %elt3299
  store i32 %_lhs3302, i32* %elt3294
  %_lhs3303 = load i32* %i_slot3273
  %bop3304 = ashr i32 %_lhs3303, 1
  store i32 %bop3304, i32* %i_slot3273
  br label %__cond624

__fresh627:
  br label %__post622

__post622:
  %_lhs3305 = load i32* %i_slot3273
  %bound_ptr3307 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3275, i32 0, i32 0
  %bound3308 = load i32* %bound_ptr3307
  call void @oat_array_bounds_check( i32 %bound3308, i32 %_lhs3305 )
  %elt3306 = getelementptr { i32, [ 0 x i32 ] }** %a_slot3275, i32 0, i32 1, i32 %_lhs3305
  %_lhs3309 = load i32* %v3281
  store i32 %_lhs3309, i32* %elt3306
  ret void
}


define i32 @program (i32 %argc3173, { i32, [ 0 x i8* ] }* %argv3171){

__fresh611:
  %argc_slot3174 = alloca i32
  store i32 %argc3173, i32* %argc_slot3174
  %argv_slot3172 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv3171, { i32, [ 0 x i8* ] }** %argv_slot3172
  %array_ptr3175 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 9 )
  %array3176 = bitcast { i32, [ 0 x i32 ] }* %array_ptr3175 to { i32, [ 0 x i32 ] }* 
  %_tmp31763178 = alloca i32
  store i32 9, i32* %_tmp31763178
  %_tmp31783180 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array3176, { i32, [ 0 x i32 ] }** %_tmp31783180
  %i3181 = alloca i32
  store i32 0, i32* %i3181
  br label %__cond598

__cond598:
  %_lhs3182 = load i32* %i3181
  %_lhs3183 = load i32* %_tmp31763178
  %bop3184 = icmp slt i32 %_lhs3182, %_lhs3183
  br i1 %bop3184, label %__body597, label %__post596

__fresh612:
  br label %__body597

__body597:
  %_lhs3185 = load i32* %i3181
  %bound_ptr3187 = getelementptr { i32, [ 0 x i32 ] }** %_tmp31783180, i32 0, i32 0
  %bound3188 = load i32* %bound_ptr3187
  call void @oat_array_bounds_check( i32 %bound3188, i32 %_lhs3185 )
  %elt3186 = getelementptr { i32, [ 0 x i32 ] }** %_tmp31783180, i32 0, i32 1, i32 %_lhs3185
  store i32 0, i32* %elt3186
  %_lhs3189 = load i32* %i3181
  %bop3190 = add i32 %_lhs3189, 1
  store i32 %bop3190, i32* %i3181
  br label %__cond598

__fresh613:
  br label %__post596

__post596:
  %a3191 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array3176, { i32, [ 0 x i32 ] }** %a3191
  %i3192 = alloca i32
  store i32 0, i32* %i3192
  %j3193 = alloca i32
  store i32 0, i32* %j3193
  %k3194 = alloca i32
  store i32 0, i32* %k3194
  %r3195 = alloca i32
  store i32 0, i32* %r3195
  %bound_ptr3197 = getelementptr { i32, [ 0 x i32 ] }** %a3191, i32 0, i32 0
  %bound3198 = load i32* %bound_ptr3197
  call void @oat_array_bounds_check( i32 %bound3198, i32 0 )
  %elt3196 = getelementptr { i32, [ 0 x i32 ] }** %a3191, i32 0, i32 1, i32 0
  %_lhs3199 = load i32* %elt3196
  %check3200 = alloca i32
  store i32 %_lhs3199, i32* %check3200
  %bound_ptr3202 = getelementptr { i32, [ 0 x i32 ] }** %a3191, i32 0, i32 0
  %bound3203 = load i32* %bound_ptr3202
  call void @oat_array_bounds_check( i32 %bound3203, i32 0 )
  %elt3201 = getelementptr { i32, [ 0 x i32 ] }** %a3191, i32 0, i32 1, i32 0
  %bound_ptr3205 = getelementptr { i32, [ 0 x i32 ] }** @b3169, i32 0, i32 0
  %bound3206 = load i32* %bound_ptr3205
  call void @oat_array_bounds_check( i32 %bound3206, i32 0 )
  %elt3204 = getelementptr { i32, [ 0 x i32 ] }** @b3169, i32 0, i32 1, i32 0
  %_lhs3207 = load i32* %elt3204
  store i32 %_lhs3207, i32* %elt3201
  store i32 1, i32* %i3192
  br label %__cond601

__cond601:
  %_lhs3208 = load i32* %i3192
  %_lhs3209 = load i32* @n3170
  %bop3210 = icmp sle i32 %_lhs3208, %_lhs3209
  br i1 %bop3210, label %__body600, label %__post599

__fresh614:
  br label %__body600

__body600:
  %_lhs3211 = load i32* %i3192
  %bound_ptr3213 = getelementptr { i32, [ 0 x i32 ] }** %a3191, i32 0, i32 0
  %bound3214 = load i32* %bound_ptr3213
  call void @oat_array_bounds_check( i32 %bound3214, i32 %_lhs3211 )
  %elt3212 = getelementptr { i32, [ 0 x i32 ] }** %a3191, i32 0, i32 1, i32 %_lhs3211
  %_lhs3215 = load i32* %i3192
  %bound_ptr3217 = getelementptr { i32, [ 0 x i32 ] }** @b3169, i32 0, i32 0
  %bound3218 = load i32* %bound_ptr3217
  call void @oat_array_bounds_check( i32 %bound3218, i32 %_lhs3215 )
  %elt3216 = getelementptr { i32, [ 0 x i32 ] }** @b3169, i32 0, i32 1, i32 %_lhs3215
  %_lhs3219 = load i32* %elt3216
  %unop3220 = sub i32 0, %_lhs3219
  store i32 %unop3220, i32* %elt3212
  %_lhs3222 = load i32* %i3192
  %_lhs3221 = load { i32, [ 0 x i32 ] }** %a3191
  call void @restoreHup( { i32, [ 0 x i32 ] }* %_lhs3221, i32 %_lhs3222 )
  %_lhs3223 = load i32* %i3192
  %bop3224 = add i32 %_lhs3223, 1
  store i32 %bop3224, i32* %i3192
  br label %__cond601

__fresh615:
  br label %__post599

__post599:
  %_lhs3225 = load i32* @n3170
  store i32 %_lhs3225, i32* %j3193
  store i32 1, i32* %i3192
  br label %__cond604

__cond604:
  %_lhs3226 = load i32* %i3192
  %_lhs3227 = load i32* %j3193
  %bop3228 = icmp sle i32 %_lhs3226, %_lhs3227
  br i1 %bop3228, label %__body603, label %__post602

__fresh616:
  br label %__body603

__body603:
  %temp3229 = alloca i32
  store i32 0, i32* %temp3229
  %bound_ptr3231 = getelementptr { i32, [ 0 x i32 ] }** %a3191, i32 0, i32 0
  %bound3232 = load i32* %bound_ptr3231
  call void @oat_array_bounds_check( i32 %bound3232, i32 1 )
  %elt3230 = getelementptr { i32, [ 0 x i32 ] }** %a3191, i32 0, i32 1, i32 1
  %_lhs3233 = load i32* %elt3230
  store i32 %_lhs3233, i32* %temp3229
  %bound_ptr3235 = getelementptr { i32, [ 0 x i32 ] }** %a3191, i32 0, i32 0
  %bound3236 = load i32* %bound_ptr3235
  call void @oat_array_bounds_check( i32 %bound3236, i32 1 )
  %elt3234 = getelementptr { i32, [ 0 x i32 ] }** %a3191, i32 0, i32 1, i32 1
  %_lhs3237 = load i32* @n3170
  %bound_ptr3239 = getelementptr { i32, [ 0 x i32 ] }** %a3191, i32 0, i32 0
  %bound3240 = load i32* %bound_ptr3239
  call void @oat_array_bounds_check( i32 %bound3240, i32 %_lhs3237 )
  %elt3238 = getelementptr { i32, [ 0 x i32 ] }** %a3191, i32 0, i32 1, i32 %_lhs3237
  %_lhs3241 = load i32* %elt3238
  store i32 %_lhs3241, i32* %elt3234
  %_lhs3242 = load i32* @n3170
  %bound_ptr3244 = getelementptr { i32, [ 0 x i32 ] }** %a3191, i32 0, i32 0
  %bound3245 = load i32* %bound_ptr3244
  call void @oat_array_bounds_check( i32 %bound3245, i32 %_lhs3242 )
  %elt3243 = getelementptr { i32, [ 0 x i32 ] }** %a3191, i32 0, i32 1, i32 %_lhs3242
  %_lhs3246 = load i32* %temp3229
  store i32 %_lhs3246, i32* %elt3243
  %_lhs3247 = load i32* @n3170
  %bop3248 = sub i32 %_lhs3247, 1
  store i32 %bop3248, i32* @n3170
  %_lhs3250 = load i32* @n3170
  %_lhs3249 = load { i32, [ 0 x i32 ] }** %a3191
  call void @restoreHdown( { i32, [ 0 x i32 ] }* %_lhs3249, i32 1, i32 %_lhs3250 )
  %_lhs3251 = load i32* %i3192
  %bop3252 = add i32 %_lhs3251, 1
  store i32 %bop3252, i32* %i3192
  br label %__cond604

__fresh617:
  br label %__post602

__post602:
  %_lhs3253 = load i32* %j3193
  store i32 %_lhs3253, i32* @n3170
  store i32 1, i32* %i3192
  br label %__cond607

__cond607:
  %_lhs3254 = load i32* %i3192
  %_lhs3255 = load i32* @n3170
  %bop3256 = icmp sle i32 %_lhs3254, %_lhs3255
  br i1 %bop3256, label %__body606, label %__post605

__fresh618:
  br label %__body606

__body606:
  %_lhs3257 = load i32* %i3192
  %bound_ptr3259 = getelementptr { i32, [ 0 x i32 ] }** %a3191, i32 0, i32 0
  %bound3260 = load i32* %bound_ptr3259
  call void @oat_array_bounds_check( i32 %bound3260, i32 %_lhs3257 )
  %elt3258 = getelementptr { i32, [ 0 x i32 ] }** %a3191, i32 0, i32 1, i32 %_lhs3257
  %_lhs3261 = load i32* %elt3258
  %_lhs3262 = load i32* %check3200
  %bop3263 = icmp sge i32 %_lhs3261, %_lhs3262
  br i1 %bop3263, label %__then610, label %__else609

__fresh619:
  br label %__then610

__then610:
  %_lhs3264 = load i32* %i3192
  %bound_ptr3266 = getelementptr { i32, [ 0 x i32 ] }** %a3191, i32 0, i32 0
  %bound3267 = load i32* %bound_ptr3266
  call void @oat_array_bounds_check( i32 %bound3267, i32 %_lhs3264 )
  %elt3265 = getelementptr { i32, [ 0 x i32 ] }** %a3191, i32 0, i32 1, i32 %_lhs3264
  %_lhs3268 = load i32* %elt3265
  store i32 %_lhs3268, i32* %check3200
  br label %__merge608

__fresh620:
  br label %__else609

__else609:
  store i32 1, i32* %r3195
  br label %__merge608

__merge608:
  %_lhs3269 = load i32* %i3192
  %bop3270 = add i32 %_lhs3269, 1
  store i32 %bop3270, i32* %i3192
  br label %__cond607

__fresh621:
  br label %__post605

__post605:
  %_lhs3271 = load i32* %r3195
  ret i32 %_lhs3271
}


define void @b3169.init (){

__fresh595:
  %array_ptr3150 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 9 )
  %array3151 = bitcast { i32, [ 0 x i32 ] }* %array_ptr3150 to { i32, [ 0 x i32 ] }* 
  %index_ptr3152 = getelementptr { i32, [ 0 x i32 ] }* %array3151, i32 0, i32 1, i32 0
  store i32 108, i32* %index_ptr3152
  %unop3153 = sub i32 0, 110
  %index_ptr3154 = getelementptr { i32, [ 0 x i32 ] }* %array3151, i32 0, i32 1, i32 1
  store i32 %unop3153, i32* %index_ptr3154
  %unop3155 = sub i32 0, 111
  %index_ptr3156 = getelementptr { i32, [ 0 x i32 ] }* %array3151, i32 0, i32 1, i32 2
  store i32 %unop3155, i32* %index_ptr3156
  %unop3157 = sub i32 0, 109
  %index_ptr3158 = getelementptr { i32, [ 0 x i32 ] }* %array3151, i32 0, i32 1, i32 3
  store i32 %unop3157, i32* %index_ptr3158
  %unop3159 = sub i32 0, 117
  %index_ptr3160 = getelementptr { i32, [ 0 x i32 ] }* %array3151, i32 0, i32 1, i32 4
  store i32 %unop3159, i32* %index_ptr3160
  %unop3161 = sub i32 0, 119
  %index_ptr3162 = getelementptr { i32, [ 0 x i32 ] }* %array3151, i32 0, i32 1, i32 5
  store i32 %unop3161, i32* %index_ptr3162
  %unop3163 = sub i32 0, 113
  %index_ptr3164 = getelementptr { i32, [ 0 x i32 ] }* %array3151, i32 0, i32 1, i32 6
  store i32 %unop3163, i32* %index_ptr3164
  %unop3165 = sub i32 0, 120
  %index_ptr3166 = getelementptr { i32, [ 0 x i32 ] }* %array3151, i32 0, i32 1, i32 7
  store i32 %unop3165, i32* %index_ptr3166
  %unop3167 = sub i32 0, 108
  %index_ptr3168 = getelementptr { i32, [ 0 x i32 ] }* %array3151, i32 0, i32 1, i32 8
  store i32 %unop3167, i32* %index_ptr3168
  store { i32, [ 0 x i32 ] }* %array3151, { i32, [ 0 x i32 ] }** @b3169
  ret void
}


