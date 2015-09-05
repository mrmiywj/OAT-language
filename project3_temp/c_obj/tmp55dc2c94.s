	.align 4
	.text
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	addl $-24, %esp
	jmp __246
.globl __246
__246:
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 0(%esp)
	movl 0(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __243
.globl __243
__243:
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 8(%esp)
	movl 8(%esp), %ecx
	movl %ecx, 12(%esp)
	jmp __244
.globl __244
__244:
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 16(%esp)
	cmpl $0, 16(%esp)
	jE __242
	jNE __245
.globl __245
__245:
	jmp __244
.globl __242
__242:
	movl 4(%esp), %ecx
	movl %ecx, 20(%esp)
	movl 20(%esp), %eax
	addl $24, %esp
	popl %ebp
	ret
