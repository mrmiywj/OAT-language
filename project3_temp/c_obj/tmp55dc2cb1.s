	.align 4
	.text
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	addl $-148, %esp
	jmp __542
.globl __542
__542:
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 0(%esp)
	movl 0(%esp), %ecx
	movl %ecx, 4(%esp)
	movl 4(%esp), %ecx
	movl %ecx, 8(%esp)
	movl 8(%esp), %ecx
	movl %ecx, 12(%esp)
	jmp __541
.globl __541
__541:
	movl $2, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 16(%esp)
	movl 16(%esp), %ecx
	movl %ecx, 20(%esp)
	movl 20(%esp), %ecx
	movl %ecx, 24(%esp)
	movl 24(%esp), %ecx
	movl %ecx, 28(%esp)
	jmp __540
.globl __540
__540:
	movl $4, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 32(%esp)
	movl 32(%esp), %ecx
	movl %ecx, 36(%esp)
	movl 36(%esp), %ecx
	movl %ecx, 40(%esp)
	movl 40(%esp), %ecx
	movl %ecx, 44(%esp)
	jmp __539
.globl __539
__539:
	movl $6, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 48(%esp)
	movl 48(%esp), %ecx
	movl %ecx, 52(%esp)
	movl 52(%esp), %ecx
	movl %ecx, 56(%esp)
	movl 56(%esp), %ecx
	movl %ecx, 60(%esp)
	jmp __538
.globl __538
__538:
	movl $8, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 64(%esp)
	movl 64(%esp), %ecx
	movl %ecx, 68(%esp)
	movl 68(%esp), %ecx
	movl %ecx, 72(%esp)
	movl 72(%esp), %ecx
	movl %ecx, 76(%esp)
	jmp __537
.globl __537
__537:
	movl $3, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 80(%esp)
	movl 80(%esp), %ecx
	movl %ecx, 84(%esp)
	movl 84(%esp), %ecx
	movl %ecx, 88(%esp)
	movl 88(%esp), %ecx
	movl %ecx, 92(%esp)
	jmp __536
.globl __536
__536:
	movl $5, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 96(%esp)
	movl 96(%esp), %ecx
	movl %ecx, 100(%esp)
	movl 100(%esp), %ecx
	movl %ecx, 104(%esp)
	movl 104(%esp), %ecx
	movl %ecx, 108(%esp)
	jmp __535
.globl __535
__535:
	movl $7, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 112(%esp)
	movl 112(%esp), %ecx
	movl %ecx, 116(%esp)
	movl 116(%esp), %ecx
	movl %ecx, 120(%esp)
	movl 120(%esp), %ecx
	movl %ecx, 124(%esp)
	jmp __534
.globl __534
__534:
	movl $9, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 128(%esp)
	movl 128(%esp), %ecx
	movl %ecx, 132(%esp)
	movl 132(%esp), %ecx
	movl %ecx, 136(%esp)
	movl 136(%esp), %ecx
	movl %ecx, 140(%esp)
	jmp __533
.globl __533
__533:
	movl 12(%esp), %ecx
	movl %ecx, 144(%esp)
	movl 144(%esp), %eax
	addl $148, %esp
	popl %ebp
	ret
