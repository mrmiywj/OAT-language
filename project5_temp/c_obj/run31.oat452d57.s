	.align 4
	.data
__const_str182:
	.ascii "no\0"
__const_str183:
	.ascii "yes\0"
__const_str181:
	.ascii "C\0"
__const_str180:
	.ascii "B\0"
__const_str179:
	.ascii "A\0"
__const_str178:
	.ascii "Object\0"
__C_vtable177:
	.long __B_vtable176
	.long __Object_get_name

__B_vtable176:
	.long __A_vtable175
	.long __Object_get_name

__A_vtable175:
	.long __Object_vtable174
	.long __Object_get_name

__Object_vtable174:
	.long 0
	.long __Object_get_name

	.text
.globl _oat_init
_oat_init:
	pushl %ebp
	movl %esp, %ebp
	subl $0, %esp
__fresh292:
	movl %ebp, %esp
	popl %ebp
	ret
.globl _program
_program:
	pushl %ebp
	movl %esp, %ebp
	subl $140, %esp
__fresh287:
	leal -136(%ebp), %eax
	movl %eax, -60(%ebp)
	movl 8(%ebp), %eax
	movl %eax, %ecx
	movl -60(%ebp), %eax
	movl %ecx, (%eax)
	leal -132(%ebp), %eax
	movl %eax, -56(%ebp)
	movl 12(%ebp), %eax
	movl %eax, %ecx
	movl -56(%ebp), %eax
	movl %ecx, (%eax)
	movl $12, %eax
	pushl %eax
	call _oat_malloc
	movl %eax, -52(%ebp)
	addl $4, %esp
	movl -52(%ebp), %eax
	movl %eax, -48(%ebp)
	movl -48(%ebp), %eax
	pushl %eax
	call __C_ctor
	movl %eax, -44(%ebp)
	addl $4, %esp
	movl -44(%ebp), %eax
	movl %eax, -40(%ebp)
	leal -128(%ebp), %eax
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
	leal -124(%ebp), %eax
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
	movl $__C_vtable177, %eax
	movl %eax, -12(%ebp)
	leal -120(%ebp), %eax
	movl %eax, -8(%ebp)
	movl -16(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -4(%ebp)
	movl -4(%ebp), %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	jmp __loop286
__loop286:
	movl -8(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -68(%ebp)
	movl -68(%ebp), %eax
	movl %eax, %ecx
	movl -12(%ebp), %eax
	cmpl %eax, %ecx
	setE -64(%ebp)
	andl $1, -64(%ebp)
	movl -64(%ebp), %eax
	cmpl $0, %eax
	jNE __then283
	jmp __fall1285
__fresh288:
	jmp __fall1285
__fall1285:
	movl -68(%ebp), %eax
	movl %eax, %ecx
	movl $0, %eax
	cmpl %eax, %ecx
	setE -72(%ebp)
	andl $1, -72(%ebp)
	movl -72(%ebp), %eax
	cmpl $0, %eax
	jNE __else282
	jmp __fall2284
__fresh289:
	jmp __fall2284
__fall2284:
	movl -8(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -84(%ebp)
	movl -84(%ebp), %eax
	movl %eax, -80(%ebp)
	movl -80(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -76(%ebp)
	movl -76(%ebp), %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	jmp __loop286
__fresh290:
	jmp __then283
__then283:
	leal -140(%ebp), %eax
	movl %eax, -100(%ebp)
	movl -20(%ebp), %eax
	movl %eax, %ecx
	movl -100(%ebp), %eax
	movl %ecx, (%eax)
	movl $__const_str183, %eax
	pushl %eax
	call _print_string
	addl $4, %esp
	movl -100(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -96(%ebp)
	movl -96(%ebp), %eax
	addl $8, %eax
	movl %eax, -92(%ebp)
	movl -92(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -88(%ebp)
	movl -88(%ebp), %eax
	movl %eax, %ecx
	movl -28(%ebp), %eax
	movl %ecx, (%eax)
	jmp __done281
__fresh291:
	jmp __else282
__else282:
	movl $__const_str182, %eax
	pushl %eax
	call _print_string
	addl $4, %esp
	movl -36(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -112(%ebp)
	movl -112(%ebp), %eax
	addl $8, %eax
	movl %eax, -108(%ebp)
	movl -108(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -104(%ebp)
	movl -104(%ebp), %eax
	movl %eax, %ecx
	movl -28(%ebp), %eax
	movl %ecx, (%eax)
	jmp __done281
__done281:
	movl -28(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -116(%ebp)
	movl -116(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl __C_ctor
__C_ctor:
	pushl %ebp
	movl %esp, %ebp
	subl $20, %esp
__fresh280:
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
	movl $__const_str181, %eax
	movl %eax, %ecx
	movl -12(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -8(%ebp)
	movl $__C_vtable177, %eax
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
__fresh279:
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
	movl $__const_str180, %eax
	movl %eax, %ecx
	movl -12(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -8(%ebp)
	movl $__B_vtable176, %eax
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
__fresh278:
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
	movl $__const_str179, %eax
	movl %eax, %ecx
	movl -12(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -8(%ebp)
	movl $__A_vtable175, %eax
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
__fresh277:
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
__fresh276:
	movl 8(%ebp), %eax
	addl $4, %eax
	movl %eax, -8(%ebp)
	movl $__const_str178, %eax
	movl %eax, %ecx
	movl -8(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	addl $0, %eax
	movl %eax, -4(%ebp)
	movl $__Object_vtable174, %eax
	movl %eax, %ecx
	movl -4(%ebp), %eax
	movl %ecx, (%eax)
	movl 8(%ebp), %eax
	movl %ebp, %esp
	popl %ebp
	ret
