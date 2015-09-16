%C = type { %_C_vtable*, i8*, i32 }
%_C_vtable = type { %_B_vtable*, i8* (%Object*)* }
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
@_const_str242.str. = private unnamed_addr constant [ 3 x i8 ] c "no\00", align 4
@_const_str242 = alias bitcast([ 3 x i8 ]* @_const_str242.str. to i8*)@_const_str243.str. = private unnamed_addr constant [ 4 x i8 ] c "yes\00", align 4
@_const_str243 = alias bitcast([ 4 x i8 ]* @_const_str243.str. to i8*)@_const_str241.str. = private unnamed_addr constant [ 2 x i8 ] c "C\00", align 4
@_const_str241 = alias bitcast([ 2 x i8 ]* @_const_str241.str. to i8*)@_const_str240.str. = private unnamed_addr constant [ 2 x i8 ] c "B\00", align 4
@_const_str240 = alias bitcast([ 2 x i8 ]* @_const_str240.str. to i8*)@_const_str239.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str239 = alias bitcast([ 2 x i8 ]* @_const_str239.str. to i8*)@_const_str238.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str238 = alias bitcast([ 7 x i8 ]* @_const_str238.str. to i8*)@_C_vtable237 = private constant %_C_vtable {%_B_vtable* @_B_vtable236, i8* (%Object*)* @_Object_get_name}, align 4
@_B_vtable236 = private constant %_B_vtable {%_A_vtable* @_A_vtable235, i8* (%Object*)* @_Object_get_name}, align 4
@_A_vtable235 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable234, i8* (%Object*)* @_Object_get_name}, align 4
@_Object_vtable234 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh394:
  ret void
}


define i32 @program (i32 %argc1223, { i32, [ 0 x i8* ] }* %argv1221){
__fresh389:
  %argc_slot1224 = alloca i32
  store i32 %argc1223, i32* %argc_slot1224
  %argv_slot1222 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv1221, { i32, [ 0 x i8* ] }** %argv_slot1222
  %mem_ptr1225 = call i32* @oat_malloc ( i32 12 )
  %obj1226 = bitcast i32* %mem_ptr1225 to %C* 
  %new_obj1227 = call %C* @_C_ctor ( %C* %obj1226 )
  %cast_op1228 = bitcast %C* %new_obj1227 to %A* 
  %vdecl_slot1229 = alloca %A*
  store %A* %cast_op1228, %A** %vdecl_slot1229
  %unop1230 = sub i32 0, 1
  %vdecl_slot1231 = alloca i32
  store i32 %unop1230, i32* %vdecl_slot1231
  %lhs_or_call1232 = load %A** %vdecl_slot1229
  %cast_op1233 = bitcast %A* %lhs_or_call1232 to i8** 
  %cast_op1234 = bitcast %_A_vtable* @_A_vtable235 to i8* 
  %vt_ptr_slot1235 = alloca i8*
  %tmp01237 = load i8** %cast_op1233
  store i8* %tmp01237, i8** %vt_ptr_slot1235
  br label %__loop388

__loop388:
  %tmp11238 = load i8** %vt_ptr_slot1235
  %guard11242 = icmp eq i8* %tmp11238, %cast_op1234
  br i1 %guard11242, label %__then385, label %__fall1387

__fresh390:
  br label %__fall1387

__fall1387:
  %guard21243 = icmp eq i8* %tmp11238, null
  br i1 %guard21243, label %__else384, label %__fall2386

__fresh391:
  br label %__fall2386

__fall2386:
  %tmp21239 = load i8** %vt_ptr_slot1235
  %tmp31240 = bitcast i8* %tmp21239 to i8** 
  %tmp41241 = load i8** %tmp31240
  store i8* %tmp41241, i8** %vt_ptr_slot1235
  br label %__loop388

__fresh392:
  br label %__then385

__then385:
  %var_slot1236 = alloca %A*
  store %A* %lhs_or_call1232, %A** %var_slot1236
  call void @print_string( i8* @_const_str243 )
  %lhs_or_call1247 = load %A** %var_slot1236
  %path1248 = getelementptr %A* %lhs_or_call1247, i32 0, i32 2
  %lhs_or_call1249 = load i32* %path1248
  store i32 %lhs_or_call1249, i32* %vdecl_slot1231
  br label %__done383

__fresh393:
  br label %__else384

__else384:
  call void @print_string( i8* @_const_str242 )
  %lhs_or_call1244 = load %A** %vdecl_slot1229
  %path1245 = getelementptr %A* %lhs_or_call1244, i32 0, i32 2
  %lhs_or_call1246 = load i32* %path1245
  store i32 %lhs_or_call1246, i32* %vdecl_slot1231
  br label %__done383

__done383:
  %lhs_or_call1250 = load i32* %vdecl_slot1231
  ret i32 %lhs_or_call1250
}


define %C* @_C_ctor (%C* %_this1){
__fresh382:
  %cast_op1216 = bitcast %C* %_this1 to %B* 
  %dummy1217 = call %B* @_B_ctor ( %B* %cast_op1216 )
  %path1218 = getelementptr %C* %_this1, i32 0, i32 1
  store i8* @_const_str241, i8** %path1218
  %vt_slot1219 = getelementptr %C* %_this1, i32 0, i32 0
  store %_C_vtable* @_C_vtable237, %_C_vtable** %vt_slot1219
  %path1220 = getelementptr %C* %_this1, i32 0, i32 2
  store i32 2, i32* %path1220
  ret %C* %_this1
}


define %B* @_B_ctor (%B* %_this1){
__fresh381:
  %cast_op1211 = bitcast %B* %_this1 to %A* 
  %dummy1212 = call %A* @_A_ctor ( %A* %cast_op1211 )
  %path1213 = getelementptr %B* %_this1, i32 0, i32 1
  store i8* @_const_str240, i8** %path1213
  %vt_slot1214 = getelementptr %B* %_this1, i32 0, i32 0
  store %_B_vtable* @_B_vtable236, %_B_vtable** %vt_slot1214
  %path1215 = getelementptr %B* %_this1, i32 0, i32 2
  store i32 1, i32* %path1215
  ret %B* %_this1
}


define %A* @_A_ctor (%A* %_this1){
__fresh380:
  %cast_op1206 = bitcast %A* %_this1 to %Object* 
  %dummy1207 = call %Object* @_Object_ctor ( %Object* %cast_op1206 )
  %path1208 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str239, i8** %path1208
  %vt_slot1209 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable235, %_A_vtable** %vt_slot1209
  %path1210 = getelementptr %A* %_this1, i32 0, i32 2
  store i32 0, i32* %path1210
  ret %A* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh379:
  %path1204 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call1205 = load i8** %path1204
  ret i8* %lhs_or_call1205
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh378:
  %path1202 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str238, i8** %path1202
  %vt_slot1203 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable234, %_Object_vtable** %vt_slot1203
  ret %Object* %_this1
}


