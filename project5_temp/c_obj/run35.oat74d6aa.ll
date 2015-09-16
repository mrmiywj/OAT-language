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
@_const_str222.str. = private unnamed_addr constant [ 3 x i8 ] c "no\00", align 4
@_const_str222 = alias bitcast([ 3 x i8 ]* @_const_str222.str. to i8*)@_const_str223.str. = private unnamed_addr constant [ 4 x i8 ] c "yes\00", align 4
@_const_str223 = alias bitcast([ 4 x i8 ]* @_const_str223.str. to i8*)@_const_str221.str. = private unnamed_addr constant [ 2 x i8 ] c "C\00", align 4
@_const_str221 = alias bitcast([ 2 x i8 ]* @_const_str221.str. to i8*)@_const_str220.str. = private unnamed_addr constant [ 2 x i8 ] c "B\00", align 4
@_const_str220 = alias bitcast([ 2 x i8 ]* @_const_str220.str. to i8*)@_const_str219.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str219 = alias bitcast([ 2 x i8 ]* @_const_str219.str. to i8*)@_const_str218.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str218 = alias bitcast([ 7 x i8 ]* @_const_str218.str. to i8*)@_C_vtable217 = private constant %_C_vtable {%_B_vtable* @_B_vtable216, i8* (%Object*)* @_Object_get_name}, align 4
@_B_vtable216 = private constant %_B_vtable {%_A_vtable* @_A_vtable215, i8* (%Object*)* @_Object_get_name}, align 4
@_A_vtable215 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable214, i8* (%Object*)* @_Object_get_name}, align 4
@_Object_vtable214 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh360:
  ret void
}


define i32 @program (i32 %argc1126, { i32, [ 0 x i8* ] }* %argv1124){
__fresh355:
  %argc_slot1127 = alloca i32
  store i32 %argc1126, i32* %argc_slot1127
  %argv_slot1125 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv1124, { i32, [ 0 x i8* ] }** %argv_slot1125
  %mem_ptr1128 = call i32* @oat_malloc ( i32 12 )
  %obj1129 = bitcast i32* %mem_ptr1128 to %A* 
  %new_obj1130 = call %A* @_A_ctor ( %A* %obj1129 )
  %vdecl_slot1131 = alloca %A*
  store %A* %new_obj1130, %A** %vdecl_slot1131
  %unop1132 = sub i32 0, 1
  %vdecl_slot1133 = alloca i32
  store i32 %unop1132, i32* %vdecl_slot1133
  %lhs_or_call1134 = load %A** %vdecl_slot1131
  %cast_op1135 = bitcast %A* %lhs_or_call1134 to i8** 
  %cast_op1136 = bitcast %_A_vtable* @_A_vtable215 to i8* 
  %vt_ptr_slot1137 = alloca i8*
  %tmp01139 = load i8** %cast_op1135
  store i8* %tmp01139, i8** %vt_ptr_slot1137
  br label %__loop354

__loop354:
  %tmp11140 = load i8** %vt_ptr_slot1137
  %guard11144 = icmp eq i8* %tmp11140, %cast_op1136
  br i1 %guard11144, label %__then351, label %__fall1353

__fresh356:
  br label %__fall1353

__fall1353:
  %guard21145 = icmp eq i8* %tmp11140, null
  br i1 %guard21145, label %__else350, label %__fall2352

__fresh357:
  br label %__fall2352

__fall2352:
  %tmp21141 = load i8** %vt_ptr_slot1137
  %tmp31142 = bitcast i8* %tmp21141 to i8** 
  %tmp41143 = load i8** %tmp31142
  store i8* %tmp41143, i8** %vt_ptr_slot1137
  br label %__loop354

__fresh358:
  br label %__then351

__then351:
  %var_slot1138 = alloca %A*
  store %A* %lhs_or_call1134, %A** %var_slot1138
  call void @print_string( i8* @_const_str223 )
  %lhs_or_call1149 = load %A** %var_slot1138
  %path1150 = getelementptr %A* %lhs_or_call1149, i32 0, i32 2
  %lhs_or_call1151 = load i32* %path1150
  store i32 %lhs_or_call1151, i32* %vdecl_slot1133
  br label %__done349

__fresh359:
  br label %__else350

__else350:
  call void @print_string( i8* @_const_str222 )
  %lhs_or_call1146 = load %A** %vdecl_slot1131
  %path1147 = getelementptr %A* %lhs_or_call1146, i32 0, i32 2
  %lhs_or_call1148 = load i32* %path1147
  store i32 %lhs_or_call1148, i32* %vdecl_slot1133
  br label %__done349

__done349:
  %lhs_or_call1152 = load i32* %vdecl_slot1133
  ret i32 %lhs_or_call1152
}


define %C* @_C_ctor (%C* %_this1){
__fresh348:
  %cast_op1119 = bitcast %C* %_this1 to %B* 
  %dummy1120 = call %B* @_B_ctor ( %B* %cast_op1119 )
  %path1121 = getelementptr %C* %_this1, i32 0, i32 1
  store i8* @_const_str221, i8** %path1121
  %vt_slot1122 = getelementptr %C* %_this1, i32 0, i32 0
  store %_C_vtable* @_C_vtable217, %_C_vtable** %vt_slot1122
  %path1123 = getelementptr %C* %_this1, i32 0, i32 2
  store i32 2, i32* %path1123
  ret %C* %_this1
}


define %B* @_B_ctor (%B* %_this1){
__fresh347:
  %cast_op1114 = bitcast %B* %_this1 to %A* 
  %dummy1115 = call %A* @_A_ctor ( %A* %cast_op1114 )
  %path1116 = getelementptr %B* %_this1, i32 0, i32 1
  store i8* @_const_str220, i8** %path1116
  %vt_slot1117 = getelementptr %B* %_this1, i32 0, i32 0
  store %_B_vtable* @_B_vtable216, %_B_vtable** %vt_slot1117
  %path1118 = getelementptr %B* %_this1, i32 0, i32 2
  store i32 1, i32* %path1118
  ret %B* %_this1
}


define %A* @_A_ctor (%A* %_this1){
__fresh346:
  %cast_op1109 = bitcast %A* %_this1 to %Object* 
  %dummy1110 = call %Object* @_Object_ctor ( %Object* %cast_op1109 )
  %path1111 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str219, i8** %path1111
  %vt_slot1112 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable215, %_A_vtable** %vt_slot1112
  %path1113 = getelementptr %A* %_this1, i32 0, i32 2
  store i32 0, i32* %path1113
  ret %A* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh345:
  %path1107 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call1108 = load i8** %path1107
  ret i8* %lhs_or_call1108
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh344:
  %path1105 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str218, i8** %path1105
  %vt_slot1106 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable214, %_Object_vtable** %vt_slot1106
  ret %Object* %_this1
}


