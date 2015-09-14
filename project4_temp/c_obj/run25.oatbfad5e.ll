declare i8* @string_of_array({ i32, [ 0 x i32 ] }*)
declare { i32, [ 0 x i32 ] }* @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] }* @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@str775 = global i8* zeroinitializer, align 4		; initialized by str775.init
define void @oat_init (){

__fresh135:
  call void @str775.init(  )
  ret void
}


define i32 @program (i32 %argc778, { i32, [ 0 x i8* ] }* %argv776){

__fresh134:
  %argc_slot779 = alloca i32
  store i32 %argc778, i32* %argc_slot779
  %argv_slot777 = alloca { i32, [ 0 x i8* ] }*
  store { i32, [ 0 x i8* ] }* %argv776, { i32, [ 0 x i8* ] }** %argv_slot777
  %_lhs780 = load i8** @str775
  call void @print_string( i8* %_lhs780 )
  ret i32 0
}


define void @str775.init (){

__fresh131:
  %array_ptr758 = call { i32, [ 0 x i32 ] }* @oat_alloc_array ( i32 3 )
  %array759 = bitcast { i32, [ 0 x i32 ] }* %array_ptr758 to { i32, [ 0 x i32 ] }* 
  %_tmp759761 = alloca i32
  store i32 3, i32* %_tmp759761
  %_tmp761763 = alloca { i32, [ 0 x i32 ] }*
  store { i32, [ 0 x i32 ] }* %array759, { i32, [ 0 x i32 ] }* %_tmp761763
  %i764 = alloca i32
  store i32 0, i32* %i764
  br label %__cond130

__cond130:
  %_lhs765 = load i32* %i764
  %_lhs766 = load i32* %_tmp759761
  %bop767 = icmp slt i32 %_lhs765, %_lhs766
  br i1 %bop767, label %__body129, label %__post128

__fresh132:
  br label %__body129

__body129:
  %_lhs768 = load i32* %i764
  %bound_ptr770 = getelementptr { i32, [ 0 x i32 ] }* %_tmp761763, i32 0, i32 0
  %bound771 = load i32* %bound_ptr770
  call void @oat_array_bounds_check( i32 %bound771, i32 %_lhs768 )
  %elt769 = getelementptr { i32, [ 0 x i32 ] }* %_tmp761763, i32 0, i32 1, i32 %_lhs768
  store i32 110, i32* %elt769
  %_lhs772 = load i32* %i764
  %bop773 = add i32 %_lhs772, 1
  store i32 %bop773, i32* %i764
  br label %__cond130

__fresh133:
  br label %__post128

__post128:
  %ret774 = call i8* @string_of_array ( { i32, [ 0 x i32 ] }* %array759 )
  store i8* %ret774, i8** @str775
  ret void
}


