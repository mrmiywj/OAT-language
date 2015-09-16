	.align 4
	.data
_o26:
	.long 0
__const_str25:
	.ascii "Object\0"
__Object_vtable24:
	.long 0
	.long __Object_get_name

	.text
.globl _oat_init
_oat_init:
	pushl %ebp
	movl %esp, %ebp
	subl $0, %esp
__fresh56:
	call _o26.init27
	addl $0, %esp
	movl %ebp, %esp
	popl %ebp
	ret
.globl _program
_program:
	pushl %ebp
	movl %esp, %ebp
	subl $36, %esp
__fresh55:
	leal -36(%ebp), %eax
	movl %eax, -24(%ebp)
	movl 8(%ebp), %eax
	movl %eax, %ecx
	movl -24(%ebp), %eax
	movl %ecx, (%eax)
	leal -32(%ebp), %eax
	movl %eax, -20(%ebp)
	movl 12(%ebp), %eax
	movl %eax, %ecx
	movl -20(%ebp), %eax
	movl %ecx, (%eax)
	movl $8, %eax
	pushl %eax
	call _oat_malloc
	movl %eax, -16(%ebp)
	addl $4, %esp
	movl -16(%ebp), %eax
	movl %eax, -12(%ebp)
	movl -12(%ebp), %eax
	pushl %eax
	call __Object_ctor
	movl %eax, -8(%ebp)
	addl $4, %esp
	leal -28(%ebp), %eax
	movl %eax, -4(%ebp)
	movl -8(%ebp), %eax
	movl %eax, %ecx
	movl -4(%ebp), %eax
	movl %ecx, (%eax)
	call _f
	addl $0, %esp
	movl $0, %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl _f
_f:
	pushl %ebp
	movl %esp, %ebp
	subl $20, %esp
__fresh54:
	movl $8, %eax
	pushl %eax
	call _oat_malloc
	movl %eax, -16(%ebp)
	addl $4, %esp
	movl -16(%ebp), %eax
	movl %eax, -12(%ebp)
	movl -12(%ebp), %eax
	pushl %eax
	call __Object_ctor
	movl %eax, -8(%ebp)
	addl $4, %esp
	leal -20(%ebp), %eax
	movl %eax, -4(%ebp)
	movl -8(%ebp), %eax
	movl %eax, %ecx
	movl -4(%ebp), %eax
	movl %ecx, (%eax)
	movl %ebp, %esp
	popl %ebp
	ret
.globl _o26.init27
_o26.init27:
	pushl %ebp
	movl %esp, %ebp
	subl $12, %esp
__fresh53:
	movl $8, %eax
	pushl %eax
	call _oat_malloc
	movl %eax, -12(%ebp)
	addl $4, %esp
	movl -12(%ebp), %eax
	movl %eax, -8(%ebp)
	movl -8(%ebp), %eax
	pushl %eax
	call __Object_ctor
	movl %eax, -4(%ebp)
	addl $4, %esp
	movl -4(%ebp), %eax
	movl %eax, _o26
	movl %ebp, %esp
	popl %ebp
	ret
.globl __Object_get_name
__Object_get_name:
	pushl %ebp
	movl %esp, %ebp
	subl $8, %esp
__fresh52:
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
__fresh51:
	movl 8(%ebp), %eax
	addl $4, %eax
	movl %eax, -8(%ebp)
	movl $__const_str25, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -4(%ebp)
	movl $__Object_vtable24, %eax
	movl %eax, %ecx
	movl -4(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
