	.align 4
	.text
.globl _program
_program:
	movl 4(%esp), %edx
	movl %edx, %eax
	pushl %eax
	movl $27, %eax
	imull 0(%esp), %eax
	addl $4, %esp
	ret
