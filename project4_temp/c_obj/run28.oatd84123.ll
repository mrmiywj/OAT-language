declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh5:
  ret void
}


define i32 @program (i32 %argc13, { i32, [ 0 x i8* ] }* %argv11){

__fresh4:
  %argc_slot14 = alloca i32
  store i32 %argc13, i32* %argc_slot14
  %argv_slot12 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv11, { i32, [ 0 x i8* ] }** %argv_slot12
  %i15 = alloca i32
  store i32 9, i32* %i15
  %_lhs16 = load i32* %i15
  %_lhs17 = load i32* %i15
  %bop18 = add i32 %_lhs16, %_lhs17
  %j19 = alloca i32
  store i32 %bop18, i32* %j19
  %_lhs20 = load i32* %i15
  %_lhs21 = load i32* %i15
  %_lhs22 = load i32* %i15
  %bop23 = mul i32 %_lhs21, %_lhs22
  %bop24 = add i32 %_lhs20, %bop23
  %_lhs25 = load i32* %j19
  %bop26 = sub i32 %bop24, %_lhs25
  %bop27 = ashr i32 %bop26, 2
  %bop28 = shl i32 %bop27, 2
  %bop29 = lshr i32 %bop28, 2
  ret i32 %bop29
}


