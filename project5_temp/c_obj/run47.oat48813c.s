	.align 4
	.data
_a3325:
	.long 0
_a2323:
	.long 0
_a1321:
	.long 0
__const_str320:
	.ascii "A\0"
__const_str319:
	.ascii "A\0"
__const_str318:
	.ascii "Object\0"
__A_vtable317:
	.long __Object_vtable316
	.long __Object_get_name
	.long __A_print

__Object_vtable316:
	.long 0
	.long __Object_get_name

	.text
.globl _oat_init
_oat_init:
	pushl %ebp
	movl %esp, %ebp
	subl $0, %esp
__fresh553:
	call _a1321.init322
	addl $0, %esp
	call _a2323.init324
	addl $0, %esp
	call _a3325.init326
	addl $0, %esp
	movl %ebp, %esp
	popl %ebp
	ret
.globl _program
_program:
	pushl %ebp
	movl %esp, %ebp
	subl $116, %esp
__fresh552:
	leal -116(%ebp), %eax
	movl %eax, -104(%ebp)
	movl 8(%ebp), %eax
	movl %eax, %ecx
	movl -104(%ebp), %eax
	movl %ecx, (%eax)
	leal -112(%ebp), %eax
	movl %eax, -100(%ebp)
	movl 12(%ebp), %eax
	movl %eax, %ecx
	movl -100(%ebp), %eax
	movl %ecx, (%eax)
	movl $8, %eax
	pushl %eax
	call _oat_malloc
	movl %eax, -96(%ebp)
	addl $4, %esp
	movl -96(%ebp), %eax
	movl %eax, -92(%ebp)
	movl -92(%ebp), %eax
	pushl %eax
	call __A_ctor
	movl %eax, -88(%ebp)
	addl $4, %esp
	leal -108(%ebp), %eax
	movl %eax, -84(%ebp)
	movl -88(%ebp), %eax
	movl %eax, %ecx
	movl -84(%ebp), %eax
	movl %ecx, (%eax)
	movl -84(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -80(%ebp)
	movl -80(%ebp), %eax
	addl $0, %eax
	movl %eax, -76(%ebp)
	movl -76(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -72(%ebp)
	movl -72(%ebp), %eax
	addl $8, %eax
	movl %eax, -68(%ebp)
	movl -68(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -64(%ebp)
	movl -80(%ebp), %eax
	pushl %eax
	movl -64(%ebp), %eax
	call *%eax
	addl $4, %esp
	movl $_a1321, %eax
	movl (%eax), %ecx
	movl %ecx, -60(%ebp)
	movl -60(%ebp), %eax
	addl $0, %eax
	movl %eax, -56(%ebp)
	movl -56(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -52(%ebp)
	movl -52(%ebp), %eax
	addl $8, %eax
	movl %eax, -48(%ebp)
	movl -48(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -44(%ebp)
	movl -60(%ebp), %eax
	pushl %eax
	movl -44(%ebp), %eax
	call *%eax
	addl $4, %esp
	movl $_a2323, %eax
	movl (%eax), %ecx
	movl %ecx, -40(%ebp)
	movl -40(%ebp), %eax
	addl $0, %eax
	movl %eax, -36(%ebp)
	movl -36(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -32(%ebp)
	movl -32(%ebp), %eax
	addl $8, %eax
	movl %eax, -28(%ebp)
	movl -28(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -24(%ebp)
	movl -40(%ebp), %eax
	pushl %eax
	movl -24(%ebp), %eax
	call *%eax
	addl $4, %esp
	movl $_a3325, %eax
	movl (%eax), %ecx
	movl %ecx, -20(%ebp)
	movl -20(%ebp), %eax
	addl $0, %eax
	movl %eax, -16(%ebp)
	movl -16(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -12(%ebp)
	movl -12(%ebp), %eax
	addl $8, %eax
	movl %eax, -8(%ebp)
	movl -8(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -4(%ebp)
	movl -20(%ebp), %eax
	pushl %eax
	movl -4(%ebp), %eax
	call *%eax
	addl $4, %esp
	movl $0, %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl _a3325.init326
_a3325.init326:
	pushl %ebp
	movl %esp, %ebp
	subl $12, %esp
__fresh551:
	movl $8, %eax
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
	movl %eax, _a3325
	movl %ebp, %esp
	popl %ebp
	ret
.globl _a2323.init324
_a2323.init324:
	pushl %ebp
	movl %esp, %ebp
	subl $12, %esp
__fresh550:
	movl $8, %eax
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
	movl %eax, _a2323
	movl %ebp, %esp
	popl %ebp
	ret
.globl _a1321.init322
_a1321.init322:
	pushl %ebp
	movl %esp, %ebp
	subl $12, %esp
__fresh549:
	movl $8, %eax
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
	movl %eax, _a1321
	movl %ebp, %esp
	popl %ebp
	ret
.globl __A_print
__A_print:
	pushl %ebp
	movl %esp, %ebp
	subl $0, %esp
__fresh548:
	movl $__const_str320, %eax
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
__fresh547:
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
	movl $__const_str319, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -4(%ebp)
	movl $__A_vtable317, %eax
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
__fresh546:
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
__fresh545:
	movl 8(%ebp), %eax
	addl $4, %eax
	movl %eax, -8(%ebp)
	movl $__const_str318, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -4(%ebp)
	movl $__Object_vtable316, %eax
	movl %eax, %ecx
	movl -4(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
