	.align 4
	.data
__const_str342:
	.ascii "G\0"
__const_str341:
	.ascii "F\0"
__const_str340:
	.ascii "E\0"
__const_str339:
	.ascii "D\0"
__const_str338:
	.ascii "C\0"
__const_str337:
	.ascii "B\0"
__const_str336:
	.ascii "A\0"
__const_str335:
	.ascii "Object\0"
__G_vtable334:
	.long __D_vtable331
	.long __Object_get_name

__F_vtable333:
	.long __B_vtable329
	.long __Object_get_name

__E_vtable332:
	.long __Object_vtable327
	.long __Object_get_name

__D_vtable331:
	.long __C_vtable330
	.long __Object_get_name

__C_vtable330:
	.long __B_vtable329
	.long __Object_get_name

__B_vtable329:
	.long __Object_vtable327
	.long __Object_get_name

__A_vtable328:
	.long __Object_vtable327
	.long __Object_get_name

__Object_vtable327:
	.long 0
	.long __Object_get_name

	.text
.globl _oat_init
_oat_init:
	pushl %ebp
	movl %esp, %ebp
	subl $0, %esp
__fresh564:
	movl %ebp, %esp
	popl %ebp
	ret
.globl _program
_program:
	pushl %ebp
	movl %esp, %ebp
	subl $408, %esp
__fresh563:
	leal -408(%ebp), %eax
	movl %eax, -368(%ebp)
	movl 8(%ebp), %eax
	movl %eax, %ecx
	movl -368(%ebp), %eax
	movl %ecx, (%eax)
	leal -404(%ebp), %eax
	movl %eax, -364(%ebp)
	movl 12(%ebp), %eax
	movl %eax, %ecx
	movl -364(%ebp), %eax
	movl %ecx, (%eax)
	movl $8, %eax
	pushl %eax
	call _oat_malloc
	movl %eax, -360(%ebp)
	addl $4, %esp
	movl -360(%ebp), %eax
	movl %eax, -356(%ebp)
	movl -356(%ebp), %eax
	pushl %eax
	call __Object_ctor
	movl %eax, -352(%ebp)
	addl $4, %esp
	leal -400(%ebp), %eax
	movl %eax, -348(%ebp)
	movl -352(%ebp), %eax
	movl %eax, %ecx
	movl -348(%ebp), %eax
	movl %ecx, (%eax)
	movl $8, %eax
	pushl %eax
	call _oat_malloc
	movl %eax, -344(%ebp)
	addl $4, %esp
	movl -344(%ebp), %eax
	movl %eax, -340(%ebp)
	movl -340(%ebp), %eax
	pushl %eax
	call __A_ctor
	movl %eax, -336(%ebp)
	addl $4, %esp
	leal -396(%ebp), %eax
	movl %eax, -332(%ebp)
	movl -336(%ebp), %eax
	movl %eax, %ecx
	movl -332(%ebp), %eax
	movl %ecx, (%eax)
	movl $8, %eax
	pushl %eax
	call _oat_malloc
	movl %eax, -328(%ebp)
	addl $4, %esp
	movl -328(%ebp), %eax
	movl %eax, -324(%ebp)
	movl -324(%ebp), %eax
	pushl %eax
	call __B_ctor
	movl %eax, -320(%ebp)
	addl $4, %esp
	leal -392(%ebp), %eax
	movl %eax, -316(%ebp)
	movl -320(%ebp), %eax
	movl %eax, %ecx
	movl -316(%ebp), %eax
	movl %ecx, (%eax)
	movl $8, %eax
	pushl %eax
	call _oat_malloc
	movl %eax, -312(%ebp)
	addl $4, %esp
	movl -312(%ebp), %eax
	movl %eax, -308(%ebp)
	movl -308(%ebp), %eax
	pushl %eax
	call __C_ctor
	movl %eax, -304(%ebp)
	addl $4, %esp
	movl -304(%ebp), %eax
	movl %eax, -300(%ebp)
	leal -388(%ebp), %eax
	movl %eax, -296(%ebp)
	movl -300(%ebp), %eax
	movl %eax, %ecx
	movl -296(%ebp), %eax
	movl %ecx, (%eax)
	movl $8, %eax
	pushl %eax
	call _oat_malloc
	movl %eax, -292(%ebp)
	addl $4, %esp
	movl -292(%ebp), %eax
	movl %eax, -288(%ebp)
	movl -288(%ebp), %eax
	pushl %eax
	call __D_ctor
	movl %eax, -284(%ebp)
	addl $4, %esp
	movl -284(%ebp), %eax
	movl %eax, -280(%ebp)
	leal -384(%ebp), %eax
	movl %eax, -276(%ebp)
	movl -280(%ebp), %eax
	movl %eax, %ecx
	movl -276(%ebp), %eax
	movl %ecx, (%eax)
	movl $8, %eax
	pushl %eax
	call _oat_malloc
	movl %eax, -272(%ebp)
	addl $4, %esp
	movl -272(%ebp), %eax
	movl %eax, -268(%ebp)
	movl -268(%ebp), %eax
	pushl %eax
	call __E_ctor
	movl %eax, -264(%ebp)
	addl $4, %esp
	leal -380(%ebp), %eax
	movl %eax, -260(%ebp)
	movl -264(%ebp), %eax
	movl %eax, %ecx
	movl -260(%ebp), %eax
	movl %ecx, (%eax)
	movl $8, %eax
	pushl %eax
	call _oat_malloc
	movl %eax, -256(%ebp)
	addl $4, %esp
	movl -256(%ebp), %eax
	movl %eax, -252(%ebp)
	movl -252(%ebp), %eax
	pushl %eax
	call __F_ctor
	movl %eax, -248(%ebp)
	addl $4, %esp
	movl -248(%ebp), %eax
	movl %eax, -244(%ebp)
	leal -376(%ebp), %eax
	movl %eax, -240(%ebp)
	movl -244(%ebp), %eax
	movl %eax, %ecx
	movl -240(%ebp), %eax
	movl %ecx, (%eax)
	movl $8, %eax
	pushl %eax
	call _oat_malloc
	movl %eax, -236(%ebp)
	addl $4, %esp
	movl -236(%ebp), %eax
	movl %eax, -232(%ebp)
	movl -232(%ebp), %eax
	pushl %eax
	call __G_ctor
	movl %eax, -228(%ebp)
	addl $4, %esp
	leal -372(%ebp), %eax
	movl %eax, -224(%ebp)
	movl -228(%ebp), %eax
	movl %eax, %ecx
	movl -224(%ebp), %eax
	movl %ecx, (%eax)
	movl -348(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -220(%ebp)
	movl -220(%ebp), %eax
	addl $0, %eax
	movl %eax, -216(%ebp)
	movl -216(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -212(%ebp)
	movl -212(%ebp), %eax
	addl $4, %eax
	movl %eax, -208(%ebp)
	movl -208(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -204(%ebp)
	movl -220(%ebp), %eax
	pushl %eax
	movl -204(%ebp), %eax
	call *%eax
	movl %eax, -200(%ebp)
	addl $4, %esp
	movl -200(%ebp), %eax
	pushl %eax
	call _print_string
	addl $4, %esp
	movl -332(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -196(%ebp)
	movl -196(%ebp), %eax
	addl $0, %eax
	movl %eax, -192(%ebp)
	movl -192(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -188(%ebp)
	movl -188(%ebp), %eax
	addl $4, %eax
	movl %eax, -184(%ebp)
	movl -184(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -180(%ebp)
	movl -196(%ebp), %eax
	movl %eax, -176(%ebp)
	movl -176(%ebp), %eax
	pushl %eax
	movl -180(%ebp), %eax
	call *%eax
	movl %eax, -172(%ebp)
	addl $4, %esp
	movl -172(%ebp), %eax
	pushl %eax
	call _print_string
	addl $4, %esp
	movl -316(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -168(%ebp)
	movl -168(%ebp), %eax
	addl $0, %eax
	movl %eax, -164(%ebp)
	movl -164(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -160(%ebp)
	movl -160(%ebp), %eax
	addl $4, %eax
	movl %eax, -156(%ebp)
	movl -156(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -152(%ebp)
	movl -168(%ebp), %eax
	movl %eax, -148(%ebp)
	movl -148(%ebp), %eax
	pushl %eax
	movl -152(%ebp), %eax
	call *%eax
	movl %eax, -144(%ebp)
	addl $4, %esp
	movl -144(%ebp), %eax
	pushl %eax
	call _print_string
	addl $4, %esp
	movl -296(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -140(%ebp)
	movl -140(%ebp), %eax
	addl $0, %eax
	movl %eax, -136(%ebp)
	movl -136(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -132(%ebp)
	movl -132(%ebp), %eax
	addl $4, %eax
	movl %eax, -128(%ebp)
	movl -128(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -124(%ebp)
	movl -140(%ebp), %eax
	movl %eax, -120(%ebp)
	movl -120(%ebp), %eax
	pushl %eax
	movl -124(%ebp), %eax
	call *%eax
	movl %eax, -116(%ebp)
	addl $4, %esp
	movl -116(%ebp), %eax
	pushl %eax
	call _print_string
	addl $4, %esp
	movl -276(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -112(%ebp)
	movl -112(%ebp), %eax
	addl $0, %eax
	movl %eax, -108(%ebp)
	movl -108(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -104(%ebp)
	movl -104(%ebp), %eax
	addl $4, %eax
	movl %eax, -100(%ebp)
	movl -100(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -96(%ebp)
	movl -112(%ebp), %eax
	movl %eax, -92(%ebp)
	movl -92(%ebp), %eax
	pushl %eax
	movl -96(%ebp), %eax
	call *%eax
	movl %eax, -88(%ebp)
	addl $4, %esp
	movl -88(%ebp), %eax
	pushl %eax
	call _print_string
	addl $4, %esp
	movl -260(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -84(%ebp)
	movl -84(%ebp), %eax
	addl $0, %eax
	movl %eax, -80(%ebp)
	movl -80(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -76(%ebp)
	movl -76(%ebp), %eax
	addl $4, %eax
	movl %eax, -72(%ebp)
	movl -72(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -68(%ebp)
	movl -84(%ebp), %eax
	movl %eax, -64(%ebp)
	movl -64(%ebp), %eax
	pushl %eax
	movl -68(%ebp), %eax
	call *%eax
	movl %eax, -60(%ebp)
	addl $4, %esp
	movl -60(%ebp), %eax
	pushl %eax
	call _print_string
	addl $4, %esp
	movl -240(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -56(%ebp)
	movl -56(%ebp), %eax
	addl $0, %eax
	movl %eax, -52(%ebp)
	movl -52(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -48(%ebp)
	movl -48(%ebp), %eax
	addl $4, %eax
	movl %eax, -44(%ebp)
	movl -44(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -40(%ebp)
	movl -56(%ebp), %eax
	movl %eax, -36(%ebp)
	movl -36(%ebp), %eax
	pushl %eax
	movl -40(%ebp), %eax
	call *%eax
	movl %eax, -32(%ebp)
	addl $4, %esp
	movl -32(%ebp), %eax
	pushl %eax
	call _print_string
	addl $4, %esp
	movl -224(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -28(%ebp)
	movl -28(%ebp), %eax
	addl $0, %eax
	movl %eax, -24(%ebp)
	movl -24(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -20(%ebp)
	movl -20(%ebp), %eax
	addl $4, %eax
	movl %eax, -16(%ebp)
	movl -16(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -12(%ebp)
	movl -28(%ebp), %eax
	movl %eax, -8(%ebp)
	movl -8(%ebp), %eax
	pushl %eax
	movl -12(%ebp), %eax
	call *%eax
	movl %eax, -4(%ebp)
	addl $4, %esp
	movl -4(%ebp), %eax
	pushl %eax
	call _print_string
	addl $4, %esp
	movl $0, %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __G_ctor
__G_ctor:
	pushl %ebp
	movl %esp, %ebp
	subl $16, %esp
__fresh562:
	movl 8(%ebp), %eax
	movl %eax, -16(%ebp)
	movl -16(%ebp), %eax
	pushl %eax
	call __D_ctor
	movl %eax, -12(%ebp)
	addl $4, %esp
	movl 8(%ebp), %eax
	addl $4, %eax
	movl %eax, -8(%ebp)
	movl $__const_str342, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -4(%ebp)
	movl $__G_vtable334, %eax
	movl %eax, %ecx
	movl -4(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __F_ctor
__F_ctor:
	pushl %ebp
	movl %esp, %ebp
	subl $16, %esp
__fresh561:
	movl 8(%ebp), %eax
	movl %eax, -16(%ebp)
	movl -16(%ebp), %eax
	pushl %eax
	call __B_ctor
	movl %eax, -12(%ebp)
	addl $4, %esp
	movl 8(%ebp), %eax
	addl $4, %eax
	movl %eax, -8(%ebp)
	movl $__const_str341, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -4(%ebp)
	movl $__F_vtable333, %eax
	movl %eax, %ecx
	movl -4(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __E_ctor
__E_ctor:
	pushl %ebp
	movl %esp, %ebp
	subl $16, %esp
__fresh560:
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
	movl $__const_str340, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -4(%ebp)
	movl $__E_vtable332, %eax
	movl %eax, %ecx
	movl -4(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __D_ctor
__D_ctor:
	pushl %ebp
	movl %esp, %ebp
	subl $16, %esp
__fresh559:
	movl 8(%ebp), %eax
	movl %eax, -16(%ebp)
	movl -16(%ebp), %eax
	pushl %eax
	call __C_ctor
	movl %eax, -12(%ebp)
	addl $4, %esp
	movl 8(%ebp), %eax
	addl $4, %eax
	movl %eax, -8(%ebp)
	movl $__const_str339, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -4(%ebp)
	movl $__D_vtable331, %eax
	movl %eax, %ecx
	movl -4(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __C_ctor
__C_ctor:
	pushl %ebp
	movl %esp, %ebp
	subl $16, %esp
__fresh558:
	movl 8(%ebp), %eax
	movl %eax, -16(%ebp)
	movl -16(%ebp), %eax
	pushl %eax
	call __B_ctor
	movl %eax, -12(%ebp)
	addl $4, %esp
	movl 8(%ebp), %eax
	addl $4, %eax
	movl %eax, -8(%ebp)
	movl $__const_str338, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -4(%ebp)
	movl $__C_vtable330, %eax
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
__fresh557:
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
	movl $__const_str337, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -4(%ebp)
	movl $__B_vtable329, %eax
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
__fresh556:
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
	movl $__const_str336, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -4(%ebp)
	movl $__A_vtable328, %eax
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
__fresh555:
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
__fresh554:
	movl 8(%ebp), %eax
	addl $4, %eax
	movl %eax, -8(%ebp)
	movl $__const_str335, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -4(%ebp)
	movl $__Object_vtable327, %eax
	movl %eax, %ecx
	movl -4(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
