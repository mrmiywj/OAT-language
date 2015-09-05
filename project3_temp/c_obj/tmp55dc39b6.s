	.align 4
	.text
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	addl $-72, %esp
	jmp __146
.globl __146
__146:
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 0(%esp)
	movl 0(%esp), %ecx
	movl %ecx, 4(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 8(%esp)
	movl 8(%esp), %ecx
	movl %ecx, 12(%esp)
	jmp __145
.globl __145
__145:
	movl 4(%esp), %ecx
	movl %ecx, 16(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 20(%esp)
	movl 16(%esp), %ebx
	movl 20(%esp), %ecx
	movl $0, 24(%esp)
	cmpl %ecx, %ebx
	setE 24(%esp)
	cmpl $0, 24(%esp)
	jE __144
	jNE __141
.globl __141
__141:
	movl 12(%esp), %ecx
	movl %ecx, 28(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 32(%esp)
	movl 28(%esp), %ebx
	movl 32(%esp), %ecx
	movl $0, 36(%esp)
	cmpl %ecx, %ebx
	setE 36(%esp)
	cmpl $0, 36(%esp)
	jE __140
	jNE __139
.globl __139
__139:
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 40(%esp)
	movl 40(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __138
.globl __140
__140:
	movl $2, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 44(%esp)
	movl 44(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __138
.globl __144
__144:
	movl 12(%esp), %ecx
	movl %ecx, 48(%esp)
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 52(%esp)
	movl 48(%esp), %ebx
	movl 52(%esp), %ecx
	movl $0, 56(%esp)
	cmpl %ecx, %ebx
	setE 56(%esp)
	cmpl $0, 56(%esp)
	jE __143
	jNE __142
.globl __142
__142:
	movl $3, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 60(%esp)
	movl 60(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __138
.globl __143
__143:
	movl $4, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 64(%esp)
	movl 64(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __138
.globl __138
__138:
	movl 4(%esp), %ecx
	movl %ecx, 68(%esp)
	movl 68(%esp), %eax
	addl $72, %esp
	popl %ebp
	ret
