declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh55:
  ret void
}


define i32 @program (i32 %argc180, { i32, [ 0 x i8* ] }* %argv178){

__fresh50:
  %argc_slot181 = alloca i32
  store i32 %argc180, i32* %argc_slot181
  %argv_slot179 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv178, { i32, [ 0 x i8* ] }** %argv_slot179
  %array_ptr182 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 3 )
  %array183 = bitcast { i32, [ 0 x i32 ] }* %array_ptr182 to { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* 
  %array_ptr184 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 4 )
  %array185 = bitcast { i32, [ 0 x i32 ] }* %array_ptr184 to { i32, [ 0 x i32 ] }* 
  %index_ptr186 = getelementptr { i32, [ 0 x i32 ] }* %array185, i32 0, i32 1, i32 0
  store i32 0, i32* %index_ptr186
  %index_ptr187 = getelementptr { i32, [ 0 x i32 ] }* %array185, i32 0, i32 1, i32 1
  store i32 1, i32* %index_ptr187
  %index_ptr188 = getelementptr { i32, [ 0 x i32 ] }* %array185, i32 0, i32 1, i32 2
  store i32 2, i32* %index_ptr188
  %index_ptr189 = getelementptr { i32, [ 0 x i32 ] }* %array185, i32 0, i32 1, i32 3
  store i32 3, i32* %index_ptr189
  %index_ptr190 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array183, i32 0, i32 1, i32 0
  store { i32, [ 0 x i32 ] }* %array185, { i32, [ 0 x i32 ] }** %index_ptr190
  %array_ptr191 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 4 )
  %array192 = bitcast { i32, [ 0 x i32 ] }* %array_ptr191 to { i32, [ 0 x i32 ] }* 
  %index_ptr193 = getelementptr { i32, [ 0 x i32 ] }* %array192, i32 0, i32 1, i32 0
  store i32 4, i32* %index_ptr193
  %index_ptr194 = getelementptr { i32, [ 0 x i32 ] }* %array192, i32 0, i32 1, i32 1
  store i32 5, i32* %index_ptr194
  %index_ptr195 = getelementptr { i32, [ 0 x i32 ] }* %array192, i32 0, i32 1, i32 2
  store i32 6, i32* %index_ptr195
  %index_ptr196 = getelementptr { i32, [ 0 x i32 ] }* %array192, i32 0, i32 1, i32 3
  store i32 7, i32* %index_ptr196
  %index_ptr197 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array183, i32 0, i32 1, i32 1
  store { i32, [ 0 x i32 ] }* %array192, { i32, [ 0 x i32 ] }** %index_ptr197
  %array_ptr198 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 4 )
  %array199 = bitcast { i32, [ 0 x i32 ] }* %array_ptr198 to { i32, [ 0 x i32 ] }* 
  %index_ptr200 = getelementptr { i32, [ 0 x i32 ] }* %array199, i32 0, i32 1, i32 0
  store i32 8, i32* %index_ptr200
  %index_ptr201 = getelementptr { i32, [ 0 x i32 ] }* %array199, i32 0, i32 1, i32 1
  store i32 9, i32* %index_ptr201
  %index_ptr202 = getelementptr { i32, [ 0 x i32 ] }* %array199, i32 0, i32 1, i32 2
  store i32 10, i32* %index_ptr202
  %index_ptr203 = getelementptr { i32, [ 0 x i32 ] }* %array199, i32 0, i32 1, i32 3
  store i32 11, i32* %index_ptr203
  %index_ptr204 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array183, i32 0, i32 1, i32 2
  store { i32, [ 0 x i32 ] }* %array199, { i32, [ 0 x i32 ] }** %index_ptr204
  %a205 = alloca { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }*
  store { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array183, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a205
  %s206 = alloca i32
  store i32 0, i32* %s206
  %i207 = alloca i32
  store i32 0, i32* %i207
  br label %__cond46

__cond46:
  %_lhs208 = load i32* %i207
  %bop209 = icmp slt i32 %_lhs208, 3
  br i1 %bop209, label %__body45, label %__post44

__fresh51:
  br label %__body45

__body45:
  %j210 = alloca i32
  store i32 0, i32* %j210
  br label %__cond49

__cond49:
  %_lhs211 = load i32* %j210
  %bop212 = icmp slt i32 %_lhs211, 4
  br i1 %bop212, label %__body48, label %__post47

__fresh52:
  br label %__body48

__body48:
  %_lhs213 = load i32* %s206
  %_lhs215 = load i32* %i207
  %bound_ptr217 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a205, i32 0, i32 0
  %bound218 = load i32* %bound_ptr217
  call void @oat_array_bounds_check( i32 %bound218, i32 %_lhs215 )
  %elt216 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a205, i32 0, i32 1, i32 %_lhs215
  %_lhs214 = load i32* %j210
  %bound_ptr220 = getelementptr { i32, [ 0 x i32 ] }** %elt216, i32 0, i32 0
  %bound221 = load i32* %bound_ptr220
  call void @oat_array_bounds_check( i32 %bound221, i32 %_lhs214 )
  %elt219 = getelementptr { i32, [ 0 x i32 ] }** %elt216, i32 0, i32 1, i32 %_lhs214
  %_lhs222 = load i32* %elt219
  %bop223 = add i32 %_lhs213, %_lhs222
  store i32 %bop223, i32* %s206
  %_lhs224 = load i32* %j210
  %bop225 = add i32 %_lhs224, 1
  store i32 %bop225, i32* %j210
  br label %__cond49

__fresh53:
  br label %__post47

__post47:
  %_lhs226 = load i32* %i207
  %bop227 = add i32 %_lhs226, 1
  store i32 %bop227, i32* %i207
  br label %__cond46

__fresh54:
  br label %__post44

__post44:
  %_lhs228 = load i32* %s206
  ret i32 %_lhs228
}


