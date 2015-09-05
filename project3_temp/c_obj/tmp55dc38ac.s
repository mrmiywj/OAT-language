	.align 4
	.text
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	addl $-72, %esp
	jmp __194
.globl __194
__194:
	movl $3, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 0(%esp)
	movl 0(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __193
.globl __193
__193:
	movl 4(%esp), %ecx
	movl %ecx, 8(%esp)
	movl $3, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 12(%esp)
	movl 8(%esp), %ebx
	movl 12(%esp), %ecx
	movl $0, 16(%esp)
	cmpl %ecx, %ebx
	setL 16(%esp)
	cmpl $0, 16(%esp)
	jE __192
	jNE __191
.globl __191
__191:
	jmp __190
.globl __190
__190:
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
	jmp __189
.globl __189
__189:
	movl 4(%esp), %ecx
	movl %ecx, 32(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 36(%esp)
	movl 32(%esp), %ebx
	movl 36(%esp), %ecx
	movl $0, 40(%esp)
	cmpl %ecx, %ebx
	setG 40(%esp)
	cmpl $0, 40(%esp)
	jE __188
	jNE __187
.globl __187
__187:
	movl 4(%esp), %ecx
	movl %ecx, 44(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 48(%esp)
	movl 48(%esp), %ecx
	movl 44(%esp), %eax
	addl %ecx, %eax
	movl %eax, 52(%esp)
	movl 52(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __186
.globl __188
__188:
	jmp __186
.globl __192
__192:
	movl 4(%esp), %ecx
	movl %ecx, 56(%esp)
	movl 4(%esp), %ecx
	movl %ecx, 60(%esp)
	movl 60(%esp), %ecx
	movl 56(%esp), %eax
	imull %ecx, %eax
	movl %eax, 64(%esp)
	movl 64(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __186
.globl __186
__186:
	movl 4(%esp), %ecx
	movl %ecx, 68(%esp)
	movl 68(%esp), %eax
	addl $72, %esp
	popl %ebp
	ret
