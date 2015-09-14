declare i8* @string_of_array({ i32, [ 0 x i32 ] })
declare { i32, [ 0 x i32 ] } @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] } @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@garr619 = global { i32, [ 0 x { i32, [ 0 x i32 ] } ] } zeroinitializer, align 4		; initialized by garr619.init
define void @oat_init (){

__fresh143:
  call void @garr619.init(  )
  ret void
}


define i32 @program (i32 %argc625, { i32, [ 0 x i8* ] } %argv623){

__fresh142:
  %argc_slot626 = alloca i32
  store i32 %argc625, i32* %argc_slot626
  %argv_slot624 = alloca { i32, [ 0 x i8* ] }
  store { i32, [ 0 x i8* ] } %argv623, { i32, [ 0 x i8* ] }* %argv_slot624
  %bound_ptr628 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* @garr619, i32 0, i32 0
  %bound629 = load i32* %bound_ptr628
  call void @oat_array_bounds_check( i32 %bound629, i32 1 )
  %elt627 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* @garr619, i32 0, i32 1, i32 1
  %_lhs630 = load { i32, [ 0 x i32 ] }* %elt627
  %ret631 = call { i32, [ 0 x i32 ] } @f ( { i32, [ 0 x i32 ] } %_lhs630 )
  %arr632 = alloca { i32, [ 0 x i32 ] }
  store { i32, [ 0 x i32 ] } %ret631, { i32, [ 0 x i32 ] }* %arr632
  %bound_ptr634 = getelementptr { i32, [ 0 x i32 ] }* %arr632, i32 0, i32 0
  %bound635 = load i32* %bound_ptr634
  call void @oat_array_bounds_check( i32 %bound635, i32 1 )
  %elt633 = getelementptr { i32, [ 0 x i32 ] }* %arr632, i32 0, i32 1, i32 1
  %_lhs636 = load i32* %elt633
  ret i32 %_lhs636
}


define { i32, [ 0 x i32 ] } @f ({ i32, [ 0 x i32 ] } %arr620){

__fresh141:
  %arr_slot621 = alloca { i32, [ 0 x i32 ] }
  store { i32, [ 0 x i32 ] } %arr620, { i32, [ 0 x i32 ] }* %arr_slot621
  %_lhs622 = load { i32, [ 0 x i32 ] }* %arr_slot621
  ret { i32, [ 0 x i32 ] } %_lhs622
}


define void @garr619.init (){

__fresh140:
  %array_ptr605 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 2 )
  %array606 = bitcast { i32, [ 0 x i32 ] } %array_ptr605 to { i32, [ 0 x { i32, [ 0 x i32 ] } ] } 
  %array_ptr607 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 3 )
  %array608 = bitcast { i32, [ 0 x i32 ] } %array_ptr607 to { i32, [ 0 x i32 ] } 
  %index_ptr609 = getelementptr { i32, [ 0 x i32 ] } %array608, i32 0, i32 1, i32 0
  store i32 1, i32* %index_ptr609
  %index_ptr610 = getelementptr { i32, [ 0 x i32 ] } %array608, i32 0, i32 1, i32 1
  store i32 2, i32* %index_ptr610
  %index_ptr611 = getelementptr { i32, [ 0 x i32 ] } %array608, i32 0, i32 1, i32 2
  store i32 3, i32* %index_ptr611
  %index_ptr612 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %array606, i32 0, i32 1, i32 0
  store { i32, [ 0 x i32 ] } %array608, { i32, [ 0 x i32 ] }* %index_ptr612
  %array_ptr613 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 3 )
  %array614 = bitcast { i32, [ 0 x i32 ] } %array_ptr613 to { i32, [ 0 x i32 ] } 
  %index_ptr615 = getelementptr { i32, [ 0 x i32 ] } %array614, i32 0, i32 1, i32 0
  store i32 4, i32* %index_ptr615
  %index_ptr616 = getelementptr { i32, [ 0 x i32 ] } %array614, i32 0, i32 1, i32 1
  store i32 5, i32* %index_ptr616
  %index_ptr617 = getelementptr { i32, [ 0 x i32 ] } %array614, i32 0, i32 1, i32 2
  store i32 6, i32* %index_ptr617
  %index_ptr618 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %array606, i32 0, i32 1, i32 1
  store { i32, [ 0 x i32 ] } %array614, { i32, [ 0 x i32 ] }* %index_ptr618
  store { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %array606, { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* @garr619
  ret void
}


