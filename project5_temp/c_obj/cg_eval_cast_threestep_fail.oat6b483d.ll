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
@_const_str386.str. = private unnamed_addr constant [ 4 x i8 ] c "CCC\00", align 4
@_const_str386 = alias bitcast([ 4 x i8 ]* @_const_str386.str. to i8*)@_const_str385.str. = private unnamed_addr constant [ 4 x i8 ] c "CCc\00", align 4
@_const_str385 = alias bitcast([ 4 x i8 ]* @_const_str385.str. to i8*)@_const_str384.str. = private unnamed_addr constant [ 4 x i8 ] c "CcC\00", align 4
@_const_str384 = alias bitcast([ 4 x i8 ]* @_const_str384.str. to i8*)@_const_str383.str. = private unnamed_addr constant [ 4 x i8 ] c "Ccc\00", align 4
@_const_str383 = alias bitcast([ 4 x i8 ]* @_const_str383.str. to i8*)@_const_str382.str. = private unnamed_addr constant [ 3 x i8 ] c "CC\00", align 4
@_const_str382 = alias bitcast([ 3 x i8 ]* @_const_str382.str. to i8*)@_const_str381.str. = private unnamed_addr constant [ 3 x i8 ] c "Cc\00", align 4
@_const_str381 = alias bitcast([ 3 x i8 ]* @_const_str381.str. to i8*)@_const_str380.str. = private unnamed_addr constant [ 2 x i8 ] c "B\00", align 4
@_const_str380 = alias bitcast([ 2 x i8 ]* @_const_str380.str. to i8*)@_const_str379.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str379 = alias bitcast([ 2 x i8 ]* @_const_str379.str. to i8*)@_const_str378.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str378 = alias bitcast([ 7 x i8 ]* @_const_str378.str. to i8*)@_CCC_vtable377 = private constant %_CCC_vtable {%_CC_vtable* @_CC_vtable373, i8* (%Object*)* @_Object_get_name}, align 4
@_CCc_vtable376 = private constant %_CCc_vtable {%_CC_vtable* @_CC_vtable373, i8* (%Object*)* @_Object_get_name}, align 4
@_CcC_vtable375 = private constant %_CcC_vtable {%_Cc_vtable* @_Cc_vtable372, i8* (%Object*)* @_Object_get_name}, align 4
@_Ccc_vtable374 = private constant %_Ccc_vtable {%_Cc_vtable* @_Cc_vtable372, i8* (%Object*)* @_Object_get_name}, align 4
@_CC_vtable373 = private constant %_CC_vtable {%_B_vtable* @_B_vtable371, i8* (%Object*)* @_Object_get_name}, align 4
@_Cc_vtable372 = private constant %_Cc_vtable {%_B_vtable* @_B_vtable371, i8* (%Object*)* @_Object_get_name}, align 4
@_B_vtable371 = private constant %_B_vtable {%_A_vtable* @_A_vtable370, i8* (%Object*)* @_Object_get_name}, align 4
@_A_vtable370 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable369, i8* (%Object*)* @_Object_get_name}, align 4
@_Object_vtable369 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh617:
  ret void
}


define i32 @program (i32 %argc2201, { i32, [ 0 x i8* ] }* %argv2199){
__fresh616:
  %argc_slot2202 = alloca i32
  store i32 %argc2201, i32* %argc_slot2202
  %argv_slot2200 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv2199, { i32, [ 0 x i8* ] }** %argv_slot2200
  %mem_ptr2203 = call i32* @oat_malloc ( i32 8 )
  %obj2204 = bitcast i32* %mem_ptr2203 to %Cc* 
  %new_obj2205 = call %Cc* @_Cc_ctor ( %Cc* %obj2204 )
  %cast_op2206 = bitcast %Cc* %new_obj2205 to %Object* 
  %ret2207 = call i32 @docast ( %Object* %cast_op2206 )
  ret i32 %ret2207
}


define i32 @docast (%Object* %o2182){
__fresh611:
  %o_slot2183 = alloca %Object*
  store %Object* %o2182, %Object** %o_slot2183
  %vdecl_slot2184 = alloca i32
  store i32 0, i32* %vdecl_slot2184
  %lhs_or_call2185 = load %Object** %o_slot2183
  %cast_op2186 = bitcast %Object* %lhs_or_call2185 to %CCC* 
  %cast_op2187 = bitcast %CCC* %cast_op2186 to i8** 
  %cast_op2188 = bitcast %_CCC_vtable* @_CCC_vtable377 to i8* 
  %vt_ptr_slot2189 = alloca i8*
  %tmp02191 = load i8** %cast_op2187
  store i8* %tmp02191, i8** %vt_ptr_slot2189
  br label %__loop610

__loop610:
  %tmp12192 = load i8** %vt_ptr_slot2189
  %guard12196 = icmp eq i8* %tmp12192, %cast_op2188
  br i1 %guard12196, label %__then607, label %__fall1609

__fresh612:
  br label %__fall1609

__fall1609:
  %guard22197 = icmp eq i8* %tmp12192, null
  br i1 %guard22197, label %__else606, label %__fall2608

__fresh613:
  br label %__fall2608

__fall2608:
  %tmp22193 = load i8** %vt_ptr_slot2189
  %tmp32194 = bitcast i8* %tmp22193 to i8** 
  %tmp42195 = load i8** %tmp32194
  store i8* %tmp42195, i8** %vt_ptr_slot2189
  br label %__loop610

__fresh614:
  br label %__then607

__then607:
  %var_slot2190 = alloca %CCC*
  store %CCC* %cast_op2186, %CCC** %var_slot2190
  store i32 12, i32* %vdecl_slot2184
  br label %__done605

__fresh615:
  br label %__else606

__else606:
  store i32 21, i32* %vdecl_slot2184
  br label %__done605

__done605:
  %lhs_or_call2198 = load i32* %vdecl_slot2184
  ret i32 %lhs_or_call2198
}


define %CCC* @_CCC_ctor (%CCC* %_this1){
__fresh604:
  %cast_op2178 = bitcast %CCC* %_this1 to %CC* 
  %dummy2179 = call %CC* @_CC_ctor ( %CC* %cast_op2178 )
  %path2180 = getelementptr %CCC* %_this1, i32 0, i32 1
  store i8* @_const_str386, i8** %path2180
  %vt_slot2181 = getelementptr %CCC* %_this1, i32 0, i32 0
  store %_CCC_vtable* @_CCC_vtable377, %_CCC_vtable** %vt_slot2181
  ret %CCC* %_this1
}


define %CCc* @_CCc_ctor (%CCc* %_this1){
__fresh603:
  %cast_op2174 = bitcast %CCc* %_this1 to %CC* 
  %dummy2175 = call %CC* @_CC_ctor ( %CC* %cast_op2174 )
  %path2176 = getelementptr %CCc* %_this1, i32 0, i32 1
  store i8* @_const_str385, i8** %path2176
  %vt_slot2177 = getelementptr %CCc* %_this1, i32 0, i32 0
  store %_CCc_vtable* @_CCc_vtable376, %_CCc_vtable** %vt_slot2177
  ret %CCc* %_this1
}


define %CcC* @_CcC_ctor (%CcC* %_this1){
__fresh602:
  %cast_op2170 = bitcast %CcC* %_this1 to %Cc* 
  %dummy2171 = call %Cc* @_Cc_ctor ( %Cc* %cast_op2170 )
  %path2172 = getelementptr %CcC* %_this1, i32 0, i32 1
  store i8* @_const_str384, i8** %path2172
  %vt_slot2173 = getelementptr %CcC* %_this1, i32 0, i32 0
  store %_CcC_vtable* @_CcC_vtable375, %_CcC_vtable** %vt_slot2173
  ret %CcC* %_this1
}


define %Ccc* @_Ccc_ctor (%Ccc* %_this1){
__fresh601:
  %cast_op2166 = bitcast %Ccc* %_this1 to %Cc* 
  %dummy2167 = call %Cc* @_Cc_ctor ( %Cc* %cast_op2166 )
  %path2168 = getelementptr %Ccc* %_this1, i32 0, i32 1
  store i8* @_const_str383, i8** %path2168
  %vt_slot2169 = getelementptr %Ccc* %_this1, i32 0, i32 0
  store %_Ccc_vtable* @_Ccc_vtable374, %_Ccc_vtable** %vt_slot2169
  ret %Ccc* %_this1
}


define %CC* @_CC_ctor (%CC* %_this1){
__fresh600:
  %cast_op2162 = bitcast %CC* %_this1 to %B* 
  %dummy2163 = call %B* @_B_ctor ( %B* %cast_op2162 )
  %path2164 = getelementptr %CC* %_this1, i32 0, i32 1
  store i8* @_const_str382, i8** %path2164
  %vt_slot2165 = getelementptr %CC* %_this1, i32 0, i32 0
  store %_CC_vtable* @_CC_vtable373, %_CC_vtable** %vt_slot2165
  ret %CC* %_this1
}


define %Cc* @_Cc_ctor (%Cc* %_this1){
__fresh599:
  %cast_op2158 = bitcast %Cc* %_this1 to %B* 
  %dummy2159 = call %B* @_B_ctor ( %B* %cast_op2158 )
  %path2160 = getelementptr %Cc* %_this1, i32 0, i32 1
  store i8* @_const_str381, i8** %path2160
  %vt_slot2161 = getelementptr %Cc* %_this1, i32 0, i32 0
  store %_Cc_vtable* @_Cc_vtable372, %_Cc_vtable** %vt_slot2161
  ret %Cc* %_this1
}


define %B* @_B_ctor (%B* %_this1){
__fresh598:
  %cast_op2154 = bitcast %B* %_this1 to %A* 
  %dummy2155 = call %A* @_A_ctor ( %A* %cast_op2154 )
  %path2156 = getelementptr %B* %_this1, i32 0, i32 1
  store i8* @_const_str380, i8** %path2156
  %vt_slot2157 = getelementptr %B* %_this1, i32 0, i32 0
  store %_B_vtable* @_B_vtable371, %_B_vtable** %vt_slot2157
  ret %B* %_this1
}


define %A* @_A_ctor (%A* %_this1){
__fresh597:
  %cast_op2150 = bitcast %A* %_this1 to %Object* 
  %dummy2151 = call %Object* @_Object_ctor ( %Object* %cast_op2150 )
  %path2152 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str379, i8** %path2152
  %vt_slot2153 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable370, %_A_vtable** %vt_slot2153
  ret %A* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh596:
  %path2148 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call2149 = load i8** %path2148
  ret i8* %lhs_or_call2149
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh595:
  %path2146 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str378, i8** %path2146
  %vt_slot2147 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable369, %_Object_vtable** %vt_slot2147
  ret %Object* %_this1
}


