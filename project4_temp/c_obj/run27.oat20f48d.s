	.align 4
	.text
.globl oat_init
oat_init:
	pushl %ebp
	movl %esp, %ebp
	subl $0, %esp
__fresh3:
	movl %ebp, %esp
	popl %ebp
	ret
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	subl $28, %esp
__fresh2:
	leal -28(%ebp), %eax
	movl %eax, -16(%ebp)
	movl 8(%ebp), %eax
	movl %eax, %ecx
	movl -16(%ebp), %eax
	movl %ecx, (%eax)
	leal -24(%ebp), %eax
	movl %eax, -12(%ebp)
	movl 12(%ebp), %eax
	movl %eax, %ecx
	movl -12(%ebp), %eax
	movl %ecx, (%eax)
	leal -20(%ebp), %eax
	movl %eax, -8(%ebp)
	movl $99, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl -8(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -4(%ebp)
	movl -4(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
