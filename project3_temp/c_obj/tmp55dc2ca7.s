	.align 4
	.text
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	addl $-68, %esp
	jmp __419
.globl __419
__419:
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 0(%esp)
	movl 0(%esp), %ecx
	movl %ecx, 4(%esp)
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 8(%esp)
	movl 8(%esp), %ecx
	movl %ecx, 12(%esp)
	jmp __414
.globl __414
__414:
	jmp __415
.globl __415
__415:
	movl 4(%esp), %ecx
	movl %ecx, 16(%esp)
	movl $10, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 20(%esp)
	movl 16(%esp), %ebx
	movl 20(%esp), %ecx
	movl $0, 24(%esp)
	cmpl %ecx, %ebx
	setL 24(%esp)
	cmpl $0, 24(%esp)
	jE __413
	jNE __418
.globl __418
__418:
	movl 4(%esp), %ecx
	movl %ecx, 28(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 32(%esp)
	movl 32(%esp), %ecx
	movl 28(%esp), %eax
	addl %ecx, %eax
	movl %eax, 36(%esp)
	movl 36(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __417
.globl __417
__417:
	jmp __416
.globl __416
__416:
	movl 12(%esp), %ecx
	movl %ecx, 40(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 44(%esp)
	movl 44(%esp), %ecx
	movl 40(%esp), %eax
	addl %ecx, %eax
	movl %eax, 48(%esp)
	movl 48(%esp), %ecx
	movl %ecx, 12(%esp)
	jmp __415
.globl __413
__413:
	movl 12(%esp), %ecx
	movl %ecx, 52(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 56(%esp)
	movl 56(%esp), %ecx
	movl 52(%esp), %eax
	addl %ecx, %eax
	movl %eax, 60(%esp)
	movl 60(%esp), %ecx
	movl %ecx, 12(%esp)
	jmp __412
.globl __412
__412:
	movl 12(%esp), %ecx
	movl %ecx, 64(%esp)
	movl 64(%esp), %eax
	addl $68, %esp
	popl %ebp
	ret
