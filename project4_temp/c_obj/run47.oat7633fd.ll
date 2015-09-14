declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@a2114 = global i32 1, align 4
define void @oat_init (){

__fresh371:
  ret void
}


define i32 @program (i32 %argc2120, { i32, [ 0 x i8* ] }* %argv2118){

__fresh368:
  %argc_slot2121 = alloca i32
  store i32 %argc2120, i32* %argc_slot2121
  %argv_slot2119 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv2118, { i32, [ 0 x i8* ] }** %argv_slot2119
  %ret2122 = call i32 @f (  )
  %array_ptr2123 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 %ret2122 )
  %array2124 = bitcast { i32, [ 0 x i32 ] }* %array_ptr2123 to { i32, [ 0 x i32 ] }* 
  %_tmp21242126 = alloca i32
  store i32 %ret2122, i32* %_tmp21242126
  %_tmp21262128 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array2124, { i32, [ 0 x i32 ] }** %_tmp21262128
  %i2129 = alloca i32
  store i32 0, i32* %i2129
  br label %__cond367

__cond367:
  %_lhs2130 = load i32* %i2129
  %_lhs2131 = load i32* %_tmp21242126
  %bop2132 = icmp slt i32 %_lhs2130, %_lhs2131
  br i1 %bop2132, label %__body366, label %__post365

__fresh369:
  br label %__body366

__body366:
  %_lhs2133 = load i32* %i2129
  %bound_ptr2135 = getelementptr { i32, [ 0 x i32 ] }** %_tmp21262128, i32 0, i32 0
  %bound2136 = load i32* %bound_ptr2135
  call void @oat_array_bounds_check( i32 %bound2136, i32 %_lhs2133 )
  %elt2134 = getelementptr { i32, [ 0 x i32 ] }** %_tmp21262128, i32 0, i32 1, i32 %_lhs2133
  %_lhs2137 = load i32* %i2129
  store i32 %_lhs2137, i32* %elt2134
  %_lhs2138 = load i32* %i2129
  %bop2139 = add i32 %_lhs2138, 1
  store i32 %bop2139, i32* %i2129
  br label %__cond367

__fresh370:
  br label %__post365

__post365:
  %b2140 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array2124, { i32, [ 0 x i32 ] }** %b2140
  %_lhs2141 = load i32* @a2114
  %bound_ptr2143 = getelementptr { i32, [ 0 x i32 ] }** %b2140, i32 0, i32 0
  %bound2144 = load i32* %bound_ptr2143
  call void @oat_array_bounds_check( i32 %bound2144, i32 0 )
  %elt2142 = getelementptr { i32, [ 0 x i32 ] }** %b2140, i32 0, i32 1, i32 0
  %_lhs2145 = load i32* %elt2142
  %bop2146 = add i32 %_lhs2141, %_lhs2145
  %bound_ptr2148 = getelementptr { i32, [ 0 x i32 ] }** %b2140, i32 0, i32 0
  %bound2149 = load i32* %bound_ptr2148
  call void @oat_array_bounds_check( i32 %bound2149, i32 1 )
  %elt2147 = getelementptr { i32, [ 0 x i32 ] }** %b2140, i32 0, i32 1, i32 1
  %_lhs2150 = load i32* %elt2147
  %bop2151 = add i32 %bop2146, %_lhs2150
  ret i32 %bop2151
}


define i32 @f (){

__fresh364:
  %_lhs2115 = load i32* @a2114
  %bop2116 = add i32 %_lhs2115, 1
  store i32 %bop2116, i32* @a2114
  %_lhs2117 = load i32* @a2114
  ret i32 %_lhs2117
}


