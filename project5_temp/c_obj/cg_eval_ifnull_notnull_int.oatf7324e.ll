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
@_const_str408.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str408 = alias bitcast([ 2 x i8 ]* @_const_str408.str. to i8*)@_const_str407.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str407 = alias bitcast([ 7 x i8 ]* @_const_str407.str. to i8*)@_A_vtable406 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable405, i8* (%Object*)* @_Object_get_name}, align 4
@_Object_vtable405 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh651:
  ret void
}


define i32 @program (i32 %argc2294, { i32, [ 0 x i8* ] }* %argv2292){
__fresh650:
  %argc_slot2295 = alloca i32
  store i32 %argc2294, i32* %argc_slot2295
  %argv_slot2293 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv2292, { i32, [ 0 x i8* ] }** %argv_slot2293
  %mem_ptr2296 = call i32* @oat_malloc ( i32 12 )
  %obj2297 = bitcast i32* %mem_ptr2296 to %A* 
  %new_obj2298 = call %A* @_A_ctor ( %A* %obj2297, i32 11 )
  %ret2299 = call i32 @try_ifnull ( %A* %new_obj2298 )
  ret i32 %ret2299
}


define i32 @try_ifnull (%A* %a2282){
__fresh647:
  %a_slot2283 = alloca %A*
  store %A* %a2282, %A** %a_slot2283
  %vdecl_slot2284 = alloca i32
  store i32 0, i32* %vdecl_slot2284
  %lhs_or_call2285 = load %A** %a_slot2283
  %ifnull_slot2286 = alloca %A*
  store %A* %lhs_or_call2285, %A** %ifnull_slot2286
  %ifnull_guard2287 = icmp ne %A* %lhs_or_call2285, null
  br i1 %ifnull_guard2287, label %__then646, label %__else645

__fresh648:
  br label %__then646

__then646:
  %lhs_or_call2288 = load %A** %ifnull_slot2286
  %path2289 = getelementptr %A* %lhs_or_call2288, i32 0, i32 2
  %lhs_or_call2290 = load i32* %path2289
  store i32 %lhs_or_call2290, i32* %vdecl_slot2284
  br label %__merge644

__fresh649:
  br label %__else645

__else645:
  store i32 12, i32* %vdecl_slot2284
  br label %__merge644

__merge644:
  %lhs_or_call2291 = load i32* %vdecl_slot2284
  ret i32 %lhs_or_call2291
}


define %A* @_A_ctor (%A* %_this1, i32 %x2274){
__fresh643:
  %x_slot2275 = alloca i32
  store i32 %x2274, i32* %x_slot2275
  %cast_op2276 = bitcast %A* %_this1 to %Object* 
  %dummy2277 = call %Object* @_Object_ctor ( %Object* %cast_op2276 )
  %path2278 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str408, i8** %path2278
  %vt_slot2279 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable406, %_A_vtable** %vt_slot2279
  %path2280 = getelementptr %A* %_this1, i32 0, i32 2
  %lhs_or_call2281 = load i32* %x_slot2275
  store i32 %lhs_or_call2281, i32* %path2280
  ret %A* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh642:
  %path2272 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call2273 = load i8** %path2272
  ret i8* %lhs_or_call2273
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh641:
  %path2270 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str407, i8** %path2270
  %vt_slot2271 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable405, %_Object_vtable** %vt_slot2271
  ret %Object* %_this1
}


