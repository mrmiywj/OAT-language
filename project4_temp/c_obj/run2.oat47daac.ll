declare i8* @string_of_array({ i32, [ 0 x i32 ] })
declare { i32, [ 0 x i32 ] } @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] } @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@i503 = global i32 0, align 4
define void @oat_init (){

__fresh129:
  ret void
}


define i32 @program (i32 %argc522, { i32, [ 0 x i8* ] } %argv520){

__fresh128:
  %argc_slot523 = alloca i32
  store i32 %argc522, i32* %argc_slot523
  %argv_slot521 = alloca { i32, [ 0 x i8* ] }
  store { i32, [ 0 x i8* ] } %argv520, { i32, [ 0 x i8* ] }* %argv_slot521
  %x524 = alloca i32
  store i32 3, i32* %x524
  %y525 = alloca i32
  store i32 3, i32* %y525
  %_lhs527 = load i32* %y525
  %_lhs526 = load i32* %x524
  %ret528 = call i32 @f ( i32 %_lhs526, i32 %_lhs527 )
  %_lhs529 = load i32* @i503
  %bop530 = add i32 %ret528, %_lhs529
  ret i32 %bop530
}


define i32 @f (i32 %x506, i32 %y504){

__fresh125:
  %x_slot507 = alloca i32
  store i32 %x506, i32* %x_slot507
  %y_slot505 = alloca i32
  store i32 %y504, i32* %y_slot505
  %r508 = alloca i32
  store i32 0, i32* %r508
  %_lhs509 = load i32* %x_slot507
  %bop510 = icmp sge i32 %_lhs509, 1
  br i1 %bop510, label %__then124, label %__else123

__fresh126:
  br label %__then124

__then124:
  %_lhs513 = load i32* %y_slot505
  %_lhs511 = load i32* %x_slot507
  %bop512 = sub i32 %_lhs511, 1
  %ret514 = call i32 @f ( i32 %bop512, i32 %_lhs513 )
  %bop515 = add i32 1, %ret514
  store i32 %bop515, i32* %r508
  br label %__merge122

__fresh127:
  br label %__else123

__else123:
  %_lhs516 = load i32* %x_slot507
  %_lhs517 = load i32* %y_slot505
  %bop518 = add i32 %_lhs516, %_lhs517
  store i32 %bop518, i32* %r508
  br label %__merge122

__merge122:
  %_lhs519 = load i32* %r508
  ret i32 %_lhs519
}


