%A = type { %_A_vtable*, i8* }
%_A_vtable = type { %_Object_vtable*, i8* (%Object*)*, void (%A*)* }
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
@a3325 = global %A* zeroinitializer, align 4		; initialized by @a3325.init326
@a2323 = global %A* zeroinitializer, align 4		; initialized by @a2323.init324
@a1321 = global %A* zeroinitializer, align 4		; initialized by @a1321.init322
@_const_str320.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str320 = alias bitcast([ 2 x i8 ]* @_const_str320.str. to i8*)@_const_str319.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str319 = alias bitcast([ 2 x i8 ]* @_const_str319.str. to i8*)@_const_str318.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str318 = alias bitcast([ 7 x i8 ]* @_const_str318.str. to i8*)@_A_vtable317 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable316, i8* (%Object*)* @_Object_get_name, void (%A*)* @_A_print}, align 4
@_Object_vtable316 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh553:
  call void @a1321.init322(  )
  call void @a2323.init324(  )
  call void @a3325.init326(  )
  ret void
}


define i32 @program (i32 %argc1893, { i32, [ 0 x i8* ] }* %argv1891){
__fresh552:
  %argc_slot1894 = alloca i32
  store i32 %argc1893, i32* %argc_slot1894
  %argv_slot1892 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv1891, { i32, [ 0 x i8* ] }** %argv_slot1892
  %mem_ptr1895 = call i32* @oat_malloc ( i32 8 )
  %obj1896 = bitcast i32* %mem_ptr1895 to %A* 
  %new_obj1897 = call %A* @_A_ctor ( %A* %obj1896 )
  %vdecl_slot1898 = alloca %A*
  store %A* %new_obj1897, %A** %vdecl_slot1898
  %lhs_or_call1899 = load %A** %vdecl_slot1898
  %vtmp1901 = getelementptr %A* %lhs_or_call1899, i32 0, i32 0
  %vtable1900 = load %_A_vtable** %vtmp1901
  %fptmp1902 = getelementptr %_A_vtable* %vtable1900, i32 0, i32 2
  %method1903 = load void (%A*)** %fptmp1902
  call void %method1903( %A* %lhs_or_call1899 )
  %lhs_or_call1904 = load %A** @a1321
  %vtmp1906 = getelementptr %A* %lhs_or_call1904, i32 0, i32 0
  %vtable1905 = load %_A_vtable** %vtmp1906
  %fptmp1907 = getelementptr %_A_vtable* %vtable1905, i32 0, i32 2
  %method1908 = load void (%A*)** %fptmp1907
  call void %method1908( %A* %lhs_or_call1904 )
  %lhs_or_call1909 = load %A** @a2323
  %vtmp1911 = getelementptr %A* %lhs_or_call1909, i32 0, i32 0
  %vtable1910 = load %_A_vtable** %vtmp1911
  %fptmp1912 = getelementptr %_A_vtable* %vtable1910, i32 0, i32 2
  %method1913 = load void (%A*)** %fptmp1912
  call void %method1913( %A* %lhs_or_call1909 )
  %lhs_or_call1914 = load %A** @a3325
  %vtmp1916 = getelementptr %A* %lhs_or_call1914, i32 0, i32 0
  %vtable1915 = load %_A_vtable** %vtmp1916
  %fptmp1917 = getelementptr %_A_vtable* %vtable1915, i32 0, i32 2
  %method1918 = load void (%A*)** %fptmp1917
  call void %method1918( %A* %lhs_or_call1914 )
  ret i32 0
}


define void @a3325.init326 (){
__fresh551:
  %mem_ptr1888 = call i32* @oat_malloc ( i32 8 )
  %obj1889 = bitcast i32* %mem_ptr1888 to %A* 
  %new_obj1890 = call %A* @_A_ctor ( %A* %obj1889 )
  store %A* %new_obj1890, %A** @a3325
  ret void
}


define void @a2323.init324 (){
__fresh550:
  %mem_ptr1885 = call i32* @oat_malloc ( i32 8 )
  %obj1886 = bitcast i32* %mem_ptr1885 to %A* 
  %new_obj1887 = call %A* @_A_ctor ( %A* %obj1886 )
  store %A* %new_obj1887, %A** @a2323
  ret void
}


define void @a1321.init322 (){
__fresh549:
  %mem_ptr1882 = call i32* @oat_malloc ( i32 8 )
  %obj1883 = bitcast i32* %mem_ptr1882 to %A* 
  %new_obj1884 = call %A* @_A_ctor ( %A* %obj1883 )
  store %A* %new_obj1884, %A** @a1321
  ret void
}


define void @_A_print (%A* %_this1){
__fresh548:
  call void @print_string( i8* @_const_str320 )
  ret void
}


define %A* @_A_ctor (%A* %_this1){
__fresh547:
  %cast_op1878 = bitcast %A* %_this1 to %Object* 
  %dummy1879 = call %Object* @_Object_ctor ( %Object* %cast_op1878 )
  %path1880 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str319, i8** %path1880
  %vt_slot1881 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable317, %_A_vtable** %vt_slot1881
  ret %A* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh546:
  %path1876 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call1877 = load i8** %path1876
  ret i8* %lhs_or_call1877
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh545:
  %path1874 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str318, i8** %path1874
  %vt_slot1875 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable316, %_Object_vtable** %vt_slot1875
  ret %Object* %_this1
}


