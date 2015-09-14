declare i8* @string_of_array({ i32, [ 0 x i32 ] })
declare { i32, [ 0 x i32 ] } @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] } @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh262:
  ret void
}


define i32 @program (i32 %argc1792, { i32, [ 0 x i8* ] } %argv1790){

__fresh261:
  %argc_slot1793 = alloca i32
  store i32 %argc1792, i32* %argc_slot1793
  %argv_slot1791 = alloca { i32, [ 0 x i8* ] }
  store { i32, [ 0 x i8* ] } %argv1790, { i32, [ 0 x i8* ] }* %argv_slot1791
  %ret1794 = call i32 @f ( i32 5 )
  ret i32 %ret1794
}


define i32 @f (i32 %i1779){

__fresh258:
  %i_slot1780 = alloca i32
  store i32 %i1779, i32* %i_slot1780
  %r1781 = alloca i32
  store i32 0, i32* %r1781
  %_lhs1782 = load i32* %i_slot1780
  %bop1783 = icmp eq i32 %_lhs1782, 0
  br i1 %bop1783, label %__then257, label %__else256

__fresh259:
  br label %__then257

__then257:
  store i32 1, i32* %r1781
  br label %__merge255

__fresh260:
  br label %__else256

__else256:
  %_lhs1784 = load i32* %i_slot1780
  %_lhs1785 = load i32* %i_slot1780
  %bop1786 = sub i32 %_lhs1785, 1
  %ret1787 = call i32 @f ( i32 %bop1786 )
  %bop1788 = mul i32 %_lhs1784, %ret1787
  store i32 %bop1788, i32* %r1781
  br label %__merge255

__merge255:
  %_lhs1789 = load i32* %r1781
  ret i32 %_lhs1789
}


