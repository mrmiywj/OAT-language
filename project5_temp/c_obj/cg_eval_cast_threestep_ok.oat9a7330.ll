%CCC = type { %_CCC_vtable*, i8* }
%_CCC_vtable = type { %_CC_vtable*, i8* (%Object*)* }
%CCc = type { %_CCc_vtable*, i8* }
%_CCc_vtable = type { %_CC_vtable*, i8* (%Object*)* }
%CcC = type { %_CcC_vtable*, i8* }
%_CcC_vtable = type { %_Cc_vtable*, i8* (%Object*)* }
%Ccc = type { %_Ccc_vtable*, i8* }
%_Ccc_vtable = type { %_Cc_vtable*, i8* (%Object*)* }
%CC = type { %_CC_vtable*, i8* }
%_CC_vtable = type { %_B_vtable*, i8* (%Object*)* }
%Cc = type { %_Cc_vtable*, i8* }
%_Cc_vtable = type { %_B_vtable*, i8* (%Object*)* }
%B = type { %_B_vtable*, i8* }
%_B_vtable = type { %_A_vtable*, i8* (%Object*)* }
%A = type { %_A_vtable*, i8* }
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
@_const_str404.str. = private unnamed_addr constant [ 4 x i8 ] c "CCC\00", align 4
@_const_str404 = alias bitcast([ 4 x i8 ]* @_const_str404.str. to i8*)@_const_str403.str. = private unnamed_addr constant [ 4 x i8 ] c "CCc\00", align 4
@_const_str403 = alias bitcast([ 4 x i8 ]* @_const_str403.str. to i8*)@_const_str402.str. = private unnamed_addr constant [ 4 x i8 ] c "CcC\00", align 4
@_const_str402 = alias bitcast([ 4 x i8 ]* @_const_str402.str. to i8*)@_const_str401.str. = private unnamed_addr constant [ 4 x i8 ] c "Ccc\00", align 4
@_const_str401 = alias bitcast([ 4 x i8 ]* @_const_str401.str. to i8*)@_const_str400.str. = private unnamed_addr constant [ 3 x i8 ] c "CC\00", align 4
@_const_str400 = alias bitcast([ 3 x i8 ]* @_const_str400.str. to i8*)@_const_str399.str. = private unnamed_addr constant [ 3 x i8 ] c "Cc\00", align 4
@_const_str399 = alias bitcast([ 3 x i8 ]* @_const_str399.str. to i8*)@_const_str398.str. = private unnamed_addr constant [ 2 x i8 ] c "B\00", align 4
@_const_str398 = alias bitcast([ 2 x i8 ]* @_const_str398.str. to i8*)@_const_str397.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str397 = alias bitcast([ 2 x i8 ]* @_const_str397.str. to i8*)@_const_str396.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str396 = alias bitcast([ 7 x i8 ]* @_const_str396.str. to i8*)@_CCC_vtable395 = private constant %_CCC_vtable {%_CC_vtable* @_CC_vtable391, i8* (%Object*)* @_Object_get_name}, align 4
@_CCc_vtable394 = private constant %_CCc_vtable {%_CC_vtable* @_CC_vtable391, i8* (%Object*)* @_Object_get_name}, align 4
@_CcC_vtable393 = private constant %_CcC_vtable {%_Cc_vtable* @_Cc_vtable390, i8* (%Object*)* @_Object_get_name}, align 4
@_Ccc_vtable392 = private constant %_Ccc_vtable {%_Cc_vtable* @_Cc_vtable390, i8* (%Object*)* @_Object_get_name}, align 4
@_CC_vtable391 = private constant %_CC_vtable {%_B_vtable* @_B_vtable389, i8* (%Object*)* @_Object_get_name}, align 4
@_Cc_vtable390 = private constant %_Cc_vtable {%_B_vtable* @_B_vtable389, i8* (%Object*)* @_Object_get_name}, align 4
@_B_vtable389 = private constant %_B_vtable {%_A_vtable* @_A_vtable388, i8* (%Object*)* @_Object_get_name}, align 4
@_A_vtable388 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable387, i8* (%Object*)* @_Object_get_name}, align 4
@_Object_vtable387 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh640:
  ret void
}


define i32 @program (i32 %argc2263, { i32, [ 0 x i8* ] }* %argv2261){
__fresh639:
  %argc_slot2264 = alloca i32
  store i32 %argc2263, i32* %argc_slot2264
  %argv_slot2262 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv2261, { i32, [ 0 x i8* ] }** %argv_slot2262
  %mem_ptr2265 = call i32* @oat_malloc ( i32 8 )
  %obj2266 = bitcast i32* %mem_ptr2265 to %Ccc* 
  %new_obj2267 = call %Ccc* @_Ccc_ctor ( %Ccc* %obj2266 )
  %cast_op2268 = bitcast %Ccc* %new_obj2267 to %Object* 
  %ret2269 = call i32 @docast ( %Object* %cast_op2268 )
  ret i32 %ret2269
}


define i32 @docast (%Object* %o2244){
__fresh634:
  %o_slot2245 = alloca %Object*
  store %Object* %o2244, %Object** %o_slot2245
  %vdecl_slot2246 = alloca i32
  store i32 0, i32* %vdecl_slot2246
  %lhs_or_call2247 = load %Object** %o_slot2245
  %cast_op2248 = bitcast %Object* %lhs_or_call2247 to %A* 
  %cast_op2249 = bitcast %A* %cast_op2248 to i8** 
  %cast_op2250 = bitcast %_A_vtable* @_A_vtable388 to i8* 
  %vt_ptr_slot2251 = alloca i8*
  %tmp02253 = load i8** %cast_op2249
  store i8* %tmp02253, i8** %vt_ptr_slot2251
  br label %__loop633

__loop633:
  %tmp12254 = load i8** %vt_ptr_slot2251
  %guard12258 = icmp eq i8* %tmp12254, %cast_op2250
  br i1 %guard12258, label %__then630, label %__fall1632

__fresh635:
  br label %__fall1632

__fall1632:
  %guard22259 = icmp eq i8* %tmp12254, null
  br i1 %guard22259, label %__else629, label %__fall2631

__fresh636:
  br label %__fall2631

__fall2631:
  %tmp22255 = load i8** %vt_ptr_slot2251
  %tmp32256 = bitcast i8* %tmp22255 to i8** 
  %tmp42257 = load i8** %tmp32256
  store i8* %tmp42257, i8** %vt_ptr_slot2251
  br label %__loop633

__fresh637:
  br label %__then630

__then630:
  %var_slot2252 = alloca %A*
  store %A* %cast_op2248, %A** %var_slot2252
  store i32 12, i32* %vdecl_slot2246
  br label %__done628

__fresh638:
  br label %__else629

__else629:
  store i32 21, i32* %vdecl_slot2246
  br label %__done628

__done628:
  %lhs_or_call2260 = load i32* %vdecl_slot2246
  ret i32 %lhs_or_call2260
}


define %CCC* @_CCC_ctor (%CCC* %_this1){
__fresh627:
  %cast_op2240 = bitcast %CCC* %_this1 to %CC* 
  %dummy2241 = call %CC* @_CC_ctor ( %CC* %cast_op2240 )
  %path2242 = getelementptr %CCC* %_this1, i32 0, i32 1
  store i8* @_const_str404, i8** %path2242
  %vt_slot2243 = getelementptr %CCC* %_this1, i32 0, i32 0
  store %_CCC_vtable* @_CCC_vtable395, %_CCC_vtable** %vt_slot2243
  ret %CCC* %_this1
}


define %CCc* @_CCc_ctor (%CCc* %_this1){
__fresh626:
  %cast_op2236 = bitcast %CCc* %_this1 to %CC* 
  %dummy2237 = call %CC* @_CC_ctor ( %CC* %cast_op2236 )
  %path2238 = getelementptr %CCc* %_this1, i32 0, i32 1
  store i8* @_const_str403, i8** %path2238
  %vt_slot2239 = getelementptr %CCc* %_this1, i32 0, i32 0
  store %_CCc_vtable* @_CCc_vtable394, %_CCc_vtable** %vt_slot2239
  ret %CCc* %_this1
}


define %CcC* @_CcC_ctor (%CcC* %_this1){
__fresh625:
  %cast_op2232 = bitcast %CcC* %_this1 to %Cc* 
  %dummy2233 = call %Cc* @_Cc_ctor ( %Cc* %cast_op2232 )
  %path2234 = getelementptr %CcC* %_this1, i32 0, i32 1
  store i8* @_const_str402, i8** %path2234
  %vt_slot2235 = getelementptr %CcC* %_this1, i32 0, i32 0
  store %_CcC_vtable* @_CcC_vtable393, %_CcC_vtable** %vt_slot2235
  ret %CcC* %_this1
}


define %Ccc* @_Ccc_ctor (%Ccc* %_this1){
__fresh624:
  %cast_op2228 = bitcast %Ccc* %_this1 to %Cc* 
  %dummy2229 = call %Cc* @_Cc_ctor ( %Cc* %cast_op2228 )
  %path2230 = getelementptr %Ccc* %_this1, i32 0, i32 1
  store i8* @_const_str401, i8** %path2230
  %vt_slot2231 = getelementptr %Ccc* %_this1, i32 0, i32 0
  store %_Ccc_vtable* @_Ccc_vtable392, %_Ccc_vtable** %vt_slot2231
  ret %Ccc* %_this1
}


define %CC* @_CC_ctor (%CC* %_this1){
__fresh623:
  %cast_op2224 = bitcast %CC* %_this1 to %B* 
  %dummy2225 = call %B* @_B_ctor ( %B* %cast_op2224 )
  %path2226 = getelementptr %CC* %_this1, i32 0, i32 1
  store i8* @_const_str400, i8** %path2226
  %vt_slot2227 = getelementptr %CC* %_this1, i32 0, i32 0
  store %_CC_vtable* @_CC_vtable391, %_CC_vtable** %vt_slot2227
  ret %CC* %_this1
}


define %Cc* @_Cc_ctor (%Cc* %_this1){
__fresh622:
  %cast_op2220 = bitcast %Cc* %_this1 to %B* 
  %dummy2221 = call %B* @_B_ctor ( %B* %cast_op2220 )
  %path2222 = getelementptr %Cc* %_this1, i32 0, i32 1
  store i8* @_const_str399, i8** %path2222
  %vt_slot2223 = getelementptr %Cc* %_this1, i32 0, i32 0
  store %_Cc_vtable* @_Cc_vtable390, %_Cc_vtable** %vt_slot2223
  ret %Cc* %_this1
}


define %B* @_B_ctor (%B* %_this1){
__fresh621:
  %cast_op2216 = bitcast %B* %_this1 to %A* 
  %dummy2217 = call %A* @_A_ctor ( %A* %cast_op2216 )
  %path2218 = getelementptr %B* %_this1, i32 0, i32 1
  store i8* @_const_str398, i8** %path2218
  %vt_slot2219 = getelementptr %B* %_this1, i32 0, i32 0
  store %_B_vtable* @_B_vtable389, %_B_vtable** %vt_slot2219
  ret %B* %_this1
}


define %A* @_A_ctor (%A* %_this1){
__fresh620:
  %cast_op2212 = bitcast %A* %_this1 to %Object* 
  %dummy2213 = call %Object* @_Object_ctor ( %Object* %cast_op2212 )
  %path2214 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str397, i8** %path2214
  %vt_slot2215 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable388, %_A_vtable** %vt_slot2215
  ret %A* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh619:
  %path2210 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call2211 = load i8** %path2210
  ret i8* %lhs_or_call2211
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh618:
  %path2208 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str396, i8** %path2208
  %vt_slot2209 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable387, %_Object_vtable** %vt_slot2209
  ret %Object* %_this1
}


