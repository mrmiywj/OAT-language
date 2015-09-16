%G = type { %_G_vtable*, i8* }
%_G_vtable = type { %_D_vtable*, i8* (%Object*)* }
%F = type { %_F_vtable*, i8* }
%_F_vtable = type { %_B_vtable*, i8* (%Object*)* }
%E = type { %_E_vtable*, i8* }
%_E_vtable = type { %_Object_vtable*, i8* (%Object*)* }
%D = type { %_D_vtable*, i8* }
%_D_vtable = type { %_C_vtable*, i8* (%Object*)* }
%C = type { %_C_vtable*, i8* }
%_C_vtable = type { %_B_vtable*, i8* (%Object*)* }
%B = type { %_B_vtable*, i8* }
%_B_vtable = type { %_Object_vtable*, i8* (%Object*)* }
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
@_const_str342.str. = private unnamed_addr constant [ 2 x i8 ] c "G\00", align 4
@_const_str342 = alias bitcast([ 2 x i8 ]* @_const_str342.str. to i8*)@_const_str341.str. = private unnamed_addr constant [ 2 x i8 ] c "F\00", align 4
@_const_str341 = alias bitcast([ 2 x i8 ]* @_const_str341.str. to i8*)@_const_str340.str. = private unnamed_addr constant [ 2 x i8 ] c "E\00", align 4
@_const_str340 = alias bitcast([ 2 x i8 ]* @_const_str340.str. to i8*)@_const_str339.str. = private unnamed_addr constant [ 2 x i8 ] c "D\00", align 4
@_const_str339 = alias bitcast([ 2 x i8 ]* @_const_str339.str. to i8*)@_const_str338.str. = private unnamed_addr constant [ 2 x i8 ] c "C\00", align 4
@_const_str338 = alias bitcast([ 2 x i8 ]* @_const_str338.str. to i8*)@_const_str337.str. = private unnamed_addr constant [ 2 x i8 ] c "B\00", align 4
@_const_str337 = alias bitcast([ 2 x i8 ]* @_const_str337.str. to i8*)@_const_str336.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str336 = alias bitcast([ 2 x i8 ]* @_const_str336.str. to i8*)@_const_str335.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str335 = alias bitcast([ 7 x i8 ]* @_const_str335.str. to i8*)@_G_vtable334 = private constant %_G_vtable {%_D_vtable* @_D_vtable331, i8* (%Object*)* @_Object_get_name}, align 4
@_F_vtable333 = private constant %_F_vtable {%_B_vtable* @_B_vtable329, i8* (%Object*)* @_Object_get_name}, align 4
@_E_vtable332 = private constant %_E_vtable {%_Object_vtable* @_Object_vtable327, i8* (%Object*)* @_Object_get_name}, align 4
@_D_vtable331 = private constant %_D_vtable {%_C_vtable* @_C_vtable330, i8* (%Object*)* @_Object_get_name}, align 4
@_C_vtable330 = private constant %_C_vtable {%_B_vtable* @_B_vtable329, i8* (%Object*)* @_Object_get_name}, align 4
@_B_vtable329 = private constant %_B_vtable {%_Object_vtable* @_Object_vtable327, i8* (%Object*)* @_Object_get_name}, align 4
@_A_vtable328 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable327, i8* (%Object*)* @_Object_get_name}, align 4
@_Object_vtable327 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh564:
  ret void
}


define i32 @program (i32 %argc1953, { i32, [ 0 x i8* ] }* %argv1951){
__fresh563:
  %argc_slot1954 = alloca i32
  store i32 %argc1953, i32* %argc_slot1954
  %argv_slot1952 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv1951, { i32, [ 0 x i8* ] }** %argv_slot1952
  %mem_ptr1955 = call i32* @oat_malloc ( i32 8 )
  %obj1956 = bitcast i32* %mem_ptr1955 to %Object* 
  %new_obj1957 = call %Object* @_Object_ctor ( %Object* %obj1956 )
  %vdecl_slot1958 = alloca %Object*
  store %Object* %new_obj1957, %Object** %vdecl_slot1958
  %mem_ptr1959 = call i32* @oat_malloc ( i32 8 )
  %obj1960 = bitcast i32* %mem_ptr1959 to %A* 
  %new_obj1961 = call %A* @_A_ctor ( %A* %obj1960 )
  %vdecl_slot1962 = alloca %A*
  store %A* %new_obj1961, %A** %vdecl_slot1962
  %mem_ptr1963 = call i32* @oat_malloc ( i32 8 )
  %obj1964 = bitcast i32* %mem_ptr1963 to %B* 
  %new_obj1965 = call %B* @_B_ctor ( %B* %obj1964 )
  %vdecl_slot1966 = alloca %B*
  store %B* %new_obj1965, %B** %vdecl_slot1966
  %mem_ptr1967 = call i32* @oat_malloc ( i32 8 )
  %obj1968 = bitcast i32* %mem_ptr1967 to %C* 
  %new_obj1969 = call %C* @_C_ctor ( %C* %obj1968 )
  %cast_op1970 = bitcast %C* %new_obj1969 to %B* 
  %vdecl_slot1971 = alloca %B*
  store %B* %cast_op1970, %B** %vdecl_slot1971
  %mem_ptr1972 = call i32* @oat_malloc ( i32 8 )
  %obj1973 = bitcast i32* %mem_ptr1972 to %D* 
  %new_obj1974 = call %D* @_D_ctor ( %D* %obj1973 )
  %cast_op1975 = bitcast %D* %new_obj1974 to %B* 
  %vdecl_slot1976 = alloca %B*
  store %B* %cast_op1975, %B** %vdecl_slot1976
  %mem_ptr1977 = call i32* @oat_malloc ( i32 8 )
  %obj1978 = bitcast i32* %mem_ptr1977 to %E* 
  %new_obj1979 = call %E* @_E_ctor ( %E* %obj1978 )
  %vdecl_slot1980 = alloca %E*
  store %E* %new_obj1979, %E** %vdecl_slot1980
  %mem_ptr1981 = call i32* @oat_malloc ( i32 8 )
  %obj1982 = bitcast i32* %mem_ptr1981 to %F* 
  %new_obj1983 = call %F* @_F_ctor ( %F* %obj1982 )
  %cast_op1984 = bitcast %F* %new_obj1983 to %B* 
  %vdecl_slot1985 = alloca %B*
  store %B* %cast_op1984, %B** %vdecl_slot1985
  %mem_ptr1986 = call i32* @oat_malloc ( i32 8 )
  %obj1987 = bitcast i32* %mem_ptr1986 to %G* 
  %new_obj1988 = call %G* @_G_ctor ( %G* %obj1987 )
  %vdecl_slot1989 = alloca %G*
  store %G* %new_obj1988, %G** %vdecl_slot1989
  %lhs_or_call1990 = load %Object** %vdecl_slot1958
  %vtmp1992 = getelementptr %Object* %lhs_or_call1990, i32 0, i32 0
  %vtable1991 = load %_Object_vtable** %vtmp1992
  %fptmp1993 = getelementptr %_Object_vtable* %vtable1991, i32 0, i32 1
  %method1994 = load i8* (%Object*)** %fptmp1993
  %ret1995 = call i8* %method1994 ( %Object* %lhs_or_call1990 )
  call void @print_string( i8* %ret1995 )
  %lhs_or_call1996 = load %A** %vdecl_slot1962
  %vtmp1998 = getelementptr %A* %lhs_or_call1996, i32 0, i32 0
  %vtable1997 = load %_A_vtable** %vtmp1998
  %fptmp1999 = getelementptr %_A_vtable* %vtable1997, i32 0, i32 1
  %method2000 = load i8* (%Object*)** %fptmp1999
  %cast_op2001 = bitcast %A* %lhs_or_call1996 to %Object* 
  %ret2002 = call i8* %method2000 ( %Object* %cast_op2001 )
  call void @print_string( i8* %ret2002 )
  %lhs_or_call2003 = load %B** %vdecl_slot1966
  %vtmp2005 = getelementptr %B* %lhs_or_call2003, i32 0, i32 0
  %vtable2004 = load %_B_vtable** %vtmp2005
  %fptmp2006 = getelementptr %_B_vtable* %vtable2004, i32 0, i32 1
  %method2007 = load i8* (%Object*)** %fptmp2006
  %cast_op2008 = bitcast %B* %lhs_or_call2003 to %Object* 
  %ret2009 = call i8* %method2007 ( %Object* %cast_op2008 )
  call void @print_string( i8* %ret2009 )
  %lhs_or_call2010 = load %B** %vdecl_slot1971
  %vtmp2012 = getelementptr %B* %lhs_or_call2010, i32 0, i32 0
  %vtable2011 = load %_B_vtable** %vtmp2012
  %fptmp2013 = getelementptr %_B_vtable* %vtable2011, i32 0, i32 1
  %method2014 = load i8* (%Object*)** %fptmp2013
  %cast_op2015 = bitcast %B* %lhs_or_call2010 to %Object* 
  %ret2016 = call i8* %method2014 ( %Object* %cast_op2015 )
  call void @print_string( i8* %ret2016 )
  %lhs_or_call2017 = load %B** %vdecl_slot1976
  %vtmp2019 = getelementptr %B* %lhs_or_call2017, i32 0, i32 0
  %vtable2018 = load %_B_vtable** %vtmp2019
  %fptmp2020 = getelementptr %_B_vtable* %vtable2018, i32 0, i32 1
  %method2021 = load i8* (%Object*)** %fptmp2020
  %cast_op2022 = bitcast %B* %lhs_or_call2017 to %Object* 
  %ret2023 = call i8* %method2021 ( %Object* %cast_op2022 )
  call void @print_string( i8* %ret2023 )
  %lhs_or_call2024 = load %E** %vdecl_slot1980
  %vtmp2026 = getelementptr %E* %lhs_or_call2024, i32 0, i32 0
  %vtable2025 = load %_E_vtable** %vtmp2026
  %fptmp2027 = getelementptr %_E_vtable* %vtable2025, i32 0, i32 1
  %method2028 = load i8* (%Object*)** %fptmp2027
  %cast_op2029 = bitcast %E* %lhs_or_call2024 to %Object* 
  %ret2030 = call i8* %method2028 ( %Object* %cast_op2029 )
  call void @print_string( i8* %ret2030 )
  %lhs_or_call2031 = load %B** %vdecl_slot1985
  %vtmp2033 = getelementptr %B* %lhs_or_call2031, i32 0, i32 0
  %vtable2032 = load %_B_vtable** %vtmp2033
  %fptmp2034 = getelementptr %_B_vtable* %vtable2032, i32 0, i32 1
  %method2035 = load i8* (%Object*)** %fptmp2034
  %cast_op2036 = bitcast %B* %lhs_or_call2031 to %Object* 
  %ret2037 = call i8* %method2035 ( %Object* %cast_op2036 )
  call void @print_string( i8* %ret2037 )
  %lhs_or_call2038 = load %G** %vdecl_slot1989
  %vtmp2040 = getelementptr %G* %lhs_or_call2038, i32 0, i32 0
  %vtable2039 = load %_G_vtable** %vtmp2040
  %fptmp2041 = getelementptr %_G_vtable* %vtable2039, i32 0, i32 1
  %method2042 = load i8* (%Object*)** %fptmp2041
  %cast_op2043 = bitcast %G* %lhs_or_call2038 to %Object* 
  %ret2044 = call i8* %method2042 ( %Object* %cast_op2043 )
  call void @print_string( i8* %ret2044 )
  ret i32 0
}


define %G* @_G_ctor (%G* %_this1){
__fresh562:
  %cast_op1947 = bitcast %G* %_this1 to %D* 
  %dummy1948 = call %D* @_D_ctor ( %D* %cast_op1947 )
  %path1949 = getelementptr %G* %_this1, i32 0, i32 1
  store i8* @_const_str342, i8** %path1949
  %vt_slot1950 = getelementptr %G* %_this1, i32 0, i32 0
  store %_G_vtable* @_G_vtable334, %_G_vtable** %vt_slot1950
  ret %G* %_this1
}


define %F* @_F_ctor (%F* %_this1){
__fresh561:
  %cast_op1943 = bitcast %F* %_this1 to %B* 
  %dummy1944 = call %B* @_B_ctor ( %B* %cast_op1943 )
  %path1945 = getelementptr %F* %_this1, i32 0, i32 1
  store i8* @_const_str341, i8** %path1945
  %vt_slot1946 = getelementptr %F* %_this1, i32 0, i32 0
  store %_F_vtable* @_F_vtable333, %_F_vtable** %vt_slot1946
  ret %F* %_this1
}


define %E* @_E_ctor (%E* %_this1){
__fresh560:
  %cast_op1939 = bitcast %E* %_this1 to %Object* 
  %dummy1940 = call %Object* @_Object_ctor ( %Object* %cast_op1939 )
  %path1941 = getelementptr %E* %_this1, i32 0, i32 1
  store i8* @_const_str340, i8** %path1941
  %vt_slot1942 = getelementptr %E* %_this1, i32 0, i32 0
  store %_E_vtable* @_E_vtable332, %_E_vtable** %vt_slot1942
  ret %E* %_this1
}


define %D* @_D_ctor (%D* %_this1){
__fresh559:
  %cast_op1935 = bitcast %D* %_this1 to %C* 
  %dummy1936 = call %C* @_C_ctor ( %C* %cast_op1935 )
  %path1937 = getelementptr %D* %_this1, i32 0, i32 1
  store i8* @_const_str339, i8** %path1937
  %vt_slot1938 = getelementptr %D* %_this1, i32 0, i32 0
  store %_D_vtable* @_D_vtable331, %_D_vtable** %vt_slot1938
  ret %D* %_this1
}


define %C* @_C_ctor (%C* %_this1){
__fresh558:
  %cast_op1931 = bitcast %C* %_this1 to %B* 
  %dummy1932 = call %B* @_B_ctor ( %B* %cast_op1931 )
  %path1933 = getelementptr %C* %_this1, i32 0, i32 1
  store i8* @_const_str338, i8** %path1933
  %vt_slot1934 = getelementptr %C* %_this1, i32 0, i32 0
  store %_C_vtable* @_C_vtable330, %_C_vtable** %vt_slot1934
  ret %C* %_this1
}


define %B* @_B_ctor (%B* %_this1){
__fresh557:
  %cast_op1927 = bitcast %B* %_this1 to %Object* 
  %dummy1928 = call %Object* @_Object_ctor ( %Object* %cast_op1927 )
  %path1929 = getelementptr %B* %_this1, i32 0, i32 1
  store i8* @_const_str337, i8** %path1929
  %vt_slot1930 = getelementptr %B* %_this1, i32 0, i32 0
  store %_B_vtable* @_B_vtable329, %_B_vtable** %vt_slot1930
  ret %B* %_this1
}


define %A* @_A_ctor (%A* %_this1){
__fresh556:
  %cast_op1923 = bitcast %A* %_this1 to %Object* 
  %dummy1924 = call %Object* @_Object_ctor ( %Object* %cast_op1923 )
  %path1925 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str336, i8** %path1925
  %vt_slot1926 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable328, %_A_vtable** %vt_slot1926
  ret %A* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh555:
  %path1921 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call1922 = load i8** %path1921
  ret i8* %lhs_or_call1922
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh554:
  %path1919 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str335, i8** %path1919
  %vt_slot1920 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable327, %_Object_vtable** %vt_slot1920
  ret %Object* %_this1
}


