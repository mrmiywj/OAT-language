declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh30:
  ret void
}


define i32 @program (i32 %argc116, { i32, [ 0 x i8* ] }* %argv114){

__fresh29:
  %argc_slot117 = alloca i32
  store i32 %argc116, i32* %argc_slot117
  %argv_slot115 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv114, { i32, [ 0 x i8* ] }** %argv_slot115
  %array_ptr118 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 3 )
  %array119 = bitcast { i32, [ 0 x i32 ] }* %array_ptr118 to { i32, [ 0 x i32 ] }* 
  %unop120 = sub i32 0, 1
  %index_ptr121 = getelementptr { i32, [ 0 x i32 ] }* %array119, i32 0, i32 1, i32 0
  store i32 %unop120, i32* %index_ptr121
  %unop122 = sub i32 0, 100
  %index_ptr123 = getelementptr { i32, [ 0 x i32 ] }* %array119, i32 0, i32 1, i32 1
  store i32 %unop122, i32* %index_ptr123
  %ret124 = call i32 @f (  )
  %index_ptr125 = getelementptr { i32, [ 0 x i32 ] }* %array119, i32 0, i32 1, i32 2
  store i32 %ret124, i32* %index_ptr125
  %a126 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array119, { i32, [ 0 x i32 ] }** %a126
  %bound_ptr128 = getelementptr { i32, [ 0 x i32 ] }** %a126, i32 0, i32 0
  %bound129 = load i32* %bound_ptr128
  call void @oat_array_bounds_check( i32 %bound129, i32 2 )
  %elt127 = getelementptr { i32, [ 0 x i32 ] }** %a126, i32 0, i32 1, i32 2
  %_lhs130 = load i32* %elt127
  ret i32 %_lhs130
}


define i32 @f (){

__fresh28:
  ret i32 19
}


