	.align 4
	.text
.globl _program
_program:
	movl 4(%esp), %edx
	movl %edx, %eax
	pushl %eax
	movl $4, %eax
	cmpl %eax, 0(%esp)
	movl $0, %eax
	setG %al
	addl $4, %esp
	ret
