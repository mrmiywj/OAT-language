%B = type { %_B_vtable*, i8*, i32 }
%_B_vtable = type { %_A_vtable*, i8* (%Object*)* }
%A = type { %_A_vtable*, i8*, i32 }
%_A_vtable = type { %_Object_vtable*, i8* (%Object*)* }
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
@_const_str348.str. = private unnamed_addr constant [ 2 x i8 ] c "B\00", align 4
@_const_str348 = alias bitcast([ 2 x i8 ]* @_const_str348.str. to i8*)@_const_str347.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str347 = alias bitcast([ 2 x i8 ]* @_const_str347.str. to i8*)@_const_str346.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str346 = alias bitcast([ 7 x i8 ]* @_const_str346.str. to i8*)@_B_vtable345 = private constant %_B_vtable {%_A_vtable* @_A_vtable344, i8* (%Object*)* @_Object_get_name}, align 4
@_A_vtable344 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable343, i8* (%Object*)* @_Object_get_name}, align 4
@_Object_vtable343 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh570:
  ret void
}


define i32 @program (i32 %argc2071, { i32, [ 0 x i8* ] }* %argv2069){
__fresh569:
  %argc_slot2072 = alloca i32
  store i32 %argc2071, i32* %argc_slot2072
  %argv_slot2070 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv2069, { i32, [ 0 x i8* ] }** %argv_slot2070
  %mem_ptr2073 = call i32* @oat_malloc ( i32 12 )
  %obj2074 = bitcast i32* %mem_ptr2073 to %B* 
  %new_obj2075 = call %B* @_B_ctor ( %B* %obj2074, i32 1, i32 2 )
  %vdecl_slot2076 = alloca %B*
  store %B* %new_obj2075, %B** %vdecl_slot2076
  %lhs_or_call2077 = load %B** %vdecl_slot2076
  %path2078 = getelementptr %B* %lhs_or_call2077, i32 0, i32 2
  %lhs_or_call2079 = load i32* %path2078
  ret i32 %lhs_or_call2079
}


define %B* @_B_ctor (%B* %_this1, i32 %a2059, i32 %b2057){
__fresh568:
  %a_slot2060 = alloca i32
  store i32 %a2059, i32* %a_slot2060
  %b_slot2058 = alloca i32
  store i32 %b2057, i32* %b_slot2058
  %lhs_or_call2061 = load i32* %a_slot2060
  %bop2062 = mul i32 %lhs_or_call2061, 10
  %lhs_or_call2063 = load i32* %b_slot2058
  %bop2064 = add i32 %bop2062, %lhs_or_call2063
  %cast_op2065 = bitcast %B* %_this1 to %A* 
  %dummy2066 = call %A* @_A_ctor ( %A* %cast_op2065, i32 %bop2064 )
  %path2067 = getelementptr %B* %_this1, i32 0, i32 1
  store i8* @_const_str348, i8** %path2067
  %vt_slot2068 = getelementptr %B* %_this1, i32 0, i32 0
  store %_B_vtable* @_B_vtable345, %_B_vtable** %vt_slot2068
  ret %B* %_this1
}


define %A* @_A_ctor (%A* %_this1, i32 %x2049){
__fresh567:
  %x_slot2050 = alloca i32
  store i32 %x2049, i32* %x_slot2050
  %cast_op2051 = bitcast %A* %_this1 to %Object* 
  %dummy2052 = call %Object* @_Object_ctor ( %Object* %cast_op2051 )
  %path2053 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str347, i8** %path2053
  %vt_slot2054 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable344, %_A_vtable** %vt_slot2054
  %path2055 = getelementptr %A* %_this1, i32 0, i32 2
  %lhs_or_call2056 = load i32* %x_slot2050
  store i32 %lhs_or_call2056, i32* %path2055
  ret %A* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh566:
  %path2047 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call2048 = load i8** %path2047
  ret i8* %lhs_or_call2048
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh565:
  %path2045 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str346, i8** %path2045
  %vt_slot2046 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable343, %_Object_vtable** %vt_slot2046
  ret %Object* %_this1
}


