	.align 4
	.data
_a449:
	.long 0
__const_str448:
	.ascii "C\0"
__const_str447:
	.ascii "B\0"
__const_str446:
	.ascii "A\0"
__const_str445:
	.ascii "Object\0"
__C_vtable444:
	.long __B_vtable443
	.long __Object_get_name
	.long __C_over

__B_vtable443:
	.long __A_vtable442
	.long __Object_get_name
	.long __B_over

__A_vtable442:
	.long __Object_vtable441
	.long __Object_get_name
	.long __A_over

__Object_vtable441:
	.long 0
	.long __Object_get_name

	.text
.globl _oat_init
_oat_init:
	pushl %ebp
	movl %esp, %ebp
	subl $0, %esp
__fresh705:
	call _a449.init450
	addl $0, %esp
	movl %ebp, %esp
	popl %ebp
	ret
.globl _program
_program:
	pushl %ebp
	movl %esp, %ebp
	subl $40, %esp
__fresh704:
	leal -40(%ebp), %eax
	movl %eax, -32(%ebp)
	movl 8(%ebp), %eax
	movl %eax, %ecx
	movl -32(%ebp), %eax
	movl %ecx, (%eax)
	leal -36(%ebp), %eax
	movl %eax, -28(%ebp)
	movl 12(%ebp), %eax
	movl %eax, %ecx
	movl -28(%ebp), %eax
	movl %ecx, (%eax)
	movl $_a449, %eax
	movl (%eax), %ecx
	movl %ecx, -24(%ebp)
	movl -24(%ebp), %eax
	addl $0, %eax
	movl %eax, -20(%ebp)
	movl -20(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -16(%ebp)
	movl -16(%ebp), %eax
	addl $8, %eax
	movl %eax, -12(%ebp)
	movl -12(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -8(%ebp)
	movl $3, %eax
	pushl %eax
	movl -24(%ebp), %eax
	pushl %eax
	movl -8(%ebp), %eax
	call *%eax
	movl %eax, -4(%ebp)
	addl $8, %esp
	movl -4(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl _a449.init450
_a449.init450:
	pushl %ebp
	movl %esp, %ebp
	subl $16, %esp
__fresh703:
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
	movl %eax, _a449
	movl %ebp, %esp
	popl %ebp
	ret
.globl __C_over
__C_over:
	pushl %ebp
	movl %esp, %ebp
	subl $32, %esp
__fresh702:
	leal -32(%ebp), %eax
	movl %eax, -28(%ebp)
	movl 12(%ebp), %eax
	movl %eax, %ecx
	movl -28(%ebp), %eax
	movl %ecx, (%eax)
	movl -28(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -24(%ebp)
	movl -24(%ebp), %eax
	movl %eax, -20(%ebp)
	movl $1, %eax
	movl %eax, %ecx
	addl %ecx, -20(%ebp)
	movl -28(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -16(%ebp)
	movl 8(%ebp), %eax
	movl %eax, -12(%ebp)
	movl -16(%ebp), %eax
	pushl %eax
	movl -12(%ebp), %eax
	pushl %eax
	call __B_over
	movl %eax, -8(%ebp)
	addl $8, %esp
	movl -20(%ebp), %eax
	movl %eax, -4(%ebp)
	movl -8(%ebp), %eax
	movl %eax, %ecx
	addl %ecx, -4(%ebp)
	movl -4(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __C_ctor
__C_ctor:
	pushl %ebp
	movl %esp, %ebp
	subl $16, %esp
__fresh701:
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
	movl $__const_str448, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -4(%ebp)
	movl $__C_vtable444, %eax
	movl %eax, %ecx
	movl -4(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __B_over
__B_over:
	pushl %ebp
	movl %esp, %ebp
	subl $16, %esp
__fresh700:
	leal -16(%ebp), %eax
	movl %eax, -12(%ebp)
	movl 12(%ebp), %eax
	movl %eax, %ecx
	movl -12(%ebp), %eax
	movl %ecx, (%eax)
	movl -12(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -8(%ebp)
	movl -8(%ebp), %eax
	movl %eax, -4(%ebp)
	movl $2, %eax
	movl %eax, %ecx
	addl %ecx, -4(%ebp)
	movl -4(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __B_ctor
__B_ctor:
	pushl %ebp
	movl %esp, %ebp
	subl $16, %esp
__fresh699:
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
	movl $__const_str447, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -4(%ebp)
	movl $__B_vtable443, %eax
	movl %eax, %ecx
	movl -4(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __A_over
__A_over:
	pushl %ebp
	movl %esp, %ebp
	subl $16, %esp
__fresh698:
	leal -16(%ebp), %eax
	movl %eax, -12(%ebp)
	movl 12(%ebp), %eax
	movl %eax, %ecx
	movl -12(%ebp), %eax
	movl %ecx, (%eax)
	movl -12(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -8(%ebp)
	movl -8(%ebp), %eax
	movl %eax, -4(%ebp)
	movl $1, %eax
	movl %eax, %ecx
	addl %ecx, -4(%ebp)
	movl -4(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __A_ctor
__A_ctor:
	pushl %ebp
	movl %esp, %ebp
	subl $16, %esp
__fresh697:
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
	movl $__const_str446, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -4(%ebp)
	movl $__A_vtable442, %eax
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
__fresh696:
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
__fresh695:
	movl 8(%ebp), %eax
	addl $4, %eax
	movl %eax, -8(%ebp)
	movl $__const_str445, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -4(%ebp)
	movl $__Object_vtable441, %eax
	movl %eax, %ecx
	movl -4(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
