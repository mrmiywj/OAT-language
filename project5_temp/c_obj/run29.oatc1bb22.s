	.align 4
	.data
__const_str162:
	.ascii "no\0"
__const_str163:
	.ascii "yes\0"
__const_str161:
	.ascii "C\0"
__const_str160:
	.ascii "B\0"
__const_str159:
	.ascii "A\0"
__const_str158:
	.ascii "Object\0"
__C_vtable157:
	.long __B_vtable156
	.long __Object_get_name

__B_vtable156:
	.long __A_vtable155
	.long __Object_get_name

__A_vtable155:
	.long __Object_vtable154
	.long __Object_get_name

__Object_vtable154:
	.long 0
	.long __Object_get_name

	.text
.globl _oat_init
_oat_init:
	pushl %ebp
	movl %esp, %ebp
	subl $0, %esp
__fresh258:
	movl %ebp, %esp
	popl %ebp
	ret
.globl _program
_program:
	pushl %ebp
	movl %esp, %ebp
	subl $136, %esp
__fresh253:
	leal -132(%ebp), %eax
	movl %eax, -56(%ebp)
	movl 8(%ebp), %eax
	movl %eax, %ecx
	movl -56(%ebp), %eax
	movl %ecx, (%eax)
	leal -128(%ebp), %eax
	movl %eax, -52(%ebp)
	movl 12(%ebp), %eax
	movl %eax, %ecx
	movl -52(%ebp), %eax
	movl %ecx, (%eax)
	movl $12, %eax
	pushl %eax
	call _oat_malloc
	movl %eax, -48(%ebp)
	addl $4, %esp
	movl -48(%ebp), %eax
	movl %eax, -44(%ebp)
	movl -44(%ebp), %eax
	pushl %eax
	call __A_ctor
	movl %eax, -40(%ebp)
	addl $4, %esp
	leal -124(%ebp), %eax
	movl %eax, -36(%ebp)
	movl -40(%ebp), %eax
	movl %eax, %ecx
	movl -36(%ebp), %eax
	movl %ecx, (%eax)
	movl $0, %eax
	movl %eax, -32(%ebp)
	movl $1, %eax
	movl %eax, %ecx
	subl %ecx, -32(%ebp)
	leal -120(%ebp), %eax
	movl %eax, -28(%ebp)
	movl -32(%ebp), %eax
	movl %eax, %ecx
	movl -28(%ebp), %eax
	movl %ecx, (%eax)
	movl -36(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -24(%ebp)
	movl -24(%ebp), %eax
	movl %eax, -20(%ebp)
	movl -20(%ebp), %eax
	movl %eax, -16(%ebp)
	movl $__C_vtable157, %eax
	movl %eax, -12(%ebp)
	leal -116(%ebp), %eax
	movl %eax, -8(%ebp)
	movl -16(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -4(%ebp)
	movl -4(%ebp), %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	jmp __loop252
__loop252:
	movl -8(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -64(%ebp)
	movl -64(%ebp), %eax
	movl %eax, %ecx
	movl -12(%ebp), %eax
	cmpl %eax, %ecx
	setE -60(%ebp)
	andl $1, -60(%ebp)
	movl -60(%ebp), %eax
	cmpl $0, %eax
	jNE __then249
	jmp __fall1251
__fresh254:
	jmp __fall1251
__fall1251:
	movl -64(%ebp), %eax
	movl %eax, %ecx
	movl $0, %eax
	cmpl %eax, %ecx
	setE -68(%ebp)
	andl $1, -68(%ebp)
	movl -68(%ebp), %eax
	cmpl $0, %eax
	jNE __else248
	jmp __fall2250
__fresh255:
	jmp __fall2250
__fall2250:
	movl -8(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -80(%ebp)
	movl -80(%ebp), %eax
	movl %eax, -76(%ebp)
	movl -76(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -72(%ebp)
	movl -72(%ebp), %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	jmp __loop252
__fresh256:
	jmp __then249
__then249:
	leal -136(%ebp), %eax
	movl %eax, -96(%ebp)
	movl -20(%ebp), %eax
	movl %eax, %ecx
	movl -96(%ebp), %eax
	movl %ecx, (%eax)
	movl $__const_str163, %eax
	pushl %eax
	call _print_string
	addl $4, %esp
	movl -96(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -92(%ebp)
	movl -92(%ebp), %eax
	addl $8, %eax
	movl %eax, -88(%ebp)
	movl -88(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -84(%ebp)
	movl -84(%ebp), %eax
	movl %eax, %ecx
	movl -28(%ebp), %eax
	movl %ecx, (%eax)
	jmp __done247
__fresh257:
	jmp __else248
__else248:
	movl $__const_str162, %eax
	pushl %eax
	call _print_string
	addl $4, %esp
	movl -36(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -108(%ebp)
	movl -108(%ebp), %eax
	addl $8, %eax
	movl %eax, -104(%ebp)
	movl -104(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -100(%ebp)
	movl -100(%ebp), %eax
	movl %eax, %ecx
	movl -28(%ebp), %eax
	movl %ecx, (%eax)
	jmp __done247
__done247:
	movl -28(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -112(%ebp)
	movl -112(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __C_ctor
__C_ctor:
	pushl %ebp
	movl %esp, %ebp
	subl $20, %esp
__fresh246:
	movl 8(%ebp), %eax
	movl %eax, -20(%ebp)
	movl -20(%ebp), %eax
	pushl %eax
	call __B_ctor
	movl %eax, -16(%ebp)
	addl $4, %esp
	movl 8(%ebp), %eax
	addl $4, %eax
	movl %eax, -12(%ebp)
	movl $__const_str161, %eax
	movl %eax, %ecx
	movl -12(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -8(%ebp)
	movl $__C_vtable157, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $8, %eax
	movl %eax, -4(%ebp)
	movl $2, %eax
	movl %eax, %ecx
	movl -4(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __B_ctor
__B_ctor:
	pushl %ebp
	movl %esp, %ebp
	subl $20, %esp
__fresh245:
	movl 8(%ebp), %eax
	movl %eax, -20(%ebp)
	movl -20(%ebp), %eax
	pushl %eax
	call __A_ctor
	movl %eax, -16(%ebp)
	addl $4, %esp
	movl 8(%ebp), %eax
	addl $4, %eax
	movl %eax, -12(%ebp)
	movl $__const_str160, %eax
	movl %eax, %ecx
	movl -12(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -8(%ebp)
	movl $__B_vtable156, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $8, %eax
	movl %eax, -4(%ebp)
	movl $1, %eax
	movl %eax, %ecx
	movl -4(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __A_ctor
__A_ctor:
	pushl %ebp
	movl %esp, %ebp
	subl $20, %esp
__fresh244:
	movl 8(%ebp), %eax
	movl %eax, -20(%ebp)
	movl -20(%ebp), %eax
	pushl %eax
	call __Object_ctor
	movl %eax, -16(%ebp)
	addl $4, %esp
	movl 8(%ebp), %eax
	addl $4, %eax
	movl %eax, -12(%ebp)
	movl $__const_str159, %eax
	movl %eax, %ecx
	movl -12(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -8(%ebp)
	movl $__A_vtable155, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $8, %eax
	movl %eax, -4(%ebp)
	movl $0, %eax
	movl %eax, %ecx
	movl -4(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __Object_get_name
__Object_get_name:
	pushl %ebp
	movl %esp, %ebp
	subl $8, %esp
__fresh243:
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
__fresh242:
	movl 8(%ebp), %eax
	addl $4, %eax
	movl %eax, -8(%ebp)
	movl $__const_str158, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -4(%ebp)
	movl $__Object_vtable154, %eax
	movl %eax, %ecx
	movl -4(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
