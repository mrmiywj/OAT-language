declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@arr2798 = global { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* zeroinitializer, align 4		; initialized by arr2798.init
@arr1777 = global { i32, [ 0 x i32 ] }* zeroinitializer, align 4		; initialized by arr1777.init
@i771 = global i32 1, align 4
define void @oat_init (){

__fresh188:
  call void @arr1777.init(  )
  call void @arr2798.init(  )
  ret void
}


define i32 @program (i32 %argc815, { i32, [ 0 x i8* ] }* %argv813){

__fresh187:
  %argc_slot816 = alloca i32
  store i32 %argc815, i32* %argc_slot816
  %argv_slot814 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv813, { i32, [ 0 x i8* ] }** %argv_slot814
  %c817 = alloca i32
  store i32 1, i32* %c817
  %ret818 = call { i32, [ 0 x i32 ] }* @g (  )
  %arr4819 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %ret818, { i32, [ 0 x i32 ] }** %arr4819
  %array_ptr820 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 4 )
  %array821 = bitcast { i32, [ 0 x i32 ] }* %array_ptr820 to { i32, [ 0 x i32 ] }* 
  %index_ptr822 = getelementptr { i32, [ 0 x i32 ] }* %array821, i32 0, i32 1, i32 0
  store i32 99, i32* %index_ptr822
  %index_ptr823 = getelementptr { i32, [ 0 x i32 ] }* %array821, i32 0, i32 1, i32 1
  store i32 99, i32* %index_ptr823
  %index_ptr824 = getelementptr { i32, [ 0 x i32 ] }* %array821, i32 0, i32 1, i32 2
  store i32 99, i32* %index_ptr824
  %index_ptr825 = getelementptr { i32, [ 0 x i32 ] }* %array821, i32 0, i32 1, i32 3
  store i32 1, i32* %index_ptr825
  %arr3826 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array821, { i32, [ 0 x i32 ] }** %arr3826
  %_lhs827 = load i32* %c817
  %_lhs828 = load i32* @i771
  %bop829 = add i32 %_lhs827, %_lhs828
  store i32 %bop829, i32* %c817
  %_lhs830 = load i32* %c817
  %bound_ptr832 = getelementptr { i32, [ 0 x i32 ] }** @arr1777, i32 0, i32 0
  %bound833 = load i32* %bound_ptr832
  call void @oat_array_bounds_check( i32 %bound833, i32 1 )
  %elt831 = getelementptr { i32, [ 0 x i32 ] }** @arr1777, i32 0, i32 1, i32 1
  %_lhs834 = load i32* %elt831
  %bop835 = add i32 %_lhs830, %_lhs834
  store i32 %bop835, i32* %c817
  %_lhs836 = load i32* %c817
  %bound_ptr838 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** @arr2798, i32 0, i32 0
  %bound839 = load i32* %bound_ptr838
  call void @oat_array_bounds_check( i32 %bound839, i32 1 )
  %elt837 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** @arr2798, i32 0, i32 1, i32 1
  %bound_ptr841 = getelementptr { i32, [ 0 x i32 ] }** %elt837, i32 0, i32 0
  %bound842 = load i32* %bound_ptr841
  call void @oat_array_bounds_check( i32 %bound842, i32 1 )
  %elt840 = getelementptr { i32, [ 0 x i32 ] }** %elt837, i32 0, i32 1, i32 1
  %_lhs843 = load i32* %elt840
  %bop844 = add i32 %_lhs836, %_lhs843
  store i32 %bop844, i32* %c817
  %_lhs845 = load i32* %c817
  %bound_ptr847 = getelementptr { i32, [ 0 x i32 ] }** %arr3826, i32 0, i32 0
  %bound848 = load i32* %bound_ptr847
  call void @oat_array_bounds_check( i32 %bound848, i32 3 )
  %elt846 = getelementptr { i32, [ 0 x i32 ] }** %arr3826, i32 0, i32 1, i32 3
  %_lhs849 = load i32* %elt846
  %bop850 = add i32 %_lhs845, %_lhs849
  store i32 %bop850, i32* %c817
  %_lhs851 = load i32* %c817
  %_lhs852 = load { i32, [ 0 x i32 ] }** %arr3826
  %ret853 = call i32 @f ( { i32, [ 0 x i32 ] }* %_lhs852 )
  %bop854 = add i32 %_lhs851, %ret853
  store i32 %bop854, i32* %c817
  %_lhs855 = load i32* %c817
  %bound_ptr857 = getelementptr { i32, [ 0 x i32 ] }** %arr4819, i32 0, i32 0
  %bound858 = load i32* %bound_ptr857
  call void @oat_array_bounds_check( i32 %bound858, i32 1 )
  %elt856 = getelementptr { i32, [ 0 x i32 ] }** %arr4819, i32 0, i32 1, i32 1
  %_lhs859 = load i32* %elt856
  %bop860 = add i32 %_lhs855, %_lhs859
  store i32 %bop860, i32* %c817
  %_lhs861 = load i32* %c817
  ret i32 %_lhs861
}


define { i32, [ 0 x i32 ] }* @g (){

__fresh186:
  %array_ptr805 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 4 )
  %array806 = bitcast { i32, [ 0 x i32 ] }* %array_ptr805 to { i32, [ 0 x i32 ] }* 
  %index_ptr807 = getelementptr { i32, [ 0 x i32 ] }* %array806, i32 0, i32 1, i32 0
  store i32 99, i32* %index_ptr807
  %index_ptr808 = getelementptr { i32, [ 0 x i32 ] }* %array806, i32 0, i32 1, i32 1
  store i32 1, i32* %index_ptr808
  %index_ptr809 = getelementptr { i32, [ 0 x i32 ] }* %array806, i32 0, i32 1, i32 2
  store i32 99, i32* %index_ptr809
  %index_ptr810 = getelementptr { i32, [ 0 x i32 ] }* %array806, i32 0, i32 1, i32 3
  store i32 99, i32* %index_ptr810
  %arr811 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array806, { i32, [ 0 x i32 ] }** %arr811
  %_lhs812 = load { i32, [ 0 x i32 ] }** %arr811
  ret { i32, [ 0 x i32 ] }* %_lhs812
}


define i32 @f ({ i32, [ 0 x i32 ] }* %arr799){

__fresh185:
  %arr_slot800 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %arr799, { i32, [ 0 x i32 ] }** %arr_slot800
  %bound_ptr802 = getelementptr { i32, [ 0 x i32 ] }** %arr_slot800, i32 0, i32 0
  %bound803 = load i32* %bound_ptr802
  call void @oat_array_bounds_check( i32 %bound803, i32 3 )
  %elt801 = getelementptr { i32, [ 0 x i32 ] }** %arr_slot800, i32 0, i32 1, i32 3
  %_lhs804 = load i32* %elt801
  ret i32 %_lhs804
}


define void @arr2798.init (){

__fresh184:
  %array_ptr778 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 3 )
  %array779 = bitcast { i32, [ 0 x i32 ] }* %array_ptr778 to { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* 
  %array_ptr780 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 3 )
  %array781 = bitcast { i32, [ 0 x i32 ] }* %array_ptr780 to { i32, [ 0 x i32 ] }* 
  %index_ptr782 = getelementptr { i32, [ 0 x i32 ] }* %array781, i32 0, i32 1, i32 0
  store i32 99, i32* %index_ptr782
  %index_ptr783 = getelementptr { i32, [ 0 x i32 ] }* %array781, i32 0, i32 1, i32 1
  store i32 99, i32* %index_ptr783
  %index_ptr784 = getelementptr { i32, [ 0 x i32 ] }* %array781, i32 0, i32 1, i32 2
  store i32 99, i32* %index_ptr784
  %index_ptr785 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array779, i32 0, i32 1, i32 0
  store { i32, [ 0 x i32 ] }* %array781, { i32, [ 0 x i32 ] }** %index_ptr785
  %array_ptr786 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 3 )
  %array787 = bitcast { i32, [ 0 x i32 ] }* %array_ptr786 to { i32, [ 0 x i32 ] }* 
  %index_ptr788 = getelementptr { i32, [ 0 x i32 ] }* %array787, i32 0, i32 1, i32 0
  store i32 99, i32* %index_ptr788
  %index_ptr789 = getelementptr { i32, [ 0 x i32 ] }* %array787, i32 0, i32 1, i32 1
  store i32 1, i32* %index_ptr789
  %index_ptr790 = getelementptr { i32, [ 0 x i32 ] }* %array787, i32 0, i32 1, i32 2
  store i32 99, i32* %index_ptr790
  %index_ptr791 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array779, i32 0, i32 1, i32 1
  store { i32, [ 0 x i32 ] }* %array787, { i32, [ 0 x i32 ] }** %index_ptr791
  %array_ptr792 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 3 )
  %array793 = bitcast { i32, [ 0 x i32 ] }* %array_ptr792 to { i32, [ 0 x i32 ] }* 
  %index_ptr794 = getelementptr { i32, [ 0 x i32 ] }* %array793, i32 0, i32 1, i32 0
  store i32 99, i32* %index_ptr794
  %index_ptr795 = getelementptr { i32, [ 0 x i32 ] }* %array793, i32 0, i32 1, i32 1
  store i32 99, i32* %index_ptr795
  %index_ptr796 = getelementptr { i32, [ 0 x i32 ] }* %array793, i32 0, i32 1, i32 2
  store i32 99, i32* %index_ptr796
  %index_ptr797 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array779, i32 0, i32 1, i32 2
  store { i32, [ 0 x i32 ] }* %array793, { i32, [ 0 x i32 ] }** %index_ptr797
  store { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }* %array779, { i32, [ 0 x { i32, [ 0 x i32 ] }* ] }** @arr2798
  ret void
}


define void @arr1777.init (){

__fresh183:
  %array_ptr772 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 3 )
  %array773 = bitcast { i32, [ 0 x i32 ] }* %array_ptr772 to { i32, [ 0 x i32 ] }* 
  %index_ptr774 = getelementptr { i32, [ 0 x i32 ] }* %array773, i32 0, i32 1, i32 0
  store i32 99, i32* %index_ptr774
  %index_ptr775 = getelementptr { i32, [ 0 x i32 ] }* %array773, i32 0, i32 1, i32 1
  store i32 1, i32* %index_ptr775
  %index_ptr776 = getelementptr { i32, [ 0 x i32 ] }* %array773, i32 0, i32 1, i32 2
  store i32 99, i32* %index_ptr776
  store { i32, [ 0 x i32 ] }* %array773, { i32, [ 0 x i32 ] }** @arr1777
  ret void
}


