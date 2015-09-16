%B = type { %_B_vtable*, i8* }
%_B_vtable = type { %_Object_vtable*, i8* (%Object*)*, %A* (%B*)* }
%A = type { %_A_vtable*, i8*, i32, %S* }
%_A_vtable = type { %_Object_vtable*, i8* (%Object*)*, %A* (%A*)* }
%S = type { %_S_vtable*, i8*, i32 }
%_S_vtable = type { %_Object_vtable*, i8* (%Object*)*, { i32, [ 0 x i32 ] }* (%S*)*, %S* (%S*)* }
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
@_const_str315.str. = private unnamed_addr constant [ 2 x i8 ] c "B\00", align 4
@_const_str315 = alias bitcast([ 2 x i8 ]* @_const_str315.str. to i8*)@_const_str314.str. = private unnamed_addr constant [ 2 x i8 ] c "A\00", align 4
@_const_str314 = alias bitcast([ 2 x i8 ]* @_const_str314.str. to i8*)@_const_str313.str. = private unnamed_addr constant [ 2 x i8 ] c "S\00", align 4
@_const_str313 = alias bitcast([ 2 x i8 ]* @_const_str313.str. to i8*)@arr311 = global { i32, [ 0 x i32 ] }* zeroinitializer, align 4		; initialized by @arr311.init312
@_const_str310.str. = private unnamed_addr constant [ 7 x i8 ] c "Object\00", align 4
@_const_str310 = alias bitcast([ 7 x i8 ]* @_const_str310.str. to i8*)@_B_vtable309 = private constant %_B_vtable {%_Object_vtable* @_Object_vtable306, i8* (%Object*)* @_Object_get_name, %A* (%B*)* @_B_f}, align 4
@_A_vtable308 = private constant %_A_vtable {%_Object_vtable* @_Object_vtable306, i8* (%Object*)* @_Object_get_name, %A* (%A*)* @_A_g}, align 4
@_S_vtable307 = private constant %_S_vtable {%_Object_vtable* @_Object_vtable306, i8* (%Object*)* @_Object_get_name, { i32, [ 0 x i32 ] }* (%S*)* @_S_g, %S* (%S*)* @_S_f}, align 4
@_Object_vtable306 = private constant %_Object_vtable {{  }* null, i8* (%Object*)* @_Object_get_name}, align 4
define void @oat_init (){
__fresh544:
  call void @arr311.init312(  )
  ret void
}


define i32 @program (i32 %argc1726, { i32, [ 0 x i8* ] }* %argv1724){
__fresh543:
  %argc_slot1727 = alloca i32
  store i32 %argc1726, i32* %argc_slot1727
  %argv_slot1725 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv1724, { i32, [ 0 x i8* ] }** %argv_slot1725
  %mem_ptr1728 = call i32* @oat_malloc ( i32 8 )
  %obj1729 = bitcast i32* %mem_ptr1728 to %B* 
  %new_obj1730 = call %B* @_B_ctor ( %B* %obj1729 )
  %vdecl_slot1731 = alloca %B*
  store %B* %new_obj1730, %B** %vdecl_slot1731
  %lhs_or_call1732 = load %B** %vdecl_slot1731
  %vtmp1734 = getelementptr %B* %lhs_or_call1732, i32 0, i32 0
  %vtable1733 = load %_B_vtable** %vtmp1734
  %fptmp1735 = getelementptr %_B_vtable* %vtable1733, i32 0, i32 2
  %method1736 = load %A* (%B*)** %fptmp1735
  %ret1737 = call %A* %method1736 ( %B* %lhs_or_call1732 )
  %path1738 = getelementptr %A* %ret1737, i32 0, i32 3
  %lhs_or_call1739 = load %S** %path1738
  %vtmp1741 = getelementptr %S* %lhs_or_call1739, i32 0, i32 0
  %vtable1740 = load %_S_vtable** %vtmp1741
  %fptmp1742 = getelementptr %_S_vtable* %vtable1740, i32 0, i32 2
  %method1743 = load { i32, [ 0 x i32 ] }* (%S*)** %fptmp1742
  %ret1744 = call { i32, [ 0 x i32 ] }* %method1743 ( %S* %lhs_or_call1739 )
  %bound_ptr1746 = getelementptr { i32, [ 0 x i32 ] }* %ret1744, i32 0, i32 0
  %bound1747 = load i32* %bound_ptr1746
  call void @oat_array_bounds_check( i32 %bound1747, i32 1 )
  %elt1745 = getelementptr { i32, [ 0 x i32 ] }* %ret1744, i32 0, i32 1, i32 1
  store i32 100, i32* %elt1745
  %lhs_or_call1748 = load %B** %vdecl_slot1731
  %vtmp1750 = getelementptr %B* %lhs_or_call1748, i32 0, i32 0
  %vtable1749 = load %_B_vtable** %vtmp1750
  %fptmp1751 = getelementptr %_B_vtable* %vtable1749, i32 0, i32 2
  %method1752 = load %A* (%B*)** %fptmp1751
  %ret1753 = call %A* %method1752 ( %B* %lhs_or_call1748 )
  %path1754 = getelementptr %A* %ret1753, i32 0, i32 2
  %lhs_or_call1755 = load i32* %path1754
  %lhs_or_call1756 = load %B** %vdecl_slot1731
  %vtmp1758 = getelementptr %B* %lhs_or_call1756, i32 0, i32 0
  %vtable1757 = load %_B_vtable** %vtmp1758
  %fptmp1759 = getelementptr %_B_vtable* %vtable1757, i32 0, i32 2
  %method1760 = load %A* (%B*)** %fptmp1759
  %ret1761 = call %A* %method1760 ( %B* %lhs_or_call1756 )
  %vtmp1763 = getelementptr %A* %ret1761, i32 0, i32 0
  %vtable1762 = load %_A_vtable** %vtmp1763
  %fptmp1764 = getelementptr %_A_vtable* %vtable1762, i32 0, i32 2
  %method1765 = load %A* (%A*)** %fptmp1764
  %ret1766 = call %A* %method1765 ( %A* %ret1761 )
  %vtmp1768 = getelementptr %A* %ret1766, i32 0, i32 0
  %vtable1767 = load %_A_vtable** %vtmp1768
  %fptmp1769 = getelementptr %_A_vtable* %vtable1767, i32 0, i32 2
  %method1770 = load %A* (%A*)** %fptmp1769
  %ret1771 = call %A* %method1770 ( %A* %ret1766 )
  %vtmp1773 = getelementptr %A* %ret1771, i32 0, i32 0
  %vtable1772 = load %_A_vtable** %vtmp1773
  %fptmp1774 = getelementptr %_A_vtable* %vtable1772, i32 0, i32 2
  %method1775 = load %A* (%A*)** %fptmp1774
  %ret1776 = call %A* %method1775 ( %A* %ret1771 )
  %path1777 = getelementptr %A* %ret1776, i32 0, i32 2
  %lhs_or_call1778 = load i32* %path1777
  %bop1779 = add i32 %lhs_or_call1755, %lhs_or_call1778
  %lhs_or_call1780 = load %B** %vdecl_slot1731
  %vtmp1782 = getelementptr %B* %lhs_or_call1780, i32 0, i32 0
  %vtable1781 = load %_B_vtable** %vtmp1782
  %fptmp1783 = getelementptr %_B_vtable* %vtable1781, i32 0, i32 2
  %method1784 = load %A* (%B*)** %fptmp1783
  %ret1785 = call %A* %method1784 ( %B* %lhs_or_call1780 )
  %vtmp1787 = getelementptr %A* %ret1785, i32 0, i32 0
  %vtable1786 = load %_A_vtable** %vtmp1787
  %fptmp1788 = getelementptr %_A_vtable* %vtable1786, i32 0, i32 2
  %method1789 = load %A* (%A*)** %fptmp1788
  %ret1790 = call %A* %method1789 ( %A* %ret1785 )
  %vtmp1792 = getelementptr %A* %ret1790, i32 0, i32 0
  %vtable1791 = load %_A_vtable** %vtmp1792
  %fptmp1793 = getelementptr %_A_vtable* %vtable1791, i32 0, i32 2
  %method1794 = load %A* (%A*)** %fptmp1793
  %ret1795 = call %A* %method1794 ( %A* %ret1790 )
  %vtmp1797 = getelementptr %A* %ret1795, i32 0, i32 0
  %vtable1796 = load %_A_vtable** %vtmp1797
  %fptmp1798 = getelementptr %_A_vtable* %vtable1796, i32 0, i32 2
  %method1799 = load %A* (%A*)** %fptmp1798
  %ret1800 = call %A* %method1799 ( %A* %ret1795 )
  %vtmp1802 = getelementptr %A* %ret1800, i32 0, i32 0
  %vtable1801 = load %_A_vtable** %vtmp1802
  %fptmp1803 = getelementptr %_A_vtable* %vtable1801, i32 0, i32 2
  %method1804 = load %A* (%A*)** %fptmp1803
  %ret1805 = call %A* %method1804 ( %A* %ret1800 )
  %vtmp1807 = getelementptr %A* %ret1805, i32 0, i32 0
  %vtable1806 = load %_A_vtable** %vtmp1807
  %fptmp1808 = getelementptr %_A_vtable* %vtable1806, i32 0, i32 2
  %method1809 = load %A* (%A*)** %fptmp1808
  %ret1810 = call %A* %method1809 ( %A* %ret1805 )
  %vtmp1812 = getelementptr %A* %ret1810, i32 0, i32 0
  %vtable1811 = load %_A_vtable** %vtmp1812
  %fptmp1813 = getelementptr %_A_vtable* %vtable1811, i32 0, i32 2
  %method1814 = load %A* (%A*)** %fptmp1813
  %ret1815 = call %A* %method1814 ( %A* %ret1810 )
  %vtmp1817 = getelementptr %A* %ret1815, i32 0, i32 0
  %vtable1816 = load %_A_vtable** %vtmp1817
  %fptmp1818 = getelementptr %_A_vtable* %vtable1816, i32 0, i32 2
  %method1819 = load %A* (%A*)** %fptmp1818
  %ret1820 = call %A* %method1819 ( %A* %ret1815 )
  %vtmp1822 = getelementptr %A* %ret1820, i32 0, i32 0
  %vtable1821 = load %_A_vtable** %vtmp1822
  %fptmp1823 = getelementptr %_A_vtable* %vtable1821, i32 0, i32 2
  %method1824 = load %A* (%A*)** %fptmp1823
  %ret1825 = call %A* %method1824 ( %A* %ret1820 )
  %vtmp1827 = getelementptr %A* %ret1825, i32 0, i32 0
  %vtable1826 = load %_A_vtable** %vtmp1827
  %fptmp1828 = getelementptr %_A_vtable* %vtable1826, i32 0, i32 2
  %method1829 = load %A* (%A*)** %fptmp1828
  %ret1830 = call %A* %method1829 ( %A* %ret1825 )
  %path1831 = getelementptr %A* %ret1830, i32 0, i32 2
  %lhs_or_call1832 = load i32* %path1831
  %bop1833 = add i32 %bop1779, %lhs_or_call1832
  %lhs_or_call1834 = load %B** %vdecl_slot1731
  %vtmp1836 = getelementptr %B* %lhs_or_call1834, i32 0, i32 0
  %vtable1835 = load %_B_vtable** %vtmp1836
  %fptmp1837 = getelementptr %_B_vtable* %vtable1835, i32 0, i32 2
  %method1838 = load %A* (%B*)** %fptmp1837
  %ret1839 = call %A* %method1838 ( %B* %lhs_or_call1834 )
  %path1840 = getelementptr %A* %ret1839, i32 0, i32 3
  %lhs_or_call1841 = load %S** %path1840
  %vtmp1843 = getelementptr %S* %lhs_or_call1841, i32 0, i32 0
  %vtable1842 = load %_S_vtable** %vtmp1843
  %fptmp1844 = getelementptr %_S_vtable* %vtable1842, i32 0, i32 3
  %method1845 = load %S* (%S*)** %fptmp1844
  %ret1846 = call %S* %method1845 ( %S* %lhs_or_call1841 )
  %path1847 = getelementptr %S* %ret1846, i32 0, i32 2
  %lhs_or_call1848 = load i32* %path1847
  %bop1849 = add i32 %bop1833, %lhs_or_call1848
  %lhs_or_call1850 = load { i32, [ 0 x i32 ] }** @arr311
  %bound_ptr1852 = getelementptr { i32, [ 0 x i32 ] }* %lhs_or_call1850, i32 0, i32 0
  %bound1853 = load i32* %bound_ptr1852
  call void @oat_array_bounds_check( i32 %bound1853, i32 1 )
  %elt1851 = getelementptr { i32, [ 0 x i32 ] }* %lhs_or_call1850, i32 0, i32 1, i32 1
  %lhs_or_call1854 = load i32* %elt1851
  %bop1855 = add i32 %bop1849, %lhs_or_call1854
  %lhs_or_call1856 = load %B** %vdecl_slot1731
  %vtmp1858 = getelementptr %B* %lhs_or_call1856, i32 0, i32 0
  %vtable1857 = load %_B_vtable** %vtmp1858
  %fptmp1859 = getelementptr %_B_vtable* %vtable1857, i32 0, i32 2
  %method1860 = load %A* (%B*)** %fptmp1859
  %ret1861 = call %A* %method1860 ( %B* %lhs_or_call1856 )
  %path1862 = getelementptr %A* %ret1861, i32 0, i32 3
  %lhs_or_call1863 = load %S** %path1862
  %vtmp1865 = getelementptr %S* %lhs_or_call1863, i32 0, i32 0
  %vtable1864 = load %_S_vtable** %vtmp1865
  %fptmp1866 = getelementptr %_S_vtable* %vtable1864, i32 0, i32 2
  %method1867 = load { i32, [ 0 x i32 ] }* (%S*)** %fptmp1866
  %ret1868 = call { i32, [ 0 x i32 ] }* %method1867 ( %S* %lhs_or_call1863 )
  %bound_ptr1870 = getelementptr { i32, [ 0 x i32 ] }* %ret1868, i32 0, i32 0
  %bound1871 = load i32* %bound_ptr1870
  call void @oat_array_bounds_check( i32 %bound1871, i32 1 )
  %elt1869 = getelementptr { i32, [ 0 x i32 ] }* %ret1868, i32 0, i32 1, i32 1
  %lhs_or_call1872 = load i32* %elt1869
  %bop1873 = add i32 %bop1855, %lhs_or_call1872
  ret i32 %bop1873
}


define %A* @_B_f (%B* %_this1){
__fresh542:
  %mem_ptr1721 = call i32* @oat_malloc ( i32 16 )
  %obj1722 = bitcast i32* %mem_ptr1721 to %A* 
  %new_obj1723 = call %A* @_A_ctor ( %A* %obj1722 )
  ret %A* %new_obj1723
}


define %B* @_B_ctor (%B* %_this1){
__fresh541:
  %cast_op1717 = bitcast %B* %_this1 to %Object* 
  %dummy1718 = call %Object* @_Object_ctor ( %Object* %cast_op1717 )
  %path1719 = getelementptr %B* %_this1, i32 0, i32 1
  store i8* @_const_str315, i8** %path1719
  %vt_slot1720 = getelementptr %B* %_this1, i32 0, i32 0
  store %_B_vtable* @_B_vtable309, %_B_vtable** %vt_slot1720
  ret %B* %_this1
}


define %A* @_A_g (%A* %_this1){
__fresh540:
  %mem_ptr1714 = call i32* @oat_malloc ( i32 16 )
  %obj1715 = bitcast i32* %mem_ptr1714 to %A* 
  %new_obj1716 = call %A* @_A_ctor ( %A* %obj1715 )
  ret %A* %new_obj1716
}


define %A* @_A_ctor (%A* %_this1){
__fresh539:
  %cast_op1705 = bitcast %A* %_this1 to %Object* 
  %dummy1706 = call %Object* @_Object_ctor ( %Object* %cast_op1705 )
  %path1707 = getelementptr %A* %_this1, i32 0, i32 1
  store i8* @_const_str314, i8** %path1707
  %path1708 = getelementptr %A* %_this1, i32 0, i32 3
  %mem_ptr1709 = call i32* @oat_malloc ( i32 12 )
  %obj1710 = bitcast i32* %mem_ptr1709 to %S* 
  %new_obj1711 = call %S* @_S_ctor ( %S* %obj1710 )
  store %S* %new_obj1711, %S** %path1708
  %vt_slot1712 = getelementptr %A* %_this1, i32 0, i32 0
  store %_A_vtable* @_A_vtable308, %_A_vtable** %vt_slot1712
  %path1713 = getelementptr %A* %_this1, i32 0, i32 2
  store i32 1, i32* %path1713
  ret %A* %_this1
}


define %S* @_S_f (%S* %_this1){
__fresh538:
  %mem_ptr1702 = call i32* @oat_malloc ( i32 12 )
  %obj1703 = bitcast i32* %mem_ptr1702 to %S* 
  %new_obj1704 = call %S* @_S_ctor ( %S* %obj1703 )
  ret %S* %new_obj1704
}


define { i32, [ 0 x i32 ] }* @_S_g (%S* %_this1){
__fresh537:
  %lhs_or_call1701 = load { i32, [ 0 x i32 ] }** @arr311
  ret { i32, [ 0 x i32 ] }* %lhs_or_call1701
}


define %S* @_S_ctor (%S* %_this1){
__fresh536:
  %cast_op1696 = bitcast %S* %_this1 to %Object* 
  %dummy1697 = call %Object* @_Object_ctor ( %Object* %cast_op1696 )
  %path1698 = getelementptr %S* %_this1, i32 0, i32 1
  store i8* @_const_str313, i8** %path1698
  %vt_slot1699 = getelementptr %S* %_this1, i32 0, i32 0
  store %_S_vtable* @_S_vtable307, %_S_vtable** %vt_slot1699
  %path1700 = getelementptr %S* %_this1, i32 0, i32 2
  store i32 2, i32* %path1700
  ret %S* %_this1
}


define void @arr311.init312 (){
__fresh535:
  %array_ptr1691 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 3 )
  %array1692 = bitcast { i32, [ 0 x i32 ] }* %array_ptr1691 to { i32, [ 0 x i32 ] }* 
  %index_ptr1693 = getelementptr { i32, [ 0 x i32 ] }* %array1692, i32 0, i32 1, i32 0
  store i32 0, i32* %index_ptr1693
  %index_ptr1694 = getelementptr { i32, [ 0 x i32 ] }* %array1692, i32 0, i32 1, i32 1
  store i32 0, i32* %index_ptr1694
  %index_ptr1695 = getelementptr { i32, [ 0 x i32 ] }* %array1692, i32 0, i32 1, i32 2
  store i32 0, i32* %index_ptr1695
  store { i32, [ 0 x i32 ] }* %array1692, { i32, [ 0 x i32 ] }** @arr311
  ret void
}


define i8* @_Object_get_name (%Object* %_this1){
__fresh534:
  %path1689 = getelementptr %Object* %_this1, i32 0, i32 1
  %lhs_or_call1690 = load i8** %path1689
  ret i8* %lhs_or_call1690
}


define %Object* @_Object_ctor (%Object* %_this1){
__fresh533:
  %path1687 = getelementptr %Object* %_this1, i32 0, i32 1
  store i8* @_const_str310, i8** %path1687
  %vt_slot1688 = getelementptr %Object* %_this1, i32 0, i32 0
  store %_Object_vtable* @_Object_vtable306, %_Object_vtable** %vt_slot1688
  ret %Object* %_this1
}


