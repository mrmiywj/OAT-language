declare i8* @string_of_array({ i32, [ 0 x i32 ] })
declare { i32, [ 0 x i32 ] } @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] } @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@arr535 = global { i32, [ 0 x i32 ] } zeroinitializer, align 4		; initialized by arr535.init
define void @oat_init (){

__fresh132:
  call void @arr535.init(  )
  ret void
}


define i32 @program (i32 %argc538, { i32, [ 0 x i8* ] } %argv536){

__fresh131:
  %argc_slot539 = alloca i32
  store i32 %argc538, i32* %argc_slot539
  %argv_slot537 = alloca { i32, [ 0 x i8* ] }
  store { i32, [ 0 x i8* ] } %argv536, { i32, [ 0 x i8* ] }* %argv_slot537
  %bound_ptr541 = getelementptr { i32, [ 0 x i32 ] }* @arr535, i32 0, i32 0
  %bound542 = load i32* %bound_ptr541
  call void @oat_array_bounds_check( i32 %bound542, i32 1 )
  %elt540 = getelementptr { i32, [ 0 x i32 ] }* @arr535, i32 0, i32 1, i32 1
  %_lhs543 = load i32* %elt540
  ret i32 %_lhs543
}


define void @arr535.init (){

__fresh130:
  %array_ptr531 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 2 )
  %array532 = bitcast { i32, [ 0 x i32 ] } %array_ptr531 to { i32, [ 0 x i32 ] } 
  %index_ptr533 = getelementptr { i32, [ 0 x i32 ] } %array532, i32 0, i32 1, i32 0
  store i32 1, i32* %index_ptr533
  %index_ptr534 = getelementptr { i32, [ 0 x i32 ] } %array532, i32 0, i32 1, i32 1
  store i32 2, i32* %index_ptr534
  store { i32, [ 0 x i32 ] } %array532, { i32, [ 0 x i32 ] }* @arr535
  ret void
}


