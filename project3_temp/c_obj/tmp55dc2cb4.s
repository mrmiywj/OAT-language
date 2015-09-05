	.align 4
	.text
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	addl $-224, %esp
	jmp __616
.globl __616
__616:
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 0(%esp)
	movl 0(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __593
.globl __593
__593:
	movl 4(%esp), %ecx
	movl %ecx, 8(%esp)
	movl $100, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 12(%esp)
	movl 8(%esp), %ebx
	movl 12(%esp), %ecx
	movl $0, 16(%esp)
	cmpl %ecx, %ebx
	setL 16(%esp)
	cmpl $0, 16(%esp)
	jE __592
	jNE __615
.globl __615
__615:
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 20(%esp)
	movl 20(%esp), %ecx
	movl %ecx, 24(%esp)
	jmp __614
.globl __614
__614:
	movl 4(%esp), %ecx
	movl %ecx, 28(%esp)
	movl $10, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 32(%esp)
	movl 32(%esp), %ecx
	movl 28(%esp), %eax
	addl %ecx, %eax
	movl %eax, 36(%esp)
	movl 36(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __594
.globl __594
__594:
	jmp __595
.globl __595
__595:
	movl 24(%esp), %ecx
	movl %ecx, 40(%esp)
	movl $100, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 44(%esp)
	movl 40(%esp), %ebx
	movl 44(%esp), %ecx
	movl $0, 48(%esp)
	cmpl %ecx, %ebx
	setL 48(%esp)
	cmpl $0, 48(%esp)
	jE __593
	jNE __613
.globl __613
__613:
	jmp __612
.globl __612
__612:
	movl 24(%esp), %ecx
	movl %ecx, 52(%esp)
	movl 52(%esp), %ecx
	movl %ecx, 56(%esp)
	jmp __597
.globl __597
__597:
	movl 56(%esp), %ecx
	movl %ecx, 60(%esp)
	movl $900, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 64(%esp)
	movl $-1, %ecx
	movl 64(%esp), %eax
	imull %ecx, %eax
	movl %eax, 68(%esp)
	movl 60(%esp), %ebx
	movl 68(%esp), %ecx
	movl $0, 72(%esp)
	cmpl %ecx, %ebx
	setG 72(%esp)
	cmpl $0, 72(%esp)
	jE __596
	jNE __611
.globl __611
__611:
	jmp __610
.globl __610
__610:
	movl 56(%esp), %ecx
	movl %ecx, 76(%esp)
	movl $100, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 80(%esp)
	movl 80(%esp), %ecx
	movl 76(%esp), %eax
	subl %ecx, %eax
	movl %eax, 84(%esp)
	movl 84(%esp), %ecx
	movl %ecx, 56(%esp)
	jmp __609
.globl __609
__609:
	movl 56(%esp), %ecx
	movl %ecx, 88(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 92(%esp)
	movl 92(%esp), %ecx
	movl 88(%esp), %eax
	andl %ecx, %eax
	movl %eax, 96(%esp)
	cmpl $0, 96(%esp)
	jE __608
	jNE __602
.globl __602
__602:
	movl $100, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 100(%esp)
	movl 100(%esp), %ecx
	movl %ecx, 104(%esp)
	jmp __598
.globl __598
__598:
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 108(%esp)
	movl 108(%esp), %ecx
	movl %ecx, 112(%esp)
	jmp __599
.globl __599
__599:
	movl 112(%esp), %ecx
	movl %ecx, 116(%esp)
	movl 104(%esp), %ecx
	movl %ecx, 120(%esp)
	movl 116(%esp), %ebx
	movl 120(%esp), %ecx
	movl $0, 124(%esp)
	cmpl %ecx, %ebx
	setL 124(%esp)
	cmpl $0, 124(%esp)
	jE __597
	jNE __601
.globl __601
__601:
	jmp __600
.globl __600
__600:
	movl 112(%esp), %ecx
	movl %ecx, 128(%esp)
	movl $5, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 132(%esp)
	movl 132(%esp), %ecx
	movl 128(%esp), %eax
	addl %ecx, %eax
	movl %eax, 136(%esp)
	movl 136(%esp), %ecx
	movl %ecx, 112(%esp)
	jmp __599
.globl __608
__608:
	movl $100, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 140(%esp)
	movl 140(%esp), %ecx
	movl %ecx, 144(%esp)
	jmp __603
.globl __603
__603:
	movl 144(%esp), %ecx
	movl %ecx, 148(%esp)
	movl $100, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 152(%esp)
	movl $-1, %ecx
	movl 152(%esp), %eax
	imull %ecx, %eax
	movl %eax, 156(%esp)
	movl 148(%esp), %ebx
	movl 156(%esp), %ecx
	movl $0, 160(%esp)
	cmpl %ecx, %ebx
	setG 160(%esp)
	cmpl $0, 160(%esp)
	jE __597
	jNE __607
.globl __607
__607:
	jmp __606
.globl __606
__606:
	movl 144(%esp), %ecx
	movl %ecx, 164(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 168(%esp)
	movl 168(%esp), %ecx
	movl 164(%esp), %eax
	subl %ecx, %eax
	movl %eax, 172(%esp)
	movl 172(%esp), %ecx
	movl %ecx, 144(%esp)
	jmp __605
.globl __605
__605:
	movl 144(%esp), %ecx
	movl %ecx, 176(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 180(%esp)
	movl 180(%esp), %ecx
	movl 176(%esp), %eax
	subl %ecx, %eax
	movl %eax, 184(%esp)
	movl 184(%esp), %ecx
	movl %ecx, 144(%esp)
	jmp __604
.globl __604
__604:
	movl 144(%esp), %ecx
	movl %ecx, 188(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 192(%esp)
	movl 192(%esp), %ecx
	movl 188(%esp), %eax
	subl %ecx, %eax
	movl %eax, 196(%esp)
	movl 196(%esp), %ecx
	movl %ecx, 144(%esp)
	jmp __603
.globl __596
__596:
	movl 24(%esp), %ecx
	movl %ecx, 200(%esp)
	movl $18, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 204(%esp)
	movl $1, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 208(%esp)
	movl 208(%esp), %ecx
	movl 204(%esp), %eax
	imull %ecx, %eax
	movl %eax, 212(%esp)
	movl 212(%esp), %ecx
	movl 200(%esp), %eax
	addl %ecx, %eax
	movl %eax, 216(%esp)
	movl 216(%esp), %ecx
	movl %ecx, 24(%esp)
	jmp __595
.globl __592
__592:
	movl 4(%esp), %ecx
	movl %ecx, 220(%esp)
	movl 220(%esp), %eax
	addl $224, %esp
	popl %ebp
	ret
