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
@_const_str232.str. = private unnamed_addr constant [ 3 x i8 ] c "no\00", align 4
@_const_str232 = alias bitcast([ 3 x i8 ]* @_const_str232.str. to i8*)@_const_str233.str. = private unnamed_addr constant [ 4 x i8 ] c "yes\00", align 4
@_const_str233 = alias bitcast([ 4 x i8 ]* @_const_str233.str. to i8*)@_const_str231.str. = private unnamed_addr constant [ 2 x i8 ] c "C\00", align 4
@_const_str231 = alias bitcast([ 2 x i8 ]* @_const_str231.str. to i8*)@_const_str230.str. = private unnamed_addr constant [ 2 x i8 ] c "B\00", align 4
@_const_str230 = alias bitcast([ 2 x i8 ]* @_const_str230.str. to i8*)@_const_str229.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str229 = alias bitcast([ 2 x i8 ]* @_const_str229.str. to i8*)@_const_str228.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str228 = alias bitcast([ 7 x i8 ]* @_const_str228.str. to i8*)@_C_vtable227 = private constant %_C_vtable {%_B_vtable* @_B_vtable226, i8* (%Object*)* @_Object_get_name}, align 4
@_B_vtable226 = private constant %_B_vtable {%_A_vtable* @_A_vtable225, i8* (%Object*)* @_Object_get_name}, align 4
@_A_vtable225 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable224, i8* (%Object*)* @_Object_get_name}, align 4
@_Object_vtable224 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh377:
  ret void
}


define i32 @program (i32 %argc1174, { i32, [ 0 x i8* ] }* %argv1172){
__fresh372:
  %argc_slot1175 = alloca i32
  store i32 %argc1174, i32* %argc_slot1175
  %argv_slot1173 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv1172, { i32, [ 0 x i8* ] }** %argv_slot1173
  %mem_ptr1176 = call i32* @oat_malloc ( i32 12 )
  %obj1177 = bitcast i32* %mem_ptr1176 to %B* 
  %new_obj1178 = call %B* @_B_ctor ( %B* %obj1177 )
  %cast_op1179 = bitcast %B* %new_obj1178 to %A* 
  %vdecl_slot1180 = alloca %A*
  store %A* %cast_op1179, %A** %vdecl_slot1180
  %unop1181 = sub i32 0, 1
  %vdecl_slot1182 = alloca i32
  store i32 %unop1181, i32* %vdecl_slot1182
  %lhs_or_call1183 = load %A** %vdecl_slot1180
  %cast_op1184 = bitcast %A* %lhs_or_call1183 to i8** 
  %cast_op1185 = bitcast %_A_vtable* @_A_vtable225 to i8* 
  %vt_ptr_slot1186 = alloca i8*
  %tmp01188 = load i8** %cast_op1184
  store i8* %tmp01188, i8** %vt_ptr_slot1186
  br label %__loop371

__loop371:
  %tmp11189 = load i8** %vt_ptr_slot1186
  %guard11193 = icmp eq i8* %tmp11189, %cast_op1185
  br i1 %guard11193, label %__then368, label %__fall1370

__fresh373:
  br label %__fall1370

__fall1370:
  %guard21194 = icmp eq i8* %tmp11189, null
  br i1 %guard21194, label %__else367, label %__fall2369

__fresh374:
  br label %__fall2369

__fall2369:
  %tmp21190 = load i8** %vt_ptr_slot1186
  %tmp31191 = bitcast i8* %tmp21190 to i8** 
  %tmp41192 = load i8** %tmp31191
  store i8* %tmp41192, i8** %vt_ptr_slot1186
  br label %__loop371

__fresh375:
  br label %__then368

__then368:
  %var_slot1187 = alloca %A*
  store %A* %lhs_or_call1183, %A** %var_slot1187
  call void @print_string( i8* @_const_str233 )
  %lhs_or_call1198 = load %A** %var_slot1187
  %path1199 = getelementptr %A* %lhs_or_call1198, i32 0, i32 2
  %lhs_or_call1200 = load i32* %path1199
  store i32 %lhs_or_call1200, i32* %vdecl_slot1182
  br label %__done366

__fresh376:
  br label %__else367

__else367:
  call void @print_string( i8* @_const_str232 )
  %lhs_or_call1195 = load %A** %vdecl_slot1180
  %path1196 = getelementptr %A* %lhs_or_call1195, i32 0, i32 2
  %lhs_or_call1197 = load i32* %path1196
  store i32 %lhs_or_call1197, i32* %vdecl_slot1182
  br label %__done366

__done366:
  %lhs_or_call1201 = load i32* %vdecl_slot1182
  ret i32 %lhs_or_call1201
}


define %C* @_C_ctor (%C* %_this1){
__fresh365:
  %cast_op1167 = bitcast %C* %_this1 to %B* 
  %dummy1168 = call %B* @_B_ctor ( %B* %cast_op1167 )
  %path1169 = getelementptr %C* %_this1, i32 0, i32 1
  store i8* @_const_str231, i8** %path1169
  %vt_slot1170 = getelementptr %C* %_this1, i32 0, i32 0
  store %_C_vtable* @_C_vtable227, %_C_vtable** %vt_slot1170
  %path1171 = getelementptr %C* %_this1, i32 0, i32 2
  store i32 2, i32* %path1171
  ret %C* %_this1
}


define %B* @_B_ctor (%B* %_this1){
__fresh364:
  %cast_op1162 = bitcast %B* %_this1 to %A* 
  %dummy1163 = call %A* @_A_ctor ( %A* %cast_op1162 )
  %path1164 = getelementptr %B* %_this1, i32 0, i32 1
  store i8* @_const_str230, i8** %path1164
  %vt_slot1165 = getelementptr %B* %_this1, i32 0, i32 0
  store %_B_vtable* @_B_vtable226, %_B_vtable** %vt_slot1165
  %path1166 = getelementptr %B* %_this1, i32 0, i32 2
  store i32 1, i32* %path1166
  ret %B* %_this1
}


define %A* @_A_ctor (%A* %_this1){
__fresh363:
  %cast_op1157 = bitcast %A* %_this1 to %Object* 
  %dummy1158 = call %Object* @_Object_ctor ( %Object* %cast_op1157 )
  %path1159 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str229, i8** %path1159
  %vt_slot1160 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable225, %_A_vtable** %vt_slot1160
  %path1161 = getelementptr %A* %_this1, i32 0, i32 2
  store i32 0, i32* %path1161
  ret %A* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh362:
  %path1155 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call1156 = load i8** %path1155
  ret i8* %lhs_or_call1156
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh361:
  %path1153 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str228, i8** %path1153
  %vt_slot1154 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable224, %_Object_vtable** %vt_slot1154
  ret %Object* %_this1
}


