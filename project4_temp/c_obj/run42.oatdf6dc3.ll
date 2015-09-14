declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh139:
  ret void
}


define i32 @program (i32 %argc385, { i32, [ 0 x i8* ] }* %argv383){

__fresh122:
  %argc_slot386 = alloca i32
  store i32 %argc385, i32* %argc_slot386
  %argv_slot384 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv383, { i32, [ 0 x i8* ] }** %argv_slot384
  %array_ptr387 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 3 )
  %array388 = bitcast { i32, [ 0 x i32 ] }* %array_ptr387 to { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* 
  %_tmp388390 = alloca i32
  store i32 3, i32* %_tmp388390
  %_tmp390392 = alloca { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }*
  store { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array388, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %_tmp390392
  %i393 = alloca i32
  store i32 0, i32* %i393
  br label %__cond100

__cond100:
  %_lhs394 = load i32* %i393
  %_lhs395 = load i32* %_tmp388390
  %bop396 = icmp slt i32 %_lhs394, %_lhs395
  br i1 %bop396, label %__body99, label %__post98

__fresh123:
  br label %__body99

__body99:
  %_lhs397 = load i32* %i393
  %bound_ptr399 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %_tmp390392, i32 0, i32 0
  %bound400 = load i32* %bound_ptr399
  call void @oat_array_bounds_check( i32 %bound400, i32 %_lhs397 )
  %elt398 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %_tmp390392, i32 0, i32 1, i32 %_lhs397
  %array_ptr401 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 3 )
  %array402 = bitcast { i32, [ 0 x i32 ] }* %array_ptr401 to { i32, [ 0 x i32 ] }* 
  %_tmp402404 = alloca i32
  store i32 3, i32* %_tmp402404
  %_tmp404406 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array402, { i32, [ 0 x i32 ] }** %_tmp404406
  %i407 = alloca i32
  store i32 0, i32* %i407
  br label %__cond103

__cond103:
  %_lhs408 = load i32* %i407
  %_lhs409 = load i32* %_tmp402404
  %bop410 = icmp slt i32 %_lhs408, %_lhs409
  br i1 %bop410, label %__body102, label %__post101

__fresh124:
  br label %__body102

__body102:
  %_lhs411 = load i32* %i407
  %bound_ptr413 = getelementptr { i32, [ 0 x i32 ] }** %_tmp404406, i32 0, i32 0
  %bound414 = load i32* %bound_ptr413
  call void @oat_array_bounds_check( i32 %bound414, i32 %_lhs411 )
  %elt412 = getelementptr { i32, [ 0 x i32 ] }** %_tmp404406, i32 0, i32 1, i32 %_lhs411
  store i32 1, i32* %elt412
  %_lhs415 = load i32* %i407
  %bop416 = add i32 %_lhs415, 1
  store i32 %bop416, i32* %i407
  br label %__cond103

__fresh125:
  br label %__post101

__post101:
  store { i32, [ 0 x i32 ] }* %array402, { i32, [ 0 x i32 ] }** %elt398
  %_lhs417 = load i32* %i393
  %bop418 = add i32 %_lhs417, 1
  store i32 %bop418, i32* %i393
  br label %__cond100

__fresh126:
  br label %__post98

__post98:
  %a1419 = alloca { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }*
  store { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array388, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a1419
  %array_ptr420 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 3 )
  %array421 = bitcast { i32, [ 0 x i32 ] }* %array_ptr420 to { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* 
  %_tmp421423 = alloca i32
  store i32 3, i32* %_tmp421423
  %_tmp423425 = alloca { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }*
  store { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array421, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %_tmp423425
  %i426 = alloca i32
  store i32 0, i32* %i426
  br label %__cond106

__cond106:
  %_lhs427 = load i32* %i426
  %_lhs428 = load i32* %_tmp421423
  %bop429 = icmp slt i32 %_lhs427, %_lhs428
  br i1 %bop429, label %__body105, label %__post104

__fresh127:
  br label %__body105

__body105:
  %_lhs430 = load i32* %i426
  %bound_ptr432 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %_tmp423425, i32 0, i32 0
  %bound433 = load i32* %bound_ptr432
  call void @oat_array_bounds_check( i32 %bound433, i32 %_lhs430 )
  %elt431 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %_tmp423425, i32 0, i32 1, i32 %_lhs430
  %array_ptr434 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 3 )
  %array435 = bitcast { i32, [ 0 x i32 ] }* %array_ptr434 to { i32, [ 0 x i32 ] }* 
  %_tmp435437 = alloca i32
  store i32 3, i32* %_tmp435437
  %_tmp437439 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array435, { i32, [ 0 x i32 ] }** %_tmp437439
  %i440 = alloca i32
  store i32 0, i32* %i440
  br label %__cond109

__cond109:
  %_lhs441 = load i32* %i440
  %_lhs442 = load i32* %_tmp435437
  %bop443 = icmp slt i32 %_lhs441, %_lhs442
  br i1 %bop443, label %__body108, label %__post107

__fresh128:
  br label %__body108

__body108:
  %_lhs444 = load i32* %i440
  %bound_ptr446 = getelementptr { i32, [ 0 x i32 ] }** %_tmp437439, i32 0, i32 0
  %bound447 = load i32* %bound_ptr446
  call void @oat_array_bounds_check( i32 %bound447, i32 %_lhs444 )
  %elt445 = getelementptr { i32, [ 0 x i32 ] }** %_tmp437439, i32 0, i32 1, i32 %_lhs444
  store i32 2, i32* %elt445
  %_lhs448 = load i32* %i440
  %bop449 = add i32 %_lhs448, 1
  store i32 %bop449, i32* %i440
  br label %__cond109

__fresh129:
  br label %__post107

__post107:
  store { i32, [ 0 x i32 ] }* %array435, { i32, [ 0 x i32 ] }** %elt431
  %_lhs450 = load i32* %i426
  %bop451 = add i32 %_lhs450, 1
  store i32 %bop451, i32* %i426
  br label %__cond106

__fresh130:
  br label %__post104

__post104:
  %a2452 = alloca { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }*
  store { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array421, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a2452
  %array_ptr453 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 3 )
  %array454 = bitcast { i32, [ 0 x i32 ] }* %array_ptr453 to { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* 
  %_tmp454456 = alloca i32
  store i32 3, i32* %_tmp454456
  %_tmp456458 = alloca { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }*
  store { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array454, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %_tmp456458
  %i459 = alloca i32
  store i32 0, i32* %i459
  br label %__cond112

__cond112:
  %_lhs460 = load i32* %i459
  %_lhs461 = load i32* %_tmp454456
  %bop462 = icmp slt i32 %_lhs460, %_lhs461
  br i1 %bop462, label %__body111, label %__post110

__fresh131:
  br label %__body111

__body111:
  %_lhs463 = load i32* %i459
  %bound_ptr465 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %_tmp456458, i32 0, i32 0
  %bound466 = load i32* %bound_ptr465
  call void @oat_array_bounds_check( i32 %bound466, i32 %_lhs463 )
  %elt464 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %_tmp456458, i32 0, i32 1, i32 %_lhs463
  %array_ptr467 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 3 )
  %array468 = bitcast { i32, [ 0 x i32 ] }* %array_ptr467 to { i32, [ 0 x i32 ] }* 
  %_tmp468470 = alloca i32
  store i32 3, i32* %_tmp468470
  %_tmp470472 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array468, { i32, [ 0 x i32 ] }** %_tmp470472
  %i473 = alloca i32
  store i32 0, i32* %i473
  br label %__cond115

__cond115:
  %_lhs474 = load i32* %i473
  %_lhs475 = load i32* %_tmp468470
  %bop476 = icmp slt i32 %_lhs474, %_lhs475
  br i1 %bop476, label %__body114, label %__post113

__fresh132:
  br label %__body114

__body114:
  %_lhs477 = load i32* %i473
  %bound_ptr479 = getelementptr { i32, [ 0 x i32 ] }** %_tmp470472, i32 0, i32 0
  %bound480 = load i32* %bound_ptr479
  call void @oat_array_bounds_check( i32 %bound480, i32 %_lhs477 )
  %elt478 = getelementptr { i32, [ 0 x i32 ] }** %_tmp470472, i32 0, i32 1, i32 %_lhs477
  store i32 3, i32* %elt478
  %_lhs481 = load i32* %i473
  %bop482 = add i32 %_lhs481, 1
  store i32 %bop482, i32* %i473
  br label %__cond115

__fresh133:
  br label %__post113

__post113:
  store { i32, [ 0 x i32 ] }* %array468, { i32, [ 0 x i32 ] }** %elt464
  %_lhs483 = load i32* %i459
  %bop484 = add i32 %_lhs483, 1
  store i32 %bop484, i32* %i459
  br label %__cond112

__fresh134:
  br label %__post110

__post110:
  %a3485 = alloca { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }*
  store { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array454, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a3485
  %array_ptr486 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 3 )
  %array487 = bitcast { i32, [ 0 x i32 ] }* %array_ptr486 to { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* 
  %_tmp487489 = alloca i32
  store i32 3, i32* %_tmp487489
  %_tmp489491 = alloca { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }*
  store { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array487, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %_tmp489491
  %i492 = alloca i32
  store i32 0, i32* %i492
  br label %__cond118

__cond118:
  %_lhs493 = load i32* %i492
  %_lhs494 = load i32* %_tmp487489
  %bop495 = icmp slt i32 %_lhs493, %_lhs494
  br i1 %bop495, label %__body117, label %__post116

__fresh135:
  br label %__body117

__body117:
  %_lhs496 = load i32* %i492
  %bound_ptr498 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %_tmp489491, i32 0, i32 0
  %bound499 = load i32* %bound_ptr498
  call void @oat_array_bounds_check( i32 %bound499, i32 %_lhs496 )
  %elt497 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %_tmp489491, i32 0, i32 1, i32 %_lhs496
  %array_ptr500 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 3 )
  %array501 = bitcast { i32, [ 0 x i32 ] }* %array_ptr500 to { i32, [ 0 x i32 ] }* 
  %_tmp501503 = alloca i32
  store i32 3, i32* %_tmp501503
  %_tmp503505 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array501, { i32, [ 0 x i32 ] }** %_tmp503505
  %i506 = alloca i32
  store i32 0, i32* %i506
  br label %__cond121

__cond121:
  %_lhs507 = load i32* %i506
  %_lhs508 = load i32* %_tmp501503
  %bop509 = icmp slt i32 %_lhs507, %_lhs508
  br i1 %bop509, label %__body120, label %__post119

__fresh136:
  br label %__body120

__body120:
  %_lhs510 = load i32* %i506
  %bound_ptr512 = getelementptr { i32, [ 0 x i32 ] }** %_tmp503505, i32 0, i32 0
  %bound513 = load i32* %bound_ptr512
  call void @oat_array_bounds_check( i32 %bound513, i32 %_lhs510 )
  %elt511 = getelementptr { i32, [ 0 x i32 ] }** %_tmp503505, i32 0, i32 1, i32 %_lhs510
  store i32 4, i32* %elt511
  %_lhs514 = load i32* %i506
  %bop515 = add i32 %_lhs514, 1
  store i32 %bop515, i32* %i506
  br label %__cond121

__fresh137:
  br label %__post119

__post119:
  store { i32, [ 0 x i32 ] }* %array501, { i32, [ 0 x i32 ] }** %elt497
  %_lhs516 = load i32* %i492
  %bop517 = add i32 %_lhs516, 1
  store i32 %bop517, i32* %i492
  br label %__cond118

__fresh138:
  br label %__post116

__post116:
  %a4518 = alloca { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }*
  store { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array487, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a4518
  %_lhs519 = load { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a2452
  store { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %_lhs519, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a1419
  %_lhs520 = load { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a1419
  store { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %_lhs520, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a3485
  %_lhs521 = load { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a4518
  store { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %_lhs521, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a1419
  %_lhs522 = load { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a3485
  store { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %_lhs522, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a2452
  %_lhs523 = load { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a2452
  store { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %_lhs523, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a4518
  %_lhs524 = load { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a4518
  store { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %_lhs524, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a3485
  %bound_ptr526 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a3485, i32 0, i32 0
  %bound527 = load i32* %bound_ptr526
  call void @oat_array_bounds_check( i32 %bound527, i32 0 )
  %elt525 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a3485, i32 0, i32 1, i32 0
  %bound_ptr529 = getelementptr { i32, [ 0 x i32 ] }** %elt525, i32 0, i32 0
  %bound530 = load i32* %bound_ptr529
  call void @oat_array_bounds_check( i32 %bound530, i32 0 )
  %elt528 = getelementptr { i32, [ 0 x i32 ] }** %elt525, i32 0, i32 1, i32 0
  %_lhs531 = load i32* %elt528
  ret i32 %_lhs531
}


