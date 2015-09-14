declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@strs1236 = global { i32, [ 0 x { i32, [ 0 x i8* ] }* ] }* zeroinitializer, align 4		; initialized by strs1236.init
@_oat_string1232.str. = private unnamed_addr constant [ 4 x i8 ] c "123\00", align 4
@_oat_string1232 = global i8* getelementptr inbounds ([ 4 x i8 ]* @_oat_string1232.str., i32 0, i32 0), align 4
@_oat_string1229.str. = private unnamed_addr constant [ 4 x i8 ] c "789\00", align 4
@_oat_string1229 = global i8* getelementptr inbounds ([ 4 x i8 ]* @_oat_string1229.str., i32 0, i32 0), align 4
@_oat_string1223.str. = private unnamed_addr constant [ 4 x i8 ] c "def\00", align 4
@_oat_string1223 = global i8* getelementptr inbounds ([ 4 x i8 ]* @_oat_string1223.str., i32 0, i32 0), align 4
@_oat_string1220.str. = private unnamed_addr constant [ 4 x i8 ] c "abc\00", align 4
@_oat_string1220 = global i8* getelementptr inbounds ([ 4 x i8 ]* @_oat_string1220.str., i32 0, i32 0), align 4
define void @oat_init (){

__fresh274:
  call void @strs1236.init(  )
  ret void
}


define i32 @program (i32 %argc1243, { i32, [ 0 x i8* ] }* %argv1241){

__fresh273:
  %argc_slot1244 = alloca i32
  store i32 %argc1243, i32* %argc_slot1244
  %argv_slot1242 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv1241, { i32, [ 0 x i8* ] }** %argv_slot1242
  %bound_ptr1246 = getelementptr { i32, [ 0 x { i32, [ 0 x i8* ] }* ] }** @strs1236, i32 0, i32 0
  %bound1247 = load i32* %bound_ptr1246
  call void @oat_array_bounds_check( i32 %bound1247, i32 1 )
  %elt1245 = getelementptr { i32, [ 0 x { i32, [ 0 x i8* ] }* ] }** @strs1236, i32 0, i32 1, i32 1
  %bound_ptr1249 = getelementptr { i32, [ 0 x i8* ] }** %elt1245, i32 0, i32 0
  %bound1250 = load i32* %bound_ptr1249
  call void @oat_array_bounds_check( i32 %bound1250, i32 1 )
  %elt1248 = getelementptr { i32, [ 0 x i8* ] }** %elt1245, i32 0, i32 1, i32 1
  %_lhs1251 = load i8** %elt1248
  call void @print_string( i8* %_lhs1251 )
  ret i32 0
}


define void @strs1236.init (){

__fresh272:
  %array_ptr1216 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 2 )
  %array1217 = bitcast { i32, [ 0 x i32 ] }* %array_ptr1216 to { i32, [ 0 x { i32, [ 0 x i8* ] }* ] }* 
  %array_ptr1218 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 2 )
  %array1219 = bitcast { i32, [ 0 x i32 ] }* %array_ptr1218 to { i32, [ 0 x i8* ] }* 
  %strval1221 = load i8** @_oat_string1220
  %index_ptr1222 = getelementptr { i32, [ 0 x i8* ] }* %array1219, i32 0, i32 1, i32 0
  store i8* %strval1221, i8** %index_ptr1222
  %strval1224 = load i8** @_oat_string1223
  %index_ptr1225 = getelementptr { i32, [ 0 x i8* ] }* %array1219, i32 0, i32 1, i32 1
  store i8* %strval1224, i8** %index_ptr1225
  %index_ptr1226 = getelementptr { i32, [ 0 x { i32, [ 0 x i8* ] }* ] }* %array1217, i32 0, i32 1, i32 0
  store { i32, [ 0 x i8* ] }* %array1219, { i32, [ 0 x i8* ] }** %index_ptr1226
  %array_ptr1227 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 2 )
  %array1228 = bitcast { i32, [ 0 x i32 ] }* %array_ptr1227 to { i32, [ 0 x i8* ] }* 
  %strval1230 = load i8** @_oat_string1229
  %index_ptr1231 = getelementptr { i32, [ 0 x i8* ] }* %array1228, i32 0, i32 1, i32 0
  store i8* %strval1230, i8** %index_ptr1231
  %strval1233 = load i8** @_oat_string1232
  %index_ptr1234 = getelementptr { i32, [ 0 x i8* ] }* %array1228, i32 0, i32 1, i32 1
  store i8* %strval1233, i8** %index_ptr1234
  %index_ptr1235 = getelementptr { i32, [ 0 x { i32, [ 0 x i8* ] }* ] }* %array1217, i32 0, i32 1, i32 1
  store { i32, [ 0 x i8* ] }* %array1228, { i32, [ 0 x i8* ] }** %index_ptr1235
  store { i32, [ 0 x { i32, [ 0 x i8* ] }* ] }* %array1217, { i32, [ 0 x { i32, [ 0 x i8* ] }* ] }** @strs1236
  ret void
}


