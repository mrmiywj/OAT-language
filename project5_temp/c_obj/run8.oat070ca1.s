	.align 4
	.data
__const_str68:
	.ascii "A\0"
__const_str67:
	.ascii "Object\0"
__A_vtable66:
	.long __Object_vtable65
	.long __Object_get_name
	.long __A_f

__Object_vtable65:
	.long 0
	.long __Object_get_name

	.text
.globl _oat_init
_oat_init:
	pushl %ebp
	movl %esp, %ebp
	subl $0, %esp
__fresh115:
	movl %ebp, %esp
	popl %ebp
	ret
.globl _program
_program:
	pushl %ebp
	movl %esp, %ebp
	subl $60, %esp
__fresh114:
	leal -60(%ebp), %eax
	movl %eax, -48(%ebp)
	movl 8(%ebp), %eax
	movl %eax, %ecx
	movl -48(%ebp), %eax
	movl %ecx, (%eax)
	leal -56(%ebp), %eax
	movl %eax, -44(%ebp)
	movl 12(%ebp), %eax
	movl %eax, %ecx
	movl -44(%ebp), %eax
	movl %ecx, (%eax)
	movl $12, %eax
	pushl %eax
	call _oat_malloc
	movl %eax, -40(%ebp)
	addl $4, %esp
	movl -40(%ebp), %eax
	movl %eax, -36(%ebp)
	movl -36(%ebp), %eax
	pushl %eax
	call __A_ctor
	movl %eax, -32(%ebp)
	addl $4, %esp
	leal -52(%ebp), %eax
	movl %eax, -28(%ebp)
	movl -32(%ebp), %eax
	movl %eax, %ecx
	movl -28(%ebp), %eax
	movl %ecx, (%eax)
	movl -28(%ebp), %eax
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
.globl __A_f
__A_f:
	pushl %ebp
	movl %esp, %ebp
	subl $12, %esp
__fresh113:
	movl 8(%ebp), %eax
	addl $8, %eax
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
	movl %ebp, %esp
	popl %ebp
	ret
.globl __A_ctor
__A_ctor:
	pushl %ebp
	movl %esp, %ebp
	subl $20, %esp
__fresh112:
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
	movl $__const_str68, %eax
	movl %eax, %ecx
	movl -12(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -8(%ebp)
	movl $__A_vtable66, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $8, %eax
	movl %eax, -4(%ebp)
	movl $0, %eax
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
__fresh111:
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
__fresh110:
	movl 8(%ebp), %eax
	addl $4, %eax
	movl %eax, -8(%ebp)
	movl $__const_str67, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -4(%ebp)
	movl $__Object_vtable65, %eax
	movl %eax, %ecx
	movl -4(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
