declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@arr669 = global { i32, [ 0 x i32 ] }* zeroinitializer, align 4		; initialized by arr669.init
define void @oat_init (){

__fresh171:
  call void @arr669.init(  )
  ret void
}


define i32 @program (i32 %argc672, { i32, [ 0 x i8* ] }* %argv670){

__fresh170:
  %argc_slot673 = alloca i32
  store i32 %argc672, i32* %argc_slot673
  %argv_slot671 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv670, { i32, [ 0 x i8* ] }** %argv_slot671
  %bound_ptr675 = getelementptr { i32, [ 0 x i32 ] }** @arr669, i32 0, i32 0
  %bound676 = load i32* %bound_ptr675
  call void @oat_array_bounds_check( i32 %bound676, i32 1 )
  %elt674 = getelementptr { i32, [ 0 x i32 ] }** @arr669, i32 0, i32 1, i32 1
  %_lhs677 = load i32* %elt674
  ret i32 %_lhs677
}


define void @arr669.init (){

__fresh169:
  %array_ptr665 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 2 )
  %array666 = bitcast { i32, [ 0 x i32 ] }* %array_ptr665 to { i32, [ 0 x i32 ] }* 
  %index_ptr667 = getelementptr { i32, [ 0 x i32 ] }* %array666, i32 0, i32 1, i32 0
  store i32 1, i32* %index_ptr667
  %index_ptr668 = getelementptr { i32, [ 0 x i32 ] }* %array666, i32 0, i32 1, i32 1
  store i32 2, i32* %index_ptr668
  store { i32, [ 0 x i32 ] }* %array666, { i32, [ 0 x i32 ] }** @arr669
  ret void
}


