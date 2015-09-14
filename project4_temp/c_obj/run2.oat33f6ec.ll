declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@i637 = global i32 0, align 4
define void @oat_init (){

__fresh168:
  ret void
}


define i32 @program (i32 %argc656, { i32, [ 0 x i8* ] }* %argv654){

__fresh167:
  %argc_slot657 = alloca i32
  store i32 %argc656, i32* %argc_slot657
  %argv_slot655 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv654, { i32, [ 0 x i8* ] }** %argv_slot655
  %x658 = alloca i32
  store i32 3, i32* %x658
  %y659 = alloca i32
  store i32 3, i32* %y659
  %_lhs661 = load i32* %y659
  %_lhs660 = load i32* %x658
  %ret662 = call i32 @f ( i32 %_lhs660, i32 %_lhs661 )
  %_lhs663 = load i32* @i637
  %bop664 = add i32 %ret662, %_lhs663
  ret i32 %bop664
}


define i32 @f (i32 %x640, i32 %y638){

__fresh164:
  %x_slot641 = alloca i32
  store i32 %x640, i32* %x_slot641
  %y_slot639 = alloca i32
  store i32 %y638, i32* %y_slot639
  %r642 = alloca i32
  store i32 0, i32* %r642
  %_lhs643 = load i32* %x_slot641
  %bop644 = icmp sge i32 %_lhs643, 1
  br i1 %bop644, label %__then163, label %__else162

__fresh165:
  br label %__then163

__then163:
  %_lhs647 = load i32* %y_slot639
  %_lhs645 = load i32* %x_slot641
  %bop646 = sub i32 %_lhs645, 1
  %ret648 = call i32 @f ( i32 %bop646, i32 %_lhs647 )
  %bop649 = add i32 1, %ret648
  store i32 %bop649, i32* %r642
  br label %__merge161

__fresh166:
  br label %__else162

__else162:
  %_lhs650 = load i32* %x_slot641
  %_lhs651 = load i32* %y_slot639
  %bop652 = add i32 %_lhs650, %_lhs651
  store i32 %bop652, i32* %r642
  br label %__merge161

__merge161:
  %_lhs653 = load i32* %r642
  ret i32 %_lhs653
}


