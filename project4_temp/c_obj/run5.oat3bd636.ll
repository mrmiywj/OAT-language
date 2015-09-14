declare i8* @string_of_array({ i32, [ 0 x i32 ] })
declare { i32, [ 0 x i32 ] } @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] } @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@arr556 = global { i32, [ 0 x { i32, [ 0 x i32 ] } ] } zeroinitializer, align 4		; initialized by arr556.init
define void @oat_init (){

__fresh135:
  call void @arr556.init(  )
  ret void
}


define i32 @program (i32 %argc559, { i32, [ 0 x i8* ] } %argv557){

__fresh134:
  %argc_slot560 = alloca i32
  store i32 %argc559, i32* %argc_slot560
  %argv_slot558 = alloca { i32, [ 0 x i8* ] }
  store { i32, [ 0 x i8* ] } %argv557, { i32, [ 0 x i8* ] }* %argv_slot558
  %bound_ptr562 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* @arr556, i32 0, i32 0
  %bound563 = load i32* %bound_ptr562
  call void @oat_array_bounds_check( i32 %bound563, i32 1 )
  %elt561 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* @arr556, i32 0, i32 1, i32 1
  %bound_ptr565 = getelementptr { i32, [ 0 x i32 ] }* %elt561, i32 0, i32 0
  %bound566 = load i32* %bound_ptr565
  call void @oat_array_bounds_check( i32 %bound566, i32 1 )
  %elt564 = getelementptr { i32, [ 0 x i32 ] }* %elt561, i32 0, i32 1, i32 1
  %_lhs567 = load i32* %elt564
  ret i32 %_lhs567
}


define void @arr556.init (){

__fresh133:
  %array_ptr544 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 2 )
  %array545 = bitcast { i32, [ 0 x i32 ] } %array_ptr544 to { i32, [ 0 x { i32, [ 0 x i32 ] } ] } 
  %array_ptr546 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 2 )
  %array547 = bitcast { i32, [ 0 x i32 ] } %array_ptr546 to { i32, [ 0 x i32 ] } 
  %index_ptr548 = getelementptr { i32, [ 0 x i32 ] } %array547, i32 0, i32 1, i32 0
  store i32 1, i32* %index_ptr548
  %index_ptr549 = getelementptr { i32, [ 0 x i32 ] } %array547, i32 0, i32 1, i32 1
  store i32 2, i32* %index_ptr549
  %index_ptr550 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %array545, i32 0, i32 1, i32 0
  store { i32, [ 0 x i32 ] } %array547, { i32, [ 0 x i32 ] }* %index_ptr550
  %array_ptr551 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 2 )
  %array552 = bitcast { i32, [ 0 x i32 ] } %array_ptr551 to { i32, [ 0 x i32 ] } 
  %index_ptr553 = getelementptr { i32, [ 0 x i32 ] } %array552, i32 0, i32 1, i32 0
  store i32 3, i32* %index_ptr553
  %index_ptr554 = getelementptr { i32, [ 0 x i32 ] } %array552, i32 0, i32 1, i32 1
  store i32 4, i32* %index_ptr554
  %index_ptr555 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %array545, i32 0, i32 1, i32 1
  store { i32, [ 0 x i32 ] } %array552, { i32, [ 0 x i32 ] }* %index_ptr555
  store { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %array545, { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* @arr556
  ret void
}


