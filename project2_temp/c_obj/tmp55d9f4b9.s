	.align 4
	.text
.globl program
program:
	movl 4(%esp), %edx
	movl %edx, %eax
	cmpl $0, %eax
	movl $0, %eax
	setE %al
	ret
