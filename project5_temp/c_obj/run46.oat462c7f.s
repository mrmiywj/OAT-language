	.align 4
	.data
__const_str315:
	.ascii "B\0"
__const_str314:
	.ascii "A\0"
__const_str313:
	.ascii "S\0"
_arr311:
	.long 0
__const_str310:
	.ascii "Object\0"
__B_vtable309:
	.long __Object_vtable306
	.long __Object_get_name
	.long __B_f

__A_vtable308:
	.long __Object_vtable306
	.long __Object_get_name
	.long __A_g

__S_vtable307:
	.long __Object_vtable306
	.long __Object_get_name
	.long __S_g
	.long __S_f

__Object_vtable306:
	.long 0
	.long __Object_get_name

	.text
.globl _oat_init
_oat_init:
	pushl %ebp
	movl %esp, %ebp
	subl $0, %esp
__fresh544:
	call _arr311.init312
	addl $0, %esp
	movl %ebp, %esp
	popl %ebp
	ret
.globl _program
_program:
	pushl %ebp
	movl %esp, %ebp
	subl $604, %esp
__fresh543:
	leal -604(%ebp), %eax
	movl %eax, -592(%ebp)
	movl 8(%ebp), %eax
	movl %eax, %ecx
	movl -592(%ebp), %eax
	movl %ecx, (%eax)
	leal -600(%ebp), %eax
	movl %eax, -588(%ebp)
	movl 12(%ebp), %eax
	movl %eax, %ecx
	movl -588(%ebp), %eax
	movl %ecx, (%eax)
	movl $8, %eax
	pushl %eax
	call _oat_malloc
	movl %eax, -584(%ebp)
	addl $4, %esp
	movl -584(%ebp), %eax
	movl %eax, -580(%ebp)
	movl -580(%ebp), %eax
	pushl %eax
	call __B_ctor
	movl %eax, -576(%ebp)
	addl $4, %esp
	leal -596(%ebp), %eax
	movl %eax, -572(%ebp)
	movl -576(%ebp), %eax
	movl %eax, %ecx
	movl -572(%ebp), %eax
	movl %ecx, (%eax)
	movl -572(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -568(%ebp)
	movl -568(%ebp), %eax
	addl $0, %eax
	movl %eax, -564(%ebp)
	movl -564(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -560(%ebp)
	movl -560(%ebp), %eax
	addl $8, %eax
	movl %eax, -556(%ebp)
	movl -556(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -552(%ebp)
	movl -568(%ebp), %eax
	pushl %eax
	movl -552(%ebp), %eax
	call *%eax
	movl %eax, -548(%ebp)
	addl $4, %esp
	movl -548(%ebp), %eax
	addl $12, %eax
	movl %eax, -544(%ebp)
	movl -544(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -540(%ebp)
	movl -540(%ebp), %eax
	addl $0, %eax
	movl %eax, -536(%ebp)
	movl -536(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -532(%ebp)
	movl -532(%ebp), %eax
	addl $8, %eax
	movl %eax, -528(%ebp)
	movl -528(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -524(%ebp)
	movl -540(%ebp), %eax
	pushl %eax
	movl -524(%ebp), %eax
	call *%eax
	movl %eax, -520(%ebp)
	addl $4, %esp
	movl -520(%ebp), %eax
	addl $0, %eax
	movl %eax, -516(%ebp)
	movl -516(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -512(%ebp)
	movl $1, %eax
	pushl %eax
	movl -512(%ebp), %eax
	pushl %eax
	call _oat_array_bounds_check
	addl $8, %esp
	movl -520(%ebp), %eax
	addl $4, %eax
	addl $4, %eax
	movl %eax, -508(%ebp)
	movl $100, %eax
	movl %eax, %ecx
	movl -508(%ebp), %eax
	movl %ecx, (%eax)
	movl -572(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -504(%ebp)
	movl -504(%ebp), %eax
	addl $0, %eax
	movl %eax, -500(%ebp)
	movl -500(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -496(%ebp)
	movl -496(%ebp), %eax
	addl $8, %eax
	movl %eax, -492(%ebp)
	movl -492(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -488(%ebp)
	movl -504(%ebp), %eax
	pushl %eax
	movl -488(%ebp), %eax
	call *%eax
	movl %eax, -484(%ebp)
	addl $4, %esp
	movl -484(%ebp), %eax
	addl $8, %eax
	movl %eax, -480(%ebp)
	movl -480(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -476(%ebp)
	movl -572(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -472(%ebp)
	movl -472(%ebp), %eax
	addl $0, %eax
	movl %eax, -468(%ebp)
	movl -468(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -464(%ebp)
	movl -464(%ebp), %eax
	addl $8, %eax
	movl %eax, -460(%ebp)
	movl -460(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -456(%ebp)
	movl -472(%ebp), %eax
	pushl %eax
	movl -456(%ebp), %eax
	call *%eax
	movl %eax, -452(%ebp)
	addl $4, %esp
	movl -452(%ebp), %eax
	addl $0, %eax
	movl %eax, -448(%ebp)
	movl -448(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -444(%ebp)
	movl -444(%ebp), %eax
	addl $8, %eax
	movl %eax, -440(%ebp)
	movl -440(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -436(%ebp)
	movl -452(%ebp), %eax
	pushl %eax
	movl -436(%ebp), %eax
	call *%eax
	movl %eax, -432(%ebp)
	addl $4, %esp
	movl -432(%ebp), %eax
	addl $0, %eax
	movl %eax, -428(%ebp)
	movl -428(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -424(%ebp)
	movl -424(%ebp), %eax
	addl $8, %eax
	movl %eax, -420(%ebp)
	movl -420(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -416(%ebp)
	movl -432(%ebp), %eax
	pushl %eax
	movl -416(%ebp), %eax
	call *%eax
	movl %eax, -412(%ebp)
	addl $4, %esp
	movl -412(%ebp), %eax
	addl $0, %eax
	movl %eax, -408(%ebp)
	movl -408(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -404(%ebp)
	movl -404(%ebp), %eax
	addl $8, %eax
	movl %eax, -400(%ebp)
	movl -400(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -396(%ebp)
	movl -412(%ebp), %eax
	pushl %eax
	movl -396(%ebp), %eax
	call *%eax
	movl %eax, -392(%ebp)
	addl $4, %esp
	movl -392(%ebp), %eax
	addl $8, %eax
	movl %eax, -388(%ebp)
	movl -388(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -384(%ebp)
	movl -476(%ebp), %eax
	movl %eax, -380(%ebp)
	movl -384(%ebp), %eax
	movl %eax, %ecx
	addl %ecx, -380(%ebp)
	movl -572(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -376(%ebp)
	movl -376(%ebp), %eax
	addl $0, %eax
	movl %eax, -372(%ebp)
	movl -372(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -368(%ebp)
	movl -368(%ebp), %eax
	addl $8, %eax
	movl %eax, -364(%ebp)
	movl -364(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -360(%ebp)
	movl -376(%ebp), %eax
	pushl %eax
	movl -360(%ebp), %eax
	call *%eax
	movl %eax, -356(%ebp)
	addl $4, %esp
	movl -356(%ebp), %eax
	addl $0, %eax
	movl %eax, -352(%ebp)
	movl -352(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -348(%ebp)
	movl -348(%ebp), %eax
	addl $8, %eax
	movl %eax, -344(%ebp)
	movl -344(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -340(%ebp)
	movl -356(%ebp), %eax
	pushl %eax
	movl -340(%ebp), %eax
	call *%eax
	movl %eax, -336(%ebp)
	addl $4, %esp
	movl -336(%ebp), %eax
	addl $0, %eax
	movl %eax, -332(%ebp)
	movl -332(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -328(%ebp)
	movl -328(%ebp), %eax
	addl $8, %eax
	movl %eax, -324(%ebp)
	movl -324(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -320(%ebp)
	movl -336(%ebp), %eax
	pushl %eax
	movl -320(%ebp), %eax
	call *%eax
	movl %eax, -316(%ebp)
	addl $4, %esp
	movl -316(%ebp), %eax
	addl $0, %eax
	movl %eax, -312(%ebp)
	movl -312(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -308(%ebp)
	movl -308(%ebp), %eax
	addl $8, %eax
	movl %eax, -304(%ebp)
	movl -304(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -300(%ebp)
	movl -316(%ebp), %eax
	pushl %eax
	movl -300(%ebp), %eax
	call *%eax
	movl %eax, -296(%ebp)
	addl $4, %esp
	movl -296(%ebp), %eax
	addl $0, %eax
	movl %eax, -292(%ebp)
	movl -292(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -288(%ebp)
	movl -288(%ebp), %eax
	addl $8, %eax
	movl %eax, -284(%ebp)
	movl -284(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -280(%ebp)
	movl -296(%ebp), %eax
	pushl %eax
	movl -280(%ebp), %eax
	call *%eax
	movl %eax, -276(%ebp)
	addl $4, %esp
	movl -276(%ebp), %eax
	addl $0, %eax
	movl %eax, -272(%ebp)
	movl -272(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -268(%ebp)
	movl -268(%ebp), %eax
	addl $8, %eax
	movl %eax, -264(%ebp)
	movl -264(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -260(%ebp)
	movl -276(%ebp), %eax
	pushl %eax
	movl -260(%ebp), %eax
	call *%eax
	movl %eax, -256(%ebp)
	addl $4, %esp
	movl -256(%ebp), %eax
	addl $0, %eax
	movl %eax, -252(%ebp)
	movl -252(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -248(%ebp)
	movl -248(%ebp), %eax
	addl $8, %eax
	movl %eax, -244(%ebp)
	movl -244(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -240(%ebp)
	movl -256(%ebp), %eax
	pushl %eax
	movl -240(%ebp), %eax
	call *%eax
	movl %eax, -236(%ebp)
	addl $4, %esp
	movl -236(%ebp), %eax
	addl $0, %eax
	movl %eax, -232(%ebp)
	movl -232(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -228(%ebp)
	movl -228(%ebp), %eax
	addl $8, %eax
	movl %eax, -224(%ebp)
	movl -224(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -220(%ebp)
	movl -236(%ebp), %eax
	pushl %eax
	movl -220(%ebp), %eax
	call *%eax
	movl %eax, -216(%ebp)
	addl $4, %esp
	movl -216(%ebp), %eax
	addl $0, %eax
	movl %eax, -212(%ebp)
	movl -212(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -208(%ebp)
	movl -208(%ebp), %eax
	addl $8, %eax
	movl %eax, -204(%ebp)
	movl -204(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -200(%ebp)
	movl -216(%ebp), %eax
	pushl %eax
	movl -200(%ebp), %eax
	call *%eax
	movl %eax, -196(%ebp)
	addl $4, %esp
	movl -196(%ebp), %eax
	addl $0, %eax
	movl %eax, -192(%ebp)
	movl -192(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -188(%ebp)
	movl -188(%ebp), %eax
	addl $8, %eax
	movl %eax, -184(%ebp)
	movl -184(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -180(%ebp)
	movl -196(%ebp), %eax
	pushl %eax
	movl -180(%ebp), %eax
	call *%eax
	movl %eax, -176(%ebp)
	addl $4, %esp
	movl -176(%ebp), %eax
	addl $8, %eax
	movl %eax, -172(%ebp)
	movl -172(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -168(%ebp)
	movl -380(%ebp), %eax
	movl %eax, -164(%ebp)
	movl -168(%ebp), %eax
	movl %eax, %ecx
	addl %ecx, -164(%ebp)
	movl -572(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -160(%ebp)
	movl -160(%ebp), %eax
	addl $0, %eax
	movl %eax, -156(%ebp)
	movl -156(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -152(%ebp)
	movl -152(%ebp), %eax
	addl $8, %eax
	movl %eax, -148(%ebp)
	movl -148(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -144(%ebp)
	movl -160(%ebp), %eax
	pushl %eax
	movl -144(%ebp), %eax
	call *%eax
	movl %eax, -140(%ebp)
	addl $4, %esp
	movl -140(%ebp), %eax
	addl $12, %eax
	movl %eax, -136(%ebp)
	movl -136(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -132(%ebp)
	movl -132(%ebp), %eax
	addl $0, %eax
	movl %eax, -128(%ebp)
	movl -128(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -124(%ebp)
	movl -124(%ebp), %eax
	addl $12, %eax
	movl %eax, -120(%ebp)
	movl -120(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -116(%ebp)
	movl -132(%ebp), %eax
	pushl %eax
	movl -116(%ebp), %eax
	call *%eax
	movl %eax, -112(%ebp)
	addl $4, %esp
	movl -112(%ebp), %eax
	addl $8, %eax
	movl %eax, -108(%ebp)
	movl -108(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -104(%ebp)
	movl -164(%ebp), %eax
	movl %eax, -100(%ebp)
	movl -104(%ebp), %eax
	movl %eax, %ecx
	addl %ecx, -100(%ebp)
	movl $_arr311, %eax
	movl (%eax), %ecx
	movl %ecx, -96(%ebp)
	movl -96(%ebp), %eax
	addl $0, %eax
	movl %eax, -92(%ebp)
	movl -92(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -88(%ebp)
	movl $1, %eax
	pushl %eax
	movl -88(%ebp), %eax
	pushl %eax
	call _oat_array_bounds_check
	addl $8, %esp
	movl -96(%ebp), %eax
	addl $4, %eax
	addl $4, %eax
	movl %eax, -84(%ebp)
	movl -84(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -80(%ebp)
	movl -100(%ebp), %eax
	movl %eax, -76(%ebp)
	movl -80(%ebp), %eax
	movl %eax, %ecx
	addl %ecx, -76(%ebp)
	movl -572(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -72(%ebp)
	movl -72(%ebp), %eax
	addl $0, %eax
	movl %eax, -68(%ebp)
	movl -68(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -64(%ebp)
	movl -64(%ebp), %eax
	addl $8, %eax
	movl %eax, -60(%ebp)
	movl -60(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -56(%ebp)
	movl -72(%ebp), %eax
	pushl %eax
	movl -56(%ebp), %eax
	call *%eax
	movl %eax, -52(%ebp)
	addl $4, %esp
	movl -52(%ebp), %eax
	addl $12, %eax
	movl %eax, -48(%ebp)
	movl -48(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -44(%ebp)
	movl -44(%ebp), %eax
	addl $0, %eax
	movl %eax, -40(%ebp)
	movl -40(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -36(%ebp)
	movl -36(%ebp), %eax
	addl $8, %eax
	movl %eax, -32(%ebp)
	movl -32(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -28(%ebp)
	movl -44(%ebp), %eax
	pushl %eax
	movl -28(%ebp), %eax
	call *%eax
	movl %eax, -24(%ebp)
	addl $4, %esp
	movl -24(%ebp), %eax
	addl $0, %eax
	movl %eax, -20(%ebp)
	movl -20(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -16(%ebp)
	movl $1, %eax
	pushl %eax
	movl -16(%ebp), %eax
	pushl %eax
	call _oat_array_bounds_check
	addl $8, %esp
	movl -24(%ebp), %eax
	addl $4, %eax
	addl $4, %eax
	movl %eax, -12(%ebp)
	movl -12(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -8(%ebp)
	movl -76(%ebp), %eax
	movl %eax, -4(%ebp)
	movl -8(%ebp), %eax
	movl %eax, %ecx
	addl %ecx, -4(%ebp)
	movl -4(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __B_f
__B_f:
	pushl %ebp
	movl %esp, %ebp
	subl $12, %esp
__fresh542:
	movl $16, %eax
	pushl %eax
	call _oat_malloc
	movl %eax, -12(%ebp)
	addl $4, %esp
	movl -12(%ebp), %eax
	movl %eax, -8(%ebp)
	movl -8(%ebp), %eax
	pushl %eax
	call __A_ctor
	movl %eax, -4(%ebp)
	addl $4, %esp
	movl -4(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __B_ctor
__B_ctor:
	pushl %ebp
	movl %esp, %ebp
	subl $16, %esp
__fresh541:
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
	movl $__const_str315, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -4(%ebp)
	movl $__B_vtable309, %eax
	movl %eax, %ecx
	movl -4(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __A_g
__A_g:
	pushl %ebp
	movl %esp, %ebp
	subl $12, %esp
__fresh540:
	movl $16, %eax
	pushl %eax
	call _oat_malloc
	movl %eax, -12(%ebp)
	addl $4, %esp
	movl -12(%ebp), %eax
	movl %eax, -8(%ebp)
	movl -8(%ebp), %eax
	pushl %eax
	call __A_ctor
	movl %eax, -4(%ebp)
	addl $4, %esp
	movl -4(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __A_ctor
__A_ctor:
	pushl %ebp
	movl %esp, %ebp
	subl $36, %esp
__fresh539:
	movl 8(%ebp), %eax
	movl %eax, -36(%ebp)
	movl -36(%ebp), %eax
	pushl %eax
	call __Object_ctor
	movl %eax, -32(%ebp)
	addl $4, %esp
	movl 8(%ebp), %eax
	addl $4, %eax
	movl %eax, -28(%ebp)
	movl $__const_str314, %eax
	movl %eax, %ecx
	movl -28(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $12, %eax
	movl %eax, -24(%ebp)
	movl $12, %eax
	pushl %eax
	call _oat_malloc
	movl %eax, -20(%ebp)
	addl $4, %esp
	movl -20(%ebp), %eax
	movl %eax, -16(%ebp)
	movl -16(%ebp), %eax
	pushl %eax
	call __S_ctor
	movl %eax, -12(%ebp)
	addl $4, %esp
	movl -12(%ebp), %eax
	movl %eax, %ecx
	movl -24(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -8(%ebp)
	movl $__A_vtable308, %eax
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
.globl __S_f
__S_f:
	pushl %ebp
	movl %esp, %ebp
	subl $12, %esp
__fresh538:
	movl $12, %eax
	pushl %eax
	call _oat_malloc
	movl %eax, -12(%ebp)
	addl $4, %esp
	movl -12(%ebp), %eax
	movl %eax, -8(%ebp)
	movl -8(%ebp), %eax
	pushl %eax
	call __S_ctor
	movl %eax, -4(%ebp)
	addl $4, %esp
	movl -4(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __S_g
__S_g:
	pushl %ebp
	movl %esp, %ebp
	subl $4, %esp
__fresh537:
	movl $_arr311, %eax
	movl (%eax), %ecx
	movl %ecx, -4(%ebp)
	movl -4(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __S_ctor
__S_ctor:
	pushl %ebp
	movl %esp, %ebp
	subl $20, %esp
__fresh536:
	movl 8(%ebp), %eax
	movl %eax, -20(%ebp)
	movl -20(%ebp), %eax
	pushl %eax
	call __Object_ctor
	movl %eax, -16(%ebp)
	addl $4, %esp
	movl 8(%ebp), %eax
	addl $4, %eax
	movl %eax, -12(%ebp)
	movl $__const_str313, %eax
	movl %eax, %ecx
	movl -12(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -8(%ebp)
	movl $__S_vtable307, %eax
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
.globl _arr311.init312
_arr311.init312:
	pushl %ebp
	movl %esp, %ebp
	subl $20, %esp
__fresh535:
	movl $3, %eax
	pushl %eax
	call _oat_alloc_array
	movl %eax, -20(%ebp)
	addl $4, %esp
	movl -20(%ebp), %eax
	movl %eax, -16(%ebp)
	movl -16(%ebp), %eax
	addl $4, %eax
	addl $0, %eax
	movl %eax, -12(%ebp)
	movl $0, %eax
	movl %eax, %ecx
	movl -12(%ebp), %eax
	movl %ecx, (%eax)
	movl -16(%ebp), %eax
	addl $4, %eax
	addl $4, %eax
	movl %eax, -8(%ebp)
	movl $0, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl -16(%ebp), %eax
	addl $4, %eax
	addl $8, %eax
	movl %eax, -4(%ebp)
	movl $0, %eax
	movl %eax, %ecx
	movl -4(%ebp), %eax
	movl %ecx, (%eax)
	movl -16(%ebp), %eax
	movl %eax, _arr311
	movl %ebp, %esp
	popl %ebp
	ret
.globl __Object_get_name
__Object_get_name:
	pushl %ebp
	movl %esp, %ebp
	subl $8, %esp
__fresh534:
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
__fresh533:
	movl 8(%ebp), %eax
	addl $4, %eax
	movl %eax, -8(%ebp)
	movl $__const_str310, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -4(%ebp)
	movl $__Object_vtable306, %eax
	movl %eax, %ecx
	movl -4(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
