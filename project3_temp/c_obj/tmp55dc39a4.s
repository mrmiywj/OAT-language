	.align 4
	.text
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	addl $-36, %esp
	jmp __23
.globl __23
__23:
	movl $3, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 0(%esp)
	movl 0(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __22
.globl __22
__22:
	movl 4(%esp), %ecx
	movl %ecx, 8(%esp)
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 12(%esp)
	movl 8(%esp), %ebx
	movl 12(%esp), %ecx
	movl $0, 16(%esp)
	cmpl %ecx, %ebx
	setE 16(%esp)
	cmpl $0, 16(%esp)
	jE __21
	jNE __20
.globl __20
__20:
	movl 4(%esp), %ecx
	movl %ecx, 20(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 24(%esp)
	movl 24(%esp), %ecx
	movl 20(%esp), %eax
	addl %ecx, %eax
	movl %eax, 28(%esp)
	movl 28(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __19
.globl __21
__21:
	jmp __19
.globl __19
__19:
	movl 4(%esp), %ecx
	movl %ecx, 32(%esp)
	movl 32(%esp), %eax
	addl $36, %esp
	popl %ebp
	ret
