declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh80:
  ret void
}


define i32 @program (i32 %argc574, { i32, [ 0 x i8* ] }* %argv572){

__fresh79:
  %argc_slot575 = alloca i32
  store i32 %argc574, i32* %argc_slot575
  %argv_slot573 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv572, { i32, [ 0 x i8* ] }** %argv_slot573
  %ret576 = call i32 @f ( i32 5 )
  ret i32 %ret576
}


define i32 @f (i32 %i561){

__fresh76:
  %i_slot562 = alloca i32
  store i32 %i561, i32* %i_slot562
  %r563 = alloca i32
  store i32 0, i32* %r563
  %_lhs564 = load i32* %i_slot562
  %bop565 = icmp eq i32 %_lhs564, 0
  br i1 %bop565, label %__then75, label %__else74

__fresh77:
  br label %__then75

__then75:
  store i32 1, i32* %r563
  br label %__merge73

__fresh78:
  br label %__else74

__else74:
  %_lhs566 = load i32* %i_slot562
  %_lhs567 = load i32* %i_slot562
  %bop568 = sub i32 %_lhs567, 1
  %ret569 = call i32 @f ( i32 %bop568 )
  %bop570 = mul i32 %_lhs566, %ret569
  store i32 %bop570, i32* %r563
  br label %__merge73

__merge73:
  %_lhs571 = load i32* %r563
  ret i32 %_lhs571
}


