declare i8* @string_of_array({ i32, [ 0 x i32 ] })
declare { i32, [ 0 x i32 ] } @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] } @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@_oat_string1710.str. = private unnamed_addr constant [ 11 x i8 ] c "1234967890\00", align 4
@_oat_string1710 = global i8* getelementptr inbounds ([ 11 x i8 ]* @_oat_string1710.str., i32 0, i32 0), align 4
define void @oat_init (){

__fresh248:
  ret void
}


define i32 @program (i32 %argc1708, { i32, [ 0 x i8* ] } %argv1706){

__fresh243:
  %argc_slot1709 = alloca i32
  store i32 %argc1708, i32* %argc_slot1709
  %argv_slot1707 = alloca { i32, [ 0 x i8* ] }
  store { i32, [ 0 x i8* ] } %argv1706, { i32, [ 0 x i8* ] }* %argv_slot1707
  %strval1711 = load i8** @_oat_string1710
  %ret1712 = call { i32, [ 0 x i32 ] } @array_of_string ( i8* %strval1711 )
  %arr1713 = alloca { i32, [ 0 x i32 ] }
  store { i32, [ 0 x i32 ] } %ret1712, { i32, [ 0 x i32 ] }* %arr1713
  %sum1714 = alloca i32
  store i32 0, i32* %sum1714
  %i1715 = alloca i32
  store i32 0, i32* %i1715
  br label %__cond239

__cond239:
  %_lhs1716 = load i32* %i1715
  %bop1717 = icmp slt i32 %_lhs1716, 10
  br i1 %bop1717, label %__body238, label %__post237

__fresh244:
  br label %__body238

__body238:
  %_lhs1718 = load i32* %i1715
  %bound_ptr1720 = getelementptr { i32, [ 0 x i32 ] }* %arr1713, i32 0, i32 0
  %bound1721 = load i32* %bound_ptr1720
  call void @oat_array_bounds_check( i32 %bound1721, i32 %_lhs1718 )
  %elt1719 = getelementptr { i32, [ 0 x i32 ] }* %arr1713, i32 0, i32 1, i32 %_lhs1718
  %_lhs1722 = load i32* %i1715
  store i32 %_lhs1722, i32* %elt1719
  %_lhs1723 = load i32* %i1715
  %bop1724 = add i32 %_lhs1723, 1
  store i32 %bop1724, i32* %i1715
  br label %__cond239

__fresh245:
  br label %__post237

__post237:
  %i1725 = alloca i32
  store i32 0, i32* %i1725
  br label %__cond242

__cond242:
  %_lhs1726 = load i32* %i1725
  %bop1727 = icmp slt i32 %_lhs1726, 10
  br i1 %bop1727, label %__body241, label %__post240

__fresh246:
  br label %__body241

__body241:
  %_lhs1728 = load i32* %sum1714
  %_lhs1729 = load i32* %i1725
  %bound_ptr1731 = getelementptr { i32, [ 0 x i32 ] }* %arr1713, i32 0, i32 0
  %bound1732 = load i32* %bound_ptr1731
  call void @oat_array_bounds_check( i32 %bound1732, i32 %_lhs1729 )
  %elt1730 = getelementptr { i32, [ 0 x i32 ] }* %arr1713, i32 0, i32 1, i32 %_lhs1729
  %_lhs1733 = load i32* %elt1730
  %bop1734 = add i32 %_lhs1728, %_lhs1733
  store i32 %bop1734, i32* %sum1714
  %_lhs1735 = load i32* %i1725
  %bop1736 = add i32 %_lhs1735, 1
  store i32 %bop1736, i32* %i1725
  br label %__cond242

__fresh247:
  br label %__post240

__post240:
  %_lhs1737 = load i32* %sum1714
  ret i32 %_lhs1737
}


