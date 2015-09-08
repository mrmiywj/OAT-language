declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@a1147 = global { i32, [ 0 x i32 ] }* zeroinitializer, align 4		; initialized by a1147.init
define void @oat_init (){

__fresh149:
  call void @a1147.init(  )
  ret void
}


define i32 @program (i32 %argc1150, { i32, [ 0 x i8* ] }* %argv1148){

__fresh148:
  %argc_slot1151 = alloca i32
  store i32 %argc1150, i32* %argc_slot1151
  %argv_slot1149 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv1148, { i32, [ 0 x i8* ] }** %argv_slot1149
  %_lhs1152 = load { i32, [ 0 x i32 ] }** @a1147
  %ret1153 = call i8* @string_of_array ( { i32, [ 0 x i32 ] }* %_lhs1152 )
  call void @print_string( i8* %ret1153 )
  ret i32 0
}


define void @a1147.init (){

__fresh147:
  %array_ptr1135 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 10 )
  %array1136 = bitcast { i32, [ 0 x i32 ] }* %array_ptr1135 to { i32, [ 0 x i32 ] }* 
  %index_ptr1137 = getelementptr { i32, [ 0 x i32 ] }* %array1136, i32 0, i32 1, i32 0
  store i32 126, i32* %index_ptr1137
  %index_ptr1138 = getelementptr { i32, [ 0 x i32 ] }* %array1136, i32 0, i32 1, i32 1
  store i32 125, i32* %index_ptr1138
  %index_ptr1139 = getelementptr { i32, [ 0 x i32 ] }* %array1136, i32 0, i32 1, i32 2
  store i32 124, i32* %index_ptr1139
  %index_ptr1140 = getelementptr { i32, [ 0 x i32 ] }* %array1136, i32 0, i32 1, i32 3
  store i32 123, i32* %index_ptr1140
  %index_ptr1141 = getelementptr { i32, [ 0 x i32 ] }* %array1136, i32 0, i32 1, i32 4
  store i32 122, i32* %index_ptr1141
  %index_ptr1142 = getelementptr { i32, [ 0 x i32 ] }* %array1136, i32 0, i32 1, i32 5
  store i32 121, i32* %index_ptr1142
  %index_ptr1143 = getelementptr { i32, [ 0 x i32 ] }* %array1136, i32 0, i32 1, i32 6
  store i32 120, i32* %index_ptr1143
  %index_ptr1144 = getelementptr { i32, [ 0 x i32 ] }* %array1136, i32 0, i32 1, i32 7
  store i32 119, i32* %index_ptr1144
  %index_ptr1145 = getelementptr { i32, [ 0 x i32 ] }* %array1136, i32 0, i32 1, i32 8
  store i32 118, i32* %index_ptr1145
  %index_ptr1146 = getelementptr { i32, [ 0 x i32 ] }* %array1136, i32 0, i32 1, i32 9
  store i32 117, i32* %index_ptr1146
  store { i32, [ 0 x i32 ] }* %array1136, { i32, [ 0 x i32 ] }** @a1147
  ret void
}


