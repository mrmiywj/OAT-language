declare i8* @string_of_array({ i32, [ 0 x i32 ] })
declare { i32, [ 0 x i32 ] } @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] } @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@strs793 = global { i32, [ 0 x i8* ] } zeroinitializer, align 4		; initialized by strs793.init
@_oat_string790.str. = private unnamed_addr constant [ 4 x i8 ] c "def\00", align 4
@_oat_string790 = global i8* getelementptr inbounds ([ 4 x i8 ]* @_oat_string790.str., i32 0, i32 0), align 4
@_oat_string787.str. = private unnamed_addr constant [ 4 x i8 ] c "abc\00", align 4
@_oat_string787 = global i8* getelementptr inbounds ([ 4 x i8 ]* @_oat_string787.str., i32 0, i32 0), align 4
define void @oat_init (){

__fresh163:
  call void @strs793.init(  )
  ret void
}


define i32 @program (i32 %argc798, { i32, [ 0 x i8* ] } %argv796){

__fresh162:
  %argc_slot799 = alloca i32
  store i32 %argc798, i32* %argc_slot799
  %argv_slot797 = alloca { i32, [ 0 x i8* ] }
  store { i32, [ 0 x i8* ] } %argv796, { i32, [ 0 x i8* ] }* %argv_slot797
  %bound_ptr801 = getelementptr { i32, [ 0 x i8* ] }* @strs793, i32 0, i32 0
  %bound802 = load i32* %bound_ptr801
  call void @oat_array_bounds_check( i32 %bound802, i32 0 )
  %elt800 = getelementptr { i32, [ 0 x i8* ] }* @strs793, i32 0, i32 1, i32 0
  %_lhs803 = load i8** %elt800
  call void @print_string( i8* %_lhs803 )
  ret i32 0
}


define void @strs793.init (){

__fresh161:
  %array_ptr785 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 2 )
  %array786 = bitcast { i32, [ 0 x i32 ] } %array_ptr785 to { i32, [ 0 x i8* ] } 
  %strval788 = load i8** @_oat_string787
  %index_ptr789 = getelementptr { i32, [ 0 x i8* ] } %array786, i32 0, i32 1, i32 0
  store i8* %strval788, i8** %index_ptr789
  %strval791 = load i8** @_oat_string790
  %index_ptr792 = getelementptr { i32, [ 0 x i8* ] } %array786, i32 0, i32 1, i32 1
  store i8* %strval791, i8** %index_ptr792
  store { i32, [ 0 x i8* ] } %array786, { i32, [ 0 x i8* ] }* @strs793
  ret void
}


