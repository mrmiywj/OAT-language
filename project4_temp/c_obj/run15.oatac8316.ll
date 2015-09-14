declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
define void @oat_init (){

__fresh256:
  ret void
}


define i32 @program (i32 %argc1019, { i32, [ 0 x i8* ] }* %argv1017){

__fresh243:
  %argc_slot1020 = alloca i32
  store i32 %argc1019, i32* %argc_slot1020
  %argv_slot1018 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv1017, { i32, [ 0 x i8* ] }** %argv_slot1018
  %array_ptr1021 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 3 )
  %array1022 = bitcast { i32, [ 0 x i32 ] }* %array_ptr1021 to { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* 
  %_tmp10221024 = alloca i32
  store i32 3, i32* %_tmp10221024
  %_tmp10241026 = alloca { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }*
  store { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array1022, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %_tmp10241026
  %i1027 = alloca i32
  store i32 0, i32* %i1027
  br label %__cond227

__cond227:
  %_lhs1028 = load i32* %i1027
  %_lhs1029 = load i32* %_tmp10221024
  %bop1030 = icmp slt i32 %_lhs1028, %_lhs1029
  br i1 %bop1030, label %__body226, label %__post225

__fresh244:
  br label %__body226

__body226:
  %_lhs1031 = load i32* %i1027
  %bound_ptr1033 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %_tmp10241026, i32 0, i32 0
  %bound1034 = load i32* %bound_ptr1033
  call void @oat_array_bounds_check( i32 %bound1034, i32 %_lhs1031 )
  %elt1032 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %_tmp10241026, i32 0, i32 1, i32 %_lhs1031
  %array_ptr1035 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 3 )
  %array1036 = bitcast { i32, [ 0 x i32 ] }* %array_ptr1035 to { i32, [ 0 x i32 ] }* 
  %_tmp10361038 = alloca i32
  store i32 3, i32* %_tmp10361038
  %_tmp10381040 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array1036, { i32, [ 0 x i32 ] }** %_tmp10381040
  %j1041 = alloca i32
  store i32 0, i32* %j1041
  br label %__cond230

__cond230:
  %_lhs1042 = load i32* %j1041
  %_lhs1043 = load i32* %_tmp10361038
  %bop1044 = icmp slt i32 %_lhs1042, %_lhs1043
  br i1 %bop1044, label %__body229, label %__post228

__fresh245:
  br label %__body229

__body229:
  %_lhs1045 = load i32* %j1041
  %bound_ptr1047 = getelementptr { i32, [ 0 x i32 ] }** %_tmp10381040, i32 0, i32 0
  %bound1048 = load i32* %bound_ptr1047
  call void @oat_array_bounds_check( i32 %bound1048, i32 %_lhs1045 )
  %elt1046 = getelementptr { i32, [ 0 x i32 ] }** %_tmp10381040, i32 0, i32 1, i32 %_lhs1045
  %_lhs1049 = load i32* %j1041
  store i32 %_lhs1049, i32* %elt1046
  %_lhs1050 = load i32* %j1041
  %bop1051 = add i32 %_lhs1050, 1
  store i32 %bop1051, i32* %j1041
  br label %__cond230

__fresh246:
  br label %__post228

__post228:
  store { i32, [ 0 x i32 ] }* %array1036, { i32, [ 0 x i32 ] }** %elt1032
  %_lhs1052 = load i32* %i1027
  %bop1053 = add i32 %_lhs1052, 1
  store i32 %bop1053, i32* %i1027
  br label %__cond227

__fresh247:
  br label %__post225

__post225:
  %a1054 = alloca { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }*
  store { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array1022, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a1054
  %array_ptr1055 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 4 )
  %array1056 = bitcast { i32, [ 0 x i32 ] }* %array_ptr1055 to { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* 
  %_tmp10561058 = alloca i32
  store i32 4, i32* %_tmp10561058
  %_tmp10581060 = alloca { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }*
  store { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array1056, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %_tmp10581060
  %i1061 = alloca i32
  store i32 0, i32* %i1061
  br label %__cond233

__cond233:
  %_lhs1062 = load i32* %i1061
  %_lhs1063 = load i32* %_tmp10561058
  %bop1064 = icmp slt i32 %_lhs1062, %_lhs1063
  br i1 %bop1064, label %__body232, label %__post231

__fresh248:
  br label %__body232

__body232:
  %_lhs1065 = load i32* %i1061
  %bound_ptr1067 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %_tmp10581060, i32 0, i32 0
  %bound1068 = load i32* %bound_ptr1067
  call void @oat_array_bounds_check( i32 %bound1068, i32 %_lhs1065 )
  %elt1066 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %_tmp10581060, i32 0, i32 1, i32 %_lhs1065
  %array_ptr1069 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 5 )
  %array1070 = bitcast { i32, [ 0 x i32 ] }* %array_ptr1069 to { i32, [ 0 x i32 ] }* 
  %_tmp10701072 = alloca i32
  store i32 5, i32* %_tmp10701072
  %_tmp10721074 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array1070, { i32, [ 0 x i32 ] }** %_tmp10721074
  %j1075 = alloca i32
  store i32 0, i32* %j1075
  br label %__cond236

__cond236:
  %_lhs1076 = load i32* %j1075
  %_lhs1077 = load i32* %_tmp10701072
  %bop1078 = icmp slt i32 %_lhs1076, %_lhs1077
  br i1 %bop1078, label %__body235, label %__post234

__fresh249:
  br label %__body235

__body235:
  %_lhs1079 = load i32* %j1075
  %bound_ptr1081 = getelementptr { i32, [ 0 x i32 ] }** %_tmp10721074, i32 0, i32 0
  %bound1082 = load i32* %bound_ptr1081
  call void @oat_array_bounds_check( i32 %bound1082, i32 %_lhs1079 )
  %elt1080 = getelementptr { i32, [ 0 x i32 ] }** %_tmp10721074, i32 0, i32 1, i32 %_lhs1079
  %_lhs1083 = load i32* %i1061
  %_lhs1084 = load i32* %j1075
  %bop1085 = mul i32 %_lhs1083, %_lhs1084
  store i32 %bop1085, i32* %elt1080
  %_lhs1086 = load i32* %j1075
  %bop1087 = add i32 %_lhs1086, 1
  store i32 %bop1087, i32* %j1075
  br label %__cond236

__fresh250:
  br label %__post234

__post234:
  store { i32, [ 0 x i32 ] }* %array1070, { i32, [ 0 x i32 ] }** %elt1066
  %_lhs1088 = load i32* %i1061
  %bop1089 = add i32 %_lhs1088, 1
  store i32 %bop1089, i32* %i1061
  br label %__cond233

__fresh251:
  br label %__post231

__post231:
  %arr1090 = alloca { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }*
  store { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array1056, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %arr1090
  %bound_ptr1092 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %arr1090, i32 0, i32 0
  %bound1093 = load i32* %bound_ptr1092
  call void @oat_array_bounds_check( i32 %bound1093, i32 3 )
  %elt1091 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %arr1090, i32 0, i32 1, i32 3
  %bound_ptr1095 = getelementptr { i32, [ 0 x i32 ] }** %elt1091, i32 0, i32 0
  %bound1096 = load i32* %bound_ptr1095
  call void @oat_array_bounds_check( i32 %bound1096, i32 4 )
  %elt1094 = getelementptr { i32, [ 0 x i32 ] }** %elt1091, i32 0, i32 1, i32 4
  %_lhs1097 = load i32* %elt1094
  %bound_ptr1099 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a1054, i32 0, i32 0
  %bound1100 = load i32* %bound_ptr1099
  call void @oat_array_bounds_check( i32 %bound1100, i32 1 )
  %elt1098 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a1054, i32 0, i32 1, i32 1
  %bound_ptr1102 = getelementptr { i32, [ 0 x i32 ] }** %elt1098, i32 0, i32 0
  %bound1103 = load i32* %bound_ptr1102
  call void @oat_array_bounds_check( i32 %bound1103, i32 2 )
  %elt1101 = getelementptr { i32, [ 0 x i32 ] }** %elt1098, i32 0, i32 1, i32 2
  %_lhs1104 = load i32* %elt1101
  %bop1105 = add i32 %_lhs1097, %_lhs1104
  %array_ptr1106 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 3 )
  %array1107 = bitcast { i32, [ 0 x i32 ] }* %array_ptr1106 to { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* 
  %_tmp11071109 = alloca i32
  store i32 3, i32* %_tmp11071109
  %_tmp11091111 = alloca { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }*
  store { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array1107, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %_tmp11091111
  %i1112 = alloca i32
  store i32 0, i32* %i1112
  br label %__cond239

__cond239:
  %_lhs1113 = load i32* %i1112
  %_lhs1114 = load i32* %_tmp11071109
  %bop1115 = icmp slt i32 %_lhs1113, %_lhs1114
  br i1 %bop1115, label %__body238, label %__post237

__fresh252:
  br label %__body238

__body238:
  %_lhs1116 = load i32* %i1112
  %bound_ptr1118 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %_tmp11091111, i32 0, i32 0
  %bound1119 = load i32* %bound_ptr1118
  call void @oat_array_bounds_check( i32 %bound1119, i32 %_lhs1116 )
  %elt1117 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %_tmp11091111, i32 0, i32 1, i32 %_lhs1116
  %array_ptr1120 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 3 )
  %array1121 = bitcast { i32, [ 0 x i32 ] }* %array_ptr1120 to { i32, [ 0 x i32 ] }* 
  %_tmp11211123 = alloca i32
  store i32 3, i32* %_tmp11211123
  %_tmp11231125 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array1121, { i32, [ 0 x i32 ] }** %_tmp11231125
  %j1126 = alloca i32
  store i32 0, i32* %j1126
  br label %__cond242

__cond242:
  %_lhs1127 = load i32* %j1126
  %_lhs1128 = load i32* %_tmp11211123
  %bop1129 = icmp slt i32 %_lhs1127, %_lhs1128
  br i1 %bop1129, label %__body241, label %__post240

__fresh253:
  br label %__body241

__body241:
  %_lhs1130 = load i32* %j1126
  %bound_ptr1132 = getelementptr { i32, [ 0 x i32 ] }** %_tmp11231125, i32 0, i32 0
  %bound1133 = load i32* %bound_ptr1132
  call void @oat_array_bounds_check( i32 %bound1133, i32 %_lhs1130 )
  %elt1131 = getelementptr { i32, [ 0 x i32 ] }** %_tmp11231125, i32 0, i32 1, i32 %_lhs1130
  %_lhs1134 = load i32* %i1112
  %_lhs1135 = load i32* %j1126
  %bop1136 = mul i32 %_lhs1134, %_lhs1135
  store i32 %bop1136, i32* %elt1131
  %_lhs1137 = load i32* %j1126
  %bop1138 = add i32 %_lhs1137, 1
  store i32 %bop1138, i32* %j1126
  br label %__cond242

__fresh254:
  br label %__post240

__post240:
  store { i32, [ 0 x i32 ] }* %array1121, { i32, [ 0 x i32 ] }** %elt1117
  %_lhs1139 = load i32* %i1112
  %bop1140 = add i32 %_lhs1139, 1
  store i32 %bop1140, i32* %i1112
  br label %__cond239

__fresh255:
  br label %__post237

__post237:
  %ret1141 = call i32 @f ( { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array1107 )
  %bop1142 = add i32 %bop1105, %ret1141
  %ret1143 = call i32 @g ( i32 4 )
  %bop1144 = add i32 %bop1142, %ret1143
  ret i32 %bop1144
}


define i32 @g (i32 %x974){

__fresh220:
  %x_slot975 = alloca i32
  store i32 %x974, i32* %x_slot975
  %array_ptr976 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 3 )
  %array977 = bitcast { i32, [ 0 x i32 ] }* %array_ptr976 to { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* 
  %_tmp977979 = alloca i32
  store i32 3, i32* %_tmp977979
  %_tmp979981 = alloca { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }*
  store { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array977, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %_tmp979981
  %i982 = alloca i32
  store i32 0, i32* %i982
  br label %__cond216

__cond216:
  %_lhs983 = load i32* %i982
  %_lhs984 = load i32* %_tmp977979
  %bop985 = icmp slt i32 %_lhs983, %_lhs984
  br i1 %bop985, label %__body215, label %__post214

__fresh221:
  br label %__body215

__body215:
  %_lhs986 = load i32* %i982
  %bound_ptr988 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %_tmp979981, i32 0, i32 0
  %bound989 = load i32* %bound_ptr988
  call void @oat_array_bounds_check( i32 %bound989, i32 %_lhs986 )
  %elt987 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %_tmp979981, i32 0, i32 1, i32 %_lhs986
  %array_ptr990 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 3 )
  %array991 = bitcast { i32, [ 0 x i32 ] }* %array_ptr990 to { i32, [ 0 x i32 ] }* 
  %_tmp991993 = alloca i32
  store i32 3, i32* %_tmp991993
  %_tmp993995 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array991, { i32, [ 0 x i32 ] }** %_tmp993995
  %j996 = alloca i32
  store i32 0, i32* %j996
  br label %__cond219

__cond219:
  %_lhs997 = load i32* %j996
  %_lhs998 = load i32* %_tmp991993
  %bop999 = icmp slt i32 %_lhs997, %_lhs998
  br i1 %bop999, label %__body218, label %__post217

__fresh222:
  br label %__body218

__body218:
  %_lhs1000 = load i32* %j996
  %bound_ptr1002 = getelementptr { i32, [ 0 x i32 ] }** %_tmp993995, i32 0, i32 0
  %bound1003 = load i32* %bound_ptr1002
  call void @oat_array_bounds_check( i32 %bound1003, i32 %_lhs1000 )
  %elt1001 = getelementptr { i32, [ 0 x i32 ] }** %_tmp993995, i32 0, i32 1, i32 %_lhs1000
  %_lhs1004 = load i32* %x_slot975
  store i32 %_lhs1004, i32* %elt1001
  %_lhs1005 = load i32* %j996
  %bop1006 = add i32 %_lhs1005, 1
  store i32 %bop1006, i32* %j996
  br label %__cond219

__fresh223:
  br label %__post217

__post217:
  store { i32, [ 0 x i32 ] }* %array991, { i32, [ 0 x i32 ] }** %elt987
  %_lhs1007 = load i32* %i982
  %bop1008 = add i32 %_lhs1007, 1
  store i32 %bop1008, i32* %i982
  br label %__cond216

__fresh224:
  br label %__post214

__post214:
  %arr1009 = alloca { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }*
  store { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array977, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %arr1009
  %bound_ptr1011 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %arr1009, i32 0, i32 0
  %bound1012 = load i32* %bound_ptr1011
  call void @oat_array_bounds_check( i32 %bound1012, i32 1 )
  %elt1010 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %arr1009, i32 0, i32 1, i32 1
  %bound_ptr1014 = getelementptr { i32, [ 0 x i32 ] }** %elt1010, i32 0, i32 0
  %bound1015 = load i32* %bound_ptr1014
  call void @oat_array_bounds_check( i32 %bound1015, i32 1 )
  %elt1013 = getelementptr { i32, [ 0 x i32 ] }** %elt1010, i32 0, i32 1, i32 1
  %_lhs1016 = load i32* %elt1013
  ret i32 %_lhs1016
}


define i32 @f ({ i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %a965){

__fresh213:
  %a_slot966 = alloca { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }*
  store { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %a965, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a_slot966
  %bound_ptr968 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a_slot966, i32 0, i32 0
  %bound969 = load i32* %bound_ptr968
  call void @oat_array_bounds_check( i32 %bound969, i32 1 )
  %elt967 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** %a_slot966, i32 0, i32 1, i32 1
  %bound_ptr971 = getelementptr { i32, [ 0 x i32 ] }** %elt967, i32 0, i32 0
  %bound972 = load i32* %bound_ptr971
  call void @oat_array_bounds_check( i32 %bound972, i32 1 )
  %elt970 = getelementptr { i32, [ 0 x i32 ] }** %elt967, i32 0, i32 1, i32 1
  %_lhs973 = load i32* %elt970
  ret i32 %_lhs973
}


