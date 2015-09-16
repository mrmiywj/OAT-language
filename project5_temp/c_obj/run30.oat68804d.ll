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
@_const_str172.str. = private unnamed_addr constant [ 3 x i8 ] c "no\00", align 4
@_const_str172 = alias bitcast([ 3 x i8 ]* @_const_str172.str. to i8*)@_const_str173.str. = private unnamed_addr constant [ 4 x i8 ] c "yes\00", align 4
@_const_str173 = alias bitcast([ 4 x i8 ]* @_const_str173.str. to i8*)@_const_str171.str. = private unnamed_addr constant [ 2 x i8 ] c "C\00", align 4
@_const_str171 = alias bitcast([ 2 x i8 ]* @_const_str171.str. to i8*)@_const_str170.str. = private unnamed_addr constant [ 2 x i8 ] c "B\00", align 4
@_const_str170 = alias bitcast([ 2 x i8 ]* @_const_str170.str. to i8*)@_const_str169.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str169 = alias bitcast([ 2 x i8 ]* @_const_str169.str. to i8*)@_const_str168.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str168 = alias bitcast([ 7 x i8 ]* @_const_str168.str. to i8*)@_C_vtable167 = private constant %_C_vtable {%_B_vtable* @_B_vtable166, i8* (%Object*)* @_Object_get_name}, align 4
@_B_vtable166 = private constant %_B_vtable {%_A_vtable* @_A_vtable165, i8* (%Object*)* @_Object_get_name}, align 4
@_A_vtable165 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable164, i8* (%Object*)* @_Object_get_name}, align 4
@_Object_vtable164 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh275:
  ret void
}


define i32 @program (i32 %argc877, { i32, [ 0 x i8* ] }* %argv875){
__fresh270:
  %argc_slot878 = alloca i32
  store i32 %argc877, i32* %argc_slot878
  %argv_slot876 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv875, { i32, [ 0 x i8* ] }** %argv_slot876
  %mem_ptr879 = call i32* @oat_malloc ( i32 12 )
  %obj880 = bitcast i32* %mem_ptr879 to %B* 
  %new_obj881 = call %B* @_B_ctor ( %B* %obj880 )
  %cast_op882 = bitcast %B* %new_obj881 to %A* 
  %vdecl_slot883 = alloca %A*
  store %A* %cast_op882, %A** %vdecl_slot883
  %unop884 = sub i32 0, 1
  %vdecl_slot885 = alloca i32
  store i32 %unop884, i32* %vdecl_slot885
  %lhs_or_call886 = load %A** %vdecl_slot883
  %cast_op887 = bitcast %A* %lhs_or_call886 to %C* 
  %cast_op888 = bitcast %C* %cast_op887 to i8** 
  %cast_op889 = bitcast %_C_vtable* @_C_vtable167 to i8* 
  %vt_ptr_slot890 = alloca i8*
  %tmp0892 = load i8** %cast_op888
  store i8* %tmp0892, i8** %vt_ptr_slot890
  br label %__loop269

__loop269:
  %tmp1893 = load i8** %vt_ptr_slot890
  %guard1897 = icmp eq i8* %tmp1893, %cast_op889
  br i1 %guard1897, label %__then266, label %__fall1268

__fresh271:
  br label %__fall1268

__fall1268:
  %guard2898 = icmp eq i8* %tmp1893, null
  br i1 %guard2898, label %__else265, label %__fall2267

__fresh272:
  br label %__fall2267

__fall2267:
  %tmp2894 = load i8** %vt_ptr_slot890
  %tmp3895 = bitcast i8* %tmp2894 to i8** 
  %tmp4896 = load i8** %tmp3895
  store i8* %tmp4896, i8** %vt_ptr_slot890
  br label %__loop269

__fresh273:
  br label %__then266

__then266:
  %var_slot891 = alloca %C*
  store %C* %cast_op887, %C** %var_slot891
  call void @print_string( i8* @_const_str173 )
  %lhs_or_call902 = load %C** %var_slot891
  %path903 = getelementptr %C* %lhs_or_call902, i32 0, i32 2
  %lhs_or_call904 = load i32* %path903
  store i32 %lhs_or_call904, i32* %vdecl_slot885
  br label %__done264

__fresh274:
  br label %__else265

__else265:
  call void @print_string( i8* @_const_str172 )
  %lhs_or_call899 = load %A** %vdecl_slot883
  %path900 = getelementptr %A* %lhs_or_call899, i32 0, i32 2
  %lhs_or_call901 = load i32* %path900
  store i32 %lhs_or_call901, i32* %vdecl_slot885
  br label %__done264

__done264:
  %lhs_or_call905 = load i32* %vdecl_slot885
  ret i32 %lhs_or_call905
}


define %C* @_C_ctor (%C* %_this1){
__fresh263:
  %cast_op870 = bitcast %C* %_this1 to %B* 
  %dummy871 = call %B* @_B_ctor ( %B* %cast_op870 )
  %path872 = getelementptr %C* %_this1, i32 0, i32 1
  store i8* @_const_str171, i8** %path872
  %vt_slot873 = getelementptr %C* %_this1, i32 0, i32 0
  store %_C_vtable* @_C_vtable167, %_C_vtable** %vt_slot873
  %path874 = getelementptr %C* %_this1, i32 0, i32 2
  store i32 2, i32* %path874
  ret %C* %_this1
}


define %B* @_B_ctor (%B* %_this1){
__fresh262:
  %cast_op865 = bitcast %B* %_this1 to %A* 
  %dummy866 = call %A* @_A_ctor ( %A* %cast_op865 )
  %path867 = getelementptr %B* %_this1, i32 0, i32 1
  store i8* @_const_str170, i8** %path867
  %vt_slot868 = getelementptr %B* %_this1, i32 0, i32 0
  store %_B_vtable* @_B_vtable166, %_B_vtable** %vt_slot868
  %path869 = getelementptr %B* %_this1, i32 0, i32 2
  store i32 1, i32* %path869
  ret %B* %_this1
}


define %A* @_A_ctor (%A* %_this1){
__fresh261:
  %cast_op860 = bitcast %A* %_this1 to %Object* 
  %dummy861 = call %Object* @_Object_ctor ( %Object* %cast_op860 )
  %path862 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str169, i8** %path862
  %vt_slot863 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable165, %_A_vtable** %vt_slot863
  %path864 = getelementptr %A* %_this1, i32 0, i32 2
  store i32 0, i32* %path864
  ret %A* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh260:
  %path858 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call859 = load i8** %path858
  ret i8* %lhs_or_call859
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh259:
  %path856 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str168, i8** %path856
  %vt_slot857 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable164, %_Object_vtable** %vt_slot857
  ret %Object* %_this1
}


