declare i8** @string_of_array({ i32, [ 0 x i32 ] }**)
declare { i32, [ 0 x i32 ] }** @array_of_string(i8**)
declare void @print_string(i8**)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32** @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }** @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@_oat_string351.str. = private unnamed_addr constant [ 4 x i8 ] c "abc\00", align 4
@_oat_string351 = global i8* getelementptr inbounds ([ 4 x i8 ]* @_oat_string351.str., i32 0, i32 0), align 4
define void @oat_init (){

__fresh73:
  ret void
}


define i32 @program (i32 %argc349, { i32, [ 0 x i8** ] }** %argv347){

__fresh72:
  %argc_slot350 = alloca i32
  store i32 %argc349, i32** %argc_slot350
  %argv_slot348 = alloca { i32, [ 0 x i8** ] }**
  store { i32, [ 0 x i8** ] }** %argv347, { i32, [ 0 x i8** ] }**** %argv_slot348
  %strval352 = load i8**** @_oat_string351
  call void @print_string( i8** %strval352 )
  ret i32 0
}


