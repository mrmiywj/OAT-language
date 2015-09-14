declare i8* @string_of_array({ i32, [ 0 x i32 ] })
declare { i32, [ 0 x i32 ] } @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] } @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@arr2621 = global { i32, [ 0 x i32 ] } zeroinitializer, align 4		; initialized by arr2621.init
define void @oat_init (){

__fresh431:
  call void @arr2621.init(  )
  ret void
}


define i32 @program (i32 %argc2624, { i32, [ 0 x i8* ] } %argv2622){

__fresh430:
  %argc_slot2625 = alloca i32
  store i32 %argc2624, i32* %argc_slot2625
  %argv_slot2623 = alloca { i32, [ 0 x i8* ] }
  store { i32, [ 0 x i8* ] } %argv2622, { i32, [ 0 x i8* ] }* %argv_slot2623
  %bound_ptr2627 = getelementptr { i32, [ 0 x i32 ] }* @arr2621, i32 0, i32 0
  %bound2628 = load i32* %bound_ptr2627
  call void @oat_array_bounds_check( i32 %bound2628, i32 2 )
  %elt2626 = getelementptr { i32, [ 0 x i32 ] }* @arr2621, i32 0, i32 1, i32 2
  %_lhs2629 = load i32* %elt2626
  ret i32 %_lhs2629
}


define void @arr2621.init (){

__fresh429:
  %array_ptr2617 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 2 )
  %array2618 = bitcast { i32, [ 0 x i32 ] } %array_ptr2617 to { i32, [ 0 x i32 ] } 
  %index_ptr2619 = getelementptr { i32, [ 0 x i32 ] } %array2618, i32 0, i32 1, i32 0
  store i32 1, i32* %index_ptr2619
  %index_ptr2620 = getelementptr { i32, [ 0 x i32 ] } %array2618, i32 0, i32 1, i32 1
  store i32 2, i32* %index_ptr2620
  store { i32, [ 0 x i32 ] } %array2618, { i32, [ 0 x i32 ] }* @arr2621
  ret void
}


