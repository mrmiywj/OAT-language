declare i8* @string_of_array({ i32, [ 0 x i32 ] })
declare { i32, [ 0 x i32 ] } @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] } @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh27:
  ret void
}


define i32 @program (i32 %argc98, { i32, [ 0 x i8* ] } %argv96){

__fresh26:
  %argc_slot99 = alloca i32
  store i32 %argc98, i32* %argc_slot99
  %argv_slot97 = alloca { i32, [ 0 x i8* ] }
  store { i32, [ 0 x i8* ] } %argv96, { i32, [ 0 x i8* ] }* %argv_slot97
  %i100 = alloca i32
  store i32 999, i32* %i100
  %array_ptr101 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 3 )
  %array102 = bitcast { i32, [ 0 x i32 ] } %array_ptr101 to { i32, [ 0 x i32 ] } 
  %unop103 = sub i32 0, 1
  %index_ptr104 = getelementptr { i32, [ 0 x i32 ] } %array102, i32 0, i32 1, i32 0
  store i32 %unop103, i32* %index_ptr104
  %unop105 = sub i32 0, 100
  %index_ptr106 = getelementptr { i32, [ 0 x i32 ] } %array102, i32 0, i32 1, i32 1
  store i32 %unop105, i32* %index_ptr106
  %_lhs107 = load i32* %i100
  %index_ptr108 = getelementptr { i32, [ 0 x i32 ] } %array102, i32 0, i32 1, i32 2
  store i32 %_lhs107, i32* %index_ptr108
  %a109 = alloca { i32, [ 0 x i32 ] }
  store { i32, [ 0 x i32 ] } %array102, { i32, [ 0 x i32 ] }* %a109
  %bound_ptr111 = getelementptr { i32, [ 0 x i32 ] }* %a109, i32 0, i32 0
  %bound112 = load i32* %bound_ptr111
  call void @oat_array_bounds_check( i32 %bound112, i32 2 )
  %elt110 = getelementptr { i32, [ 0 x i32 ] }* %a109, i32 0, i32 1, i32 2
  %_lhs113 = load i32* %elt110
  ret i32 %_lhs113
}


