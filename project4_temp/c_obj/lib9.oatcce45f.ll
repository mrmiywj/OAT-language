declare i8* @string_of_array({ i32, [ 0 x i32 ] })
declare { i32, [ 0 x i32 ] } @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] } @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh233:
  ret void
}


define i32 @program (i32 %argc1678, { i32, [ 0 x i8* ] } %argv1676){

__fresh230:
  %argc_slot1679 = alloca i32
  store i32 %argc1678, i32* %argc_slot1679
  %argv_slot1677 = alloca { i32, [ 0 x i8* ] }
  store { i32, [ 0 x i8* ] } %argv1676, { i32, [ 0 x i8* ] }* %argv_slot1677
  %i1680 = alloca i32
  store i32 1, i32* %i1680
  br label %__cond229

__cond229:
  %_lhs1681 = load i32* %i1680
  %_lhs1682 = load i32* %argc_slot1679
  %bop1683 = icmp slt i32 %_lhs1681, %_lhs1682
  br i1 %bop1683, label %__body228, label %__post227

__fresh231:
  br label %__body228

__body228:
  %_lhs1684 = load i32* %i1680
  %bound_ptr1686 = getelementptr { i32, [ 0 x i8* ] }* %argv_slot1677, i32 0, i32 0
  %bound1687 = load i32* %bound_ptr1686
  call void @oat_array_bounds_check( i32 %bound1687, i32 %_lhs1684 )
  %elt1685 = getelementptr { i32, [ 0 x i8* ] }* %argv_slot1677, i32 0, i32 1, i32 %_lhs1684
  %_lhs1688 = load i8** %elt1685
  call void @print_string( i8* %_lhs1688 )
  %_lhs1689 = load i32* %i1680
  %bop1690 = add i32 %_lhs1689, 1
  store i32 %bop1690, i32* %i1680
  br label %__cond229

__fresh232:
  br label %__post227

__post227:
  %_lhs1691 = load i32* %argc_slot1679
  ret i32 %_lhs1691
}


