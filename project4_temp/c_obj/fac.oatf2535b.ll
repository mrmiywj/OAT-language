declare i8** @string_of_array({ i32, [ 0 x i32 ] }**)
declare { i32, [ 0 x i32 ] }** @array_of_string(i8**)
declare void @print_string(i8**)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32** @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }** @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh160:
  ret void
}


define i32 @program (i32 %argc1204, { i32, [ 0 x i8** ] }** %argv1202){

__fresh159:
  %argc_slot1205 = alloca i32
  store i32 %argc1204, i32** %argc_slot1205
  %argv_slot1203 = alloca { i32, [ 0 x i8** ] }**
  store { i32, [ 0 x i8** ] }** %argv1202, { i32, [ 0 x i8** ] }**** %argv_slot1203
  %ret1206 = call i32 @f ( i32 5 )
  ret i32 %ret1206
}


define i32 @f (i32 %i1191){

__fresh156:
  %i_slot1192 = alloca i32
  store i32 %i1191, i32** %i_slot1192
  %r1193 = alloca i32
  store i32 0, i32** %r1193
  %_lhs1194 = load i32** %i_slot1192
  %bop1195 = icmp eq i32 %_lhs1194, 0
  br i1 %bop1195, label %__then155, label %__else154

__fresh157:
  br label %__then155

__then155:
  store i32 1, i32** %r1193
  br label %__merge153

__fresh158:
  br label %__else154

__else154:
  %_lhs1196 = load i32** %i_slot1192
  %_lhs1197 = load i32** %i_slot1192
  %bop1198 = sub i32 %_lhs1197, 1
  %ret1199 = call i32 @f ( i32 %bop1198 )
  %bop1200 = mul i32 %_lhs1196, %ret1199
  store i32 %bop1200, i32** %r1193
  br label %__merge153

__merge153:
  %_lhs1201 = load i32** %r1193
  ret i32 %_lhs1201
}


