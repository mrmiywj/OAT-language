	.align 4
	.text
.globl oat_init
oat_init:
	pushl %ebp
	movl %esp, %ebp
	subl $0, %esp
__fresh5:
	movl %ebp, %esp
	popl %ebp
	ret
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	subl $84, %esp
__fresh4:
	leal -84(%ebp), %eax
	movl %eax, -68(%ebp)
	movl 8(%ebp), %eax
	movl %eax, %ecx
	movl -68(%ebp), %eax
	movl %ecx, (%eax)
	leal -80(%ebp), %eax
	movl %eax, -64(%ebp)
	movl 12(%ebp), %eax
	movl %eax, %ecx
	movl -64(%ebp), %eax
	movl %ecx, (%eax)
	leal -76(%ebp), %eax
	movl %eax, -60(%ebp)
	movl $9, %eax
	movl %eax, %ecx
	movl -60(%ebp), %eax
	movl %ecx, (%eax)
	movl -60(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -56(%ebp)
	movl -60(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -52(%ebp)
	movl -56(%ebp), %eax
	movl %eax, -48(%ebp)
	movl -52(%ebp), %eax
	movl %eax, %ecx
	addl %ecx, -48(%ebp)
	leal -72(%ebp), %eax
	movl %eax, -44(%ebp)
	movl -48(%ebp), %eax
	movl %eax, %ecx
	movl -44(%ebp), %eax
	movl %ecx, (%eax)
	movl -60(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -40(%ebp)
	movl -60(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -36(%ebp)
	movl -60(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -32(%ebp)
	movl -36(%ebp), %eax
	movl %eax, -28(%ebp)
	movl -32(%ebp), %eax
	movl %eax, %ecx
	movl -28(%ebp), %eax
	imull %ecx, %eax
	movl %eax, -28(%ebp)
	movl -40(%ebp), %eax
	movl %eax, -24(%ebp)
	movl -28(%ebp), %eax
	movl %eax, %ecx
	addl %ecx, -24(%ebp)
	movl -44(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -20(%ebp)
	movl -24(%ebp), %eax
	movl %eax, -16(%ebp)
	movl -20(%ebp), %eax
	movl %eax, %ecx
	subl %ecx, -16(%ebp)
	movl -16(%ebp), %eax
	movl %eax, -12(%ebp)
	movl $2, %eax
	movl %eax, %ecx
	sarl %cl, -12(%ebp)
	movl -12(%ebp), %eax
	movl %eax, -8(%ebp)
	movl $2, %eax
	movl %eax, %ecx
	shll %cl, -8(%ebp)
	movl -8(%ebp), %eax
	movl %eax, -4(%ebp)
	movl $2, %eax
	movl %eax, %ecx
	shrl %cl, -4(%ebp)
	movl -4(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
