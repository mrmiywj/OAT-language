declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh43:
  ret void
}


define i32 @program (i32 %argc165, { i32, [ 0 x i8* ] }* %argv163){

__fresh40:
  %argc_slot166 = alloca i32
  store i32 %argc165, i32* %argc_slot166
  %argv_slot164 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv163, { i32, [ 0 x i8* ] }** %argv_slot164
  %array_ptr167 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 2 )
  %array168 = bitcast { i32, [ 0 x i32 ] }* %array_ptr167 to { i32, [ 0 x i1 ] }* 
  %index_ptr169 = getelementptr { i32, [ 0 x i1 ] }* %array168, i32 0, i32 1, i32 0
  store i1 1, i1* %index_ptr169
  %index_ptr170 = getelementptr { i32, [ 0 x i1 ] }* %array168, i32 0, i32 1, i32 1
  store i1 0, i1* %index_ptr170
  %b171 = alloca { i32, [ 0 x i1 ] }*
  store { i32, [ 0 x i1 ] }* %array168, { i32, [ 0 x i1 ] }** %b171
  %i172 = alloca i32
  store i32 0, i32* %i172
  %bound_ptr174 = getelementptr { i32, [ 0 x i1 ] }** %b171, i32 0, i32 0
  %bound175 = load i32* %bound_ptr174
  call void @oat_array_bounds_check( i32 %bound175, i32 0 )
  %elt173 = getelementptr { i32, [ 0 x i1 ] }** %b171, i32 0, i32 1, i32 0
  %_lhs176 = load i1* %elt173
  br i1 %_lhs176, label %__then39, label %__else38

__fresh41:
  br label %__then39

__then39:
  store i32 1, i32* %i172
  br label %__merge37

__fresh42:
  br label %__else38

__else38:
  br label %__merge37

__merge37:
  %_lhs177 = load i32* %i172
  ret i32 %_lhs177
}


