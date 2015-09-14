declare i8* @string_of_array({ i32, [ 0 x i32 ] })
declare { i32, [ 0 x i32 ] } @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] } @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@strs824 = global { i32, [ 0 x { i32, [ 0 x i8* ] } ] } zeroinitializer, align 4		; initialized by strs824.init
@_oat_string820.str. = private unnamed_addr constant [ 4 x i8 ] c "123\00", align 4
@_oat_string820 = global i8* getelementptr inbounds ([ 4 x i8 ]* @_oat_string820.str., i32 0, i32 0), align 4
@_oat_string817.str. = private unnamed_addr constant [ 4 x i8 ] c "789\00", align 4
@_oat_string817 = global i8* getelementptr inbounds ([ 4 x i8 ]* @_oat_string817.str., i32 0, i32 0), align 4
@_oat_string811.str. = private unnamed_addr constant [ 4 x i8 ] c "def\00", align 4
@_oat_string811 = global i8* getelementptr inbounds ([ 4 x i8 ]* @_oat_string811.str., i32 0, i32 0), align 4
@_oat_string808.str. = private unnamed_addr constant [ 4 x i8 ] c "abc\00", align 4
@_oat_string808 = global i8* getelementptr inbounds ([ 4 x i8 ]* @_oat_string808.str., i32 0, i32 0), align 4
define void @oat_init (){

__fresh166:
  call void @strs824.init(  )
  ret void
}


define i32 @program (i32 %argc831, { i32, [ 0 x i8* ] } %argv829){

__fresh165:
  %argc_slot832 = alloca i32
  store i32 %argc831, i32* %argc_slot832
  %argv_slot830 = alloca { i32, [ 0 x i8* ] }
  store { i32, [ 0 x i8* ] } %argv829, { i32, [ 0 x i8* ] }* %argv_slot830
  %bound_ptr834 = getelementptr { i32, [ 0 x { i32, [ 0 x i8* ] } ] }* @strs824, i32 0, i32 0
  %bound835 = load i32* %bound_ptr834
  call void @oat_array_bounds_check( i32 %bound835, i32 1 )
  %elt833 = getelementptr { i32, [ 0 x { i32, [ 0 x i8* ] } ] }* @strs824, i32 0, i32 1, i32 1
  %bound_ptr837 = getelementptr { i32, [ 0 x i8* ] }* %elt833, i32 0, i32 0
  %bound838 = load i32* %bound_ptr837
  call void @oat_array_bounds_check( i32 %bound838, i32 1 )
  %elt836 = getelementptr { i32, [ 0 x i8* ] }* %elt833, i32 0, i32 1, i32 1
  %_lhs839 = load i8** %elt836
  call void @print_string( i8* %_lhs839 )
  ret i32 0
}


define void @strs824.init (){

__fresh164:
  %array_ptr804 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 2 )
  %array805 = bitcast { i32, [ 0 x i32 ] } %array_ptr804 to { i32, [ 0 x { i32, [ 0 x i8* ] } ] } 
  %array_ptr806 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 2 )
  %array807 = bitcast { i32, [ 0 x i32 ] } %array_ptr806 to { i32, [ 0 x i8* ] } 
  %strval809 = load i8** @_oat_string808
  %index_ptr810 = getelementptr { i32, [ 0 x i8* ] } %array807, i32 0, i32 1, i32 0
  store i8* %strval809, i8** %index_ptr810
  %strval812 = load i8** @_oat_string811
  %index_ptr813 = getelementptr { i32, [ 0 x i8* ] } %array807, i32 0, i32 1, i32 1
  store i8* %strval812, i8** %index_ptr813
  %index_ptr814 = getelementptr { i32, [ 0 x { i32, [ 0 x i8* ] } ] } %array805, i32 0, i32 1, i32 0
  store { i32, [ 0 x i8* ] } %array807, { i32, [ 0 x i8* ] }* %index_ptr814
  %array_ptr815 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 2 )
  %array816 = bitcast { i32, [ 0 x i32 ] } %array_ptr815 to { i32, [ 0 x i8* ] } 
  %strval818 = load i8** @_oat_string817
  %index_ptr819 = getelementptr { i32, [ 0 x i8* ] } %array816, i32 0, i32 1, i32 0
  store i8* %strval818, i8** %index_ptr819
  %strval821 = load i8** @_oat_string820
  %index_ptr822 = getelementptr { i32, [ 0 x i8* ] } %array816, i32 0, i32 1, i32 1
  store i8* %strval821, i8** %index_ptr822
  %index_ptr823 = getelementptr { i32, [ 0 x { i32, [ 0 x i8* ] } ] } %array805, i32 0, i32 1, i32 1
  store { i32, [ 0 x i8* ] } %array816, { i32, [ 0 x i8* ] }* %index_ptr823
  store { i32, [ 0 x { i32, [ 0 x i8* ] } ] } %array805, { i32, [ 0 x { i32, [ 0 x i8* ] } ] }* @strs824
  ret void
}


