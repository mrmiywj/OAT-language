declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@_oat_string2306.str. = private unnamed_addr constant [ 6 x i8 ] c "hello\00", align 4
@_oat_string2306 = global i8* getelementptr inbounds ([ 6 x i8 ]* @_oat_string2306.str., i32 0, i32 0), align 4
define void @oat_init (){

__fresh400:
  ret void
}


define i32 @program (i32 %argc2304, { i32, [ 0 x i8* ] }* %argv2302){

__fresh397:
  %argc_slot2305 = alloca i32
  store i32 %argc2304, i32* %argc_slot2305
  %argv_slot2303 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv2302, { i32, [ 0 x i8* ] }** %argv_slot2303
  %strval2307 = load i8** @_oat_string2306
  %str2308 = alloca i8*
  store i8* %strval2307, i8** %str2308
  %_lhs2309 = load i8** %str2308
  %ret2310 = call { i32, [ 0 x i32 ] }* @array_of_string ( i8* %_lhs2309 )
  %arr2311 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %ret2310, { i32, [ 0 x i32 ] }** %arr2311
  %s2312 = alloca i32
  store i32 0, i32* %s2312
  %i2313 = alloca i32
  store i32 0, i32* %i2313
  br label %__cond396

__cond396:
  %_lhs2314 = load i32* %i2313
  %bop2315 = icmp slt i32 %_lhs2314, 5
  br i1 %bop2315, label %__body395, label %__post394

__fresh398:
  br label %__body395

__body395:
  %_lhs2316 = load i32* %s2312
  %_lhs2317 = load i32* %i2313
  %bound_ptr2319 = getelementptr { i32, [ 0 x i32 ] }** %arr2311, i32 0, i32 0
  %bound2320 = load i32* %bound_ptr2319
  call void @oat_array_bounds_check( i32 %bound2320, i32 %_lhs2317 )
  %elt2318 = getelementptr { i32, [ 0 x i32 ] }** %arr2311, i32 0, i32 1, i32 %_lhs2317
  %_lhs2321 = load i32* %elt2318
  %bop2322 = add i32 %_lhs2316, %_lhs2321
  store i32 %bop2322, i32* %s2312
  %_lhs2323 = load i32* %i2313
  %bop2324 = add i32 %_lhs2323, 1
  store i32 %bop2324, i32* %i2313
  br label %__cond396

__fresh399:
  br label %__post394

__post394:
  %_lhs2325 = load i32* %s2312
  ret i32 %_lhs2325
}


