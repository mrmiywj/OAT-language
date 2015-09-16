	.align 4
	.data
__const_str254:
	.ascii "C\0"
__const_str253:
	.ascii "C\0"
__const_str252:
	.ascii "B\0"
__const_str251:
	.ascii "B\0"
__const_str250:
	.ascii "A\0"
__const_str249:
	.ascii "A\0"
__const_str248:
	.ascii "Object\0"
__C_vtable247:
	.long __B_vtable246
	.long __Object_get_name
	.long __C_f

__B_vtable246:
	.long __A_vtable245
	.long __Object_get_name
	.long __B_f

__A_vtable245:
	.long __Object_vtable244
	.long __Object_get_name
	.long __A_f

__Object_vtable244:
	.long 0
	.long __Object_get_name

	.text
.globl _oat_init
_oat_init:
	pushl %ebp
	movl %esp, %ebp
	subl $0, %esp
__fresh435:
	movl %ebp, %esp
	popl %ebp
	ret
.globl _program
_program:
	pushl %ebp
	movl %esp, %ebp
	subl $60, %esp
__fresh434:
	leal -60(%ebp), %eax
	movl %eax, -52(%ebp)
	movl 8(%ebp), %eax
	movl %eax, %ecx
	movl -52(%ebp), %eax
	movl %ecx, (%eax)
	leal -56(%ebp), %eax
	movl %eax, -48(%ebp)
	movl 12(%ebp), %eax
	movl %eax, %ecx
	movl -48(%ebp), %eax
	movl %ecx, (%eax)
	movl $8, %eax
	pushl %eax
	call _oat_malloc
	movl %eax, -44(%ebp)
	addl $4, %esp
	movl -44(%ebp), %eax
	movl %eax, -40(%ebp)
	movl -40(%ebp), %eax
	pushl %eax
	call __A_ctor
	movl %eax, -36(%ebp)
	addl $4, %esp
	movl -36(%ebp), %eax
	pushl %eax
	call _f
	addl $4, %esp
	movl $8, %eax
	pushl %eax
	call _oat_malloc
	movl %eax, -32(%ebp)
	addl $4, %esp
	movl -32(%ebp), %eax
	movl %eax, -28(%ebp)
	movl -28(%ebp), %eax
	pushl %eax
	call __B_ctor
	movl %eax, -24(%ebp)
	addl $4, %esp
	movl -24(%ebp), %eax
	movl %eax, -20(%ebp)
	movl -20(%ebp), %eax
	pushl %eax
	call _f
	addl $4, %esp
	movl $8, %eax
	pushl %eax
	call _oat_malloc
	movl %eax, -16(%ebp)
	addl $4, %esp
	movl -16(%ebp), %eax
	movl %eax, -12(%ebp)
	movl -12(%ebp), %eax
	pushl %eax
	call __C_ctor
	movl %eax, -8(%ebp)
	addl $4, %esp
	movl -8(%ebp), %eax
	movl %eax, -4(%ebp)
	movl -4(%ebp), %eax
	pushl %eax
	call _f
	addl $4, %esp
	movl $0, %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl _f
_f:
	pushl %ebp
	movl %esp, %ebp
	subl $244, %esp
__fresh421:
	leal -224(%ebp), %eax
	movl %eax, -28(%ebp)
	movl 8(%ebp), %eax
	movl %eax, %ecx
	movl -28(%ebp), %eax
	movl %ecx, (%eax)
	movl -28(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -24(%ebp)
	movl -24(%ebp), %eax
	movl %eax, -20(%ebp)
	movl -20(%ebp), %eax
	movl %eax, -16(%ebp)
	movl $__C_vtable247, %eax
	movl %eax, -12(%ebp)
	leal -220(%ebp), %eax
	movl %eax, -8(%ebp)
	movl -16(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -4(%ebp)
	movl -4(%ebp), %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	jmp __loop408
__loop408:
	movl -8(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -36(%ebp)
	movl -36(%ebp), %eax
	movl %eax, %ecx
	movl -12(%ebp), %eax
	cmpl %eax, %ecx
	setE -32(%ebp)
	andl $1, -32(%ebp)
	movl -32(%ebp), %eax
	cmpl $0, %eax
	jNE __then405
	jmp __fall1407
__fresh422:
	jmp __fall1407
__fall1407:
	movl -36(%ebp), %eax
	movl %eax, %ecx
	movl $0, %eax
	cmpl %eax, %ecx
	setE -40(%ebp)
	andl $1, -40(%ebp)
	movl -40(%ebp), %eax
	cmpl $0, %eax
	jNE __else404
	jmp __fall2406
__fresh423:
	jmp __fall2406
__fall2406:
	movl -8(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -52(%ebp)
	movl -52(%ebp), %eax
	movl %eax, -48(%ebp)
	movl -48(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -44(%ebp)
	movl -44(%ebp), %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	jmp __loop408
__fresh424:
	jmp __then405
__then405:
	leal -228(%ebp), %eax
	movl %eax, -76(%ebp)
	movl -20(%ebp), %eax
	movl %eax, %ecx
	movl -76(%ebp), %eax
	movl %ecx, (%eax)
	movl -76(%ebp), %eax
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
	addl $4, %esp
	jmp __done403
__fresh425:
	jmp __else404
__else404:
	jmp __done403
__done403:
	movl -28(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -100(%ebp)
	movl -100(%ebp), %eax
	movl %eax, -96(%ebp)
	movl -96(%ebp), %eax
	movl %eax, -92(%ebp)
	movl $__B_vtable246, %eax
	movl %eax, -88(%ebp)
	leal -232(%ebp), %eax
	movl %eax, -84(%ebp)
	movl -92(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -80(%ebp)
	movl -80(%ebp), %eax
	movl %eax, %ecx
	movl -84(%ebp), %eax
	movl %ecx, (%eax)
	jmp __loop414
__loop414:
	movl -84(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -108(%ebp)
	movl -108(%ebp), %eax
	movl %eax, %ecx
	movl -88(%ebp), %eax
	cmpl %eax, %ecx
	setE -104(%ebp)
	andl $1, -104(%ebp)
	movl -104(%ebp), %eax
	cmpl $0, %eax
	jNE __then411
	jmp __fall1413
__fresh426:
	jmp __fall1413
__fall1413:
	movl -108(%ebp), %eax
	movl %eax, %ecx
	movl $0, %eax
	cmpl %eax, %ecx
	setE -112(%ebp)
	andl $1, -112(%ebp)
	movl -112(%ebp), %eax
	cmpl $0, %eax
	jNE __else410
	jmp __fall2412
__fresh427:
	jmp __fall2412
__fall2412:
	movl -84(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -124(%ebp)
	movl -124(%ebp), %eax
	movl %eax, -120(%ebp)
	movl -120(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -116(%ebp)
	movl -116(%ebp), %eax
	movl %eax, %ecx
	movl -84(%ebp), %eax
	movl %ecx, (%eax)
	jmp __loop414
__fresh428:
	jmp __then411
__then411:
	leal -236(%ebp), %eax
	movl %eax, -148(%ebp)
	movl -96(%ebp), %eax
	movl %eax, %ecx
	movl -148(%ebp), %eax
	movl %ecx, (%eax)
	movl -148(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -144(%ebp)
	movl -144(%ebp), %eax
	addl $0, %eax
	movl %eax, -140(%ebp)
	movl -140(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -136(%ebp)
	movl -136(%ebp), %eax
	addl $8, %eax
	movl %eax, -132(%ebp)
	movl -132(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -128(%ebp)
	movl -144(%ebp), %eax
	pushl %eax
	movl -128(%ebp), %eax
	call *%eax
	addl $4, %esp
	jmp __done409
__fresh429:
	jmp __else410
__else410:
	jmp __done409
__done409:
	movl -28(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -168(%ebp)
	movl -168(%ebp), %eax
	movl %eax, -164(%ebp)
	movl $__A_vtable245, %eax
	movl %eax, -160(%ebp)
	leal -240(%ebp), %eax
	movl %eax, -156(%ebp)
	movl -164(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -152(%ebp)
	movl -152(%ebp), %eax
	movl %eax, %ecx
	movl -156(%ebp), %eax
	movl %ecx, (%eax)
	jmp __loop420
__loop420:
	movl -156(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -176(%ebp)
	movl -176(%ebp), %eax
	movl %eax, %ecx
	movl -160(%ebp), %eax
	cmpl %eax, %ecx
	setE -172(%ebp)
	andl $1, -172(%ebp)
	movl -172(%ebp), %eax
	cmpl $0, %eax
	jNE __then417
	jmp __fall1419
__fresh430:
	jmp __fall1419
__fall1419:
	movl -176(%ebp), %eax
	movl %eax, %ecx
	movl $0, %eax
	cmpl %eax, %ecx
	setE -180(%ebp)
	andl $1, -180(%ebp)
	movl -180(%ebp), %eax
	cmpl $0, %eax
	jNE __else416
	jmp __fall2418
__fresh431:
	jmp __fall2418
__fall2418:
	movl -156(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -192(%ebp)
	movl -192(%ebp), %eax
	movl %eax, -188(%ebp)
	movl -188(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -184(%ebp)
	movl -184(%ebp), %eax
	movl %eax, %ecx
	movl -156(%ebp), %eax
	movl %ecx, (%eax)
	jmp __loop420
__fresh432:
	jmp __then417
__then417:
	leal -244(%ebp), %eax
	movl %eax, -216(%ebp)
	movl -168(%ebp), %eax
	movl %eax, %ecx
	movl -216(%ebp), %eax
	movl %ecx, (%eax)
	movl -216(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -212(%ebp)
	movl -212(%ebp), %eax
	addl $0, %eax
	movl %eax, -208(%ebp)
	movl -208(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -204(%ebp)
	movl -204(%ebp), %eax
	addl $8, %eax
	movl %eax, -200(%ebp)
	movl -200(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -196(%ebp)
	movl -212(%ebp), %eax
	pushl %eax
	movl -196(%ebp), %eax
	call *%eax
	addl $4, %esp
	jmp __done415
__fresh433:
	jmp __else416
__else416:
	jmp __done415
__done415:
	movl %ebp, %esp
	popl %ebp
	ret
.globl __C_f
__C_f:
	pushl %ebp
	movl %esp, %ebp
	subl $0, %esp
__fresh402:
	movl $__const_str254, %eax
	pushl %eax
	call _print_string
	addl $4, %esp
	movl %ebp, %esp
	popl %ebp
	ret
.globl __C_ctor
__C_ctor:
	pushl %ebp
	movl %esp, %ebp
	subl $16, %esp
__fresh401:
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
	movl $__const_str253, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -4(%ebp)
	movl $__C_vtable247, %eax
	movl %eax, %ecx
	movl -4(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __B_f
__B_f:
	pushl %ebp
	movl %esp, %ebp
	subl $0, %esp
__fresh400:
	movl $__const_str252, %eax
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
	subl $16, %esp
__fresh399:
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
	movl $__const_str251, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -4(%ebp)
	movl $__B_vtable246, %eax
	movl %eax, %ecx
	movl -4(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __A_f
__A_f:
	pushl %ebp
	movl %esp, %ebp
	subl $0, %esp
__fresh398:
	movl $__const_str250, %eax
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
__fresh397:
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
	movl $__const_str249, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -4(%ebp)
	movl $__A_vtable245, %eax
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
__fresh396:
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
__fresh395:
	movl 8(%ebp), %eax
	addl $4, %eax
	movl %eax, -8(%ebp)
	movl $__const_str248, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -4(%ebp)
	movl $__Object_vtable244, %eax
	movl %eax, %ecx
	movl -4(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
