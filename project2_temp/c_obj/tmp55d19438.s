	.align 4
	.text
.globl _program
_program:
	movl 4(%esp), %edx
	movl %edx, %eax
	ret
