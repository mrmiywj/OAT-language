declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@arr690 = global { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* zeroinitializer, align 4		; initialized by arr690.init
define void @oat_init (){

__fresh174:
  call void @arr690.init(  )
  ret void
}


define i32 @program (i32 %argc693, { i32, [ 0 x i8* ] }* %argv691){

__fresh173:
  %argc_slot694 = alloca i32
  store i32 %argc693, i32* %argc_slot694
  %argv_slot692 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv691, { i32, [ 0 x i8* ] }** %argv_slot692
  %bound_ptr696 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** @arr690, i32 0, i32 0
  %bound697 = load i32* %bound_ptr696
  call void @oat_array_bounds_check( i32 %bound697, i32 1 )
  %elt695 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** @arr690, i32 0, i32 1, i32 1
  %bound_ptr699 = getelementptr { i32, [ 0 x i32 ] }** %elt695, i32 0, i32 0
  %bound700 = load i32* %bound_ptr699
  call void @oat_array_bounds_check( i32 %bound700, i32 1 )
  %elt698 = getelementptr { i32, [ 0 x i32 ] }** %elt695, i32 0, i32 1, i32 1
  %_lhs701 = load i32* %elt698
  ret i32 %_lhs701
}


define void @arr690.init (){

__fresh172:
  %array_ptr678 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 2 )
  %array679 = bitcast { i32, [ 0 x i32 ] }* %array_ptr678 to { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* 
  %array_ptr680 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 2 )
  %array681 = bitcast { i32, [ 0 x i32 ] }* %array_ptr680 to { i32, [ 0 x i32 ] }* 
  %index_ptr682 = getelementptr { i32, [ 0 x i32 ] }* %array681, i32 0, i32 1, i32 0
  store i32 1, i32* %index_ptr682
  %index_ptr683 = getelementptr { i32, [ 0 x i32 ] }* %array681, i32 0, i32 1, i32 1
  store i32 2, i32* %index_ptr683
  %index_ptr684 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array679, i32 0, i32 1, i32 0
  store { i32, [ 0 x i32 ] }* %array681, { i32, [ 0 x i32 ] }** %index_ptr684
  %array_ptr685 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 2 )
  %array686 = bitcast { i32, [ 0 x i32 ] }* %array_ptr685 to { i32, [ 0 x i32 ] }* 
  %index_ptr687 = getelementptr { i32, [ 0 x i32 ] }* %array686, i32 0, i32 1, i32 0
  store i32 3, i32* %index_ptr687
  %index_ptr688 = getelementptr { i32, [ 0 x i32 ] }* %array686, i32 0, i32 1, i32 1
  store i32 4, i32* %index_ptr688
  %index_ptr689 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array679, i32 0, i32 1, i32 1
  store { i32, [ 0 x i32 ] }* %array686, { i32, [ 0 x i32 ] }** %index_ptr689
  store { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array679, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** @arr690
  ret void
}


