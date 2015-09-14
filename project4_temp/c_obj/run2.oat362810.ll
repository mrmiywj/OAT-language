declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@i533 = global i32 0, align 4
define void @oat_init (){

__fresh113:
  ret void
}


define i32 @program (i32 %argc552, { i32, [ 0 x i8* ] }* %argv550){

__fresh112:
  %argc_slot553 = alloca i32
  store i32 %argc552, i32* %argc_slot553
  %argv_slot551 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv550, { i32, [ 0 x i8* ] }** %argv_slot551
  %x554 = alloca i32
  store i32 3, i32* %x554
  %y555 = alloca i32
  store i32 3, i32* %y555
  %_lhs557 = load i32* %y555
  %_lhs556 = load i32* %x554
  %ret558 = call i32 @f ( i32 %_lhs556, i32 %_lhs557 )
  %_lhs559 = load i32* @i533
  %bop560 = add i32 %ret558, %_lhs559
  ret i32 %bop560
}


define i32 @f (i32 %x536, i32 %y534){

__fresh109:
  %x_slot537 = alloca i32
  store i32 %x536, i32* %x_slot537
  %y_slot535 = alloca i32
  store i32 %y534, i32* %y_slot535
  %r538 = alloca i32
  store i32 0, i32* %r538
  %_lhs539 = load i32* %x_slot537
  %bop540 = icmp sge i32 %_lhs539, 1
  br i1 %bop540, label %__then108, label %__else107

__fresh110:
  br label %__then108

__then108:
  %_lhs543 = load i32* %y_slot535
  %_lhs541 = load i32* %x_slot537
  %bop542 = sub i32 %_lhs541, 1
  %ret544 = call i32 @f ( i32 %bop542, i32 %_lhs543 )
  %bop545 = add i32 1, %ret544
  store i32 %bop545, i32* %r538
  br label %__merge106

__fresh111:
  br label %__else107

__else107:
  %_lhs546 = load i32* %x_slot537
  %_lhs547 = load i32* %y_slot535
  %bop548 = add i32 %_lhs546, %_lhs547
  store i32 %bop548, i32* %r538
  br label %__merge106

__merge106:
  %_lhs549 = load i32* %r538
  ret i32 %_lhs549
}


