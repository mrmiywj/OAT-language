	.align 4
	.text
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	addl $-72, %esp
	jmp __329
.globl __329
__329:
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
	jmp __322
.globl __322
__322:
	movl 4(%esp), %ecx
	movl %ecx, 16(%esp)
	movl 12(%esp), %ecx
	movl %ecx, 20(%esp)
	movl 16(%esp), %ebx
	movl 20(%esp), %ecx
	movl $0, 24(%esp)
	cmpl %ecx, %ebx
	setE 24(%esp)
	cmpl $0, 24(%esp)
	jE __321
	jNE __328
.globl __328
__328:
	movl 4(%esp), %ecx
	movl %ecx, 28(%esp)
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 32(%esp)
	movl 28(%esp), %ebx
	movl 32(%esp), %ecx
	movl $0, 36(%esp)
	cmpl %ecx, %ebx
	setE 36(%esp)
	cmpl $0, 36(%esp)
	jE __327
	jNE __323
.globl __323
__323:
	movl 12(%esp), %ecx
	movl %ecx, 40(%esp)
	movl 4(%esp), %ecx
	movl %ecx, 44(%esp)
	movl 40(%esp), %ebx
	movl 44(%esp), %ecx
	movl $0, 48(%esp)
	cmpl %ecx, %ebx
	setLE 48(%esp)
	cmpl $0, 48(%esp)
	jE __322
	jNE __326
.globl __326
__326:
	movl 12(%esp), %ecx
	movl %ecx, 52(%esp)
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 56(%esp)
	movl 52(%esp), %ebx
	movl 56(%esp), %ecx
	movl $0, 60(%esp)
	cmpl %ecx, %ebx
	setE 60(%esp)
	cmpl $0, 60(%esp)
	jE __325
	jNE __324
.globl __324
__324:
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 64(%esp)
	movl 64(%esp), %ecx
	movl %ecx, 12(%esp)
	jmp __323
.globl __325
__325:
	jmp __323
.globl __327
__327:
	jmp __322
.globl __321
__321:
	movl 12(%esp), %ecx
	movl %ecx, 68(%esp)
	movl 68(%esp), %eax
	addl $72, %esp
	popl %ebp
	ret
