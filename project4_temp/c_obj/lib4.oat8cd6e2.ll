declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@str2279 = global i8* zeroinitializer, align 4		; initialized by str2279.init
@_oat_string2277.str. = private unnamed_addr constant [ 6 x i8 ] c "hello\00", align 4
@_oat_string2277 = global i8* getelementptr inbounds ([ 6 x i8 ]* @_oat_string2277.str., i32 0, i32 0), align 4
define void @oat_init (){

__fresh393:
  call void @str2279.init(  )
  ret void
}


define i32 @program (i32 %argc2283, { i32, [ 0 x i8* ] }* %argv2281){

__fresh390:
  %argc_slot2284 = alloca i32
  store i32 %argc2283, i32* %argc_slot2284
  %argv_slot2282 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv2281, { i32, [ 0 x i8* ] }** %argv_slot2282
  %_lhs2285 = load i8** @str2279
  %ret2286 = call { i32, [ 0 x i32 ] }* @array_of_string ( i8* %_lhs2285 )
  %arr2287 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %ret2286, { i32, [ 0 x i32 ] }** %arr2287
  %s2288 = alloca i32
  store i32 0, i32* %s2288
  %i2289 = alloca i32
  store i32 0, i32* %i2289
  br label %__cond389

__cond389:
  %_lhs2290 = load i32* %i2289
  %bop2291 = icmp slt i32 %_lhs2290, 5
  br i1 %bop2291, label %__body388, label %__post387

__fresh391:
  br label %__body388

__body388:
  %_lhs2292 = load i32* %s2288
  %_lhs2293 = load i32* %i2289
  %bound_ptr2295 = getelementptr { i32, [ 0 x i32 ] }** %arr2287, i32 0, i32 0
  %bound2296 = load i32* %bound_ptr2295
  call void @oat_array_bounds_check( i32 %bound2296, i32 %_lhs2293 )
  %elt2294 = getelementptr { i32, [ 0 x i32 ] }** %arr2287, i32 0, i32 1, i32 %_lhs2293
  %_lhs2297 = load i32* %elt2294
  %bop2298 = add i32 %_lhs2292, %_lhs2297
  store i32 %bop2298, i32* %s2288
  %_lhs2299 = load i32* %i2289
  %bop2300 = add i32 %_lhs2299, 1
  store i32 %bop2300, i32* %i2289
  br label %__cond389

__fresh392:
  br label %__post387

__post387:
  %_lhs2301 = load i32* %s2288
  ret i32 %_lhs2301
}


define void @str2279.init (){

__fresh386:
  %strval2278 = load i8** @_oat_string2277
  store i8* %strval2278, i8** @str2279
  ret void
}


