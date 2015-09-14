declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@i135 = global { i32, [ 0 x i32 ] }* zeroinitializer, align 4		; initialized by i135.init
define void @oat_init (){

__fresh33:
  call void @i135.init(  )
  ret void
}


define i32 @program (i32 %argc138, { i32, [ 0 x i8* ] }* %argv136){

__fresh32:
  %argc_slot139 = alloca i32
  store i32 %argc138, i32* %argc_slot139
  %argv_slot137 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv136, { i32, [ 0 x i8* ] }** %argv_slot137
  %bound_ptr141 = getelementptr { i32, [ 0 x i32 ] }** @i135, i32 0, i32 0
  %bound142 = load i32* %bound_ptr141
  call void @oat_array_bounds_check( i32 %bound142, i32 0 )
  %elt140 = getelementptr { i32, [ 0 x i32 ] }** @i135, i32 0, i32 1, i32 0
  %_lhs143 = load i32* %elt140
  ret i32 %_lhs143
}


define void @i135.init (){

__fresh31:
  %array_ptr131 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 2 )
  %array132 = bitcast { i32, [ 0 x i32 ] }* %array_ptr131 to { i32, [ 0 x i32 ] }* 
  %index_ptr133 = getelementptr { i32, [ 0 x i32 ] }* %array132, i32 0, i32 1, i32 0
  store i32 99, i32* %index_ptr133
  %index_ptr134 = getelementptr { i32, [ 0 x i32 ] }* %array132, i32 0, i32 1, i32 1
  store i32 0, i32* %index_ptr134
  store { i32, [ 0 x i32 ] }* %array132, { i32, [ 0 x i32 ] }** @i135
  ret void
}


