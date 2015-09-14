declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@str1269 = global i8* zeroinitializer, align 4		; initialized by str1269.init
define void @oat_init (){

__fresh282:
  call void @str1269.init(  )
  ret void
}


define i32 @program (i32 %argc1272, { i32, [ 0 x i8* ] }* %argv1270){

__fresh281:
  %argc_slot1273 = alloca i32
  store i32 %argc1272, i32* %argc_slot1273
  %argv_slot1271 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv1270, { i32, [ 0 x i8* ] }** %argv_slot1271
  %_lhs1274 = load i8** @str1269
  call void @print_string( i8* %_lhs1274 )
  ret i32 0
}


define void @str1269.init (){

__fresh278:
  %array_ptr1252 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 3 )
  %array1253 = bitcast { i32, [ 0 x i32 ] }* %array_ptr1252 to { i32, [ 0 x i32 ] }* 
  %_tmp12531255 = alloca i32
  store i32 3, i32* %_tmp12531255
  %_tmp12551257 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array1253, { i32, [ 0 x i32 ] }** %_tmp12551257
  %i1258 = alloca i32
  store i32 0, i32* %i1258
  br label %__cond277

__cond277:
  %_lhs1259 = load i32* %i1258
  %_lhs1260 = load i32* %_tmp12531255
  %bop1261 = icmp slt i32 %_lhs1259, %_lhs1260
  br i1 %bop1261, label %__body276, label %__post275

__fresh279:
  br label %__body276

__body276:
  %_lhs1262 = load i32* %i1258
  %bound_ptr1264 = getelementptr { i32, [ 0 x i32 ] }** %_tmp12551257, i32 0, i32 0
  %bound1265 = load i32* %bound_ptr1264
  call void @oat_array_bounds_check( i32 %bound1265, i32 %_lhs1262 )
  %elt1263 = getelementptr { i32, [ 0 x i32 ] }** %_tmp12551257, i32 0, i32 1, i32 %_lhs1262
  store i32 110, i32* %elt1263
  %_lhs1266 = load i32* %i1258
  %bop1267 = add i32 %_lhs1266, 1
  store i32 %bop1267, i32* %i1258
  br label %__cond277

__fresh280:
  br label %__post275

__post275:
  %ret1268 = call i8* @string_of_array ( { i32, [ 0 x i32 ] }* %array1253 )
  store i8* %ret1268, i8** @str1269
  ret void
}


