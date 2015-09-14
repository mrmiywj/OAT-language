declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh176:
  ret void
}


define i32 @program (i32 %argc704, { i32, [ 0 x i8* ] }* %argv702){

__fresh175:
  %argc_slot705 = alloca i32
  store i32 %argc704, i32* %argc_slot705
  %argv_slot703 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv702, { i32, [ 0 x i8* ] }** %argv_slot703
  %array_ptr706 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 2 )
  %array707 = bitcast { i32, [ 0 x i32 ] }* %array_ptr706 to { i32, [ 0 x i32 ] }* 
  %index_ptr708 = getelementptr { i32, [ 0 x i32 ] }* %array707, i32 0, i32 1, i32 0
  store i32 1, i32* %index_ptr708
  %index_ptr709 = getelementptr { i32, [ 0 x i32 ] }* %array707, i32 0, i32 1, i32 1
  store i32 2, i32* %index_ptr709
  %arr710 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array707, { i32, [ 0 x i32 ] }** %arr710
  %bound_ptr712 = getelementptr { i32, [ 0 x i32 ] }** %arr710, i32 0, i32 0
  %bound713 = load i32* %bound_ptr712
  call void @oat_array_bounds_check( i32 %bound713, i32 1 )
  %elt711 = getelementptr { i32, [ 0 x i32 ] }** %arr710, i32 0, i32 1, i32 1
  %_lhs714 = load i32* %elt711
  ret i32 %_lhs714
}


