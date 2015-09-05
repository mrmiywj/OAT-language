	.align 4
	.text
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	addl $-96, %esp
	jmp __176
.globl __176
__176:
	movl $3, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 0(%esp)
	movl 0(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __175
.globl __175
__175:
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
	jE __174
	jNE __169
.globl __169
__169:
	jmp __168
.globl __168
__168:
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
	jmp __167
.globl __167
__167:
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
	jE __166
	jNE __165
.globl __165
__165:
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
	jmp __164
.globl __166
__166:
	jmp __164
.globl __174
__174:
	jmp __173
.globl __173
__173:
	movl 4(%esp), %ecx
	movl %ecx, 56(%esp)
	movl $3, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 60(%esp)
	movl 60(%esp), %ecx
	movl 56(%esp), %eax
	addl %ecx, %eax
	movl %eax, 64(%esp)
	movl 64(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __172
.globl __172
__172:
	movl 4(%esp), %ecx
	movl %ecx, 68(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 72(%esp)
	movl 68(%esp), %ebx
	movl 72(%esp), %ecx
	movl $0, 76(%esp)
	cmpl %ecx, %ebx
	setG 76(%esp)
	cmpl $0, 76(%esp)
	jE __171
	jNE __170
.globl __170
__170:
	movl 4(%esp), %ecx
	movl %ecx, 80(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 84(%esp)
	movl 84(%esp), %ecx
	movl 80(%esp), %eax
	addl %ecx, %eax
	movl %eax, 88(%esp)
	movl 88(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __164
.globl __171
__171:
	jmp __164
.globl __164
__164:
	movl 4(%esp), %ecx
	movl %ecx, 92(%esp)
	movl 92(%esp), %eax
	addl $96, %esp
	popl %ebp
	ret
