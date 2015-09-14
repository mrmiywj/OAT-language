declare i8* @string_of_array({ i32, [ 0 x i32 ] })
declare { i32, [ 0 x i32 ] } @array_of_string(i8*)
declare void @print_string(i8*)
declare void @print_int(i32)
declare void @print_bool(i1)
declare i32* @oat_malloc(i32)
declare { i32, [ 0 x i32 ] } @oat_alloc_array(i32)
declare void @oat_array_bounds_check(i32, i32)
@arr2664 = global { i32, [ 0 x { i32, [ 0 x i32 ] } ] } zeroinitializer, align 4		; initialized by arr2664.init
@arr1643 = global { i32, [ 0 x i32 ] } zeroinitializer, align 4		; initialized by arr1643.init
@i637 = global i32 1, align 4
define void @oat_init (){

__fresh149:
  call void @arr1643.init(  )
  call void @arr2664.init(  )
  ret void
}


define i32 @program (i32 %argc681, { i32, [ 0 x i8* ] } %argv679){

__fresh148:
  %argc_slot682 = alloca i32
  store i32 %argc681, i32* %argc_slot682
  %argv_slot680 = alloca { i32, [ 0 x i8* ] }
  store { i32, [ 0 x i8* ] } %argv679, { i32, [ 0 x i8* ] }* %argv_slot680
  %c683 = alloca i32
  store i32 1, i32* %c683
  %ret684 = call { i32, [ 0 x i32 ] } @g (  )
  %arr4685 = alloca { i32, [ 0 x i32 ] }
  store { i32, [ 0 x i32 ] } %ret684, { i32, [ 0 x i32 ] }* %arr4685
  %array_ptr686 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 4 )
  %array687 = bitcast { i32, [ 0 x i32 ] } %array_ptr686 to { i32, [ 0 x i32 ] } 
  %index_ptr688 = getelementptr { i32, [ 0 x i32 ] } %array687, i32 0, i32 1, i32 0
  store i32 99, i32* %index_ptr688
  %index_ptr689 = getelementptr { i32, [ 0 x i32 ] } %array687, i32 0, i32 1, i32 1
  store i32 99, i32* %index_ptr689
  %index_ptr690 = getelementptr { i32, [ 0 x i32 ] } %array687, i32 0, i32 1, i32 2
  store i32 99, i32* %index_ptr690
  %index_ptr691 = getelementptr { i32, [ 0 x i32 ] } %array687, i32 0, i32 1, i32 3
  store i32 1, i32* %index_ptr691
  %arr3692 = alloca { i32, [ 0 x i32 ] }
  store { i32, [ 0 x i32 ] } %array687, { i32, [ 0 x i32 ] }* %arr3692
  %_lhs693 = load i32* %c683
  %_lhs694 = load i32* @i637
  %bop695 = add i32 %_lhs693, %_lhs694
  store i32 %bop695, i32* %c683
  %_lhs696 = load i32* %c683
  %bound_ptr698 = getelementptr { i32, [ 0 x i32 ] }* @arr1643, i32 0, i32 0
  %bound699 = load i32* %bound_ptr698
  call void @oat_array_bounds_check( i32 %bound699, i32 1 )
  %elt697 = getelementptr { i32, [ 0 x i32 ] }* @arr1643, i32 0, i32 1, i32 1
  %_lhs700 = load i32* %elt697
  %bop701 = add i32 %_lhs696, %_lhs700
  store i32 %bop701, i32* %c683
  %_lhs702 = load i32* %c683
  %bound_ptr704 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* @arr2664, i32 0, i32 0
  %bound705 = load i32* %bound_ptr704
  call void @oat_array_bounds_check( i32 %bound705, i32 1 )
  %elt703 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* @arr2664, i32 0, i32 1, i32 1
  %bound_ptr707 = getelementptr { i32, [ 0 x i32 ] }* %elt703, i32 0, i32 0
  %bound708 = load i32* %bound_ptr707
  call void @oat_array_bounds_check( i32 %bound708, i32 1 )
  %elt706 = getelementptr { i32, [ 0 x i32 ] }* %elt703, i32 0, i32 1, i32 1
  %_lhs709 = load i32* %elt706
  %bop710 = add i32 %_lhs702, %_lhs709
  store i32 %bop710, i32* %c683
  %_lhs711 = load i32* %c683
  %bound_ptr713 = getelementptr { i32, [ 0 x i32 ] }* %arr3692, i32 0, i32 0
  %bound714 = load i32* %bound_ptr713
  call void @oat_array_bounds_check( i32 %bound714, i32 3 )
  %elt712 = getelementptr { i32, [ 0 x i32 ] }* %arr3692, i32 0, i32 1, i32 3
  %_lhs715 = load i32* %elt712
  %bop716 = add i32 %_lhs711, %_lhs715
  store i32 %bop716, i32* %c683
  %_lhs717 = load i32* %c683
  %_lhs718 = load { i32, [ 0 x i32 ] }* %arr3692
  %ret719 = call i32 @f ( { i32, [ 0 x i32 ] } %_lhs718 )
  %bop720 = add i32 %_lhs717, %ret719
  store i32 %bop720, i32* %c683
  %_lhs721 = load i32* %c683
  %bound_ptr723 = getelementptr { i32, [ 0 x i32 ] }* %arr4685, i32 0, i32 0
  %bound724 = load i32* %bound_ptr723
  call void @oat_array_bounds_check( i32 %bound724, i32 1 )
  %elt722 = getelementptr { i32, [ 0 x i32 ] }* %arr4685, i32 0, i32 1, i32 1
  %_lhs725 = load i32* %elt722
  %bop726 = add i32 %_lhs721, %_lhs725
  store i32 %bop726, i32* %c683
  %_lhs727 = load i32* %c683
  ret i32 %_lhs727
}


define { i32, [ 0 x i32 ] } @g (){

__fresh147:
  %array_ptr671 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 4 )
  %array672 = bitcast { i32, [ 0 x i32 ] } %array_ptr671 to { i32, [ 0 x i32 ] } 
  %index_ptr673 = getelementptr { i32, [ 0 x i32 ] } %array672, i32 0, i32 1, i32 0
  store i32 99, i32* %index_ptr673
  %index_ptr674 = getelementptr { i32, [ 0 x i32 ] } %array672, i32 0, i32 1, i32 1
  store i32 1, i32* %index_ptr674
  %index_ptr675 = getelementptr { i32, [ 0 x i32 ] } %array672, i32 0, i32 1, i32 2
  store i32 99, i32* %index_ptr675
  %index_ptr676 = getelementptr { i32, [ 0 x i32 ] } %array672, i32 0, i32 1, i32 3
  store i32 99, i32* %index_ptr676
  %arr677 = alloca { i32, [ 0 x i32 ] }
  store { i32, [ 0 x i32 ] } %array672, { i32, [ 0 x i32 ] }* %arr677
  %_lhs678 = load { i32, [ 0 x i32 ] }* %arr677
  ret { i32, [ 0 x i32 ] } %_lhs678
}


define i32 @f ({ i32, [ 0 x i32 ] } %arr665){

__fresh146:
  %arr_slot666 = alloca { i32, [ 0 x i32 ] }
  store { i32, [ 0 x i32 ] } %arr665, { i32, [ 0 x i32 ] }* %arr_slot666
  %bound_ptr668 = getelementptr { i32, [ 0 x i32 ] }* %arr_slot666, i32 0, i32 0
  %bound669 = load i32* %bound_ptr668
  call void @oat_array_bounds_check( i32 %bound669, i32 3 )
  %elt667 = getelementptr { i32, [ 0 x i32 ] }* %arr_slot666, i32 0, i32 1, i32 3
  %_lhs670 = load i32* %elt667
  ret i32 %_lhs670
}


define void @arr2664.init (){

__fresh145:
  %array_ptr644 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 3 )
  %array645 = bitcast { i32, [ 0 x i32 ] } %array_ptr644 to { i32, [ 0 x { i32, [ 0 x i32 ] } ] } 
  %array_ptr646 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 3 )
  %array647 = bitcast { i32, [ 0 x i32 ] } %array_ptr646 to { i32, [ 0 x i32 ] } 
  %index_ptr648 = getelementptr { i32, [ 0 x i32 ] } %array647, i32 0, i32 1, i32 0
  store i32 99, i32* %index_ptr648
  %index_ptr649 = getelementptr { i32, [ 0 x i32 ] } %array647, i32 0, i32 1, i32 1
  store i32 99, i32* %index_ptr649
  %index_ptr650 = getelementptr { i32, [ 0 x i32 ] } %array647, i32 0, i32 1, i32 2
  store i32 99, i32* %index_ptr650
  %index_ptr651 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %array645, i32 0, i32 1, i32 0
  store { i32, [ 0 x i32 ] } %array647, { i32, [ 0 x i32 ] }* %index_ptr651
  %array_ptr652 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 3 )
  %array653 = bitcast { i32, [ 0 x i32 ] } %array_ptr652 to { i32, [ 0 x i32 ] } 
  %index_ptr654 = getelementptr { i32, [ 0 x i32 ] } %array653, i32 0, i32 1, i32 0
  store i32 99, i32* %index_ptr654
  %index_ptr655 = getelementptr { i32, [ 0 x i32 ] } %array653, i32 0, i32 1, i32 1
  store i32 1, i32* %index_ptr655
  %index_ptr656 = getelementptr { i32, [ 0 x i32 ] } %array653, i32 0, i32 1, i32 2
  store i32 99, i32* %index_ptr656
  %index_ptr657 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %array645, i32 0, i32 1, i32 1
  store { i32, [ 0 x i32 ] } %array653, { i32, [ 0 x i32 ] }* %index_ptr657
  %array_ptr658 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 3 )
  %array659 = bitcast { i32, [ 0 x i32 ] } %array_ptr658 to { i32, [ 0 x i32 ] } 
  %index_ptr660 = getelementptr { i32, [ 0 x i32 ] } %array659, i32 0, i32 1, i32 0
  store i32 99, i32* %index_ptr660
  %index_ptr661 = getelementptr { i32, [ 0 x i32 ] } %array659, i32 0, i32 1, i32 1
  store i32 99, i32* %index_ptr661
  %index_ptr662 = getelementptr { i32, [ 0 x i32 ] } %array659, i32 0, i32 1, i32 2
  store i32 99, i32* %index_ptr662
  %index_ptr663 = getelementptr { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %array645, i32 0, i32 1, i32 2
  store { i32, [ 0 x i32 ] } %array659, { i32, [ 0 x i32 ] }* %index_ptr663
  store { i32, [ 0 x { i32, [ 0 x i32 ] } ] } %array645, { i32, [ 0 x { i32, [ 0 x i32 ] } ] }* @arr2664
  ret void
}


define void @arr1643.init (){

__fresh144:
  %array_ptr638 = call { i32, [ 0 x i32 ] } @oat_alloc_array ( i32 3 )
  %array639 = bitcast { i32, [ 0 x i32 ] } %array_ptr638 to { i32, [ 0 x i32 ] } 
  %index_ptr640 = getelementptr { i32, [ 0 x i32 ] } %array639, i32 0, i32 1, i32 0
  store i32 99, i32* %index_ptr640
  %index_ptr641 = getelementptr { i32, [ 0 x i32 ] } %array639, i32 0, i32 1, i32 1
  store i32 1, i32* %index_ptr641
  %index_ptr642 = getelementptr { i32, [ 0 x i32 ] } %array639, i32 0, i32 1, i32 2
  store i32 99, i32* %index_ptr642
  store { i32, [ 0 x i32 ] } %array639, { i32, [ 0 x i32 ] }* @arr1643
  ret void
}


