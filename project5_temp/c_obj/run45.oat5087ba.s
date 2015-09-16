	.align 4
	.data
__const_str286:
	.ascii "A\0"
__const_str285:
	.ascii "O\0"
__const_str284:
	.ascii "Object\0"
__A_vtable283:
	.long __O_vtable282
	.long __Object_get_name
	.long __A_init
	.long __A_incr
	.long __A_sum

__O_vtable282:
	.long __Object_vtable281
	.long __Object_get_name

__Object_vtable281:
	.long 0
	.long __Object_get_name

	.text
.globl _oat_init
_oat_init:
	pushl %ebp
	movl %esp, %ebp
	subl $0, %esp
__fresh514:
	movl %ebp, %esp
	popl %ebp
	ret
.globl _program
_program:
	pushl %ebp
	movl %esp, %ebp
	subl $80, %esp
__fresh513:
	leal -80(%ebp), %eax
	movl %eax, -68(%ebp)
	movl 8(%ebp), %eax
	movl %eax, %ecx
	movl -68(%ebp), %eax
	movl %ecx, (%eax)
	leal -76(%ebp), %eax
	movl %eax, -64(%ebp)
	movl 12(%ebp), %eax
	movl %eax, %ecx
	movl -64(%ebp), %eax
	movl %ecx, (%eax)
	movl $24, %eax
	pushl %eax
	call _oat_malloc
	movl %eax, -60(%ebp)
	addl $4, %esp
	movl -60(%ebp), %eax
	movl %eax, -56(%ebp)
	movl -56(%ebp), %eax
	pushl %eax
	call __A_ctor
	movl %eax, -52(%ebp)
	addl $4, %esp
	leal -72(%ebp), %eax
	movl %eax, -48(%ebp)
	movl -52(%ebp), %eax
	movl %eax, %ecx
	movl -48(%ebp), %eax
	movl %ecx, (%eax)
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
	addl $4, %esp
	movl -48(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -24(%ebp)
	movl -24(%ebp), %eax
	addl $0, %eax
	movl %eax, -20(%ebp)
	movl -20(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -16(%ebp)
	movl -16(%ebp), %eax
	addl $16, %eax
	movl %eax, -12(%ebp)
	movl -12(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -8(%ebp)
	movl -24(%ebp), %eax
	pushl %eax
	movl -8(%ebp), %eax
	call *%eax
	movl %eax, -4(%ebp)
	addl $4, %esp
	movl -4(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __A_sum
__A_sum:
	pushl %ebp
	movl %esp, %ebp
	subl $224, %esp
__fresh506:
	leal -216(%ebp), %eax
	movl %eax, -20(%ebp)
	movl $0, %eax
	movl %eax, %ecx
	movl -20(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $20, %eax
	movl %eax, -16(%ebp)
	movl -16(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -12(%ebp)
	leal -212(%ebp), %eax
	movl %eax, -8(%ebp)
	movl -12(%ebp), %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl -12(%ebp), %eax
	movl %eax, %ecx
	movl $0, %eax
	cmpl %eax, %ecx
	setNE -4(%ebp)
	andl $1, -4(%ebp)
	movl -4(%ebp), %eax
	cmpl $0, %eax
	jNE __then505
	jmp __else504
__fresh507:
	jmp __then505
__then505:
	leal -220(%ebp), %eax
	movl %eax, -24(%ebp)
	movl $0, %eax
	movl %eax, %ecx
	movl -24(%ebp), %eax
	movl %ecx, (%eax)
	jmp __cond499
__cond499:
	movl -24(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -44(%ebp)
	movl -8(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -40(%ebp)
	movl -40(%ebp), %eax
	addl $0, %eax
	movl %eax, -36(%ebp)
	movl -36(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -32(%ebp)
	movl -44(%ebp), %eax
	movl %eax, %ecx
	movl -32(%ebp), %eax
	cmpl %eax, %ecx
	setL -28(%ebp)
	andl $1, -28(%ebp)
	movl -28(%ebp), %eax
	cmpl $0, %eax
	jNE __body498
	jmp __post497
__fresh508:
	jmp __body498
__body498:
	movl -8(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -92(%ebp)
	movl -24(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -88(%ebp)
	movl -92(%ebp), %eax
	addl $0, %eax
	movl %eax, -84(%ebp)
	movl -84(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -80(%ebp)
	movl -88(%ebp), %eax
	pushl %eax
	movl -80(%ebp), %eax
	pushl %eax
	call _oat_array_bounds_check
	addl $8, %esp
	movl -92(%ebp), %eax
	addl $4, %eax
	movl %eax, %ecx
	movl -88(%ebp), %eax
	imull $4, %eax
	addl %ecx, %eax
	movl %eax, -76(%ebp)
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
	addl $12, %eax
	movl %eax, -60(%ebp)
	movl -60(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -56(%ebp)
	movl -72(%ebp), %eax
	pushl %eax
	movl -56(%ebp), %eax
	call *%eax
	addl $4, %esp
	movl -24(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -52(%ebp)
	movl -52(%ebp), %eax
	movl %eax, -48(%ebp)
	movl $1, %eax
	movl %eax, %ecx
	addl %ecx, -48(%ebp)
	movl -48(%ebp), %eax
	movl %eax, %ecx
	movl -24(%ebp), %eax
	movl %ecx, (%eax)
	jmp __cond499
__fresh509:
	jmp __post497
__post497:
	leal -224(%ebp), %eax
	movl %eax, -96(%ebp)
	movl $0, %eax
	movl %eax, %ecx
	movl -96(%ebp), %eax
	movl %ecx, (%eax)
	jmp __cond502
__cond502:
	movl -96(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -116(%ebp)
	movl -8(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -112(%ebp)
	movl -112(%ebp), %eax
	addl $0, %eax
	movl %eax, -108(%ebp)
	movl -108(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -104(%ebp)
	movl -116(%ebp), %eax
	movl %eax, %ecx
	movl -104(%ebp), %eax
	cmpl %eax, %ecx
	setL -100(%ebp)
	andl $1, -100(%ebp)
	movl -100(%ebp), %eax
	cmpl $0, %eax
	jNE __body501
	jmp __post500
__fresh510:
	jmp __body501
__body501:
	movl -20(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -204(%ebp)
	movl -8(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -200(%ebp)
	movl -96(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -196(%ebp)
	movl -200(%ebp), %eax
	addl $0, %eax
	movl %eax, -192(%ebp)
	movl -192(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -188(%ebp)
	movl -196(%ebp), %eax
	pushl %eax
	movl -188(%ebp), %eax
	pushl %eax
	call _oat_array_bounds_check
	addl $8, %esp
	movl -200(%ebp), %eax
	addl $4, %eax
	movl %eax, %ecx
	movl -196(%ebp), %eax
	imull $4, %eax
	addl %ecx, %eax
	movl %eax, -184(%ebp)
	movl -184(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -180(%ebp)
	movl -180(%ebp), %eax
	addl $8, %eax
	movl %eax, -176(%ebp)
	movl -176(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -172(%ebp)
	movl -204(%ebp), %eax
	movl %eax, -168(%ebp)
	movl -172(%ebp), %eax
	movl %eax, %ecx
	addl %ecx, -168(%ebp)
	movl -168(%ebp), %eax
	movl %eax, %ecx
	movl -20(%ebp), %eax
	movl %ecx, (%eax)
	movl -20(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -164(%ebp)
	movl -8(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -160(%ebp)
	movl -96(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -156(%ebp)
	movl -160(%ebp), %eax
	addl $0, %eax
	movl %eax, -152(%ebp)
	movl -152(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -148(%ebp)
	movl -156(%ebp), %eax
	pushl %eax
	movl -148(%ebp), %eax
	pushl %eax
	call _oat_array_bounds_check
	addl $8, %esp
	movl -160(%ebp), %eax
	addl $4, %eax
	movl %eax, %ecx
	movl -156(%ebp), %eax
	imull $4, %eax
	addl %ecx, %eax
	movl %eax, -144(%ebp)
	movl -144(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -140(%ebp)
	movl -140(%ebp), %eax
	addl $12, %eax
	movl %eax, -136(%ebp)
	movl -136(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -132(%ebp)
	movl -164(%ebp), %eax
	movl %eax, -128(%ebp)
	movl -132(%ebp), %eax
	movl %eax, %ecx
	addl %ecx, -128(%ebp)
	movl -128(%ebp), %eax
	movl %eax, %ecx
	movl -20(%ebp), %eax
	movl %ecx, (%eax)
	movl -96(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -124(%ebp)
	movl -124(%ebp), %eax
	movl %eax, -120(%ebp)
	movl $1, %eax
	movl %eax, %ecx
	addl %ecx, -120(%ebp)
	movl -120(%ebp), %eax
	movl %eax, %ecx
	movl -96(%ebp), %eax
	movl %ecx, (%eax)
	jmp __cond502
__fresh511:
	jmp __post500
__post500:
	jmp __merge503
__fresh512:
	jmp __else504
__else504:
	jmp __merge503
__merge503:
	movl -20(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -208(%ebp)
	movl -208(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __A_incr
__A_incr:
	pushl %ebp
	movl %esp, %ebp
	subl $32, %esp
__fresh496:
	movl 8(%ebp), %eax
	addl $8, %eax
	movl %eax, -32(%ebp)
	movl 8(%ebp), %eax
	addl $8, %eax
	movl %eax, -28(%ebp)
	movl -28(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -24(%ebp)
	movl -24(%ebp), %eax
	movl %eax, -20(%ebp)
	movl $1, %eax
	movl %eax, %ecx
	addl %ecx, -20(%ebp)
	movl -20(%ebp), %eax
	movl %eax, %ecx
	movl -32(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $12, %eax
	movl %eax, -16(%ebp)
	movl 8(%ebp), %eax
	addl $12, %eax
	movl %eax, -12(%ebp)
	movl -12(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -8(%ebp)
	movl -8(%ebp), %eax
	movl %eax, -4(%ebp)
	movl $1, %eax
	movl %eax, %ecx
	addl %ecx, -4(%ebp)
	movl -4(%ebp), %eax
	movl %eax, %ecx
	movl -16(%ebp), %eax
	movl %ecx, (%eax)
	movl %ebp, %esp
	popl %ebp
	ret
.globl __A_init
__A_init:
	pushl %ebp
	movl %esp, %ebp
	subl $188, %esp
__fresh487:
	movl 8(%ebp), %eax
	addl $16, %eax
	movl %eax, -36(%ebp)
	movl $24, %eax
	pushl %eax
	call _oat_malloc
	movl %eax, -32(%ebp)
	addl $4, %esp
	movl -32(%ebp), %eax
	movl %eax, -28(%ebp)
	movl -28(%ebp), %eax
	pushl %eax
	call __A_ctor
	movl %eax, -24(%ebp)
	addl $4, %esp
	movl -24(%ebp), %eax
	movl %eax, -20(%ebp)
	movl -20(%ebp), %eax
	movl %eax, %ecx
	movl -36(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $16, %eax
	movl %eax, -16(%ebp)
	movl -16(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -12(%ebp)
	leal -168(%ebp), %eax
	movl %eax, -8(%ebp)
	movl -12(%ebp), %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl -12(%ebp), %eax
	movl %eax, %ecx
	movl $0, %eax
	cmpl %eax, %ecx
	setNE -4(%ebp)
	andl $1, -4(%ebp)
	movl -4(%ebp), %eax
	cmpl $0, %eax
	jNE __then483
	jmp __else482
__fresh488:
	jmp __then483
__then483:
	movl -8(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -60(%ebp)
	movl -60(%ebp), %eax
	movl %eax, -56(%ebp)
	movl -56(%ebp), %eax
	movl %eax, -52(%ebp)
	movl $__A_vtable283, %eax
	movl %eax, -48(%ebp)
	leal -172(%ebp), %eax
	movl %eax, -44(%ebp)
	movl -52(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -40(%ebp)
	movl -40(%ebp), %eax
	movl %eax, %ecx
	movl -44(%ebp), %eax
	movl %ecx, (%eax)
	jmp __loop480
__loop480:
	movl -44(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -68(%ebp)
	movl -68(%ebp), %eax
	movl %eax, %ecx
	movl -48(%ebp), %eax
	cmpl %eax, %ecx
	setE -64(%ebp)
	andl $1, -64(%ebp)
	movl -64(%ebp), %eax
	cmpl $0, %eax
	jNE __then477
	jmp __fall1479
__fresh489:
	jmp __fall1479
__fall1479:
	movl -68(%ebp), %eax
	movl %eax, %ecx
	movl $0, %eax
	cmpl %eax, %ecx
	setE -72(%ebp)
	andl $1, -72(%ebp)
	movl -72(%ebp), %eax
	cmpl $0, %eax
	jNE __else476
	jmp __fall2478
__fresh490:
	jmp __fall2478
__fall2478:
	movl -44(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -84(%ebp)
	movl -84(%ebp), %eax
	movl %eax, -80(%ebp)
	movl -80(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -76(%ebp)
	movl -76(%ebp), %eax
	movl %eax, %ecx
	movl -44(%ebp), %eax
	movl %ecx, (%eax)
	jmp __loop480
__fresh491:
	jmp __then477
__then477:
	leal -176(%ebp), %eax
	movl %eax, -88(%ebp)
	movl -56(%ebp), %eax
	movl %eax, %ecx
	movl -88(%ebp), %eax
	movl %ecx, (%eax)
	jmp __done475
__fresh492:
	jmp __else476
__else476:
	jmp __done475
__done475:
	jmp __merge481
__fresh493:
	jmp __else482
__else482:
	jmp __merge481
__merge481:
	movl 8(%ebp), %eax
	addl $20, %eax
	movl %eax, -112(%ebp)
	movl $2, %eax
	pushl %eax
	call _oat_alloc_array
	movl %eax, -108(%ebp)
	addl $4, %esp
	movl -108(%ebp), %eax
	movl %eax, -104(%ebp)
	leal -188(%ebp), %eax
	movl %eax, -100(%ebp)
	movl $2, %eax
	movl %eax, %ecx
	movl -100(%ebp), %eax
	movl %ecx, (%eax)
	leal -184(%ebp), %eax
	movl %eax, -96(%ebp)
	movl -104(%ebp), %eax
	movl %eax, %ecx
	movl -96(%ebp), %eax
	movl %ecx, (%eax)
	leal -180(%ebp), %eax
	movl %eax, -92(%ebp)
	movl $0, %eax
	movl %eax, %ecx
	movl -92(%ebp), %eax
	movl %ecx, (%eax)
	jmp __cond486
__cond486:
	movl -92(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -124(%ebp)
	movl -100(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -120(%ebp)
	movl -124(%ebp), %eax
	movl %eax, %ecx
	movl -120(%ebp), %eax
	cmpl %eax, %ecx
	setL -116(%ebp)
	andl $1, -116(%ebp)
	movl -116(%ebp), %eax
	cmpl $0, %eax
	jNE __body485
	jmp __post484
__fresh494:
	jmp __body485
__body485:
	movl -96(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -164(%ebp)
	movl -92(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -160(%ebp)
	movl -164(%ebp), %eax
	addl $0, %eax
	movl %eax, -156(%ebp)
	movl -156(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -152(%ebp)
	movl -160(%ebp), %eax
	pushl %eax
	movl -152(%ebp), %eax
	pushl %eax
	call _oat_array_bounds_check
	addl $8, %esp
	movl -164(%ebp), %eax
	addl $4, %eax
	movl %eax, %ecx
	movl -160(%ebp), %eax
	imull $4, %eax
	addl %ecx, %eax
	movl %eax, -148(%ebp)
	movl $24, %eax
	pushl %eax
	call _oat_malloc
	movl %eax, -144(%ebp)
	addl $4, %esp
	movl -144(%ebp), %eax
	movl %eax, -140(%ebp)
	movl -140(%ebp), %eax
	pushl %eax
	call __A_ctor
	movl %eax, -136(%ebp)
	addl $4, %esp
	movl -136(%ebp), %eax
	movl %eax, %ecx
	movl -148(%ebp), %eax
	movl %ecx, (%eax)
	movl -92(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -132(%ebp)
	movl -132(%ebp), %eax
	movl %eax, -128(%ebp)
	movl $1, %eax
	movl %eax, %ecx
	addl %ecx, -128(%ebp)
	movl -128(%ebp), %eax
	movl %eax, %ecx
	movl -92(%ebp), %eax
	movl %ecx, (%eax)
	jmp __cond486
__fresh495:
	jmp __post484
__post484:
	movl -104(%ebp), %eax
	movl %eax, %ecx
	movl -112(%ebp), %eax
	movl %ecx, (%eax)
	movl %ebp, %esp
	popl %ebp
	ret
.globl __A_ctor
__A_ctor:
	pushl %ebp
	movl %esp, %ebp
	subl $24, %esp
__fresh474:
	movl 8(%ebp), %eax
	movl %eax, -24(%ebp)
	movl -24(%ebp), %eax
	pushl %eax
	call __O_ctor
	movl %eax, -20(%ebp)
	addl $4, %esp
	movl 8(%ebp), %eax
	addl $4, %eax
	movl %eax, -16(%ebp)
	movl $__const_str286, %eax
	movl %eax, %ecx
	movl -16(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $8, %eax
	movl %eax, -12(%ebp)
	movl $1, %eax
	movl %eax, %ecx
	movl -12(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $12, %eax
	movl %eax, -8(%ebp)
	movl $2, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -4(%ebp)
	movl $__A_vtable283, %eax
	movl %eax, %ecx
	movl -4(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __O_ctor
__O_ctor:
	pushl %ebp
	movl %esp, %ebp
	subl $16, %esp
__fresh473:
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
	movl $__const_str285, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -4(%ebp)
	movl $__O_vtable282, %eax
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
__fresh472:
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
__fresh471:
	movl 8(%ebp), %eax
	addl $4, %eax
	movl %eax, -8(%ebp)
	movl $__const_str284, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -4(%ebp)
	movl $__Object_vtable281, %eax
	movl %eax, %ecx
	movl -4(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
