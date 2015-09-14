declare i8* @string_of_array({ i32, [ 0 x i32 ] })
declare { i32, [ 0 x i32 ] } @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] } @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@_oat_string1933.str. = private unnamed_addr constant [ 2 x i8 ] c "
\00", align 4
@_oat_string1933 = global i8* getelementptr inbounds ([ 2 x i8 ]* @_oat_string1933.str., i32 0, i32 0), align 4
@_oat_string1928.str. = private unnamed_addr constant [ 2 x i8 ] c "
\00", align 4
@_oat_string1928 = global i8* getelementptr inbounds ([ 2 x i8 ]* @_oat_string1928.str., i32 0, i32 0), align 4
@_oat_string1924.str. = private unnamed_addr constant [ 2 x i8 ] c "
\00", align 4
@_oat_string1924 = global i8* getelementptr inbounds ([ 2 x i8 ]* @_oat_string1924.str., i32 0, i32 0), align 4
define void @oat_init (){

__fresh296:
  ret void
}


define i32 @program (i32 %argc1910, { i32, [ 0 x i8* ] } %argv1908){

__fresh295:
  %argc_slot1911 = alloca i32
  store i32 %argc1910, i32* %argc_slot1911
  %argv_slot1909 = alloca { i32, [ 0 x i8* ] }
  store { i32, [ 0 x i8* ] } %argv1908, { i32, [ 0 x i8* ] }* %argv_slot1909
  %array_ptr1912 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 9 )
  %array1913 = bitcast { i32, [ 0 x i32 ] } %array_ptr1912 to { i32, [ 0 x i32 ] } 
  %index_ptr1914 = getelementptr { i32, [ 0 x i32 ] } %array1913, i32 0, i32 1, i32 0
  store i32 107, i32* %index_ptr1914
  %index_ptr1915 = getelementptr { i32, [ 0 x i32 ] } %array1913, i32 0, i32 1, i32 1
  store i32 112, i32* %index_ptr1915
  %index_ptr1916 = getelementptr { i32, [ 0 x i32 ] } %array1913, i32 0, i32 1, i32 2
  store i32 121, i32* %index_ptr1916
  %index_ptr1917 = getelementptr { i32, [ 0 x i32 ] } %array1913, i32 0, i32 1, i32 3
  store i32 102, i32* %index_ptr1917
  %index_ptr1918 = getelementptr { i32, [ 0 x i32 ] } %array1913, i32 0, i32 1, i32 4
  store i32 123, i32* %index_ptr1918
  %index_ptr1919 = getelementptr { i32, [ 0 x i32 ] } %array1913, i32 0, i32 1, i32 5
  store i32 115, i32* %index_ptr1919
  %index_ptr1920 = getelementptr { i32, [ 0 x i32 ] } %array1913, i32 0, i32 1, i32 6
  store i32 104, i32* %index_ptr1920
  %index_ptr1921 = getelementptr { i32, [ 0 x i32 ] } %array1913, i32 0, i32 1, i32 7
  store i32 111, i32* %index_ptr1921
  %index_ptr1922 = getelementptr { i32, [ 0 x i32 ] } %array1913, i32 0, i32 1, i32 8
  store i32 109, i32* %index_ptr1922
  %a1923 = alloca { i32, [ 0 x i32 ] }
  store { i32, [ 0 x i32 ] } %array1913, { i32, [ 0 x i32 ] }* %a1923
  %strval1925 = load i8** @_oat_string1924
  call void @print_string( i8* %strval1925 )
  %_lhs1926 = load { i32, [ 0 x i32 ] }* %a1923
  %ret1927 = call i8* @string_of_array ( { i32, [ 0 x i32 ] } %_lhs1926 )
  call void @print_string( i8* %ret1927 )
  %strval1929 = load i8** @_oat_string1928
  call void @print_string( i8* %strval1929 )
  %_lhs1930 = load { i32, [ 0 x i32 ] }* %a1923
  call void @quick_sort( { i32, [ 0 x i32 ] } %_lhs1930, i32 0, i32 8 )
  %_lhs1931 = load { i32, [ 0 x i32 ] }* %a1923
  %ret1932 = call i8* @string_of_array ( { i32, [ 0 x i32 ] } %_lhs1931 )
  call void @print_string( i8* %ret1932 )
  %strval1934 = load i8** @_oat_string1933
  call void @print_string( i8* %strval1934 )
  ret i32 255
}


define i32 @partition ({ i32, [ 0 x i32 ] } %a1821, i32 %l1819, i32 %r1817){

__fresh284:
  %a_slot1822 = alloca { i32, [ 0 x i32 ] }
  store { i32, [ 0 x i32 ] } %a1821, { i32, [ 0 x i32 ] }* %a_slot1822
  %l_slot1820 = alloca i32
  store i32 %l1819, i32* %l_slot1820
  %r_slot1818 = alloca i32
  store i32 %r1817, i32* %r_slot1818
  %_lhs1823 = load i32* %l_slot1820
  %bound_ptr1825 = getelementptr { i32, [ 0 x i32 ] }* %a_slot1822, i32 0, i32 0
  %bound1826 = load i32* %bound_ptr1825
  call void @oat_array_bounds_check( i32 %bound1826, i32 %_lhs1823 )
  %elt1824 = getelementptr { i32, [ 0 x i32 ] }* %a_slot1822, i32 0, i32 1, i32 %_lhs1823
  %_lhs1827 = load i32* %elt1824
  %pivot1828 = alloca i32
  store i32 %_lhs1827, i32* %pivot1828
  %_lhs1829 = load i32* %l_slot1820
  %i1830 = alloca i32
  store i32 %_lhs1829, i32* %i1830
  %_lhs1831 = load i32* %r_slot1818
  %bop1832 = add i32 %_lhs1831, 1
  %j1833 = alloca i32
  store i32 %bop1832, i32* %j1833
  %t1834 = alloca i32
  store i32 0, i32* %t1834
  %done1835 = alloca i32
  store i32 0, i32* %done1835
  br label %__cond271

__cond271:
  %_lhs1836 = load i32* %done1835
  %bop1837 = icmp eq i32 %_lhs1836, 0
  br i1 %bop1837, label %__body270, label %__post269

__fresh285:
  br label %__body270

__body270:
  %_lhs1838 = load i32* %i1830
  %bop1839 = add i32 %_lhs1838, 1
  store i32 %bop1839, i32* %i1830
  br label %__cond274

__cond274:
  %_lhs1840 = load i32* %i1830
  %bound_ptr1842 = getelementptr { i32, [ 0 x i32 ] }* %a_slot1822, i32 0, i32 0
  %bound1843 = load i32* %bound_ptr1842
  call void @oat_array_bounds_check( i32 %bound1843, i32 %_lhs1840 )
  %elt1841 = getelementptr { i32, [ 0 x i32 ] }* %a_slot1822, i32 0, i32 1, i32 %_lhs1840
  %_lhs1844 = load i32* %elt1841
  %_lhs1845 = load i32* %pivot1828
  %bop1846 = icmp sle i32 %_lhs1844, %_lhs1845
  %_lhs1847 = load i32* %i1830
  %_lhs1848 = load i32* %r_slot1818
  %bop1849 = icmp sle i32 %_lhs1847, %_lhs1848
  %bop1850 = and i1 %bop1846, %bop1849
  br i1 %bop1850, label %__body273, label %__post272

__fresh286:
  br label %__body273

__body273:
  %_lhs1851 = load i32* %i1830
  %bop1852 = add i32 %_lhs1851, 1
  store i32 %bop1852, i32* %i1830
  br label %__cond274

__fresh287:
  br label %__post272

__post272:
  %_lhs1853 = load i32* %j1833
  %bop1854 = sub i32 %_lhs1853, 1
  store i32 %bop1854, i32* %j1833
  br label %__cond277

__cond277:
  %_lhs1855 = load i32* %j1833
  %bound_ptr1857 = getelementptr { i32, [ 0 x i32 ] }* %a_slot1822, i32 0, i32 0
  %bound1858 = load i32* %bound_ptr1857
  call void @oat_array_bounds_check( i32 %bound1858, i32 %_lhs1855 )
  %elt1856 = getelementptr { i32, [ 0 x i32 ] }* %a_slot1822, i32 0, i32 1, i32 %_lhs1855
  %_lhs1859 = load i32* %elt1856
  %_lhs1860 = load i32* %pivot1828
  %bop1861 = icmp sgt i32 %_lhs1859, %_lhs1860
  br i1 %bop1861, label %__body276, label %__post275

__fresh288:
  br label %__body276

__body276:
  %_lhs1862 = load i32* %j1833
  %bop1863 = sub i32 %_lhs1862, 1
  store i32 %bop1863, i32* %j1833
  br label %__cond277

__fresh289:
  br label %__post275

__post275:
  %_lhs1864 = load i32* %i1830
  %_lhs1865 = load i32* %j1833
  %bop1866 = icmp sge i32 %_lhs1864, %_lhs1865
  br i1 %bop1866, label %__then280, label %__else279

__fresh290:
  br label %__then280

__then280:
  store i32 1, i32* %done1835
  br label %__merge278

__fresh291:
  br label %__else279

__else279:
  br label %__merge278

__merge278:
  %_lhs1867 = load i32* %done1835
  %bop1868 = icmp eq i32 %_lhs1867, 0
  br i1 %bop1868, label %__then283, label %__else282

__fresh292:
  br label %__then283

__then283:
  %_lhs1869 = load i32* %i1830
  %bound_ptr1871 = getelementptr { i32, [ 0 x i32 ] }* %a_slot1822, i32 0, i32 0
  %bound1872 = load i32* %bound_ptr1871
  call void @oat_array_bounds_check( i32 %bound1872, i32 %_lhs1869 )
  %elt1870 = getelementptr { i32, [ 0 x i32 ] }* %a_slot1822, i32 0, i32 1, i32 %_lhs1869
  %_lhs1873 = load i32* %elt1870
  store i32 %_lhs1873, i32* %t1834
  %_lhs1874 = load i32* %i1830
  %bound_ptr1876 = getelementptr { i32, [ 0 x i32 ] }* %a_slot1822, i32 0, i32 0
  %bound1877 = load i32* %bound_ptr1876
  call void @oat_array_bounds_check( i32 %bound1877, i32 %_lhs1874 )
  %elt1875 = getelementptr { i32, [ 0 x i32 ] }* %a_slot1822, i32 0, i32 1, i32 %_lhs1874
  %_lhs1878 = load i32* %j1833
  %bound_ptr1880 = getelementptr { i32, [ 0 x i32 ] }* %a_slot1822, i32 0, i32 0
  %bound1881 = load i32* %bound_ptr1880
  call void @oat_array_bounds_check( i32 %bound1881, i32 %_lhs1878 )
  %elt1879 = getelementptr { i32, [ 0 x i32 ] }* %a_slot1822, i32 0, i32 1, i32 %_lhs1878
  %_lhs1882 = load i32* %elt1879
  store i32 %_lhs1882, i32* %elt1875
  %_lhs1883 = load i32* %j1833
  %bound_ptr1885 = getelementptr { i32, [ 0 x i32 ] }* %a_slot1822, i32 0, i32 0
  %bound1886 = load i32* %bound_ptr1885
  call void @oat_array_bounds_check( i32 %bound1886, i32 %_lhs1883 )
  %elt1884 = getelementptr { i32, [ 0 x i32 ] }* %a_slot1822, i32 0, i32 1, i32 %_lhs1883
  %_lhs1887 = load i32* %t1834
  store i32 %_lhs1887, i32* %elt1884
  br label %__merge281

__fresh293:
  br label %__else282

__else282:
  br label %__merge281

__merge281:
  br label %__cond271

__fresh294:
  br label %__post269

__post269:
  %_lhs1888 = load i32* %l_slot1820
  %bound_ptr1890 = getelementptr { i32, [ 0 x i32 ] }* %a_slot1822, i32 0, i32 0
  %bound1891 = load i32* %bound_ptr1890
  call void @oat_array_bounds_check( i32 %bound1891, i32 %_lhs1888 )
  %elt1889 = getelementptr { i32, [ 0 x i32 ] }* %a_slot1822, i32 0, i32 1, i32 %_lhs1888
  %_lhs1892 = load i32* %elt1889
  store i32 %_lhs1892, i32* %t1834
  %_lhs1893 = load i32* %l_slot1820
  %bound_ptr1895 = getelementptr { i32, [ 0 x i32 ] }* %a_slot1822, i32 0, i32 0
  %bound1896 = load i32* %bound_ptr1895
  call void @oat_array_bounds_check( i32 %bound1896, i32 %_lhs1893 )
  %elt1894 = getelementptr { i32, [ 0 x i32 ] }* %a_slot1822, i32 0, i32 1, i32 %_lhs1893
  %_lhs1897 = load i32* %j1833
  %bound_ptr1899 = getelementptr { i32, [ 0 x i32 ] }* %a_slot1822, i32 0, i32 0
  %bound1900 = load i32* %bound_ptr1899
  call void @oat_array_bounds_check( i32 %bound1900, i32 %_lhs1897 )
  %elt1898 = getelementptr { i32, [ 0 x i32 ] }* %a_slot1822, i32 0, i32 1, i32 %_lhs1897
  %_lhs1901 = load i32* %elt1898
  store i32 %_lhs1901, i32* %elt1894
  %_lhs1902 = load i32* %j1833
  %bound_ptr1904 = getelementptr { i32, [ 0 x i32 ] }* %a_slot1822, i32 0, i32 0
  %bound1905 = load i32* %bound_ptr1904
  call void @oat_array_bounds_check( i32 %bound1905, i32 %_lhs1902 )
  %elt1903 = getelementptr { i32, [ 0 x i32 ] }* %a_slot1822, i32 0, i32 1, i32 %_lhs1902
  %_lhs1906 = load i32* %t1834
  store i32 %_lhs1906, i32* %elt1903
  %_lhs1907 = load i32* %j1833
  ret i32 %_lhs1907
}


define void @quick_sort ({ i32, [ 0 x i32 ] } %a1799, i32 %l1797, i32 %r1795){

__fresh266:
  %a_slot1800 = alloca { i32, [ 0 x i32 ] }
  store { i32, [ 0 x i32 ] } %a1799, { i32, [ 0 x i32 ] }* %a_slot1800
  %l_slot1798 = alloca i32
  store i32 %l1797, i32* %l_slot1798
  %r_slot1796 = alloca i32
  store i32 %r1795, i32* %r_slot1796
  %j1801 = alloca i32
  store i32 0, i32* %j1801
  %_lhs1802 = load i32* %l_slot1798
  %_lhs1803 = load i32* %r_slot1796
  %bop1804 = icmp slt i32 %_lhs1802, %_lhs1803
  br i1 %bop1804, label %__then265, label %__else264

__fresh267:
  br label %__then265

__then265:
  %_lhs1807 = load i32* %r_slot1796
  %_lhs1806 = load i32* %l_slot1798
  %_lhs1805 = load { i32, [ 0 x i32 ] }* %a_slot1800
  %ret1808 = call i32 @partition ( { i32, [ 0 x i32 ] } %_lhs1805, i32 %_lhs1806, i32 %_lhs1807 )
  store i32 %ret1808, i32* %j1801
  %_lhs1811 = load i32* %j1801
  %bop1812 = sub i32 %_lhs1811, 1
  %_lhs1810 = load i32* %l_slot1798
  %_lhs1809 = load { i32, [ 0 x i32 ] }* %a_slot1800
  call void @quick_sort( { i32, [ 0 x i32 ] } %_lhs1809, i32 %_lhs1810, i32 %bop1812 )
  %_lhs1816 = load i32* %r_slot1796
  %_lhs1814 = load i32* %j1801
  %bop1815 = add i32 %_lhs1814, 1
  %_lhs1813 = load { i32, [ 0 x i32 ] }* %a_slot1800
  call void @quick_sort( { i32, [ 0 x i32 ] } %_lhs1813, i32 %bop1815, i32 %_lhs1816 )
  br label %__merge263

__fresh268:
  br label %__else264

__else264:
  br label %__merge263

__merge263:
  ret void
}


