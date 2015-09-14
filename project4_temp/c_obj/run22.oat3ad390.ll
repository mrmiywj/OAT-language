declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@strs1205 = global { i32, [ 0 x i8* ] }* zeroinitializer, align 4		; initialized by strs1205.init
@_oat_string1202.str. = private unnamed_addr constant [ 4 x i8 ] c "def\00", align 4
@_oat_string1202 = global i8* getelementptr inbounds ([ 4 x i8 ]* @_oat_string1202.str., i32 0, i32 0), align 4
@_oat_string1199.str. = private unnamed_addr constant [ 4 x i8 ] c "abc\00", align 4
@_oat_string1199 = global i8* getelementptr inbounds ([ 4 x i8 ]* @_oat_string1199.str., i32 0, i32 0), align 4
define void @oat_init (){

__fresh271:
  call void @strs1205.init(  )
  ret void
}


define i32 @program (i32 %argc1210, { i32, [ 0 x i8* ] }* %argv1208){

__fresh270:
  %argc_slot1211 = alloca i32
  store i32 %argc1210, i32* %argc_slot1211
  %argv_slot1209 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv1208, { i32, [ 0 x i8* ] }** %argv_slot1209
  %bound_ptr1213 = getelementptr { i32, [ 0 x i8* ] }** @strs1205, i32 0, i32 0
  %bound1214 = load i32* %bound_ptr1213
  call void @oat_array_bounds_check( i32 %bound1214, i32 0 )
  %elt1212 = getelementptr { i32, [ 0 x i8* ] }** @strs1205, i32 0, i32 1, i32 0
  %_lhs1215 = load i8** %elt1212
  call void @print_string( i8* %_lhs1215 )
  ret i32 0
}


define void @strs1205.init (){

__fresh269:
  %array_ptr1197 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 2 )
  %array1198 = bitcast { i32, [ 0 x i32 ] }* %array_ptr1197 to { i32, [ 0 x i8* ] }* 
  %strval1200 = load i8** @_oat_string1199
  %index_ptr1201 = getelementptr { i32, [ 0 x i8* ] }* %array1198, i32 0, i32 1, i32 0
  store i8* %strval1200, i8** %index_ptr1201
  %strval1203 = load i8** @_oat_string1202
  %index_ptr1204 = getelementptr { i32, [ 0 x i8* ] }* %array1198, i32 0, i32 1, i32 1
  store i8* %strval1203, i8** %index_ptr1204
  store { i32, [ 0 x i8* ] }* %array1198, { i32, [ 0 x i8* ] }** @strs1205
  ret void
}


