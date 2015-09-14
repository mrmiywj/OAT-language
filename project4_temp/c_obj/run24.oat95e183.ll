declare i8* @string_of_array({ i32, [ 0 x i32 ] })
declare { i32, [ 0 x i32 ] } @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] } @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@a154 = global { i32, [ 0 x i32 ] } zeroinitializer, align 4		; initialized by a154.init
define void @oat_init (){

__fresh36:
  call void @a154.init(  )
  ret void
}


define i32 @program (i32 %argc157, { i32, [ 0 x i8* ] } %argv155){

__fresh35:
  %argc_slot158 = alloca i32
  store i32 %argc157, i32* %argc_slot158
  %argv_slot156 = alloca { i32, [ 0 x i8* ] }
  store { i32, [ 0 x i8* ] } %argv155, { i32, [ 0 x i8* ] }* %argv_slot156
  %bound_ptr160 = getelementptr { i32, [ 0 x i32 ] }* @a154, i32 0, i32 0
  %bound161 = load i32* %bound_ptr160
  call void @oat_array_bounds_check( i32 %bound161, i32 0 )
  %elt159 = getelementptr { i32, [ 0 x i32 ] }* @a154, i32 0, i32 1, i32 0
  %_lhs162 = load i32* %elt159
  ret i32 %_lhs162
}


define void @a154.init (){

__fresh34:
  %array_ptr144 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 3 )
  %array145 = bitcast { i32, [ 0 x i32 ] } %array_ptr144 to { i32, [ 0 x i32 ] } 
  %bop146 = mul i32 12, 7
  %bop147 = add i32 %bop146, 13
  %bop148 = ashr i32 %bop147, 2
  %index_ptr149 = getelementptr { i32, [ 0 x i32 ] } %array145, i32 0, i32 1, i32 0
  store i32 %bop148, i32* %index_ptr149
  %bop150 = sub i32 9, 4
  %index_ptr151 = getelementptr { i32, [ 0 x i32 ] } %array145, i32 0, i32 1, i32 1
  store i32 %bop150, i32* %index_ptr151
  %bop152 = add i32 5, 5
  %index_ptr153 = getelementptr { i32, [ 0 x i32 ] } %array145, i32 0, i32 1, i32 2
  store i32 %bop152, i32* %index_ptr153
  store { i32, [ 0 x i32 ] } %array145, { i32, [ 0 x i32 ] }* @a154
  ret void
}


