declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh257:
  ret void
}


define i32 @program (i32 %argc1615, { i32, [ 0 x i8* ] }* %argv1613){

__fresh256:
  %argc_slot1616 = alloca i32
  store i32 %argc1615, i32* %argc_slot1616
  %argv_slot1614 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv1613, { i32, [ 0 x i8* ] }** %argv_slot1614
  %ret1617 = call i32 @f ( i32 5 )
  ret i32 %ret1617
}


define i32 @f (i32 %i1602){

__fresh253:
  %i_slot1603 = alloca i32
  store i32 %i1602, i32* %i_slot1603
  %r1604 = alloca i32
  store i32 0, i32* %r1604
  %_lhs1605 = load i32* %i_slot1603
  %bop1606 = icmp eq i32 %_lhs1605, 0
  br i1 %bop1606, label %__then252, label %__else251

__fresh254:
  br label %__then252

__then252:
  store i32 1, i32* %r1604
  br label %__merge250

__fresh255:
  br label %__else251

__else251:
  %_lhs1607 = load i32* %i_slot1603
  %_lhs1608 = load i32* %i_slot1603
  %bop1609 = sub i32 %_lhs1608, 1
  %ret1610 = call i32 @f ( i32 %bop1609 )
  %bop1611 = mul i32 %_lhs1607, %ret1610
  store i32 %bop1611, i32* %r1604
  br label %__merge250

__merge250:
  %_lhs1612 = load i32* %r1604
  ret i32 %_lhs1612
}


