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
@_const_str162.str. = private unnamed_addr constant [ 3 x i8 ] c "no\00", align 4
@_const_str162 = alias bitcast([ 3 x i8 ]* @_const_str162.str. to i8*)@_const_str163.str. = private unnamed_addr constant [ 4 x i8 ] c "yes\00", align 4
@_const_str163 = alias bitcast([ 4 x i8 ]* @_const_str163.str. to i8*)@_const_str161.str. = private unnamed_addr constant [ 2 x i8 ] c "C\00", align 4
@_const_str161 = alias bitcast([ 2 x i8 ]* @_const_str161.str. to i8*)@_const_str160.str. = private unnamed_addr constant [ 2 x i8 ] c "B\00", align 4
@_const_str160 = alias bitcast([ 2 x i8 ]* @_const_str160.str. to i8*)@_const_str159.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str159 = alias bitcast([ 2 x i8 ]* @_const_str159.str. to i8*)@_const_str158.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str158 = alias bitcast([ 7 x i8 ]* @_const_str158.str. to i8*)@_C_vtable157 = private constant %_C_vtable {%_B_vtable* @_B_vtable156, i8* (%Object*)* @_Object_get_name}, align 4
@_B_vtable156 = private constant %_B_vtable {%_A_vtable* @_A_vtable155, i8* (%Object*)* @_Object_get_name}, align 4
@_A_vtable155 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable154, i8* (%Object*)* @_Object_get_name}, align 4
@_Object_vtable154 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh258:
  ret void
}


define i32 @program (i32 %argc828, { i32, [ 0 x i8* ] }* %argv826){
__fresh253:
  %argc_slot829 = alloca i32
  store i32 %argc828, i32* %argc_slot829
  %argv_slot827 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv826, { i32, [ 0 x i8* ] }** %argv_slot827
  %mem_ptr830 = call i32* @oat_malloc ( i32 12 )
  %obj831 = bitcast i32* %mem_ptr830 to %A* 
  %new_obj832 = call %A* @_A_ctor ( %A* %obj831 )
  %vdecl_slot833 = alloca %A*
  store %A* %new_obj832, %A** %vdecl_slot833
  %unop834 = sub i32 0, 1
  %vdecl_slot835 = alloca i32
  store i32 %unop834, i32* %vdecl_slot835
  %lhs_or_call836 = load %A** %vdecl_slot833
  %cast_op837 = bitcast %A* %lhs_or_call836 to %C* 
  %cast_op838 = bitcast %C* %cast_op837 to i8** 
  %cast_op839 = bitcast %_C_vtable* @_C_vtable157 to i8* 
  %vt_ptr_slot840 = alloca i8*
  %tmp0842 = load i8** %cast_op838
  store i8* %tmp0842, i8** %vt_ptr_slot840
  br label %__loop252

__loop252:
  %tmp1843 = load i8** %vt_ptr_slot840
  %guard1847 = icmp eq i8* %tmp1843, %cast_op839
  br i1 %guard1847, label %__then249, label %__fall1251

__fresh254:
  br label %__fall1251

__fall1251:
  %guard2848 = icmp eq i8* %tmp1843, null
  br i1 %guard2848, label %__else248, label %__fall2250

__fresh255:
  br label %__fall2250

__fall2250:
  %tmp2844 = load i8** %vt_ptr_slot840
  %tmp3845 = bitcast i8* %tmp2844 to i8** 
  %tmp4846 = load i8** %tmp3845
  store i8* %tmp4846, i8** %vt_ptr_slot840
  br label %__loop252

__fresh256:
  br label %__then249

__then249:
  %var_slot841 = alloca %C*
  store %C* %cast_op837, %C** %var_slot841
  call void @print_string( i8* @_const_str163 )
  %lhs_or_call852 = load %C** %var_slot841
  %path853 = getelementptr %C* %lhs_or_call852, i32 0, i32 2
  %lhs_or_call854 = load i32* %path853
  store i32 %lhs_or_call854, i32* %vdecl_slot835
  br label %__done247

__fresh257:
  br label %__else248

__else248:
  call void @print_string( i8* @_const_str162 )
  %lhs_or_call849 = load %A** %vdecl_slot833
  %path850 = getelementptr %A* %lhs_or_call849, i32 0, i32 2
  %lhs_or_call851 = load i32* %path850
  store i32 %lhs_or_call851, i32* %vdecl_slot835
  br label %__done247

__done247:
  %lhs_or_call855 = load i32* %vdecl_slot835
  ret i32 %lhs_or_call855
}


define %C* @_C_ctor (%C* %_this1){
__fresh246:
  %cast_op821 = bitcast %C* %_this1 to %B* 
  %dummy822 = call %B* @_B_ctor ( %B* %cast_op821 )
  %path823 = getelementptr %C* %_this1, i32 0, i32 1
  store i8* @_const_str161, i8** %path823
  %vt_slot824 = getelementptr %C* %_this1, i32 0, i32 0
  store %_C_vtable* @_C_vtable157, %_C_vtable** %vt_slot824
  %path825 = getelementptr %C* %_this1, i32 0, i32 2
  store i32 2, i32* %path825
  ret %C* %_this1
}


define %B* @_B_ctor (%B* %_this1){
__fresh245:
  %cast_op816 = bitcast %B* %_this1 to %A* 
  %dummy817 = call %A* @_A_ctor ( %A* %cast_op816 )
  %path818 = getelementptr %B* %_this1, i32 0, i32 1
  store i8* @_const_str160, i8** %path818
  %vt_slot819 = getelementptr %B* %_this1, i32 0, i32 0
  store %_B_vtable* @_B_vtable156, %_B_vtable** %vt_slot819
  %path820 = getelementptr %B* %_this1, i32 0, i32 2
  store i32 1, i32* %path820
  ret %B* %_this1
}


define %A* @_A_ctor (%A* %_this1){
__fresh244:
  %cast_op811 = bitcast %A* %_this1 to %Object* 
  %dummy812 = call %Object* @_Object_ctor ( %Object* %cast_op811 )
  %path813 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str159, i8** %path813
  %vt_slot814 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable155, %_A_vtable** %vt_slot814
  %path815 = getelementptr %A* %_this1, i32 0, i32 2
  store i32 0, i32* %path815
  ret %A* %_this1
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh243:
  %path809 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call810 = load i8** %path809
  ret i8* %lhs_or_call810
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh242:
  %path807 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str158, i8** %path807
  %vt_slot808 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable154, %_Object_vtable** %vt_slot808
  ret %Object* %_this1
}


