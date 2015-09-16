%Point = type { %_Point_vtable*, i8*, i32, i32 }
%_Point_vtable = type { %_Object_vtable*, i8* (%Object*)*, %Point* (%Point*, i32, i32)* }
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
@_const_str523.str. = private unnamed_addr constant [ 6 x i8 ] c "Point\00", align 4
@_const_str523 = alias bitcast([ 6 x i8 ]* @_const_str523.str. to i8*)@_const_str522.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str522 = alias bitcast([ 7 x i8 ]* @_const_str522.str. to i8*)@_Point_vtable521 = private constant %_Point_vtable {%_Object_vtable* @_Object_vtable520, i8* (%Object*)* @_Object_get_name, %Point* (%Point*, i32, i32)* @_Point_move}, align 4
@_Object_vtable520 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh800:
  ret void
}


define i32 @program (i32 %argc2911, { i32, [ 0 x i8* ] }* %argv2909){
__fresh799:
  %argc_slot2912 = alloca i32
  store i32 %argc2911, i32* %argc_slot2912
  %argv_slot2910 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv2909, { i32, [ 0 x i8* ] }** %argv_slot2910
  %mem_ptr2913 = call i32* @oat_malloc ( i32 16 )
  %obj2914 = bitcast i32* %mem_ptr2913 to %Point* 
  %new_obj2915 = call %Point* @_Point_ctor ( %Point* %obj2914 )
  %vdecl_slot2916 = alloca %Point*
  store %Point* %new_obj2915, %Point** %vdecl_slot2916
  %lhs_or_call2917 = load %Point** %vdecl_slot2916
  %vtmp2919 = getelementptr %Point* %lhs_or_call2917, i32 0, i32 0
  %vtable2918 = load %_Point_vtable** %vtmp2919
  %fptmp2920 = getelementptr %_Point_vtable* %vtable2918, i32 0, i32 2
  %method2921 = load %Point* (%Point*, i32, i32)** %fptmp2920
  %ret2922 = call %Point* %method2921 ( %Point* %lhs_or_call2917, i32 3, i32 4 )
  %vdecl_slot2923 = alloca %Point*
  store %Point* %ret2922, %Point** %vdecl_slot2923
  %lhs_or_call2924 = load %Point** %vdecl_slot2923
  %path2925 = getelementptr %Point* %lhs_or_call2924, i32 0, i32 2
  %lhs_or_call2926 = load i32* %path2925
  ret i32 %lhs_or_call2926
}


define %Point* @_Point_move (%Point* %_this1, i32 %dx2897, i32 %dy2895){
__fresh798:
  %dx_slot2898 = alloca i32
  store i32 %dx2897, i32* %dx_slot2898
  %dy_slot2896 = alloca i32
  store i32 %dy2895, i32* %dy_slot2896
  %path2899 = getelementptr %Point* %_this1, i32 0, i32 2
  %path2900 = getelementptr %Point* %_this1, i32 0, i32 2
  %lhs_or_call2901 = load i32* %path2900
  %lhs_or_call2902 = load i32* %dx_slot2898
  %bop2903 = add i32 %lhs_or_call2901, %lhs_or_call2902
  store i32 %bop2903, i32* %path2899
  %path2904 = getelementptr %Point* %_this1, i32 0, i32 3
  %path2905 = getelementptr %Point* %_this1, i32 0, i32 3
  %lhs_or_call2906 = load i32* %path2905
  %lhs_or_call2907 = load i32* %dy_slot2896
  %bop2908 = add i32 %lhs_or_call2906, %lhs_or_call2907
  store i32 %bop2908, i32* %path2904
  ret %Point* %_this1
}


define %Point* @_Point_ctor (%Point* %_this1){
__fresh797:
  %cast_op2889 = bitcast %Point* %_this1 to %Object* 
  %dummy2890 = call %Object* @_Object_ctor ( %Object* %cast_op2889 )
  %path2891 = getelementptr %Point* %_this1, i32 0, i32 1
  store i8* @_const_str523, i8** %path2891
  %vt_slot2892 = getelementptr %Point* %_this1, i32 0, i32 0
  store %_Point_vtable* @_Point_vtable521, %_Point_vtable** %vt_slot2892
  %path2893 = getelementptr %Point* %_this1, i32 0, i32 2
  store i32 0, i32* %path2893
  %path2894 = getelementptr %Point* %_this1, i32 0, i32 3
  store i32 0, i32* %path2894
  ret %Point* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh796:
  %path2887 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call2888 = load i8** %path2887
  ret i8* %lhs_or_call2888
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh795:
  %path2885 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str522, i8** %path2885
  %vt_slot2886 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable520, %_Object_vtable** %vt_slot2886
  ret %Object* %_this1
}


