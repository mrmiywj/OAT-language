declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@a1163 = global { i32, [ 0 x i32 ] }* zeroinitializer, align 4		; initialized by a1163.init
define void @oat_init (){

__fresh149:
  call void @a1163.init(  )
  ret void
}


define i32 @program (i32 %argc1166, { i32, [ 0 x i8* ] }* %argv1164){

__fresh148:
  %argc_slot1167 = alloca i32
  store i32 %argc1166, i32* %argc_slot1167
  %argv_slot1165 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv1164, { i32, [ 0 x i8* ] }** %argv_slot1165
  %_lhs1168 = load { i32, [ 0 x i32 ] }** @a1163
  %ret1169 = call i8* @string_of_array ( { i32, [ 0 x i32 ] }* %_lhs1168 )
  call void @print_string( i8* %ret1169 )
  ret i32 0
}


define void @a1163.init (){

__fresh147:
  %array_ptr1151 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 10 )
  %array1152 = bitcast { i32, [ 0 x i32 ] }* %array_ptr1151 to { i32, [ 0 x i32 ] }* 
  %index_ptr1153 = getelementptr { i32, [ 0 x i32 ] }* %array1152, i32 0, i32 1, i32 0
  store i32 126, i32* %index_ptr1153
  %index_ptr1154 = getelementptr { i32, [ 0 x i32 ] }* %array1152, i32 0, i32 1, i32 1
  store i32 125, i32* %index_ptr1154
  %index_ptr1155 = getelementptr { i32, [ 0 x i32 ] }* %array1152, i32 0, i32 1, i32 2
  store i32 124, i32* %index_ptr1155
  %index_ptr1156 = getelementptr { i32, [ 0 x i32 ] }* %array1152, i32 0, i32 1, i32 3
  store i32 123, i32* %index_ptr1156
  %index_ptr1157 = getelementptr { i32, [ 0 x i32 ] }* %array1152, i32 0, i32 1, i32 4
  store i32 122, i32* %index_ptr1157
  %index_ptr1158 = getelementptr { i32, [ 0 x i32 ] }* %array1152, i32 0, i32 1, i32 5
  store i32 121, i32* %index_ptr1158
  %index_ptr1159 = getelementptr { i32, [ 0 x i32 ] }* %array1152, i32 0, i32 1, i32 6
  store i32 120, i32* %index_ptr1159
  %index_ptr1160 = getelementptr { i32, [ 0 x i32 ] }* %array1152, i32 0, i32 1, i32 7
  store i32 119, i32* %index_ptr1160
  %index_ptr1161 = getelementptr { i32, [ 0 x i32 ] }* %array1152, i32 0, i32 1, i32 8
  store i32 118, i32* %index_ptr1161
  %index_ptr1162 = getelementptr { i32, [ 0 x i32 ] }* %array1152, i32 0, i32 1, i32 9
  store i32 117, i32* %index_ptr1162
  store { i32, [ 0 x i32 ] }* %array1152, { i32, [ 0 x i32 ] }** @a1163
  ret void
}


