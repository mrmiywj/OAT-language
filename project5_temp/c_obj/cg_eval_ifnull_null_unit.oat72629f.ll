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
@_const_str412.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str412 = alias bitcast([ 2 x i8 ]* @_const_str412.str. to i8*)@_const_str411.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str411 = alias bitcast([ 7 x i8 ]* @_const_str411.str. to i8*)@_A_vtable410 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable409, i8* (%Object*)* @_Object_get_name}, align 4
@_Object_vtable409 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh662:
  ret void
}


define i32 @program (i32 %argc2324, { i32, [ 0 x i8* ] }* %argv2322){
__fresh661:
  %argc_slot2325 = alloca i32
  store i32 %argc2324, i32* %argc_slot2325
  %argv_slot2323 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv2322, { i32, [ 0 x i8* ] }** %argv_slot2323
  %cast_op2326 = bitcast i8* null to %A* 
  %ret2327 = call i32 @try_ifnull ( %A* %cast_op2326 )
  ret i32 %ret2327
}


define i32 @try_ifnull (%A* %a2312){
__fresh658:
  %a_slot2313 = alloca %A*
  store %A* %a2312, %A** %a_slot2313
  %vdecl_slot2314 = alloca i32
  store i32 0, i32* %vdecl_slot2314
  %lhs_or_call2315 = load %A** %a_slot2313
  %ifnull_slot2316 = alloca %A*
  store %A* %lhs_or_call2315, %A** %ifnull_slot2316
  %ifnull_guard2317 = icmp ne %A* %lhs_or_call2315, null
  br i1 %ifnull_guard2317, label %__then657, label %__else656

__fresh659:
  br label %__then657

__then657:
  %lhs_or_call2318 = load %A** %ifnull_slot2316
  %path2319 = getelementptr %A* %lhs_or_call2318, i32 0, i32 2
  %lhs_or_call2320 = load i32* %path2319
  store i32 %lhs_or_call2320, i32* %vdecl_slot2314
  br label %__merge655

__fresh660:
  br label %__else656

__else656:
  store i32 12, i32* %vdecl_slot2314
  br label %__merge655

__merge655:
  %lhs_or_call2321 = load i32* %vdecl_slot2314
  ret i32 %lhs_or_call2321
}


define %A* @_A_ctor (%A* %_this1, i32 %x2304){
__fresh654:
  %x_slot2305 = alloca i32
  store i32 %x2304, i32* %x_slot2305
  %cast_op2306 = bitcast %A* %_this1 to %Object* 
  %dummy2307 = call %Object* @_Object_ctor ( %Object* %cast_op2306 )
  %path2308 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str412, i8** %path2308
  %vt_slot2309 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable410, %_A_vtable** %vt_slot2309
  %path2310 = getelementptr %A* %_this1, i32 0, i32 2
  %lhs_or_call2311 = load i32* %x_slot2305
  store i32 %lhs_or_call2311, i32* %path2310
  ret %A* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh653:
  %path2302 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call2303 = load i8** %path2302
  ret i8* %lhs_or_call2303
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh652:
  %path2300 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str411, i8** %path2300
  %vt_slot2301 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable409, %_Object_vtable** %vt_slot2301
  ret %Object* %_this1
}


