declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@a2152 = global i32 1, align 4
define void @oat_init (){

__fresh379:
  ret void
}


define i32 @program (i32 %argc2158, { i32, [ 0 x i8* ] }* %argv2156){

__fresh376:
  %argc_slot2159 = alloca i32
  store i32 %argc2158, i32* %argc_slot2159
  %argv_slot2157 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv2156, { i32, [ 0 x i8* ] }** %argv_slot2157
  %ret2160 = call i32 @f (  )
  %array_ptr2161 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 %ret2160 )
  %array2162 = bitcast { i32, [ 0 x i32 ] }* %array_ptr2161 to { i32, [ 0 x i32 ] }* 
  %_tmp21622164 = alloca i32
  store i32 %ret2160, i32* %_tmp21622164
  %_tmp21642166 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array2162, { i32, [ 0 x i32 ] }** %_tmp21642166
  %i2167 = alloca i32
  store i32 0, i32* %i2167
  br label %__cond375

__cond375:
  %_lhs2168 = load i32* %i2167
  %_lhs2169 = load i32* %_tmp21622164
  %bop2170 = icmp slt i32 %_lhs2168, %_lhs2169
  br i1 %bop2170, label %__body374, label %__post373

__fresh377:
  br label %__body374

__body374:
  %_lhs2171 = load i32* %i2167
  %bound_ptr2173 = getelementptr { i32, [ 0 x i32 ] }** %_tmp21642166, i32 0, i32 0
  %bound2174 = load i32* %bound_ptr2173
  call void @oat_array_bounds_check( i32 %bound2174, i32 %_lhs2171 )
  %elt2172 = getelementptr { i32, [ 0 x i32 ] }** %_tmp21642166, i32 0, i32 1, i32 %_lhs2171
  %ret2175 = call i32 @f (  )
  store i32 %ret2175, i32* %elt2172
  %_lhs2176 = load i32* %i2167
  %bop2177 = add i32 %_lhs2176, 1
  store i32 %bop2177, i32* %i2167
  br label %__cond375

__fresh378:
  br label %__post373

__post373:
  %b2178 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array2162, { i32, [ 0 x i32 ] }** %b2178
  %_lhs2179 = load i32* @a2152
  %bound_ptr2181 = getelementptr { i32, [ 0 x i32 ] }** %b2178, i32 0, i32 0
  %bound2182 = load i32* %bound_ptr2181
  call void @oat_array_bounds_check( i32 %bound2182, i32 0 )
  %elt2180 = getelementptr { i32, [ 0 x i32 ] }** %b2178, i32 0, i32 1, i32 0
  %_lhs2183 = load i32* %elt2180
  %bop2184 = add i32 %_lhs2179, %_lhs2183
  %bound_ptr2186 = getelementptr { i32, [ 0 x i32 ] }** %b2178, i32 0, i32 0
  %bound2187 = load i32* %bound_ptr2186
  call void @oat_array_bounds_check( i32 %bound2187, i32 1 )
  %elt2185 = getelementptr { i32, [ 0 x i32 ] }** %b2178, i32 0, i32 1, i32 1
  %_lhs2188 = load i32* %elt2185
  %bop2189 = add i32 %bop2184, %_lhs2188
  ret i32 %bop2189
}


define i32 @f (){

__fresh372:
  %_lhs2153 = load i32* @a2152
  %bop2154 = add i32 %_lhs2153, 1
  store i32 %bop2154, i32* @a2152
  %_lhs2155 = load i32* @a2152
  ret i32 %_lhs2155
}


