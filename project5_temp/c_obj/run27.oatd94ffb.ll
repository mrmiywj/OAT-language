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
@_const_str149.str. = private unnamed_addr constant [ 5 x i8 ] c "null\00", align 4
@_const_str149 = alias bitcast([ 5 x i8 ]* @_const_str149.str. to i8*)@_const_str148.str. = private unnamed_addr constant [ 9 x i8 ] c "non-null\00", align 4
@_const_str148 = alias bitcast([ 9 x i8 ]* @_const_str148.str. to i8*)@_const_str147.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str147 = alias bitcast([ 7 x i8 ]* @_const_str147.str. to i8*)@_Object_vtable146 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh232:
  ret void
}


define i32 @program (i32 %argc788, { i32, [ 0 x i8* ] }* %argv786){
__fresh229:
  %argc_slot789 = alloca i32
  store i32 %argc788, i32* %argc_slot789
  %argv_slot787 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv786, { i32, [ 0 x i8* ] }** %argv_slot787
  %vdecl_slot790 = alloca i8*
  store i8* null, i8** %vdecl_slot790
  %lhs_or_call791 = load i8** %vdecl_slot790
  %ifnull_slot792 = alloca i8*
  store i8* %lhs_or_call791, i8** %ifnull_slot792
  %ifnull_guard793 = icmp ne i8* %lhs_or_call791, null
  br i1 %ifnull_guard793, label %__then228, label %__else227

__fresh230:
  br label %__then228

__then228:
  call void @print_string( i8* @_const_str148 )
  br label %__merge226

__fresh231:
  br label %__else227

__else227:
  call void @print_string( i8* @_const_str149 )
  br label %__merge226

__merge226:
  ret i32 0
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh225:
  %path784 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call785 = load i8** %path784
  ret i8* %lhs_or_call785
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh224:
  %path782 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str147, i8** %path782
  %vt_slot783 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable146, %_Object_vtable** %vt_slot783
  ret %Object* %_this1
}


