%C = type { %_C_vtable*, i8* }
%_C_vtable = type { %_B_vtable*, i8* (%Object*)*, void (%C*)* }
%B = type { %_B_vtable*, i8* }
%_B_vtable = type { %_A_vtable*, i8* (%Object*)*, void (%B*)* }
%A = type { %_A_vtable*, i8* }
%_A_vtable = type { %_Object_vtable*, i8* (%Object*)*, void (%A*)* }
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
@_const_str254.str. = private unnamed_addr constant [ 2 x i8 ] c "C\00", align 4
@_const_str254 = alias bitcast([ 2 x i8 ]* @_const_str254.str. to i8*)@_const_str253.str. = private unnamed_addr constant [ 2 x i8 ] c "C\00", align 4
@_const_str253 = alias bitcast([ 2 x i8 ]* @_const_str253.str. to i8*)@_const_str252.str. = private unnamed_addr constant [ 2 x i8 ] c "B\00", align 4
@_const_str252 = alias bitcast([ 2 x i8 ]* @_const_str252.str. to i8*)@_const_str251.str. = private unnamed_addr constant [ 2 x i8 ] c "B\00", align 4
@_const_str251 = alias bitcast([ 2 x i8 ]* @_const_str251.str. to i8*)@_const_str250.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str250 = alias bitcast([ 2 x i8 ]* @_const_str250.str. to i8*)@_const_str249.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str249 = alias bitcast([ 2 x i8 ]* @_const_str249.str. to i8*)@_const_str248.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str248 = alias bitcast([ 7 x i8 ]* @_const_str248.str. to i8*)@_C_vtable247 = private constant %_C_vtable {%_B_vtable* @_B_vtable246, i8* (%Object*)* @_Object_get_name, void (%C*)* @_C_f}, align 4
@_B_vtable246 = private constant %_B_vtable {%_A_vtable* @_A_vtable245, i8* (%Object*)* @_Object_get_name, void (%B*)* @_B_f}, align 4
@_A_vtable245 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable244, i8* (%Object*)* @_Object_get_name, void (%A*)* @_A_f}, align 4
@_Object_vtable244 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh435:
  ret void
}


define i32 @program (i32 %argc1324, { i32, [ 0 x i8* ] }* %argv1322){
__fresh434:
  %argc_slot1325 = alloca i32
  store i32 %argc1324, i32* %argc_slot1325
  %argv_slot1323 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv1322, { i32, [ 0 x i8* ] }** %argv_slot1323
  %mem_ptr1326 = call i32* @oat_malloc ( i32 8 )
  %obj1327 = bitcast i32* %mem_ptr1326 to %A* 
  %new_obj1328 = call %A* @_A_ctor ( %A* %obj1327 )
  call void @f( %A* %new_obj1328 )
  %mem_ptr1329 = call i32* @oat_malloc ( i32 8 )
  %obj1330 = bitcast i32* %mem_ptr1329 to %B* 
  %new_obj1331 = call %B* @_B_ctor ( %B* %obj1330 )
  %cast_op1332 = bitcast %B* %new_obj1331 to %A* 
  call void @f( %A* %cast_op1332 )
  %mem_ptr1333 = call i32* @oat_malloc ( i32 8 )
  %obj1334 = bitcast i32* %mem_ptr1333 to %C* 
  %new_obj1335 = call %C* @_C_ctor ( %C* %obj1334 )
  %cast_op1336 = bitcast %C* %new_obj1335 to %A* 
  call void @f( %A* %cast_op1336 )
  ret i32 0
}


define void @f (%A* %x1267){
__fresh421:
  %x_slot1268 = alloca %A*
  store %A* %x1267, %A** %x_slot1268
  %lhs_or_call1269 = load %A** %x_slot1268
  %cast_op1270 = bitcast %A* %lhs_or_call1269 to %C* 
  %cast_op1271 = bitcast %C* %cast_op1270 to i8** 
  %cast_op1272 = bitcast %_C_vtable* @_C_vtable247 to i8* 
  %vt_ptr_slot1273 = alloca i8*
  %tmp01275 = load i8** %cast_op1271
  store i8* %tmp01275, i8** %vt_ptr_slot1273
  br label %__loop408

__loop408:
  %tmp11276 = load i8** %vt_ptr_slot1273
  %guard11280 = icmp eq i8* %tmp11276, %cast_op1272
  br i1 %guard11280, label %__then405, label %__fall1407

__fresh422:
  br label %__fall1407

__fall1407:
  %guard21281 = icmp eq i8* %tmp11276, null
  br i1 %guard21281, label %__else404, label %__fall2406

__fresh423:
  br label %__fall2406

__fall2406:
  %tmp21277 = load i8** %vt_ptr_slot1273
  %tmp31278 = bitcast i8* %tmp21277 to i8** 
  %tmp41279 = load i8** %tmp31278
  store i8* %tmp41279, i8** %vt_ptr_slot1273
  br label %__loop408

__fresh424:
  br label %__then405

__then405:
  %var_slot1274 = alloca %C*
  store %C* %cast_op1270, %C** %var_slot1274
  %lhs_or_call1282 = load %C** %var_slot1274
  %vtmp1284 = getelementptr %C* %lhs_or_call1282, i32 0, i32 0
  %vtable1283 = load %_C_vtable** %vtmp1284
  %fptmp1285 = getelementptr %_C_vtable* %vtable1283, i32 0, i32 2
  %method1286 = load void (%C*)** %fptmp1285
  call void %method1286( %C* %lhs_or_call1282 )
  br label %__done403

__fresh425:
  br label %__else404

__else404:
  br label %__done403

__done403:
  %lhs_or_call1287 = load %A** %x_slot1268
  %cast_op1288 = bitcast %A* %lhs_or_call1287 to %B* 
  %cast_op1289 = bitcast %B* %cast_op1288 to i8** 
  %cast_op1290 = bitcast %_B_vtable* @_B_vtable246 to i8* 
  %vt_ptr_slot1291 = alloca i8*
  %tmp01293 = load i8** %cast_op1289
  store i8* %tmp01293, i8** %vt_ptr_slot1291
  br label %__loop414

__loop414:
  %tmp11294 = load i8** %vt_ptr_slot1291
  %guard11298 = icmp eq i8* %tmp11294, %cast_op1290
  br i1 %guard11298, label %__then411, label %__fall1413

__fresh426:
  br label %__fall1413

__fall1413:
  %guard21299 = icmp eq i8* %tmp11294, null
  br i1 %guard21299, label %__else410, label %__fall2412

__fresh427:
  br label %__fall2412

__fall2412:
  %tmp21295 = load i8** %vt_ptr_slot1291
  %tmp31296 = bitcast i8* %tmp21295 to i8** 
  %tmp41297 = load i8** %tmp31296
  store i8* %tmp41297, i8** %vt_ptr_slot1291
  br label %__loop414

__fresh428:
  br label %__then411

__then411:
  %var_slot1292 = alloca %B*
  store %B* %cast_op1288, %B** %var_slot1292
  %lhs_or_call1300 = load %B** %var_slot1292
  %vtmp1302 = getelementptr %B* %lhs_or_call1300, i32 0, i32 0
  %vtable1301 = load %_B_vtable** %vtmp1302
  %fptmp1303 = getelementptr %_B_vtable* %vtable1301, i32 0, i32 2
  %method1304 = load void (%B*)** %fptmp1303
  call void %method1304( %B* %lhs_or_call1300 )
  br label %__done409

__fresh429:
  br label %__else410

__else410:
  br label %__done409

__done409:
  %lhs_or_call1305 = load %A** %x_slot1268
  %cast_op1306 = bitcast %A* %lhs_or_call1305 to i8** 
  %cast_op1307 = bitcast %_A_vtable* @_A_vtable245 to i8* 
  %vt_ptr_slot1308 = alloca i8*
  %tmp01310 = load i8** %cast_op1306
  store i8* %tmp01310, i8** %vt_ptr_slot1308
  br label %__loop420

__loop420:
  %tmp11311 = load i8** %vt_ptr_slot1308
  %guard11315 = icmp eq i8* %tmp11311, %cast_op1307
  br i1 %guard11315, label %__then417, label %__fall1419

__fresh430:
  br label %__fall1419

__fall1419:
  %guard21316 = icmp eq i8* %tmp11311, null
  br i1 %guard21316, label %__else416, label %__fall2418

__fresh431:
  br label %__fall2418

__fall2418:
  %tmp21312 = load i8** %vt_ptr_slot1308
  %tmp31313 = bitcast i8* %tmp21312 to i8** 
  %tmp41314 = load i8** %tmp31313
  store i8* %tmp41314, i8** %vt_ptr_slot1308
  br label %__loop420

__fresh432:
  br label %__then417

__then417:
  %var_slot1309 = alloca %A*
  store %A* %lhs_or_call1305, %A** %var_slot1309
  %lhs_or_call1317 = load %A** %var_slot1309
  %vtmp1319 = getelementptr %A* %lhs_or_call1317, i32 0, i32 0
  %vtable1318 = load %_A_vtable** %vtmp1319
  %fptmp1320 = getelementptr %_A_vtable* %vtable1318, i32 0, i32 2
  %method1321 = load void (%A*)** %fptmp1320
  call void %method1321( %A* %lhs_or_call1317 )
  br label %__done415

__fresh433:
  br label %__else416

__else416:
  br label %__done415

__done415:
  ret void
}


define void @_C_f (%C* %_this1){
__fresh402:
  call void @print_string( i8* @_const_str254 )
  ret void
}


define %C* @_C_ctor (%C* %_this1){
__fresh401:
  %cast_op1263 = bitcast %C* %_this1 to %B* 
  %dummy1264 = call %B* @_B_ctor ( %B* %cast_op1263 )
  %path1265 = getelementptr %C* %_this1, i32 0, i32 1
  store i8* @_const_str253, i8** %path1265
  %vt_slot1266 = getelementptr %C* %_this1, i32 0, i32 0
  store %_C_vtable* @_C_vtable247, %_C_vtable** %vt_slot1266
  ret %C* %_this1
}


define void @_B_f (%B* %_this1){
__fresh400:
  call void @print_string( i8* @_const_str252 )
  ret void
}


define %B* @_B_ctor (%B* %_this1){
__fresh399:
  %cast_op1259 = bitcast %B* %_this1 to %A* 
  %dummy1260 = call %A* @_A_ctor ( %A* %cast_op1259 )
  %path1261 = getelementptr %B* %_this1, i32 0, i32 1
  store i8* @_const_str251, i8** %path1261
  %vt_slot1262 = getelementptr %B* %_this1, i32 0, i32 0
  store %_B_vtable* @_B_vtable246, %_B_vtable** %vt_slot1262
  ret %B* %_this1
}


define void @_A_f (%A* %_this1){
__fresh398:
  call void @print_string( i8* @_const_str250 )
  ret void
}


define %A* @_A_ctor (%A* %_this1){
__fresh397:
  %cast_op1255 = bitcast %A* %_this1 to %Object* 
  %dummy1256 = call %Object* @_Object_ctor ( %Object* %cast_op1255 )
  %path1257 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str249, i8** %path1257
  %vt_slot1258 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable245, %_A_vtable** %vt_slot1258
  ret %A* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh396:
  %path1253 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call1254 = load i8** %path1253
  ret i8* %lhs_or_call1254
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh395:
  %path1251 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str248, i8** %path1251
  %vt_slot1252 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable244, %_Object_vtable** %vt_slot1252
  ret %Object* %_this1
}


