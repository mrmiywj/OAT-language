%Object = type { %_Object_vtable*, i8* }
%_Object_vtable = type { {  }*, i8* (%Object*)* }
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
declare void @oat_abort(i32)
declare void @print_bool(i1)
declare void @print_int(i32)
declare void @print_string(i8*)
declare i32 @length_of_string(i8*)
declare i8* @string_cat(i8*, i8*)
declare i8* @string_of_int(i32)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
@_const_str261.str. = private unnamed_addr constant [ 12 x i8 ] c "X is three!\00", align 4
@_const_str261 = alias bitcast([ 12 x i8 ]* @_const_str261.str. to i8*)@x260 = global i32 3, align 4
@_const_str259.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str259 = alias bitcast([ 7 x i8 ]* @_const_str259.str. to i8*)@_Object_vtable258 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh448:
  ret void
}


define i32 @program (i32 %argc1351, { i32, [ 0 x i8* ] }* %argv1349){
__fresh445:
  %argc_slot1352 = alloca i32
  store i32 %argc1351, i32* %argc_slot1352
  %argv_slot1350 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv1349, { i32, [ 0 x i8* ] }** %argv_slot1350
  %lhs_or_call1353 = load i32* @x260
  %bop1354 = icmp eq i32 %lhs_or_call1353, 3
  br i1 %bop1354, label %__then444, label %__else443

__fresh446:
  br label %__then444

__then444:
  call void @print_string( i8* @_const_str261 )
  call void @oat_abort( i32 -1 )
  br label %__merge442

__fresh447:
  br label %__else443

__else443:
  store i32 4, i32* @x260
  br label %__merge442

__merge442:
  %lhs_or_call1355 = load i32* @x260
  ret i32 %lhs_or_call1355
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh441:
  %path1347 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call1348 = load i8** %path1347
  ret i8* %lhs_or_call1348
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh440:
  %path1345 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str259, i8** %path1345
  %vt_slot1346 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable258, %_Object_vtable** %vt_slot1346
  ret %Object* %_this1
}


