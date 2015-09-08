	.align 4
	.text
.globl oat_init
oat_init:
	pushl %ebp
	movl %esp, %ebp
	subl $0, %esp
__fresh1:
	movl %ebp, %esp
	popl %ebp
	ret
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	subl $16, %esp
__fresh0:
	leal -16(%ebp), %eax
	movl %eax, -8(%ebp)
	movl 8(%ebp), %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	leal -12(%ebp), %eax
	movl %eax, -4(%ebp)
	movl 12(%ebp), %eax
	movl %eax, %ecx
	movl -4(%ebp), %eax
	movl %ecx, (%eax)
	movl $0, %eax
	movl %ebp, %esp
	popl %ebp
	ret
