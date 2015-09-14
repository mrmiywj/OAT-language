declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh268:
  ret void
}


define i32 @program (i32 %argc1147, { i32, [ 0 x i8* ] }* %argv1145){

__fresh263:
  %argc_slot1148 = alloca i32
  store i32 %argc1147, i32* %argc_slot1148
  %argv_slot1146 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv1145, { i32, [ 0 x i8* ] }** %argv_slot1146
  %x1149 = alloca i32
  store i32 10, i32* %x1149
  %array_ptr1150 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 3 )
  %array1151 = bitcast { i32, [ 0 x i32 ] }* %array_ptr1150 to { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* 
  %_tmp11511153 = alloca i32
  store i32 3, i32* %_tmp11511153
  %_tmp11531155 = alloca { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }*
  store { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array1151, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %_tmp11531155
  %i1156 = alloca i32
  store i32 0, i32* %i1156
  br label %__cond259

__cond259:
  %_lhs1157 = load i32* %i1156
  %_lhs1158 = load i32* %_tmp11511153
  %bop1159 = icmp slt i32 %_lhs1157, %_lhs1158
  br i1 %bop1159, label %__body258, label %__post257

__fresh264:
  br label %__body258

__body258:
  %_lhs1160 = load i32* %i1156
  %bound_ptr1162 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %_tmp11531155, i32 0, i32 0
  %bound1163 = load i32* %bound_ptr1162
  call void @oat_array_bounds_check( i32 %bound1163, i32 %_lhs1160 )
  %elt1161 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %_tmp11531155, i32 0, i32 1, i32 %_lhs1160
  %array_ptr1164 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 3 )
  %array1165 = bitcast { i32, [ 0 x i32 ] }* %array_ptr1164 to { i32, [ 0 x i32 ] }* 
  %_tmp11651167 = alloca i32
  store i32 3, i32* %_tmp11651167
  %_tmp11671169 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array1165, { i32, [ 0 x i32 ] }** %_tmp11671169
  %j1170 = alloca i32
  store i32 0, i32* %j1170
  br label %__cond262

__cond262:
  %_lhs1171 = load i32* %j1170
  %_lhs1172 = load i32* %_tmp11651167
  %bop1173 = icmp slt i32 %_lhs1171, %_lhs1172
  br i1 %bop1173, label %__body261, label %__post260

__fresh265:
  br label %__body261

__body261:
  %_lhs1174 = load i32* %j1170
  %bound_ptr1176 = getelementptr { i32, [ 0 x i32 ] }** %_tmp11671169, i32 0, i32 0
  %bound1177 = load i32* %bound_ptr1176
  call void @oat_array_bounds_check( i32 %bound1177, i32 %_lhs1174 )
  %elt1175 = getelementptr { i32, [ 0 x i32 ] }** %_tmp11671169, i32 0, i32 1, i32 %_lhs1174
  %_lhs1178 = load i32* %x1149
  %_lhs1179 = load i32* %i1156
  %bop1180 = add i32 %_lhs1178, %_lhs1179
  %_lhs1181 = load i32* %j1170
  %bop1182 = add i32 %bop1180, %_lhs1181
  store i32 %bop1182, i32* %elt1175
  %_lhs1183 = load i32* %j1170
  %bop1184 = add i32 %_lhs1183, 1
  store i32 %bop1184, i32* %j1170
  br label %__cond262

__fresh266:
  br label %__post260

__post260:
  store { i32, [ 0 x i32 ] }* %array1165, { i32, [ 0 x i32 ] }** %elt1161
  %_lhs1185 = load i32* %i1156
  %bop1186 = add i32 %_lhs1185, 1
  store i32 %bop1186, i32* %i1156
  br label %__cond259

__fresh267:
  br label %__post257

__post257:
  %a1187 = alloca { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }*
  store { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array1151, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a1187
  %_lhs1188 = load { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a1187
  %b1189 = alloca { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }*
  store { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %_lhs1188, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %b1189
  %bound_ptr1191 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %b1189, i32 0, i32 0
  %bound1192 = load i32* %bound_ptr1191
  call void @oat_array_bounds_check( i32 %bound1192, i32 2 )
  %elt1190 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %b1189, i32 0, i32 1, i32 2
  %bound_ptr1194 = getelementptr { i32, [ 0 x i32 ] }** %elt1190, i32 0, i32 0
  %bound1195 = load i32* %bound_ptr1194
  call void @oat_array_bounds_check( i32 %bound1195, i32 1 )
  %elt1193 = getelementptr { i32, [ 0 x i32 ] }** %elt1190, i32 0, i32 1, i32 1
  %_lhs1196 = load i32* %elt1193
  ret i32 %_lhs1196
}


