declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@_oat_string525.str. = private unnamed_addr constant [ 7 x i8 ] c "Hello?\00", align 4
@_oat_string525 = global i8* getelementptr inbounds ([ 7 x i8 ]* @_oat_string525.str., i32 0, i32 0), align 4
define void @oat_init (){

__fresh66:
  ret void
}


define i32 @program (i32 %argc523, { i32, [ 0 x i8* ] }* %argv521){

__fresh65:
  %argc_slot524 = alloca i32
  store i32 %argc523, i32* %argc_slot524
  %argv_slot522 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv521, { i32, [ 0 x i8* ] }** %argv_slot522
  %strval526 = load i8** @_oat_string525
  %ret527 = call i32 @my_length_of_string ( i8* %strval526 )
  ret i32 %ret527
}


define i32 @my_length_of_string (i8* %str515){

__fresh64:
  %str_slot516 = alloca i8*
  store i8* %str515, i8** %str_slot516
  %_lhs517 = load i8** %str_slot516
  %ret518 = call { i32, [ 0 x i32 ] }* @array_of_string ( i8* %_lhs517 )
  %len_ptr519 = getelementptr { i32, [ 0 x i32 ] }* %ret518, i32 0, i32 0
  %len520 = load i32* %len_ptr519
  ret i32 %len520
}


