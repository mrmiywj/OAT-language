declare i8* @string_of_array({ i32, [ 0 x i32 ] })
declare { i32, [ 0 x i32 ] } @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] } @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@x412 = global i32 10, align 4
define void @oat_init (){

__fresh106:
  ret void
}


define i32 @program (i32 %argc415, { i32, [ 0 x i8* ] } %argv413){

__fresh105:
  %argc_slot416 = alloca i32
  store i32 %argc415, i32* %argc_slot416
  %argv_slot414 = alloca { i32, [ 0 x i8* ] }
  store { i32, [ 0 x i8* ] } %argv413, { i32, [ 0 x i8* ] }* %argv_slot414
  %y417 = alloca i32
  store i32 0, i32* %y417
  %_lhs418 = load i32* @x412
  %bop419 = add i32 %_lhs418, 1
  %x420 = alloca i32
  store i32 %bop419, i32* %x420
  %_lhs421 = load i32* %x420
  store i32 %_lhs421, i32* %y417
  %_lhs422 = load i32* %y417
  ret i32 %_lhs422
}


