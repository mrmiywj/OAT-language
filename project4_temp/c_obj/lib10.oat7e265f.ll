declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@_oat_string2426.str. = private unnamed_addr constant [ 7 x i8 ] c "Hello?\00", align 4
@_oat_string2426 = global i8* getelementptr inbounds ([ 7 x i8 ]* @_oat_string2426.str., i32 0, i32 0), align 4
define void @oat_init (){

__fresh427:
  ret void
}


define i32 @program (i32 %argc2424, { i32, [ 0 x i8* ] }* %argv2422){

__fresh426:
  %argc_slot2425 = alloca i32
  store i32 %argc2424, i32* %argc_slot2425
  %argv_slot2423 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv2422, { i32, [ 0 x i8* ] }** %argv_slot2423
  %strval2427 = load i8** @_oat_string2426
  %ret2428 = call i32 @my_length_of_string ( i8* %strval2427 )
  ret i32 %ret2428
}


define i32 @my_length_of_string (i8* %str2416){

__fresh425:
  %str_slot2417 = alloca i8*
  store i8* %str2416, i8** %str_slot2417
  %_lhs2418 = load i8** %str_slot2417
  %ret2419 = call { i32, [ 0 x i32 ] }* @array_of_string ( i8* %_lhs2418 )
  %len_ptr2420 = getelementptr { i32, [ 0 x i32 ] }* %ret2419, i32 0, i32 0
  %len2421 = load i32* %len_ptr2420
  ret i32 %len2421
}


