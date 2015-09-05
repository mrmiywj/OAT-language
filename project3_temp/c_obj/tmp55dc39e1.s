	.align 4
	.text
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	addl $-224, %esp
	jmp __566
.globl __566
__566:
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 0(%esp)
	movl 0(%esp), %ecx
	movl %ecx, 4(%esp)
	jmp __544
.globl __544
__544:
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
	jE __543
	jNE __565
.globl __565
__565:
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 20(%esp)
	movl 20(%esp), %ecx
	movl %ecx, 24(%esp)
	jmp __564
.globl __564
__564:
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
	jmp __545
.globl __545
__545:
	jmp __546
.globl __546
__546:
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
	jE __544
	jNE __563
.globl __563
__563:
	movl 24(%esp), %ecx
	movl %ecx, 52(%esp)
	movl 52(%esp), %ecx
	movl %ecx, 56(%esp)
	jmp __548
.globl __548
__548:
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
	jE __547
	jNE __562
.globl __562
__562:
	jmp __561
.globl __561
__561:
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
	jmp __560
.globl __560
__560:
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
	jE __559
	jNE __553
.globl __553
__553:
	movl $100, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 100(%esp)
	movl 100(%esp), %ecx
	movl %ecx, 104(%esp)
	jmp __549
.globl __549
__549:
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 108(%esp)
	movl 108(%esp), %ecx
	movl %ecx, 112(%esp)
	jmp __550
.globl __550
__550:
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
	jE __548
	jNE __552
.globl __552
__552:
	jmp __551
.globl __551
__551:
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
	jmp __550
.globl __559
__559:
	movl $100, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 140(%esp)
	movl 140(%esp), %ecx
	movl %ecx, 144(%esp)
	jmp __554
.globl __554
__554:
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
	jE __548
	jNE __558
.globl __558
__558:
	jmp __557
.globl __557
__557:
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
	jmp __556
.globl __556
__556:
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
	jmp __555
.globl __555
__555:
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
	jmp __554
.globl __547
__547:
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
	jmp __546
.globl __543
__543:
	movl 4(%esp), %ecx
	movl %ecx, 220(%esp)
	movl 220(%esp), %eax
	addl $224, %esp
	popl %ebp
	ret
