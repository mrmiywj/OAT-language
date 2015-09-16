	.align 4
	.data
_bb536:
	.long 0
_b534:
	.long 0
_a532:
	.long 0
__const_str531:
	.ascii "Bb\0"
__const_str530:
	.ascii "B\0"
__const_str529:
	.ascii "A\0"
__const_str528:
	.ascii "Object\0"
__Bb_vtable527:
	.long __A_vtable525
	.long __Object_get_name

__B_vtable526:
	.long __A_vtable525
	.long __Object_get_name

__A_vtable525:
	.long __Object_vtable524
	.long __Object_get_name

__Object_vtable524:
	.long 0
	.long __Object_get_name

	.text
.globl _oat_init
_oat_init:
	pushl %ebp
	movl %esp, %ebp
	subl $0, %esp
__fresh900:
	call _a532.init533
	addl $0, %esp
	call _b534.init535
	addl $0, %esp
	call _bb536.init537
	addl $0, %esp
	movl %ebp, %esp
	popl %ebp
	ret
.globl _program
_program:
	pushl %ebp
	movl %esp, %ebp
	subl $640, %esp
__fresh863:
	leal -572(%ebp), %eax
	movl %eax, -36(%ebp)
	movl 8(%ebp), %eax
	movl %eax, %ecx
	movl -36(%ebp), %eax
	movl %ecx, (%eax)
	leal -568(%ebp), %eax
	movl %eax, -32(%ebp)
	movl 12(%ebp), %eax
	movl %eax, %ecx
	movl -32(%ebp), %eax
	movl %ecx, (%eax)
	leal -564(%ebp), %eax
	movl %eax, -28(%ebp)
	movl $0, %eax
	movl %eax, %ecx
	movl -28(%ebp), %eax
	movl %ecx, (%eax)
	movl $_a532, %eax
	movl (%eax), %ecx
	movl %ecx, -24(%ebp)
	movl -24(%ebp), %eax
	movl %eax, -20(%ebp)
	movl -20(%ebp), %eax
	movl %eax, -16(%ebp)
	movl $__A_vtable525, %eax
	movl %eax, -12(%ebp)
	leal -560(%ebp), %eax
	movl %eax, -8(%ebp)
	movl -16(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -4(%ebp)
	movl -4(%ebp), %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	jmp __loop814
__loop814:
	movl -8(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -44(%ebp)
	movl -44(%ebp), %eax
	movl %eax, %ecx
	movl -12(%ebp), %eax
	cmpl %eax, %ecx
	setE -40(%ebp)
	andl $1, -40(%ebp)
	movl -40(%ebp), %eax
	cmpl $0, %eax
	jNE __then811
	jmp __fall1813
__fresh864:
	jmp __fall1813
__fall1813:
	movl -44(%ebp), %eax
	movl %eax, %ecx
	movl $0, %eax
	cmpl %eax, %ecx
	setE -48(%ebp)
	andl $1, -48(%ebp)
	movl -48(%ebp), %eax
	cmpl $0, %eax
	jNE __else810
	jmp __fall2812
__fresh865:
	jmp __fall2812
__fall2812:
	movl -8(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -60(%ebp)
	movl -60(%ebp), %eax
	movl %eax, -56(%ebp)
	movl -56(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -52(%ebp)
	movl -52(%ebp), %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	jmp __loop814
__fresh866:
	jmp __then811
__then811:
	leal -576(%ebp), %eax
	movl %eax, -72(%ebp)
	movl -20(%ebp), %eax
	movl %eax, %ecx
	movl -72(%ebp), %eax
	movl %ecx, (%eax)
	movl -28(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -68(%ebp)
	movl -68(%ebp), %eax
	movl %eax, -64(%ebp)
	movl $1, %eax
	movl %eax, %ecx
	addl %ecx, -64(%ebp)
	movl -64(%ebp), %eax
	movl %eax, %ecx
	movl -28(%ebp), %eax
	movl %ecx, (%eax)
	jmp __done809
__fresh867:
	jmp __else810
__else810:
	jmp __done809
__done809:
	movl $_b534, %eax
	movl (%eax), %ecx
	movl %ecx, -96(%ebp)
	movl -96(%ebp), %eax
	movl %eax, -92(%ebp)
	movl -92(%ebp), %eax
	movl %eax, -88(%ebp)
	movl $__A_vtable525, %eax
	movl %eax, -84(%ebp)
	leal -580(%ebp), %eax
	movl %eax, -80(%ebp)
	movl -88(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -76(%ebp)
	movl -76(%ebp), %eax
	movl %eax, %ecx
	movl -80(%ebp), %eax
	movl %ecx, (%eax)
	jmp __loop820
__loop820:
	movl -80(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -104(%ebp)
	movl -104(%ebp), %eax
	movl %eax, %ecx
	movl -84(%ebp), %eax
	cmpl %eax, %ecx
	setE -100(%ebp)
	andl $1, -100(%ebp)
	movl -100(%ebp), %eax
	cmpl $0, %eax
	jNE __then817
	jmp __fall1819
__fresh868:
	jmp __fall1819
__fall1819:
	movl -104(%ebp), %eax
	movl %eax, %ecx
	movl $0, %eax
	cmpl %eax, %ecx
	setE -108(%ebp)
	andl $1, -108(%ebp)
	movl -108(%ebp), %eax
	cmpl $0, %eax
	jNE __else816
	jmp __fall2818
__fresh869:
	jmp __fall2818
__fall2818:
	movl -80(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -120(%ebp)
	movl -120(%ebp), %eax
	movl %eax, -116(%ebp)
	movl -116(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -112(%ebp)
	movl -112(%ebp), %eax
	movl %eax, %ecx
	movl -80(%ebp), %eax
	movl %ecx, (%eax)
	jmp __loop820
__fresh870:
	jmp __then817
__then817:
	leal -584(%ebp), %eax
	movl %eax, -132(%ebp)
	movl -92(%ebp), %eax
	movl %eax, %ecx
	movl -132(%ebp), %eax
	movl %ecx, (%eax)
	movl -28(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -128(%ebp)
	movl -128(%ebp), %eax
	movl %eax, -124(%ebp)
	movl $1, %eax
	movl %eax, %ecx
	addl %ecx, -124(%ebp)
	movl -124(%ebp), %eax
	movl %eax, %ecx
	movl -28(%ebp), %eax
	movl %ecx, (%eax)
	jmp __done815
__fresh871:
	jmp __else816
__else816:
	jmp __done815
__done815:
	movl $_bb536, %eax
	movl (%eax), %ecx
	movl %ecx, -156(%ebp)
	movl -156(%ebp), %eax
	movl %eax, -152(%ebp)
	movl -152(%ebp), %eax
	movl %eax, -148(%ebp)
	movl $__A_vtable525, %eax
	movl %eax, -144(%ebp)
	leal -588(%ebp), %eax
	movl %eax, -140(%ebp)
	movl -148(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -136(%ebp)
	movl -136(%ebp), %eax
	movl %eax, %ecx
	movl -140(%ebp), %eax
	movl %ecx, (%eax)
	jmp __loop826
__loop826:
	movl -140(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -164(%ebp)
	movl -164(%ebp), %eax
	movl %eax, %ecx
	movl -144(%ebp), %eax
	cmpl %eax, %ecx
	setE -160(%ebp)
	andl $1, -160(%ebp)
	movl -160(%ebp), %eax
	cmpl $0, %eax
	jNE __then823
	jmp __fall1825
__fresh872:
	jmp __fall1825
__fall1825:
	movl -164(%ebp), %eax
	movl %eax, %ecx
	movl $0, %eax
	cmpl %eax, %ecx
	setE -168(%ebp)
	andl $1, -168(%ebp)
	movl -168(%ebp), %eax
	cmpl $0, %eax
	jNE __else822
	jmp __fall2824
__fresh873:
	jmp __fall2824
__fall2824:
	movl -140(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -180(%ebp)
	movl -180(%ebp), %eax
	movl %eax, -176(%ebp)
	movl -176(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -172(%ebp)
	movl -172(%ebp), %eax
	movl %eax, %ecx
	movl -140(%ebp), %eax
	movl %ecx, (%eax)
	jmp __loop826
__fresh874:
	jmp __then823
__then823:
	leal -592(%ebp), %eax
	movl %eax, -192(%ebp)
	movl -152(%ebp), %eax
	movl %eax, %ecx
	movl -192(%ebp), %eax
	movl %ecx, (%eax)
	movl -28(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -188(%ebp)
	movl -188(%ebp), %eax
	movl %eax, -184(%ebp)
	movl $1, %eax
	movl %eax, %ecx
	addl %ecx, -184(%ebp)
	movl -184(%ebp), %eax
	movl %eax, %ecx
	movl -28(%ebp), %eax
	movl %ecx, (%eax)
	jmp __done821
__fresh875:
	jmp __else822
__else822:
	jmp __done821
__done821:
	movl $_b534, %eax
	movl (%eax), %ecx
	movl %ecx, -216(%ebp)
	movl -216(%ebp), %eax
	movl %eax, -212(%ebp)
	movl -212(%ebp), %eax
	movl %eax, -208(%ebp)
	movl $__B_vtable526, %eax
	movl %eax, -204(%ebp)
	leal -596(%ebp), %eax
	movl %eax, -200(%ebp)
	movl -208(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -196(%ebp)
	movl -196(%ebp), %eax
	movl %eax, %ecx
	movl -200(%ebp), %eax
	movl %ecx, (%eax)
	jmp __loop832
__loop832:
	movl -200(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -224(%ebp)
	movl -224(%ebp), %eax
	movl %eax, %ecx
	movl -204(%ebp), %eax
	cmpl %eax, %ecx
	setE -220(%ebp)
	andl $1, -220(%ebp)
	movl -220(%ebp), %eax
	cmpl $0, %eax
	jNE __then829
	jmp __fall1831
__fresh876:
	jmp __fall1831
__fall1831:
	movl -224(%ebp), %eax
	movl %eax, %ecx
	movl $0, %eax
	cmpl %eax, %ecx
	setE -228(%ebp)
	andl $1, -228(%ebp)
	movl -228(%ebp), %eax
	cmpl $0, %eax
	jNE __else828
	jmp __fall2830
__fresh877:
	jmp __fall2830
__fall2830:
	movl -200(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -240(%ebp)
	movl -240(%ebp), %eax
	movl %eax, -236(%ebp)
	movl -236(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -232(%ebp)
	movl -232(%ebp), %eax
	movl %eax, %ecx
	movl -200(%ebp), %eax
	movl %ecx, (%eax)
	jmp __loop832
__fresh878:
	jmp __then829
__then829:
	leal -600(%ebp), %eax
	movl %eax, -252(%ebp)
	movl -212(%ebp), %eax
	movl %eax, %ecx
	movl -252(%ebp), %eax
	movl %ecx, (%eax)
	movl -28(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -248(%ebp)
	movl -248(%ebp), %eax
	movl %eax, -244(%ebp)
	movl $1, %eax
	movl %eax, %ecx
	addl %ecx, -244(%ebp)
	movl -244(%ebp), %eax
	movl %eax, %ecx
	movl -28(%ebp), %eax
	movl %ecx, (%eax)
	jmp __done827
__fresh879:
	jmp __else828
__else828:
	jmp __done827
__done827:
	movl $_bb536, %eax
	movl (%eax), %ecx
	movl %ecx, -276(%ebp)
	movl -276(%ebp), %eax
	movl %eax, -272(%ebp)
	movl -272(%ebp), %eax
	movl %eax, -268(%ebp)
	movl $__Bb_vtable527, %eax
	movl %eax, -264(%ebp)
	leal -604(%ebp), %eax
	movl %eax, -260(%ebp)
	movl -268(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -256(%ebp)
	movl -256(%ebp), %eax
	movl %eax, %ecx
	movl -260(%ebp), %eax
	movl %ecx, (%eax)
	jmp __loop838
__loop838:
	movl -260(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -284(%ebp)
	movl -284(%ebp), %eax
	movl %eax, %ecx
	movl -264(%ebp), %eax
	cmpl %eax, %ecx
	setE -280(%ebp)
	andl $1, -280(%ebp)
	movl -280(%ebp), %eax
	cmpl $0, %eax
	jNE __then835
	jmp __fall1837
__fresh880:
	jmp __fall1837
__fall1837:
	movl -284(%ebp), %eax
	movl %eax, %ecx
	movl $0, %eax
	cmpl %eax, %ecx
	setE -288(%ebp)
	andl $1, -288(%ebp)
	movl -288(%ebp), %eax
	cmpl $0, %eax
	jNE __else834
	jmp __fall2836
__fresh881:
	jmp __fall2836
__fall2836:
	movl -260(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -300(%ebp)
	movl -300(%ebp), %eax
	movl %eax, -296(%ebp)
	movl -296(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -292(%ebp)
	movl -292(%ebp), %eax
	movl %eax, %ecx
	movl -260(%ebp), %eax
	movl %ecx, (%eax)
	jmp __loop838
__fresh882:
	jmp __then835
__then835:
	leal -608(%ebp), %eax
	movl %eax, -312(%ebp)
	movl -272(%ebp), %eax
	movl %eax, %ecx
	movl -312(%ebp), %eax
	movl %ecx, (%eax)
	movl -28(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -308(%ebp)
	movl -308(%ebp), %eax
	movl %eax, -304(%ebp)
	movl $1, %eax
	movl %eax, %ecx
	addl %ecx, -304(%ebp)
	movl -304(%ebp), %eax
	movl %eax, %ecx
	movl -28(%ebp), %eax
	movl %ecx, (%eax)
	jmp __done833
__fresh883:
	jmp __else834
__else834:
	jmp __done833
__done833:
	movl $_a532, %eax
	movl (%eax), %ecx
	movl %ecx, -336(%ebp)
	movl -336(%ebp), %eax
	movl %eax, -332(%ebp)
	movl -332(%ebp), %eax
	movl %eax, -328(%ebp)
	movl $__B_vtable526, %eax
	movl %eax, -324(%ebp)
	leal -612(%ebp), %eax
	movl %eax, -320(%ebp)
	movl -328(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -316(%ebp)
	movl -316(%ebp), %eax
	movl %eax, %ecx
	movl -320(%ebp), %eax
	movl %ecx, (%eax)
	jmp __loop844
__loop844:
	movl -320(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -344(%ebp)
	movl -344(%ebp), %eax
	movl %eax, %ecx
	movl -324(%ebp), %eax
	cmpl %eax, %ecx
	setE -340(%ebp)
	andl $1, -340(%ebp)
	movl -340(%ebp), %eax
	cmpl $0, %eax
	jNE __then841
	jmp __fall1843
__fresh884:
	jmp __fall1843
__fall1843:
	movl -344(%ebp), %eax
	movl %eax, %ecx
	movl $0, %eax
	cmpl %eax, %ecx
	setE -348(%ebp)
	andl $1, -348(%ebp)
	movl -348(%ebp), %eax
	cmpl $0, %eax
	jNE __else840
	jmp __fall2842
__fresh885:
	jmp __fall2842
__fall2842:
	movl -320(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -360(%ebp)
	movl -360(%ebp), %eax
	movl %eax, -356(%ebp)
	movl -356(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -352(%ebp)
	movl -352(%ebp), %eax
	movl %eax, %ecx
	movl -320(%ebp), %eax
	movl %ecx, (%eax)
	jmp __loop844
__fresh886:
	jmp __then841
__then841:
	leal -616(%ebp), %eax
	movl %eax, -364(%ebp)
	movl -332(%ebp), %eax
	movl %eax, %ecx
	movl -364(%ebp), %eax
	movl %ecx, (%eax)
	jmp __done839
__fresh887:
	jmp __else840
__else840:
	movl -28(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -372(%ebp)
	movl -372(%ebp), %eax
	movl %eax, -368(%ebp)
	movl $1, %eax
	movl %eax, %ecx
	addl %ecx, -368(%ebp)
	movl -368(%ebp), %eax
	movl %eax, %ecx
	movl -28(%ebp), %eax
	movl %ecx, (%eax)
	jmp __done839
__done839:
	movl $_a532, %eax
	movl (%eax), %ecx
	movl %ecx, -396(%ebp)
	movl -396(%ebp), %eax
	movl %eax, -392(%ebp)
	movl -392(%ebp), %eax
	movl %eax, -388(%ebp)
	movl $__Bb_vtable527, %eax
	movl %eax, -384(%ebp)
	leal -620(%ebp), %eax
	movl %eax, -380(%ebp)
	movl -388(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -376(%ebp)
	movl -376(%ebp), %eax
	movl %eax, %ecx
	movl -380(%ebp), %eax
	movl %ecx, (%eax)
	jmp __loop850
__loop850:
	movl -380(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -404(%ebp)
	movl -404(%ebp), %eax
	movl %eax, %ecx
	movl -384(%ebp), %eax
	cmpl %eax, %ecx
	setE -400(%ebp)
	andl $1, -400(%ebp)
	movl -400(%ebp), %eax
	cmpl $0, %eax
	jNE __then847
	jmp __fall1849
__fresh888:
	jmp __fall1849
__fall1849:
	movl -404(%ebp), %eax
	movl %eax, %ecx
	movl $0, %eax
	cmpl %eax, %ecx
	setE -408(%ebp)
	andl $1, -408(%ebp)
	movl -408(%ebp), %eax
	cmpl $0, %eax
	jNE __else846
	jmp __fall2848
__fresh889:
	jmp __fall2848
__fall2848:
	movl -380(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -420(%ebp)
	movl -420(%ebp), %eax
	movl %eax, -416(%ebp)
	movl -416(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -412(%ebp)
	movl -412(%ebp), %eax
	movl %eax, %ecx
	movl -380(%ebp), %eax
	movl %ecx, (%eax)
	jmp __loop850
__fresh890:
	jmp __then847
__then847:
	leal -624(%ebp), %eax
	movl %eax, -424(%ebp)
	movl -392(%ebp), %eax
	movl %eax, %ecx
	movl -424(%ebp), %eax
	movl %ecx, (%eax)
	jmp __done845
__fresh891:
	jmp __else846
__else846:
	movl -28(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -432(%ebp)
	movl -432(%ebp), %eax
	movl %eax, -428(%ebp)
	movl $1, %eax
	movl %eax, %ecx
	addl %ecx, -428(%ebp)
	movl -428(%ebp), %eax
	movl %eax, %ecx
	movl -28(%ebp), %eax
	movl %ecx, (%eax)
	jmp __done845
__done845:
	movl $_b534, %eax
	movl (%eax), %ecx
	movl %ecx, -456(%ebp)
	movl -456(%ebp), %eax
	movl %eax, -452(%ebp)
	movl -452(%ebp), %eax
	movl %eax, -448(%ebp)
	movl $__Bb_vtable527, %eax
	movl %eax, -444(%ebp)
	leal -628(%ebp), %eax
	movl %eax, -440(%ebp)
	movl -448(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -436(%ebp)
	movl -436(%ebp), %eax
	movl %eax, %ecx
	movl -440(%ebp), %eax
	movl %ecx, (%eax)
	jmp __loop856
__loop856:
	movl -440(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -464(%ebp)
	movl -464(%ebp), %eax
	movl %eax, %ecx
	movl -444(%ebp), %eax
	cmpl %eax, %ecx
	setE -460(%ebp)
	andl $1, -460(%ebp)
	movl -460(%ebp), %eax
	cmpl $0, %eax
	jNE __then853
	jmp __fall1855
__fresh892:
	jmp __fall1855
__fall1855:
	movl -464(%ebp), %eax
	movl %eax, %ecx
	movl $0, %eax
	cmpl %eax, %ecx
	setE -468(%ebp)
	andl $1, -468(%ebp)
	movl -468(%ebp), %eax
	cmpl $0, %eax
	jNE __else852
	jmp __fall2854
__fresh893:
	jmp __fall2854
__fall2854:
	movl -440(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -480(%ebp)
	movl -480(%ebp), %eax
	movl %eax, -476(%ebp)
	movl -476(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -472(%ebp)
	movl -472(%ebp), %eax
	movl %eax, %ecx
	movl -440(%ebp), %eax
	movl %ecx, (%eax)
	jmp __loop856
__fresh894:
	jmp __then853
__then853:
	leal -632(%ebp), %eax
	movl %eax, -484(%ebp)
	movl -452(%ebp), %eax
	movl %eax, %ecx
	movl -484(%ebp), %eax
	movl %ecx, (%eax)
	jmp __done851
__fresh895:
	jmp __else852
__else852:
	movl -28(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -492(%ebp)
	movl -492(%ebp), %eax
	movl %eax, -488(%ebp)
	movl $1, %eax
	movl %eax, %ecx
	addl %ecx, -488(%ebp)
	movl -488(%ebp), %eax
	movl %eax, %ecx
	movl -28(%ebp), %eax
	movl %ecx, (%eax)
	jmp __done851
__done851:
	movl $_bb536, %eax
	movl (%eax), %ecx
	movl %ecx, -516(%ebp)
	movl -516(%ebp), %eax
	movl %eax, -512(%ebp)
	movl -512(%ebp), %eax
	movl %eax, -508(%ebp)
	movl $__B_vtable526, %eax
	movl %eax, -504(%ebp)
	leal -636(%ebp), %eax
	movl %eax, -500(%ebp)
	movl -508(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -496(%ebp)
	movl -496(%ebp), %eax
	movl %eax, %ecx
	movl -500(%ebp), %eax
	movl %ecx, (%eax)
	jmp __loop862
__loop862:
	movl -500(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -524(%ebp)
	movl -524(%ebp), %eax
	movl %eax, %ecx
	movl -504(%ebp), %eax
	cmpl %eax, %ecx
	setE -520(%ebp)
	andl $1, -520(%ebp)
	movl -520(%ebp), %eax
	cmpl $0, %eax
	jNE __then859
	jmp __fall1861
__fresh896:
	jmp __fall1861
__fall1861:
	movl -524(%ebp), %eax
	movl %eax, %ecx
	movl $0, %eax
	cmpl %eax, %ecx
	setE -528(%ebp)
	andl $1, -528(%ebp)
	movl -528(%ebp), %eax
	cmpl $0, %eax
	jNE __else858
	jmp __fall2860
__fresh897:
	jmp __fall2860
__fall2860:
	movl -500(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -540(%ebp)
	movl -540(%ebp), %eax
	movl %eax, -536(%ebp)
	movl -536(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -532(%ebp)
	movl -532(%ebp), %eax
	movl %eax, %ecx
	movl -500(%ebp), %eax
	movl %ecx, (%eax)
	jmp __loop862
__fresh898:
	jmp __then859
__then859:
	leal -640(%ebp), %eax
	movl %eax, -544(%ebp)
	movl -512(%ebp), %eax
	movl %eax, %ecx
	movl -544(%ebp), %eax
	movl %ecx, (%eax)
	jmp __done857
__fresh899:
	jmp __else858
__else858:
	movl -28(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -552(%ebp)
	movl -552(%ebp), %eax
	movl %eax, -548(%ebp)
	movl $1, %eax
	movl %eax, %ecx
	addl %ecx, -548(%ebp)
	movl -548(%ebp), %eax
	movl %eax, %ecx
	movl -28(%ebp), %eax
	movl %ecx, (%eax)
	jmp __done857
__done857:
	movl -28(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -556(%ebp)
	movl -556(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl _bb536.init537
_bb536.init537:
	pushl %ebp
	movl %esp, %ebp
	subl $16, %esp
__fresh808:
	movl $8, %eax
	pushl %eax
	call _oat_malloc
	movl %eax, -16(%ebp)
	addl $4, %esp
	movl -16(%ebp), %eax
	movl %eax, -12(%ebp)
	movl -12(%ebp), %eax
	pushl %eax
	call __Bb_ctor
	movl %eax, -8(%ebp)
	addl $4, %esp
	movl -8(%ebp), %eax
	movl %eax, -4(%ebp)
	movl -4(%ebp), %eax
	movl %eax, _bb536
	movl %ebp, %esp
	popl %ebp
	ret
.globl _b534.init535
_b534.init535:
	pushl %ebp
	movl %esp, %ebp
	subl $16, %esp
__fresh807:
	movl $8, %eax
	pushl %eax
	call _oat_malloc
	movl %eax, -16(%ebp)
	addl $4, %esp
	movl -16(%ebp), %eax
	movl %eax, -12(%ebp)
	movl -12(%ebp), %eax
	pushl %eax
	call __B_ctor
	movl %eax, -8(%ebp)
	addl $4, %esp
	movl -8(%ebp), %eax
	movl %eax, -4(%ebp)
	movl -4(%ebp), %eax
	movl %eax, _b534
	movl %ebp, %esp
	popl %ebp
	ret
.globl _a532.init533
_a532.init533:
	pushl %ebp
	movl %esp, %ebp
	subl $16, %esp
__fresh806:
	movl $8, %eax
	pushl %eax
	call _oat_malloc
	movl %eax, -16(%ebp)
	addl $4, %esp
	movl -16(%ebp), %eax
	movl %eax, -12(%ebp)
	movl -12(%ebp), %eax
	pushl %eax
	call __A_ctor
	movl %eax, -8(%ebp)
	addl $4, %esp
	movl -8(%ebp), %eax
	movl %eax, -4(%ebp)
	movl -4(%ebp), %eax
	movl %eax, _a532
	movl %ebp, %esp
	popl %ebp
	ret
.globl __Bb_ctor
__Bb_ctor:
	pushl %ebp
	movl %esp, %ebp
	subl $16, %esp
__fresh805:
	movl 8(%ebp), %eax
	movl %eax, -16(%ebp)
	movl -16(%ebp), %eax
	pushl %eax
	call __A_ctor
	movl %eax, -12(%ebp)
	addl $4, %esp
	movl 8(%ebp), %eax
	addl $4, %eax
	movl %eax, -8(%ebp)
	movl $__const_str531, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -4(%ebp)
	movl $__Bb_vtable527, %eax
	movl %eax, %ecx
	movl -4(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __B_ctor
__B_ctor:
	pushl %ebp
	movl %esp, %ebp
	subl $16, %esp
__fresh804:
	movl 8(%ebp), %eax
	movl %eax, -16(%ebp)
	movl -16(%ebp), %eax
	pushl %eax
	call __A_ctor
	movl %eax, -12(%ebp)
	addl $4, %esp
	movl 8(%ebp), %eax
	addl $4, %eax
	movl %eax, -8(%ebp)
	movl $__const_str530, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -4(%ebp)
	movl $__B_vtable526, %eax
	movl %eax, %ecx
	movl -4(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __A_ctor
__A_ctor:
	pushl %ebp
	movl %esp, %ebp
	subl $16, %esp
__fresh803:
	movl 8(%ebp), %eax
	movl %eax, -16(%ebp)
	movl -16(%ebp), %eax
	pushl %eax
	call __Object_ctor
	movl %eax, -12(%ebp)
	addl $4, %esp
	movl 8(%ebp), %eax
	addl $4, %eax
	movl %eax, -8(%ebp)
	movl $__const_str529, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -4(%ebp)
	movl $__A_vtable525, %eax
	movl %eax, %ecx
	movl -4(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __Object_get_name
__Object_get_name:
	pushl %ebp
	movl %esp, %ebp
	subl $8, %esp
__fresh802:
	movl 8(%ebp), %eax
	addl $4, %eax
	movl %eax, -8(%ebp)
	movl -8(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -4(%ebp)
	movl -4(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __Object_ctor
__Object_ctor:
	pushl %ebp
	movl %esp, %ebp
	subl $8, %esp
__fresh801:
	movl 8(%ebp), %eax
	addl $4, %eax
	movl %eax, -8(%ebp)
	movl $__const_str528, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -4(%ebp)
	movl $__Object_vtable524, %eax
	movl %eax, %ecx
	movl -4(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
