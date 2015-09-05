	.align 4
	.text
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	addl $-76, %esp
	jmp __253
.globl __253
__253:
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 0(%esp)
	movl 0(%esp), %ecx
	movl %ecx, 4(%esp)
	movl 4(%esp), %ecx
	movl %ecx, 8(%esp)
	movl 4(%esp), %ecx
	movl %ecx, 12(%esp)
	movl 12(%esp), %ecx
	movl 8(%esp), %eax
	imull %ecx, %eax
	movl %eax, 16(%esp)
	movl $98, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 20(%esp)
	movl 20(%esp), %ecx
	movl 16(%esp), %eax
	addl %ecx, %eax
	movl %eax, 24(%esp)
	movl 24(%esp), %ecx
	movl %ecx, 28(%esp)
	jmp __248
.globl __248
__248:
	jmp __249
.globl __249
__249:
	movl 4(%esp), %ecx
	movl %ecx, 32(%esp)
	movl $100, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 36(%esp)
	movl 32(%esp), %ebx
	movl 36(%esp), %ecx
	movl $0, 40(%esp)
	cmpl %ecx, %ebx
	setL 40(%esp)
	cmpl $0, 40(%esp)
	jE __247
	jNE __252
.globl __252
__252:
	movl 28(%esp), %ecx
	movl %ecx, 44(%esp)
	movl $100, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 48(%esp)
	movl 44(%esp), %ebx
	movl 48(%esp), %ecx
	movl $0, 52(%esp)
	cmpl %ecx, %ebx
	setL 52(%esp)
	cmpl $0, 52(%esp)
	jE __251
	jNE __250
.globl __250
__250:
	movl 4(%esp), %ecx
	movl %ecx, 56(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 60(%esp)
	movl 60(%esp), %ecx
	movl 56(%esp), %eax
	addl %ecx, %eax
	movl %eax, 64(%esp)
	movl 64(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __249
.globl __251
__251:
	movl $1000, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 68(%esp)
	movl 68(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __249
.globl __247
__247:
	movl 4(%esp), %ecx
	movl %ecx, 72(%esp)
	movl 72(%esp), %eax
	addl $76, %esp
	popl %ebp
	ret
