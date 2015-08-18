	.align 4
	.text
.globl _program
_program:
	movl 4(%esp), %edx
	movl $17, %eax
	pushl %eax
	movl %edx, %eax
	subl 0(%esp), %eax
	negl %eax
	addl $4, %esp
	ret
