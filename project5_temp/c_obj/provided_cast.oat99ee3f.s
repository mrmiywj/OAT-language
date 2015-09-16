	.align 4
	.data
__const_str580:
	.ascii "makes sense.\0"
__const_str581:
	.ascii "???\0"
__const_str578:
	.ascii "makes sense.\0"
__const_str579:
	.ascii "???\0"
__const_str577:
	.ascii "Bb\0"
__const_str576:
	.ascii "Bb\0"
__const_str575:
	.ascii "B\0"
__const_str574:
	.ascii "B\0"
__const_str573:
	.ascii "A\0"
__const_str572:
	.ascii "A\0"
__const_str571:
	.ascii "Object\0"
__Bb_vtable570:
	.long __A_vtable568
	.long __Object_get_name
	.long __Bb_name

__B_vtable569:
	.long __A_vtable568
	.long __Object_get_name
	.long __B_name

__A_vtable568:
	.long __Object_vtable567
	.long __Object_get_name
	.long __A_name

__Object_vtable567:
	.long 0
	.long __Object_get_name

	.text
.globl _oat_init
_oat_init:
	pushl %ebp
	movl %esp, %ebp
	subl $0, %esp
__fresh981:
	movl %ebp, %esp
	popl %ebp
	ret
.globl _program
_program:
	pushl %ebp
	movl %esp, %ebp
	subl $416, %esp
__fresh964:
	leal -388(%ebp), %eax
	movl %eax, -92(%ebp)
	movl 8(%ebp), %eax
	movl %eax, %ecx
	movl -92(%ebp), %eax
	movl %ecx, (%eax)
	leal -384(%ebp), %eax
	movl %eax, -88(%ebp)
	movl 12(%ebp), %eax
	movl %eax, %ecx
	movl -88(%ebp), %eax
	movl %ecx, (%eax)
	movl $8, %eax
	pushl %eax
	call _oat_malloc
	movl %eax, -84(%ebp)
	addl $4, %esp
	movl -84(%ebp), %eax
	movl %eax, -80(%ebp)
	movl -80(%ebp), %eax
	pushl %eax
	call __A_ctor
	movl %eax, -76(%ebp)
	addl $4, %esp
	leal -380(%ebp), %eax
	movl %eax, -72(%ebp)
	movl -76(%ebp), %eax
	movl %eax, %ecx
	movl -72(%ebp), %eax
	movl %ecx, (%eax)
	movl $12, %eax
	pushl %eax
	call _oat_malloc
	movl %eax, -68(%ebp)
	addl $4, %esp
	movl -68(%ebp), %eax
	movl %eax, -64(%ebp)
	movl -64(%ebp), %eax
	pushl %eax
	call __B_ctor
	movl %eax, -60(%ebp)
	addl $4, %esp
	movl -60(%ebp), %eax
	movl %eax, -56(%ebp)
	leal -376(%ebp), %eax
	movl %eax, -52(%ebp)
	movl -56(%ebp), %eax
	movl %eax, %ecx
	movl -52(%ebp), %eax
	movl %ecx, (%eax)
	movl $12, %eax
	pushl %eax
	call _oat_malloc
	movl %eax, -48(%ebp)
	addl $4, %esp
	movl -48(%ebp), %eax
	movl %eax, -44(%ebp)
	movl -44(%ebp), %eax
	pushl %eax
	call __Bb_ctor
	movl %eax, -40(%ebp)
	addl $4, %esp
	movl -40(%ebp), %eax
	movl %eax, -36(%ebp)
	leal -372(%ebp), %eax
	movl %eax, -32(%ebp)
	movl -36(%ebp), %eax
	movl %eax, %ecx
	movl -32(%ebp), %eax
	movl %ecx, (%eax)
	leal -368(%ebp), %eax
	movl %eax, -28(%ebp)
	movl $0, %eax
	movl %eax, %ecx
	movl -28(%ebp), %eax
	movl %ecx, (%eax)
	movl -32(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -24(%ebp)
	movl -24(%ebp), %eax
	movl %eax, -20(%ebp)
	movl -20(%ebp), %eax
	movl %eax, -16(%ebp)
	movl $__Bb_vtable570, %eax
	movl %eax, -12(%ebp)
	leal -364(%ebp), %eax
	movl %eax, -8(%ebp)
	movl -16(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -4(%ebp)
	movl -4(%ebp), %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	jmp __loop945
__loop945:
	movl -8(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -100(%ebp)
	movl -100(%ebp), %eax
	movl %eax, %ecx
	movl -12(%ebp), %eax
	cmpl %eax, %ecx
	setE -96(%ebp)
	andl $1, -96(%ebp)
	movl -96(%ebp), %eax
	cmpl $0, %eax
	jNE __then942
	jmp __fall1944
__fresh965:
	jmp __fall1944
__fall1944:
	movl -100(%ebp), %eax
	movl %eax, %ecx
	movl $0, %eax
	cmpl %eax, %ecx
	setE -104(%ebp)
	andl $1, -104(%ebp)
	movl -104(%ebp), %eax
	cmpl $0, %eax
	jNE __else941
	jmp __fall2943
__fresh966:
	jmp __fall2943
__fall2943:
	movl -8(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -116(%ebp)
	movl -116(%ebp), %eax
	movl %eax, -112(%ebp)
	movl -112(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -108(%ebp)
	movl -108(%ebp), %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	jmp __loop945
__fresh967:
	jmp __then942
__then942:
	leal -392(%ebp), %eax
	movl %eax, -160(%ebp)
	movl -20(%ebp), %eax
	movl %eax, %ecx
	movl -160(%ebp), %eax
	movl %ecx, (%eax)
	movl -28(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -156(%ebp)
	movl -160(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -152(%ebp)
	movl -152(%ebp), %eax
	addl $8, %eax
	movl %eax, -148(%ebp)
	movl -148(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -144(%ebp)
	movl -156(%ebp), %eax
	movl %eax, -140(%ebp)
	movl -144(%ebp), %eax
	movl %eax, %ecx
	addl %ecx, -140(%ebp)
	movl -140(%ebp), %eax
	movl %eax, %ecx
	movl -28(%ebp), %eax
	movl %ecx, (%eax)
	movl -160(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -136(%ebp)
	movl -136(%ebp), %eax
	addl $0, %eax
	movl %eax, -132(%ebp)
	movl -132(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -128(%ebp)
	movl -128(%ebp), %eax
	addl $8, %eax
	movl %eax, -124(%ebp)
	movl -124(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -120(%ebp)
	movl -136(%ebp), %eax
	pushl %eax
	movl -120(%ebp), %eax
	call *%eax
	addl $4, %esp
	jmp __done940
__fresh968:
	jmp __else941
__else941:
	jmp __done940
__done940:
	movl -52(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -184(%ebp)
	movl -184(%ebp), %eax
	movl %eax, -180(%ebp)
	movl -180(%ebp), %eax
	movl %eax, -176(%ebp)
	movl $__B_vtable569, %eax
	movl %eax, -172(%ebp)
	leal -396(%ebp), %eax
	movl %eax, -168(%ebp)
	movl -176(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -164(%ebp)
	movl -164(%ebp), %eax
	movl %eax, %ecx
	movl -168(%ebp), %eax
	movl %ecx, (%eax)
	jmp __loop951
__loop951:
	movl -168(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -192(%ebp)
	movl -192(%ebp), %eax
	movl %eax, %ecx
	movl -172(%ebp), %eax
	cmpl %eax, %ecx
	setE -188(%ebp)
	andl $1, -188(%ebp)
	movl -188(%ebp), %eax
	cmpl $0, %eax
	jNE __then948
	jmp __fall1950
__fresh969:
	jmp __fall1950
__fall1950:
	movl -192(%ebp), %eax
	movl %eax, %ecx
	movl $0, %eax
	cmpl %eax, %ecx
	setE -196(%ebp)
	andl $1, -196(%ebp)
	movl -196(%ebp), %eax
	cmpl $0, %eax
	jNE __else947
	jmp __fall2949
__fresh970:
	jmp __fall2949
__fall2949:
	movl -168(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -208(%ebp)
	movl -208(%ebp), %eax
	movl %eax, -204(%ebp)
	movl -204(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -200(%ebp)
	movl -200(%ebp), %eax
	movl %eax, %ecx
	movl -168(%ebp), %eax
	movl %ecx, (%eax)
	jmp __loop951
__fresh971:
	jmp __then948
__then948:
	leal -400(%ebp), %eax
	movl %eax, -252(%ebp)
	movl -180(%ebp), %eax
	movl %eax, %ecx
	movl -252(%ebp), %eax
	movl %ecx, (%eax)
	movl -28(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -248(%ebp)
	movl -252(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -244(%ebp)
	movl -244(%ebp), %eax
	addl $8, %eax
	movl %eax, -240(%ebp)
	movl -240(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -236(%ebp)
	movl -248(%ebp), %eax
	movl %eax, -232(%ebp)
	movl -236(%ebp), %eax
	movl %eax, %ecx
	addl %ecx, -232(%ebp)
	movl -232(%ebp), %eax
	movl %eax, %ecx
	movl -28(%ebp), %eax
	movl %ecx, (%eax)
	movl -252(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -228(%ebp)
	movl -228(%ebp), %eax
	addl $0, %eax
	movl %eax, -224(%ebp)
	movl -224(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -220(%ebp)
	movl -220(%ebp), %eax
	addl $8, %eax
	movl %eax, -216(%ebp)
	movl -216(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -212(%ebp)
	movl -228(%ebp), %eax
	pushl %eax
	movl -212(%ebp), %eax
	call *%eax
	addl $4, %esp
	jmp __done946
__fresh972:
	jmp __else947
__else947:
	jmp __done946
__done946:
	movl -52(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -276(%ebp)
	movl -276(%ebp), %eax
	movl %eax, -272(%ebp)
	movl -272(%ebp), %eax
	movl %eax, -268(%ebp)
	movl $__Bb_vtable570, %eax
	movl %eax, -264(%ebp)
	leal -404(%ebp), %eax
	movl %eax, -260(%ebp)
	movl -268(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -256(%ebp)
	movl -256(%ebp), %eax
	movl %eax, %ecx
	movl -260(%ebp), %eax
	movl %ecx, (%eax)
	jmp __loop957
__loop957:
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
	jNE __then954
	jmp __fall1956
__fresh973:
	jmp __fall1956
__fall1956:
	movl -284(%ebp), %eax
	movl %eax, %ecx
	movl $0, %eax
	cmpl %eax, %ecx
	setE -288(%ebp)
	andl $1, -288(%ebp)
	movl -288(%ebp), %eax
	cmpl $0, %eax
	jNE __else953
	jmp __fall2955
__fresh974:
	jmp __fall2955
__fall2955:
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
	jmp __loop957
__fresh975:
	jmp __then954
__then954:
	leal -408(%ebp), %eax
	movl %eax, -304(%ebp)
	movl -272(%ebp), %eax
	movl %eax, %ecx
	movl -304(%ebp), %eax
	movl %ecx, (%eax)
	movl $__const_str579, %eax
	pushl %eax
	call _print_string
	addl $4, %esp
	movl $-1, %eax
	pushl %eax
	call _oat_abort
	addl $4, %esp
	jmp __done952
__fresh976:
	jmp __else953
__else953:
	movl $__const_str578, %eax
	pushl %eax
	call _print_string
	addl $4, %esp
	jmp __done952
__done952:
	movl -32(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -328(%ebp)
	movl -328(%ebp), %eax
	movl %eax, -324(%ebp)
	movl -324(%ebp), %eax
	movl %eax, -320(%ebp)
	movl $__B_vtable569, %eax
	movl %eax, -316(%ebp)
	leal -412(%ebp), %eax
	movl %eax, -312(%ebp)
	movl -320(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -308(%ebp)
	movl -308(%ebp), %eax
	movl %eax, %ecx
	movl -312(%ebp), %eax
	movl %ecx, (%eax)
	jmp __loop963
__loop963:
	movl -312(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -336(%ebp)
	movl -336(%ebp), %eax
	movl %eax, %ecx
	movl -316(%ebp), %eax
	cmpl %eax, %ecx
	setE -332(%ebp)
	andl $1, -332(%ebp)
	movl -332(%ebp), %eax
	cmpl $0, %eax
	jNE __then960
	jmp __fall1962
__fresh977:
	jmp __fall1962
__fall1962:
	movl -336(%ebp), %eax
	movl %eax, %ecx
	movl $0, %eax
	cmpl %eax, %ecx
	setE -340(%ebp)
	andl $1, -340(%ebp)
	movl -340(%ebp), %eax
	cmpl $0, %eax
	jNE __else959
	jmp __fall2961
__fresh978:
	jmp __fall2961
__fall2961:
	movl -312(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -352(%ebp)
	movl -352(%ebp), %eax
	movl %eax, -348(%ebp)
	movl -348(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -344(%ebp)
	movl -344(%ebp), %eax
	movl %eax, %ecx
	movl -312(%ebp), %eax
	movl %ecx, (%eax)
	jmp __loop963
__fresh979:
	jmp __then960
__then960:
	leal -416(%ebp), %eax
	movl %eax, -356(%ebp)
	movl -324(%ebp), %eax
	movl %eax, %ecx
	movl -356(%ebp), %eax
	movl %ecx, (%eax)
	movl $__const_str581, %eax
	pushl %eax
	call _print_string
	addl $4, %esp
	movl $-1, %eax
	pushl %eax
	call _oat_abort
	addl $4, %esp
	jmp __done958
__fresh980:
	jmp __else959
__else959:
	movl $__const_str580, %eax
	pushl %eax
	call _print_string
	addl $4, %esp
	jmp __done958
__done958:
	movl -28(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -360(%ebp)
	movl -360(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __Bb_name
__Bb_name:
	pushl %ebp
	movl %esp, %ebp
	subl $0, %esp
__fresh939:
	movl $__const_str577, %eax
	pushl %eax
	call _print_string
	addl $4, %esp
	movl %ebp, %esp
	popl %ebp
	ret
.globl __Bb_ctor
__Bb_ctor:
	pushl %ebp
	movl %esp, %ebp
	subl $20, %esp
__fresh938:
	movl 8(%ebp), %eax
	movl %eax, -20(%ebp)
	movl -20(%ebp), %eax
	pushl %eax
	call __A_ctor
	movl %eax, -16(%ebp)
	addl $4, %esp
	movl 8(%ebp), %eax
	addl $4, %eax
	movl %eax, -12(%ebp)
	movl $__const_str576, %eax
	movl %eax, %ecx
	movl -12(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -8(%ebp)
	movl $__Bb_vtable570, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $8, %eax
	movl %eax, -4(%ebp)
	movl $2, %eax
	movl %eax, %ecx
	movl -4(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __B_name
__B_name:
	pushl %ebp
	movl %esp, %ebp
	subl $0, %esp
__fresh937:
	movl $__const_str575, %eax
	pushl %eax
	call _print_string
	addl $4, %esp
	movl %ebp, %esp
	popl %ebp
	ret
.globl __B_ctor
__B_ctor:
	pushl %ebp
	movl %esp, %ebp
	subl $20, %esp
__fresh936:
	movl 8(%ebp), %eax
	movl %eax, -20(%ebp)
	movl -20(%ebp), %eax
	pushl %eax
	call __A_ctor
	movl %eax, -16(%ebp)
	addl $4, %esp
	movl 8(%ebp), %eax
	addl $4, %eax
	movl %eax, -12(%ebp)
	movl $__const_str574, %eax
	movl %eax, %ecx
	movl -12(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -8(%ebp)
	movl $__B_vtable569, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $8, %eax
	movl %eax, -4(%ebp)
	movl $1, %eax
	movl %eax, %ecx
	movl -4(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __A_name
__A_name:
	pushl %ebp
	movl %esp, %ebp
	subl $0, %esp
__fresh935:
	movl $__const_str573, %eax
	pushl %eax
	call _print_string
	addl $4, %esp
	movl %ebp, %esp
	popl %ebp
	ret
.globl __A_ctor
__A_ctor:
	pushl %ebp
	movl %esp, %ebp
	subl $16, %esp
__fresh934:
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
	movl $__const_str572, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -4(%ebp)
	movl $__A_vtable568, %eax
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
__fresh933:
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
__fresh932:
	movl 8(%ebp), %eax
	addl $4, %eax
	movl %eax, -8(%ebp)
	movl $__const_str571, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -4(%ebp)
	movl $__Object_vtable567, %eax
	movl %eax, %ecx
	movl -4(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
