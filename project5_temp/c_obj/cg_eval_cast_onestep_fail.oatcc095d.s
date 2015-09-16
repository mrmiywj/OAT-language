	.align 4
	.data
__const_str368:
	.ascii "CCC\0"
__const_str367:
	.ascii "CCc\0"
__const_str366:
	.ascii "CcC\0"
__const_str365:
	.ascii "Ccc\0"
__const_str364:
	.ascii "CC\0"
__const_str363:
	.ascii "Cc\0"
__const_str362:
	.ascii "B\0"
__const_str361:
	.ascii "Aa\0"
__const_str360:
	.ascii "A\0"
__const_str359:
	.ascii "Object\0"
__CCC_vtable358:
	.long __CC_vtable354
	.long __Object_get_name

__CCc_vtable357:
	.long __CC_vtable354
	.long __Object_get_name

__CcC_vtable356:
	.long __Cc_vtable353
	.long __Object_get_name

__Ccc_vtable355:
	.long __Cc_vtable353
	.long __Object_get_name

__CC_vtable354:
	.long __B_vtable352
	.long __Object_get_name

__Cc_vtable353:
	.long __B_vtable352
	.long __Object_get_name

__B_vtable352:
	.long __A_vtable350
	.long __Object_get_name

__Aa_vtable351:
	.long __Object_vtable349
	.long __Object_get_name

__A_vtable350:
	.long __Object_vtable349
	.long __Object_get_name

__Object_vtable349:
	.long 0
	.long __Object_get_name

	.text
.globl _oat_init
_oat_init:
	pushl %ebp
	movl %esp, %ebp
	subl $0, %esp
__fresh594:
	movl %ebp, %esp
	popl %ebp
	ret
.globl _program
_program:
	pushl %ebp
	movl %esp, %ebp
	subl $36, %esp
__fresh593:
	leal -36(%ebp), %eax
	movl %eax, -28(%ebp)
	movl 8(%ebp), %eax
	movl %eax, %ecx
	movl -28(%ebp), %eax
	movl %ecx, (%eax)
	leal -32(%ebp), %eax
	movl %eax, -24(%ebp)
	movl 12(%ebp), %eax
	movl %eax, %ecx
	movl -24(%ebp), %eax
	movl %ecx, (%eax)
	movl $8, %eax
	pushl %eax
	call _oat_malloc
	movl %eax, -20(%ebp)
	addl $4, %esp
	movl -20(%ebp), %eax
	movl %eax, -16(%ebp)
	movl -16(%ebp), %eax
	pushl %eax
	call __Aa_ctor
	movl %eax, -12(%ebp)
	addl $4, %esp
	movl -12(%ebp), %eax
	movl %eax, -8(%ebp)
	movl -8(%ebp), %eax
	pushl %eax
	call _docast
	movl %eax, -4(%ebp)
	addl $4, %esp
	movl -4(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl _docast
_docast:
	pushl %ebp
	movl %esp, %ebp
	subl $80, %esp
__fresh588:
	leal -76(%ebp), %eax
	movl %eax, -32(%ebp)
	movl 8(%ebp), %eax
	movl %eax, %ecx
	movl -32(%ebp), %eax
	movl %ecx, (%eax)
	leal -72(%ebp), %eax
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
	movl $__A_vtable350, %eax
	movl %eax, -12(%ebp)
	leal -68(%ebp), %eax
	movl %eax, -8(%ebp)
	movl -16(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -4(%ebp)
	movl -4(%ebp), %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	jmp __loop587
__loop587:
	movl -8(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -40(%ebp)
	movl -40(%ebp), %eax
	movl %eax, %ecx
	movl -12(%ebp), %eax
	cmpl %eax, %ecx
	setE -36(%ebp)
	andl $1, -36(%ebp)
	movl -36(%ebp), %eax
	cmpl $0, %eax
	jNE __then584
	jmp __fall1586
__fresh589:
	jmp __fall1586
__fall1586:
	movl -40(%ebp), %eax
	movl %eax, %ecx
	movl $0, %eax
	cmpl %eax, %ecx
	setE -44(%ebp)
	andl $1, -44(%ebp)
	movl -44(%ebp), %eax
	cmpl $0, %eax
	jNE __else583
	jmp __fall2585
__fresh590:
	jmp __fall2585
__fall2585:
	movl -8(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -56(%ebp)
	movl -56(%ebp), %eax
	movl %eax, -52(%ebp)
	movl -52(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -48(%ebp)
	movl -48(%ebp), %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	jmp __loop587
__fresh591:
	jmp __then584
__then584:
	leal -80(%ebp), %eax
	movl %eax, -60(%ebp)
	movl -20(%ebp), %eax
	movl %eax, %ecx
	movl -60(%ebp), %eax
	movl %ecx, (%eax)
	movl $12, %eax
	movl %eax, %ecx
	movl -28(%ebp), %eax
	movl %ecx, (%eax)
	jmp __done582
__fresh592:
	jmp __else583
__else583:
	movl $21, %eax
	movl %eax, %ecx
	movl -28(%ebp), %eax
	movl %ecx, (%eax)
	jmp __done582
__done582:
	movl -28(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -64(%ebp)
	movl -64(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __CCC_ctor
__CCC_ctor:
	pushl %ebp
	movl %esp, %ebp
	subl $16, %esp
__fresh581:
	movl 8(%ebp), %eax
	movl %eax, -16(%ebp)
	movl -16(%ebp), %eax
	pushl %eax
	call __CC_ctor
	movl %eax, -12(%ebp)
	addl $4, %esp
	movl 8(%ebp), %eax
	addl $4, %eax
	movl %eax, -8(%ebp)
	movl $__const_str368, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -4(%ebp)
	movl $__CCC_vtable358, %eax
	movl %eax, %ecx
	movl -4(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __CCc_ctor
__CCc_ctor:
	pushl %ebp
	movl %esp, %ebp
	subl $16, %esp
__fresh580:
	movl 8(%ebp), %eax
	movl %eax, -16(%ebp)
	movl -16(%ebp), %eax
	pushl %eax
	call __CC_ctor
	movl %eax, -12(%ebp)
	addl $4, %esp
	movl 8(%ebp), %eax
	addl $4, %eax
	movl %eax, -8(%ebp)
	movl $__const_str367, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -4(%ebp)
	movl $__CCc_vtable357, %eax
	movl %eax, %ecx
	movl -4(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __CcC_ctor
__CcC_ctor:
	pushl %ebp
	movl %esp, %ebp
	subl $16, %esp
__fresh579:
	movl 8(%ebp), %eax
	movl %eax, -16(%ebp)
	movl -16(%ebp), %eax
	pushl %eax
	call __Cc_ctor
	movl %eax, -12(%ebp)
	addl $4, %esp
	movl 8(%ebp), %eax
	addl $4, %eax
	movl %eax, -8(%ebp)
	movl $__const_str366, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -4(%ebp)
	movl $__CcC_vtable356, %eax
	movl %eax, %ecx
	movl -4(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __Ccc_ctor
__Ccc_ctor:
	pushl %ebp
	movl %esp, %ebp
	subl $16, %esp
__fresh578:
	movl 8(%ebp), %eax
	movl %eax, -16(%ebp)
	movl -16(%ebp), %eax
	pushl %eax
	call __Cc_ctor
	movl %eax, -12(%ebp)
	addl $4, %esp
	movl 8(%ebp), %eax
	addl $4, %eax
	movl %eax, -8(%ebp)
	movl $__const_str365, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -4(%ebp)
	movl $__Ccc_vtable355, %eax
	movl %eax, %ecx
	movl -4(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __CC_ctor
__CC_ctor:
	pushl %ebp
	movl %esp, %ebp
	subl $16, %esp
__fresh577:
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
	movl $__const_str364, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -4(%ebp)
	movl $__CC_vtable354, %eax
	movl %eax, %ecx
	movl -4(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __Cc_ctor
__Cc_ctor:
	pushl %ebp
	movl %esp, %ebp
	subl $16, %esp
__fresh576:
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
	movl $__const_str363, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -4(%ebp)
	movl $__Cc_vtable353, %eax
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
__fresh575:
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
	movl $__const_str362, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -4(%ebp)
	movl $__B_vtable352, %eax
	movl %eax, %ecx
	movl -4(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __Aa_ctor
__Aa_ctor:
	pushl %ebp
	movl %esp, %ebp
	subl $16, %esp
__fresh574:
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
	movl $__const_str361, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -4(%ebp)
	movl $__Aa_vtable351, %eax
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
__fresh573:
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
	movl $__const_str360, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -4(%ebp)
	movl $__A_vtable350, %eax
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
__fresh572:
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
__fresh571:
	movl 8(%ebp), %eax
	addl $4, %eax
	movl %eax, -8(%ebp)
	movl $__const_str359, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -4(%ebp)
	movl $__Object_vtable349, %eax
	movl %eax, %ecx
	movl -4(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
