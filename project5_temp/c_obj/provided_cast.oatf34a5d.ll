%Bb = type { %_Bb_vtable*, i8*, i32 }
%_Bb_vtable = type { %_A_vtable*, i8* (%Object*)*, void (%Bb*)* }
%B = type { %_B_vtable*, i8*, i32 }
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
@_const_str580.str. = private unnamed_addr constant [ 13 x i8 ] c "makes sense.\00", align 4
@_const_str580 = alias bitcast([ 13 x i8 ]* @_const_str580.str. to i8*)@_const_str581.str. = private unnamed_addr constant [ 4 x i8 ] c "???\00", align 4
@_const_str581 = alias bitcast([ 4 x i8 ]* @_const_str581.str. to i8*)@_const_str578.str. = private unnamed_addr constant [ 13 x i8 ] c "makes sense.\00", align 4
@_const_str578 = alias bitcast([ 13 x i8 ]* @_const_str578.str. to i8*)@_const_str579.str. = private unnamed_addr constant [ 4 x i8 ] c "???\00", align 4
@_const_str579 = alias bitcast([ 4 x i8 ]* @_const_str579.str. to i8*)@_const_str577.str. = private unnamed_addr constant [ 3 x i8 ] c "Bb\00", align 4
@_const_str577 = alias bitcast([ 3 x i8 ]* @_const_str577.str. to i8*)@_const_str576.str. = private unnamed_addr constant [ 3 x i8 ] c "Bb\00", align 4
@_const_str576 = alias bitcast([ 3 x i8 ]* @_const_str576.str. to i8*)@_const_str575.str. = private unnamed_addr constant [ 2 x i8 ] c "B\00", align 4
@_const_str575 = alias bitcast([ 2 x i8 ]* @_const_str575.str. to i8*)@_const_str574.str. = private unnamed_addr constant [ 2 x i8 ] c "B\00", align 4
@_const_str574 = alias bitcast([ 2 x i8 ]* @_const_str574.str. to i8*)@_const_str573.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str573 = alias bitcast([ 2 x i8 ]* @_const_str573.str. to i8*)@_const_str572.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str572 = alias bitcast([ 2 x i8 ]* @_const_str572.str. to i8*)@_const_str571.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str571 = alias bitcast([ 7 x i8 ]* @_const_str571.str. to i8*)@_Bb_vtable570 = private constant %_Bb_vtable {%_A_vtable* @_A_vtable568, i8* (%Object*)* @_Object_get_name, void (%Bb*)* @_Bb_name}, align 4
@_B_vtable569 = private constant %_B_vtable {%_A_vtable* @_A_vtable568, i8* (%Object*)* @_Object_get_name, void (%B*)* @_B_name}, align 4
@_A_vtable568 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable567, i8* (%Object*)* @_Object_get_name, void (%A*)* @_A_name}, align 4
@_Object_vtable567 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh981:
  ret void
}


define i32 @program (i32 %argc3235, { i32, [ 0 x i8* ] }* %argv3233){
__fresh964:
  %argc_slot3236 = alloca i32
  store i32 %argc3235, i32* %argc_slot3236
  %argv_slot3234 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv3233, { i32, [ 0 x i8* ] }** %argv_slot3234
  %mem_ptr3237 = call i32* @oat_malloc ( i32 8 )
  %obj3238 = bitcast i32* %mem_ptr3237 to %A* 
  %new_obj3239 = call %A* @_A_ctor ( %A* %obj3238 )
  %vdecl_slot3240 = alloca %A*
  store %A* %new_obj3239, %A** %vdecl_slot3240
  %mem_ptr3241 = call i32* @oat_malloc ( i32 12 )
  %obj3242 = bitcast i32* %mem_ptr3241 to %B* 
  %new_obj3243 = call %B* @_B_ctor ( %B* %obj3242 )
  %cast_op3244 = bitcast %B* %new_obj3243 to %A* 
  %vdecl_slot3245 = alloca %A*
  store %A* %cast_op3244, %A** %vdecl_slot3245
  %mem_ptr3246 = call i32* @oat_malloc ( i32 12 )
  %obj3247 = bitcast i32* %mem_ptr3246 to %Bb* 
  %new_obj3248 = call %Bb* @_Bb_ctor ( %Bb* %obj3247 )
  %cast_op3249 = bitcast %Bb* %new_obj3248 to %A* 
  %vdecl_slot3250 = alloca %A*
  store %A* %cast_op3249, %A** %vdecl_slot3250
  %vdecl_slot3251 = alloca i32
  store i32 0, i32* %vdecl_slot3251
  %lhs_or_call3252 = load %A** %vdecl_slot3250
  %cast_op3253 = bitcast %A* %lhs_or_call3252 to %Bb* 
  %cast_op3254 = bitcast %Bb* %cast_op3253 to i8** 
  %cast_op3255 = bitcast %_Bb_vtable* @_Bb_vtable570 to i8* 
  %vt_ptr_slot3256 = alloca i8*
  %tmp03258 = load i8** %cast_op3254
  store i8* %tmp03258, i8** %vt_ptr_slot3256
  br label %__loop945

__loop945:
  %tmp13259 = load i8** %vt_ptr_slot3256
  %guard13263 = icmp eq i8* %tmp13259, %cast_op3255
  br i1 %guard13263, label %__then942, label %__fall1944

__fresh965:
  br label %__fall1944

__fall1944:
  %guard23264 = icmp eq i8* %tmp13259, null
  br i1 %guard23264, label %__else941, label %__fall2943

__fresh966:
  br label %__fall2943

__fall2943:
  %tmp23260 = load i8** %vt_ptr_slot3256
  %tmp33261 = bitcast i8* %tmp23260 to i8** 
  %tmp43262 = load i8** %tmp33261
  store i8* %tmp43262, i8** %vt_ptr_slot3256
  br label %__loop945

__fresh967:
  br label %__then942

__then942:
  %var_slot3257 = alloca %Bb*
  store %Bb* %cast_op3253, %Bb** %var_slot3257
  %lhs_or_call3265 = load i32* %vdecl_slot3251
  %lhs_or_call3266 = load %Bb** %var_slot3257
  %path3267 = getelementptr %Bb* %lhs_or_call3266, i32 0, i32 2
  %lhs_or_call3268 = load i32* %path3267
  %bop3269 = add i32 %lhs_or_call3265, %lhs_or_call3268
  store i32 %bop3269, i32* %vdecl_slot3251
  %lhs_or_call3270 = load %Bb** %var_slot3257
  %vtmp3272 = getelementptr %Bb* %lhs_or_call3270, i32 0, i32 0
  %vtable3271 = load %_Bb_vtable** %vtmp3272
  %fptmp3273 = getelementptr %_Bb_vtable* %vtable3271, i32 0, i32 2
  %method3274 = load void (%Bb*)** %fptmp3273
  call void %method3274( %Bb* %lhs_or_call3270 )
  br label %__done940

__fresh968:
  br label %__else941

__else941:
  br label %__done940

__done940:
  %lhs_or_call3275 = load %A** %vdecl_slot3245
  %cast_op3276 = bitcast %A* %lhs_or_call3275 to %B* 
  %cast_op3277 = bitcast %B* %cast_op3276 to i8** 
  %cast_op3278 = bitcast %_B_vtable* @_B_vtable569 to i8* 
  %vt_ptr_slot3279 = alloca i8*
  %tmp03281 = load i8** %cast_op3277
  store i8* %tmp03281, i8** %vt_ptr_slot3279
  br label %__loop951

__loop951:
  %tmp13282 = load i8** %vt_ptr_slot3279
  %guard13286 = icmp eq i8* %tmp13282, %cast_op3278
  br i1 %guard13286, label %__then948, label %__fall1950

__fresh969:
  br label %__fall1950

__fall1950:
  %guard23287 = icmp eq i8* %tmp13282, null
  br i1 %guard23287, label %__else947, label %__fall2949

__fresh970:
  br label %__fall2949

__fall2949:
  %tmp23283 = load i8** %vt_ptr_slot3279
  %tmp33284 = bitcast i8* %tmp23283 to i8** 
  %tmp43285 = load i8** %tmp33284
  store i8* %tmp43285, i8** %vt_ptr_slot3279
  br label %__loop951

__fresh971:
  br label %__then948

__then948:
  %var_slot3280 = alloca %B*
  store %B* %cast_op3276, %B** %var_slot3280
  %lhs_or_call3288 = load i32* %vdecl_slot3251
  %lhs_or_call3289 = load %B** %var_slot3280
  %path3290 = getelementptr %B* %lhs_or_call3289, i32 0, i32 2
  %lhs_or_call3291 = load i32* %path3290
  %bop3292 = add i32 %lhs_or_call3288, %lhs_or_call3291
  store i32 %bop3292, i32* %vdecl_slot3251
  %lhs_or_call3293 = load %B** %var_slot3280
  %vtmp3295 = getelementptr %B* %lhs_or_call3293, i32 0, i32 0
  %vtable3294 = load %_B_vtable** %vtmp3295
  %fptmp3296 = getelementptr %_B_vtable* %vtable3294, i32 0, i32 2
  %method3297 = load void (%B*)** %fptmp3296
  call void %method3297( %B* %lhs_or_call3293 )
  br label %__done946

__fresh972:
  br label %__else947

__else947:
  br label %__done946

__done946:
  %lhs_or_call3298 = load %A** %vdecl_slot3245
  %cast_op3299 = bitcast %A* %lhs_or_call3298 to %Bb* 
  %cast_op3300 = bitcast %Bb* %cast_op3299 to i8** 
  %cast_op3301 = bitcast %_Bb_vtable* @_Bb_vtable570 to i8* 
  %vt_ptr_slot3302 = alloca i8*
  %tmp03304 = load i8** %cast_op3300
  store i8* %tmp03304, i8** %vt_ptr_slot3302
  br label %__loop957

__loop957:
  %tmp13305 = load i8** %vt_ptr_slot3302
  %guard13309 = icmp eq i8* %tmp13305, %cast_op3301
  br i1 %guard13309, label %__then954, label %__fall1956

__fresh973:
  br label %__fall1956

__fall1956:
  %guard23310 = icmp eq i8* %tmp13305, null
  br i1 %guard23310, label %__else953, label %__fall2955

__fresh974:
  br label %__fall2955

__fall2955:
  %tmp23306 = load i8** %vt_ptr_slot3302
  %tmp33307 = bitcast i8* %tmp23306 to i8** 
  %tmp43308 = load i8** %tmp33307
  store i8* %tmp43308, i8** %vt_ptr_slot3302
  br label %__loop957

__fresh975:
  br label %__then954

__then954:
  %var_slot3303 = alloca %Bb*
  store %Bb* %cast_op3299, %Bb** %var_slot3303
  call void @print_string( i8* @_const_str579 )
  call void @oat_abort( i32 -1 )
  br label %__done952

__fresh976:
  br label %__else953

__else953:
  call void @print_string( i8* @_const_str578 )
  br label %__done952

__done952:
  %lhs_or_call3311 = load %A** %vdecl_slot3250
  %cast_op3312 = bitcast %A* %lhs_or_call3311 to %B* 
  %cast_op3313 = bitcast %B* %cast_op3312 to i8** 
  %cast_op3314 = bitcast %_B_vtable* @_B_vtable569 to i8* 
  %vt_ptr_slot3315 = alloca i8*
  %tmp03317 = load i8** %cast_op3313
  store i8* %tmp03317, i8** %vt_ptr_slot3315
  br label %__loop963

__loop963:
  %tmp13318 = load i8** %vt_ptr_slot3315
  %guard13322 = icmp eq i8* %tmp13318, %cast_op3314
  br i1 %guard13322, label %__then960, label %__fall1962

__fresh977:
  br label %__fall1962

__fall1962:
  %guard23323 = icmp eq i8* %tmp13318, null
  br i1 %guard23323, label %__else959, label %__fall2961

__fresh978:
  br label %__fall2961

__fall2961:
  %tmp23319 = load i8** %vt_ptr_slot3315
  %tmp33320 = bitcast i8* %tmp23319 to i8** 
  %tmp43321 = load i8** %tmp33320
  store i8* %tmp43321, i8** %vt_ptr_slot3315
  br label %__loop963

__fresh979:
  br label %__then960

__then960:
  %var_slot3316 = alloca %B*
  store %B* %cast_op3312, %B** %var_slot3316
  call void @print_string( i8* @_const_str581 )
  call void @oat_abort( i32 -1 )
  br label %__done958

__fresh980:
  br label %__else959

__else959:
  call void @print_string( i8* @_const_str580 )
  br label %__done958

__done958:
  %lhs_or_call3324 = load i32* %vdecl_slot3251
  ret i32 %lhs_or_call3324
}


define void @_Bb_name (%Bb* %_this1){
__fresh939:
  call void @print_string( i8* @_const_str577 )
  ret void
}


define %Bb* @_Bb_ctor (%Bb* %_this1){
__fresh938:
  %cast_op3228 = bitcast %Bb* %_this1 to %A* 
  %dummy3229 = call %A* @_A_ctor ( %A* %cast_op3228 )
  %path3230 = getelementptr %Bb* %_this1, i32 0, i32 1
  store i8* @_const_str576, i8** %path3230
  %vt_slot3231 = getelementptr %Bb* %_this1, i32 0, i32 0
  store %_Bb_vtable* @_Bb_vtable570, %_Bb_vtable** %vt_slot3231
  %path3232 = getelementptr %Bb* %_this1, i32 0, i32 2
  store i32 2, i32* %path3232
  ret %Bb* %_this1
}


define void @_B_name (%B* %_this1){
__fresh937:
  call void @print_string( i8* @_const_str575 )
  ret void
}


define %B* @_B_ctor (%B* %_this1){
__fresh936:
  %cast_op3223 = bitcast %B* %_this1 to %A* 
  %dummy3224 = call %A* @_A_ctor ( %A* %cast_op3223 )
  %path3225 = getelementptr %B* %_this1, i32 0, i32 1
  store i8* @_const_str574, i8** %path3225
  %vt_slot3226 = getelementptr %B* %_this1, i32 0, i32 0
  store %_B_vtable* @_B_vtable569, %_B_vtable** %vt_slot3226
  %path3227 = getelementptr %B* %_this1, i32 0, i32 2
  store i32 1, i32* %path3227
  ret %B* %_this1
}


define void @_A_name (%A* %_this1){
__fresh935:
  call void @print_string( i8* @_const_str573 )
  ret void
}


define %A* @_A_ctor (%A* %_this1){
__fresh934:
  %cast_op3219 = bitcast %A* %_this1 to %Object* 
  %dummy3220 = call %Object* @_Object_ctor ( %Object* %cast_op3219 )
  %path3221 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str572, i8** %path3221
  %vt_slot3222 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable568, %_A_vtable** %vt_slot3222
  ret %A* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh933:
  %path3217 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call3218 = load i8** %path3217
  ret i8* %lhs_or_call3218
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh932:
  %path3215 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str571, i8** %path3215
  %vt_slot3216 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable567, %_Object_vtable** %vt_slot3216
  ret %Object* %_this1
}


