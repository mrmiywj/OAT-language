	.align 4
	.text
.globl program
program:
	pushl %ebp
	movl %esp, %ebp
	addl $-4, %esp
	jmp __532
.globl __532
__532:
	jmp __531
.globl __531
__531:
	jmp __530
.globl __530
__530:
	jmp __529
.globl __529
__529:
	jmp __528
.globl __528
__528:
	jmp __527
.globl __527
__527:
	jmp __526
.globl __526
__526:
	jmp __525
.globl __525
__525:
	jmp __524
.globl __524
__524:
	jmp __523
.globl __523
__523:
	jmp __522
.globl __522
__522:
	jmp __521
.globl __521
__521:
	jmp __520
.globl __520
__520:
	jmp __519
.globl __519
__519:
	jmp __518
.globl __518
__518:
	jmp __517
.globl __517
__517:
	jmp __516
.globl __516
__516:
	jmp __515
.globl __515
__515:
	jmp __514
.globl __514
__514:
	jmp __513
.globl __513
__513:
	movl $0, %ecx
	movl $0, %eax
	addl %ecx, %eax
	movl %eax, 0(%esp)
	movl 0(%esp), %eax
	addl $4, %esp
	popl %ebp
	ret
