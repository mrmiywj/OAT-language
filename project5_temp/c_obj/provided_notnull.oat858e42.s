	.align 4
	.data
__const_str584:
	.ascii "hello\0"
__const_str583:
	.ascii "Object\0"
__Object_vtable582:
	.long 0
	.long __Object_get_name

	.text
.globl _oat_init
_oat_init:
	pushl %ebp
	movl %esp, %ebp
	subl $0, %esp
__fresh995:
	movl %ebp, %esp
	popl %ebp
	ret
.globl _program
_program:
	pushl %ebp
	movl %esp, %ebp
	subl $116, %esp
__fresh990:
	leal -112(%ebp), %eax
	movl %eax, -36(%ebp)
	movl 8(%ebp), %eax
	movl %eax, %ecx
	movl -36(%ebp), %eax
	movl %ecx, (%eax)
	leal -108(%ebp), %eax
	movl %eax, -32(%ebp)
	movl 12(%ebp), %eax
	movl %eax, %ecx
	movl -32(%ebp), %eax
	movl %ecx, (%eax)
	leal -104(%ebp), %eax
	movl %eax, -28(%ebp)
	movl $0, %eax
	movl %eax, %ecx
	movl -28(%ebp), %eax
	movl %ecx, (%eax)
	leal -100(%ebp), %eax
	movl %eax, -24(%ebp)
	movl $__const_str584, %eax
	movl %eax, %ecx
	movl -24(%ebp), %eax
	movl %ecx, (%eax)
	leal -96(%ebp), %eax
	movl %eax, -20(%ebp)
	movl $0, %eax
	movl %eax, %ecx
	movl -20(%ebp), %eax
	movl %ecx, (%eax)
	leal -92(%ebp), %eax
	movl %eax, -16(%ebp)
	movl $0, %eax
	movl %eax, %ecx
	movl -16(%ebp), %eax
	movl %ecx, (%eax)
	movl -28(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -12(%ebp)
	leal -88(%ebp), %eax
	movl %eax, -8(%ebp)
	movl -12(%ebp), %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl -12(%ebp), %eax
	movl %eax, %ecx
	movl $0, %eax
	cmpl %eax, %ecx
	setNE -4(%ebp)
	andl $1, -4(%ebp)
	movl -4(%ebp), %eax
	cmpl $0, %eax
	jNE __then986
	jmp __else985
__fresh991:
	jmp __then986
__then986:
	movl -8(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -52(%ebp)
	movl -52(%ebp), %eax
	pushl %eax
	call _print_string
	addl $4, %esp
	movl -16(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -48(%ebp)
	movl -48(%ebp), %eax
	movl %eax, -44(%ebp)
	movl $2, %eax
	movl %eax, %ecx
	addl %ecx, -44(%ebp)
	movl -44(%ebp), %eax
	movl %eax, %ecx
	movl -16(%ebp), %eax
	movl %ecx, (%eax)
	movl -28(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -40(%ebp)
	movl -40(%ebp), %eax
	movl %eax, %ecx
	movl -20(%ebp), %eax
	movl %ecx, (%eax)
	jmp __merge984
__fresh992:
	jmp __else985
__else985:
	jmp __merge984
__merge984:
	movl -24(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -64(%ebp)
	leal -116(%ebp), %eax
	movl %eax, -60(%ebp)
	movl -64(%ebp), %eax
	movl %eax, %ecx
	movl -60(%ebp), %eax
	movl %ecx, (%eax)
	movl -64(%ebp), %eax
	movl %eax, %ecx
	movl $0, %eax
	cmpl %eax, %ecx
	setNE -56(%ebp)
	andl $1, -56(%ebp)
	movl -56(%ebp), %eax
	cmpl $0, %eax
	jNE __then989
	jmp __else988
__fresh993:
	jmp __then989
__then989:
	movl -60(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -80(%ebp)
	movl -80(%ebp), %eax
	pushl %eax
	call _print_string
	addl $4, %esp
	movl -16(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -76(%ebp)
	movl -76(%ebp), %eax
	movl %eax, -72(%ebp)
	movl $40, %eax
	movl %eax, %ecx
	addl %ecx, -72(%ebp)
	movl -72(%ebp), %eax
	movl %eax, %ecx
	movl -16(%ebp), %eax
	movl %ecx, (%eax)
	movl -28(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -68(%ebp)
	movl -68(%ebp), %eax
	movl %eax, %ecx
	movl -20(%ebp), %eax
	movl %ecx, (%eax)
	jmp __merge987
__fresh994:
	jmp __else988
__else988:
	jmp __merge987
__merge987:
	movl -16(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -84(%ebp)
	movl -84(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __Object_get_name
__Object_get_name:
	pushl %ebp
	movl %esp, %ebp
	subl $8, %esp
__fresh983:
	movl 8(%ebp), %eax
	addl $4, %eax
	movl %eax, -8(%ebp)
	movl -8(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -4(%ebp)
	movl -4(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __Object_ctor
__Object_ctor:
	pushl %ebp
	movl %esp, %ebp
	subl $8, %esp
__fresh982:
	movl 8(%ebp), %eax
	addl $4, %eax
	movl %eax, -8(%ebp)
	movl $__const_str583, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -4(%ebp)
	movl $__Object_vtable582, %eax
	movl %eax, %ecx
	movl -4(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
