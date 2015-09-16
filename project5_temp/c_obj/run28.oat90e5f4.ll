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
@_const_str153.str. = private unnamed_addr constant [ 5 x i8 ] c "null\00", align 4
@_const_str153 = alias bitcast([ 5 x i8 ]* @_const_str153.str. to i8*)@_const_str152.str. = private unnamed_addr constant [ 9 x i8 ] c "non-null\00", align 4
@_const_str152 = alias bitcast([ 9 x i8 ]* @_const_str152.str. to i8*)@_const_str151.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str151 = alias bitcast([ 7 x i8 ]* @_const_str151.str. to i8*)@_Object_vtable150 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh241:
  ret void
}


define i32 @program (i32 %argc800, { i32, [ 0 x i8* ] }* %argv798){
__fresh238:
  %argc_slot801 = alloca i32
  store i32 %argc800, i32* %argc_slot801
  %argv_slot799 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv798, { i32, [ 0 x i8* ] }** %argv_slot799
  %vdecl_slot802 = alloca i8*
  store i8* @_const_str152, i8** %vdecl_slot802
  %lhs_or_call803 = load i8** %vdecl_slot802
  %ifnull_slot804 = alloca i8*
  store i8* %lhs_or_call803, i8** %ifnull_slot804
  %ifnull_guard805 = icmp ne i8* %lhs_or_call803, null
  br i1 %ifnull_guard805, label %__then237, label %__else236

__fresh239:
  br label %__then237

__then237:
  %lhs_or_call806 = load i8** %ifnull_slot804
  call void @print_string( i8* %lhs_or_call806 )
  br label %__merge235

__fresh240:
  br label %__else236

__else236:
  call void @print_string( i8* @_const_str153 )
  br label %__merge235

__merge235:
  ret i32 0
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh234:
  %path796 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call797 = load i8** %path796
  ret i8* %lhs_or_call797
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh233:
  %path794 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str151, i8** %path794
  %vt_slot795 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable150, %_Object_vtable** %vt_slot795
  ret %Object* %_this1
}


