declare i8* @string_of_array({ i32, [ 0 x i32 ] })
declare { i32, [ 0 x i32 ] } @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] } @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh90:
  ret void
}


define i32 @program (i32 %argc330, { i32, [ 0 x i8* ] } %argv328){

__fresh89:
  %argc_slot331 = alloca i32
  store i32 %argc330, i32* %argc_slot331
  %argv_slot329 = alloca { i32, [ 0 x i8* ] }
  store { i32, [ 0 x i8* ] } %argv328, { i32, [ 0 x i8* ] }* %argv_slot329
  %_lhs332 = load i32* %argc_slot331
  %ret333 = call i32 @f1 ( i32 %_lhs332 )
  ret i32 %ret333
}


define i32 @f9 (i32 %i325){

__fresh88:
  %i_slot326 = alloca i32
  store i32 %i325, i32* %i_slot326
  %_lhs327 = load i32* %i_slot326
  ret i32 %_lhs327
}


define i32 @f8 (i32 %i321){

__fresh87:
  %i_slot322 = alloca i32
  store i32 %i321, i32* %i_slot322
  %_lhs323 = load i32* %i_slot322
  %ret324 = call i32 @f9 ( i32 %_lhs323 )
  ret i32 %ret324
}


define i32 @f7 (i32 %i317){

__fresh86:
  %i_slot318 = alloca i32
  store i32 %i317, i32* %i_slot318
  %_lhs319 = load i32* %i_slot318
  %ret320 = call i32 @f8 ( i32 %_lhs319 )
  ret i32 %ret320
}


define i32 @f6 (i32 %i313){

__fresh85:
  %i_slot314 = alloca i32
  store i32 %i313, i32* %i_slot314
  %_lhs315 = load i32* %i_slot314
  %ret316 = call i32 @f7 ( i32 %_lhs315 )
  ret i32 %ret316
}


define i32 @f5 (i32 %i309){

__fresh84:
  %i_slot310 = alloca i32
  store i32 %i309, i32* %i_slot310
  %_lhs311 = load i32* %i_slot310
  %ret312 = call i32 @f6 ( i32 %_lhs311 )
  ret i32 %ret312
}


define i32 @f4 (i32 %i305){

__fresh83:
  %i_slot306 = alloca i32
  store i32 %i305, i32* %i_slot306
  %_lhs307 = load i32* %i_slot306
  %ret308 = call i32 @f5 ( i32 %_lhs307 )
  ret i32 %ret308
}


define i32 @f3 (i32 %i301){

__fresh82:
  %i_slot302 = alloca i32
  store i32 %i301, i32* %i_slot302
  %_lhs303 = load i32* %i_slot302
  %ret304 = call i32 @f4 ( i32 %_lhs303 )
  ret i32 %ret304
}


define i32 @f2 (i32 %i297){

__fresh81:
  %i_slot298 = alloca i32
  store i32 %i297, i32* %i_slot298
  %_lhs299 = load i32* %i_slot298
  %ret300 = call i32 @f3 ( i32 %_lhs299 )
  ret i32 %ret300
}


define i32 @f1 (i32 %i293){

__fresh80:
  %i_slot294 = alloca i32
  store i32 %i293, i32* %i_slot294
  %_lhs295 = load i32* %i_slot294
  %ret296 = call i32 @f2 ( i32 %_lhs295 )
  ret i32 %ret296
}


