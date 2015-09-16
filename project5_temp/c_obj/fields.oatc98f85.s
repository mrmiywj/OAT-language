	.align 4
	.data
__const_str488:
	.ascii "Fields\0"
__const_str487:
	.ascii "Object\0"
__Fields_vtable486:
	.long __Object_vtable485
	.long __Object_get_name
	.long __Fields_sumab

__Object_vtable485:
	.long 0
	.long __Object_get_name

	.text
.globl _oat_init
_oat_init:
	pushl %ebp
	movl %esp, %ebp
	subl $0, %esp
__fresh760:
	movl %ebp, %esp
	popl %ebp
	ret
.globl _program
_program:
	pushl %ebp
	movl %esp, %ebp
	subl $80, %esp
__fresh759:
	leal -80(%ebp), %eax
	movl %eax, -64(%ebp)
	movl 8(%ebp), %eax
	movl %eax, %ecx
	movl -64(%ebp), %eax
	movl %ecx, (%eax)
	leal -76(%ebp), %eax
	movl %eax, -60(%ebp)
	movl 12(%ebp), %eax
	movl %eax, %ecx
	movl -60(%ebp), %eax
	movl %ecx, (%eax)
	movl $20, %eax
	pushl %eax
	call _oat_malloc
	movl %eax, -56(%ebp)
	addl $4, %esp
	movl -56(%ebp), %eax
	movl %eax, -52(%ebp)
	movl -52(%ebp), %eax
	pushl %eax
	call __Fields_ctor
	movl %eax, -48(%ebp)
	addl $4, %esp
	leal -72(%ebp), %eax
	movl %eax, -44(%ebp)
	movl -48(%ebp), %eax
	movl %eax, %ecx
	movl -44(%ebp), %eax
	movl %ecx, (%eax)
	movl -44(%ebp), %eax
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
	movl %eax, -20(%ebp)
	addl $4, %esp
	leal -68(%ebp), %eax
	movl %eax, -16(%ebp)
	movl -20(%ebp), %eax
	movl %eax, %ecx
	movl -16(%ebp), %eax
	movl %ecx, (%eax)
	movl -16(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -12(%ebp)
	movl -12(%ebp), %eax
	addl $12, %eax
	movl %eax, -8(%ebp)
	movl -8(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -4(%ebp)
	movl -4(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __Fields_sumab
__Fields_sumab:
	pushl %ebp
	movl %esp, %ebp
	subl $16, %esp
__fresh758:
	movl 8(%ebp), %eax
	addl $12, %eax
	movl %eax, -16(%ebp)
	movl 8(%ebp), %eax
	addl $8, %eax
	movl %eax, -12(%ebp)
	movl -12(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -8(%ebp)
	movl $1, %eax
	movl %eax, -4(%ebp)
	movl -8(%ebp), %eax
	movl %eax, %ecx
	addl %ecx, -4(%ebp)
	movl -4(%ebp), %eax
	movl %eax, %ecx
	movl -16(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __Fields_ctor
__Fields_ctor:
	pushl %ebp
	movl %esp, %ebp
	subl $20, %esp
__fresh757:
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
	movl $__const_str488, %eax
	movl %eax, %ecx
	movl -12(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -8(%ebp)
	movl $__Fields_vtable486, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $8, %eax
	movl %eax, -4(%ebp)
	movl $12, %eax
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
__fresh756:
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
__fresh755:
	movl 8(%ebp), %eax
	addl $4, %eax
	movl %eax, -8(%ebp)
	movl $__const_str487, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -4(%ebp)
	movl $__Object_vtable485, %eax
	movl %eax, %ecx
	movl -4(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
