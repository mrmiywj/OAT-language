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
%Aa = type { %_Aa_vtable*, i8* }
%_Aa_vtable = type { %_Object_vtable*, i8* (%Object*)* }
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
@_const_str368.str. = private unnamed_addr constant [ 4 x i8 ] c "CCC\00", align 4
@_const_str368 = alias bitcast([ 4 x i8 ]* @_const_str368.str. to i8*)@_const_str367.str. = private unnamed_addr constant [ 4 x i8 ] c "CCc\00", align 4
@_const_str367 = alias bitcast([ 4 x i8 ]* @_const_str367.str. to i8*)@_const_str366.str. = private unnamed_addr constant [ 4 x i8 ] c "CcC\00", align 4
@_const_str366 = alias bitcast([ 4 x i8 ]* @_const_str366.str. to i8*)@_const_str365.str. = private unnamed_addr constant [ 4 x i8 ] c "Ccc\00", align 4
@_const_str365 = alias bitcast([ 4 x i8 ]* @_const_str365.str. to i8*)@_const_str364.str. = private unnamed_addr constant [ 3 x i8 ] c "CC\00", align 4
@_const_str364 = alias bitcast([ 3 x i8 ]* @_const_str364.str. to i8*)@_const_str363.str. = private unnamed_addr constant [ 3 x i8 ] c "Cc\00", align 4
@_const_str363 = alias bitcast([ 3 x i8 ]* @_const_str363.str. to i8*)@_const_str362.str. = private unnamed_addr constant [ 2 x i8 ] c "B\00", align 4
@_const_str362 = alias bitcast([ 2 x i8 ]* @_const_str362.str. to i8*)@_const_str361.str. = private unnamed_addr constant [ 3 x i8 ] c "Aa\00", align 4
@_const_str361 = alias bitcast([ 3 x i8 ]* @_const_str361.str. to i8*)@_const_str360.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str360 = alias bitcast([ 2 x i8 ]* @_const_str360.str. to i8*)@_const_str359.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str359 = alias bitcast([ 7 x i8 ]* @_const_str359.str. to i8*)@_CCC_vtable358 = private constant %_CCC_vtable {%_CC_vtable* @_CC_vtable354, i8* (%Object*)* @_Object_get_name}, align 4
@_CCc_vtable357 = private constant %_CCc_vtable {%_CC_vtable* @_CC_vtable354, i8* (%Object*)* @_Object_get_name}, align 4
@_CcC_vtable356 = private constant %_CcC_vtable {%_Cc_vtable* @_Cc_vtable353, i8* (%Object*)* @_Object_get_name}, align 4
@_Ccc_vtable355 = private constant %_Ccc_vtable {%_Cc_vtable* @_Cc_vtable353, i8* (%Object*)* @_Object_get_name}, align 4
@_CC_vtable354 = private constant %_CC_vtable {%_B_vtable* @_B_vtable352, i8* (%Object*)* @_Object_get_name}, align 4
@_Cc_vtable353 = private constant %_Cc_vtable {%_B_vtable* @_B_vtable352, i8* (%Object*)* @_Object_get_name}, align 4
@_B_vtable352 = private constant %_B_vtable {%_A_vtable* @_A_vtable350, i8* (%Object*)* @_Object_get_name}, align 4
@_Aa_vtable351 = private constant %_Aa_vtable {%_Object_vtable* @_Object_vtable349, i8* (%Object*)* @_Object_get_name}, align 4
@_A_vtable350 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable349, i8* (%Object*)* @_Object_get_name}, align 4
@_Object_vtable349 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh594:
  ret void
}


define i32 @program (i32 %argc2139, { i32, [ 0 x i8* ] }* %argv2137){
__fresh593:
  %argc_slot2140 = alloca i32
  store i32 %argc2139, i32* %argc_slot2140
  %argv_slot2138 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv2137, { i32, [ 0 x i8* ] }** %argv_slot2138
  %mem_ptr2141 = call i32* @oat_malloc ( i32 8 )
  %obj2142 = bitcast i32* %mem_ptr2141 to %Aa* 
  %new_obj2143 = call %Aa* @_Aa_ctor ( %Aa* %obj2142 )
  %cast_op2144 = bitcast %Aa* %new_obj2143 to %Object* 
  %ret2145 = call i32 @docast ( %Object* %cast_op2144 )
  ret i32 %ret2145
}


define i32 @docast (%Object* %o2120){
__fresh588:
  %o_slot2121 = alloca %Object*
  store %Object* %o2120, %Object** %o_slot2121
  %vdecl_slot2122 = alloca i32
  store i32 0, i32* %vdecl_slot2122
  %lhs_or_call2123 = load %Object** %o_slot2121
  %cast_op2124 = bitcast %Object* %lhs_or_call2123 to %A* 
  %cast_op2125 = bitcast %A* %cast_op2124 to i8** 
  %cast_op2126 = bitcast %_A_vtable* @_A_vtable350 to i8* 
  %vt_ptr_slot2127 = alloca i8*
  %tmp02129 = load i8** %cast_op2125
  store i8* %tmp02129, i8** %vt_ptr_slot2127
  br label %__loop587

__loop587:
  %tmp12130 = load i8** %vt_ptr_slot2127
  %guard12134 = icmp eq i8* %tmp12130, %cast_op2126
  br i1 %guard12134, label %__then584, label %__fall1586

__fresh589:
  br label %__fall1586

__fall1586:
  %guard22135 = icmp eq i8* %tmp12130, null
  br i1 %guard22135, label %__else583, label %__fall2585

__fresh590:
  br label %__fall2585

__fall2585:
  %tmp22131 = load i8** %vt_ptr_slot2127
  %tmp32132 = bitcast i8* %tmp22131 to i8** 
  %tmp42133 = load i8** %tmp32132
  store i8* %tmp42133, i8** %vt_ptr_slot2127
  br label %__loop587

__fresh591:
  br label %__then584

__then584:
  %var_slot2128 = alloca %A*
  store %A* %cast_op2124, %A** %var_slot2128
  store i32 12, i32* %vdecl_slot2122
  br label %__done582

__fresh592:
  br label %__else583

__else583:
  store i32 21, i32* %vdecl_slot2122
  br label %__done582

__done582:
  %lhs_or_call2136 = load i32* %vdecl_slot2122
  ret i32 %lhs_or_call2136
}


define %CCC* @_CCC_ctor (%CCC* %_this1){
__fresh581:
  %cast_op2116 = bitcast %CCC* %_this1 to %CC* 
  %dummy2117 = call %CC* @_CC_ctor ( %CC* %cast_op2116 )
  %path2118 = getelementptr %CCC* %_this1, i32 0, i32 1
  store i8* @_const_str368, i8** %path2118
  %vt_slot2119 = getelementptr %CCC* %_this1, i32 0, i32 0
  store %_CCC_vtable* @_CCC_vtable358, %_CCC_vtable** %vt_slot2119
  ret %CCC* %_this1
}


define %CCc* @_CCc_ctor (%CCc* %_this1){
__fresh580:
  %cast_op2112 = bitcast %CCc* %_this1 to %CC* 
  %dummy2113 = call %CC* @_CC_ctor ( %CC* %cast_op2112 )
  %path2114 = getelementptr %CCc* %_this1, i32 0, i32 1
  store i8* @_const_str367, i8** %path2114
  %vt_slot2115 = getelementptr %CCc* %_this1, i32 0, i32 0
  store %_CCc_vtable* @_CCc_vtable357, %_CCc_vtable** %vt_slot2115
  ret %CCc* %_this1
}


define %CcC* @_CcC_ctor (%CcC* %_this1){
__fresh579:
  %cast_op2108 = bitcast %CcC* %_this1 to %Cc* 
  %dummy2109 = call %Cc* @_Cc_ctor ( %Cc* %cast_op2108 )
  %path2110 = getelementptr %CcC* %_this1, i32 0, i32 1
  store i8* @_const_str366, i8** %path2110
  %vt_slot2111 = getelementptr %CcC* %_this1, i32 0, i32 0
  store %_CcC_vtable* @_CcC_vtable356, %_CcC_vtable** %vt_slot2111
  ret %CcC* %_this1
}


define %Ccc* @_Ccc_ctor (%Ccc* %_this1){
__fresh578:
  %cast_op2104 = bitcast %Ccc* %_this1 to %Cc* 
  %dummy2105 = call %Cc* @_Cc_ctor ( %Cc* %cast_op2104 )
  %path2106 = getelementptr %Ccc* %_this1, i32 0, i32 1
  store i8* @_const_str365, i8** %path2106
  %vt_slot2107 = getelementptr %Ccc* %_this1, i32 0, i32 0
  store %_Ccc_vtable* @_Ccc_vtable355, %_Ccc_vtable** %vt_slot2107
  ret %Ccc* %_this1
}


define %CC* @_CC_ctor (%CC* %_this1){
__fresh577:
  %cast_op2100 = bitcast %CC* %_this1 to %B* 
  %dummy2101 = call %B* @_B_ctor ( %B* %cast_op2100 )
  %path2102 = getelementptr %CC* %_this1, i32 0, i32 1
  store i8* @_const_str364, i8** %path2102
  %vt_slot2103 = getelementptr %CC* %_this1, i32 0, i32 0
  store %_CC_vtable* @_CC_vtable354, %_CC_vtable** %vt_slot2103
  ret %CC* %_this1
}


define %Cc* @_Cc_ctor (%Cc* %_this1){
__fresh576:
  %cast_op2096 = bitcast %Cc* %_this1 to %B* 
  %dummy2097 = call %B* @_B_ctor ( %B* %cast_op2096 )
  %path2098 = getelementptr %Cc* %_this1, i32 0, i32 1
  store i8* @_const_str363, i8** %path2098
  %vt_slot2099 = getelementptr %Cc* %_this1, i32 0, i32 0
  store %_Cc_vtable* @_Cc_vtable353, %_Cc_vtable** %vt_slot2099
  ret %Cc* %_this1
}


define %B* @_B_ctor (%B* %_this1){
__fresh575:
  %cast_op2092 = bitcast %B* %_this1 to %A* 
  %dummy2093 = call %A* @_A_ctor ( %A* %cast_op2092 )
  %path2094 = getelementptr %B* %_this1, i32 0, i32 1
  store i8* @_const_str362, i8** %path2094
  %vt_slot2095 = getelementptr %B* %_this1, i32 0, i32 0
  store %_B_vtable* @_B_vtable352, %_B_vtable** %vt_slot2095
  ret %B* %_this1
}


define %Aa* @_Aa_ctor (%Aa* %_this1){
__fresh574:
  %cast_op2088 = bitcast %Aa* %_this1 to %Object* 
  %dummy2089 = call %Object* @_Object_ctor ( %Object* %cast_op2088 )
  %path2090 = getelementptr %Aa* %_this1, i32 0, i32 1
  store i8* @_const_str361, i8** %path2090
  %vt_slot2091 = getelementptr %Aa* %_this1, i32 0, i32 0
  store %_Aa_vtable* @_Aa_vtable351, %_Aa_vtable** %vt_slot2091
  ret %Aa* %_this1
}


define %A* @_A_ctor (%A* %_this1){
__fresh573:
  %cast_op2084 = bitcast %A* %_this1 to %Object* 
  %dummy2085 = call %Object* @_Object_ctor ( %Object* %cast_op2084 )
  %path2086 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str360, i8** %path2086
  %vt_slot2087 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable350, %_A_vtable** %vt_slot2087
  ret %A* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh572:
  %path2082 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call2083 = load i8** %path2082
  ret i8* %lhs_or_call2083
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh571:
  %path2080 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str359, i8** %path2080
  %vt_slot2081 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable349, %_Object_vtable** %vt_slot2081
  ret %Object* %_this1
}


