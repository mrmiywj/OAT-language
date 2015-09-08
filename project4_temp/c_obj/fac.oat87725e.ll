declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh160:
  ret void
}


define i32 @program (i32 %argc1187, { i32, [ 0 x i8* ] }* %argv1185){

__fresh159:
  %argc_slot1188 = alloca i32
  store i32 %argc1187, i32* %argc_slot1188
  %argv_slot1186 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv1185, { i32, [ 0 x i8* ] }** %argv_slot1186
  %ret1189 = call i32 @f ( i32 5 )
  ret i32 %ret1189
}


define i32 @f (i32 %i1174){

__fresh156:
  %i_slot1175 = alloca i32
  store i32 %i1174, i32* %i_slot1175
  %r1176 = alloca i32
  store i32 0, i32* %r1176
  %_lhs1177 = load i32* %i_slot1175
  %bop1178 = icmp eq i32 %_lhs1177, 0
  br i1 %bop1178, label %__then155, label %__else154

__fresh157:
  br label %__then155

__then155:
  store i32 1, i32* %r1176
  br label %__merge153

__fresh158:
  br label %__else154

__else154:
  %_lhs1179 = load i32* %i_slot1175
  %_lhs1180 = load i32* %i_slot1175
  %bop1181 = sub i32 %_lhs1180, 1
  %ret1182 = call i32 @f ( i32 %bop1181 )
  %bop1183 = mul i32 %_lhs1179, %ret1182
  store i32 %bop1183, i32* %r1176
  br label %__merge153

__merge153:
  %_lhs1184 = load i32* %r1176
  ret i32 %_lhs1184
}


