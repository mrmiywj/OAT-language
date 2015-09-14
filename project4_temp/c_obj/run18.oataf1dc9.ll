declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh25:
  ret void
}


define i32 @program (i32 %argc81, { i32, [ 0 x i8* ] }* %argv79){

__fresh24:
  %argc_slot82 = alloca i32
  store i32 %argc81, i32* %argc_slot82
  %argv_slot80 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv79, { i32, [ 0 x i8* ] }** %argv_slot80
  %array_ptr83 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 3 )
  %array84 = bitcast { i32, [ 0 x i32 ] }* %array_ptr83 to { i32, [ 0 x i32 ] }* 
  %unop85 = sub i32 0, 1
  %index_ptr86 = getelementptr { i32, [ 0 x i32 ] }* %array84, i32 0, i32 1, i32 0
  store i32 %unop85, i32* %index_ptr86
  %unop87 = sub i32 0, 100
  %index_ptr88 = getelementptr { i32, [ 0 x i32 ] }* %array84, i32 0, i32 1, i32 1
  store i32 %unop87, i32* %index_ptr88
  %unop89 = sub i32 0, 999
  %index_ptr90 = getelementptr { i32, [ 0 x i32 ] }* %array84, i32 0, i32 1, i32 2
  store i32 %unop89, i32* %index_ptr90
  %a91 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array84, { i32, [ 0 x i32 ] }** %a91
  %bound_ptr93 = getelementptr { i32, [ 0 x i32 ] }** %a91, i32 0, i32 0
  %bound94 = load i32* %bound_ptr93
  call void @oat_array_bounds_check( i32 %bound94, i32 2 )
  %elt92 = getelementptr { i32, [ 0 x i32 ] }** %a91, i32 0, i32 1, i32 2
  %_lhs95 = load i32* %elt92
  ret i32 %_lhs95
}


