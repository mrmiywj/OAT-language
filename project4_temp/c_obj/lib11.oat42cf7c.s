	.file	"<stdin>"
	.text
	.globl	oat_init
	.align	16, 0x90
	.type	oat_init,@function
oat_init:                               # @oat_init
.Ltmp0:
# BB#0:                                 # %__fresh248
	ret
.Ltmp1:
	.size	oat_init, .Ltmp1-oat_init
.Ltmp2:

	.globl	program
	.align	16, 0x90
	.type	program,@function
program:                                # @program
.Ltmp6:
# BB#0:                                 # %__fresh243
	pushl	%ebp
.Ltmp7:
.Ltmp8:
	movl	%esp, %ebp
.Ltmp9:
	pushl	%esi
	subl	$52, %esp
.Ltmp10:
	movl	12(%ebp), %eax
	movl	8(%ebp), %ecx
	movl	%ecx, -8(%ebp)
	movl	%eax, -16(%ebp)
	movl	_oat_string1710, %eax
	subl	$16, %esp
	movl	%esp, %ecx
	movl	%eax, (%ecx)
	calll	array_of_string
	addl	$16, %esp
	movl	%eax, -24(%ebp)
	movl	$0, -28(%ebp)
	movl	$0, -32(%ebp)
.LBB1_1:                                # %__cond239
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$10, -32(%ebp)
	jge	.LBB1_3
# BB#2:                                 # %__body238
                                        #   in Loop: Header=BB1_1 Depth=1
	movl	-32(%ebp), %eax
	movl	-24(%ebp), %ecx
	subl	$16, %esp
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	movl	%eax, -36(%ebp)         # 4-byte Spill
	calll	oat_array_bounds_check
	addl	$16, %esp
	movl	-32(%ebp), %eax
	movl	-36(%ebp), %ecx         # 4-byte Reload
	movl	%eax, -20(%ebp,%ecx,4)
	movl	-32(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -32(%ebp)
	jmp	.LBB1_1
.LBB1_3:                                # %__post237
	movl	%esp, %eax
	addl	$-16, %eax
	movl	%eax, %esp
	movl	$0, (%eax)
	movl	%eax, -40(%ebp)         # 4-byte Spill
.LBB1_4:                                # %__cond242
                                        # =>This Inner Loop Header: Depth=1
	movl	-40(%ebp), %eax         # 4-byte Reload
	cmpl	$10, (%eax)
	jge	.LBB1_6
# BB#5:                                 # %__body241
                                        #   in Loop: Header=BB1_4 Depth=1
	movl	-28(%ebp), %eax
	movl	-40(%ebp), %ecx         # 4-byte Reload
	movl	(%ecx), %edx
	movl	-24(%ebp), %esi
	subl	$16, %esp
	movl	%esi, (%esp)
	movl	%edx, 4(%esp)
	movl	%eax, -44(%ebp)         # 4-byte Spill
	movl	%edx, -48(%ebp)         # 4-byte Spill
	calll	oat_array_bounds_check
	addl	$16, %esp
	movl	-44(%ebp), %eax         # 4-byte Reload
	movl	-48(%ebp), %ecx         # 4-byte Reload
	addl	-20(%ebp,%ecx,4), %eax
	movl	%eax, -28(%ebp)
	movl	-40(%ebp), %eax         # 4-byte Reload
	movl	(%eax), %edx
	addl	$1, %edx
	movl	%edx, (%eax)
	jmp	.LBB1_4
.LBB1_6:                                # %__post240
	movl	-28(%ebp), %eax
	leal	-4(%ebp), %esp
	popl	%esi
	popl	%ebp
	ret
.Ltmp11:
	.size	program, .Ltmp11-program
.Ltmp12:

	.type	.L_oat_string1710.str.,@object # @_oat_string1710.str.
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	4
.L_oat_string1710.str.:
	.asciz	"1234967890"
	.size	.L_oat_string1710.str., 11

	.type	_oat_string1710,@object # @_oat_string1710
	.data
	.globl	_oat_string1710
	.align	4
_oat_string1710:
	.long	.L_oat_string1710.str.
	.size	_oat_string1710, 4


	.section	".note.GNU-stack","",@progbits
	.section	.eh_frame,"a",@progbits
.Ltmp13:
.Ltmp14:
	.long	(.Ltmp15-.Ltmp14)-4     # CIE Length
	.long	0                       # CIE ID Tag
	.byte	1                       # DW_CIE_VERSION
	.ascii	"zR"                    # CIE Augmentation
	.byte	0
	.byte	1                       # CIE Code Alignment Factor
	.byte	124                     # CIE Data Alignment Factor
	.byte	8                       # CIE Return Address Column
	.byte	1                       # Augmentation Size
	.byte	0                       # FDE Encoding = absptr
	.byte	12                      # DW_CFA_def_cfa
	.byte	4                       # Reg 4
	.byte	4                       # Offset 4
	.byte	136                     # DW_CFA_offset + Reg(8)
	.byte	1                       # Offset 1
	.align	4
.Ltmp15:
	.long	(.Ltmp17-.Ltmp16)-0     # FDE Length
.Ltmp16:
	.long	(.Ltmp16-.Ltmp14)-0     # FDE CIE Offset
	.long	.Ltmp0                  # FDE initial location
	.long	(.Ltmp2-.Ltmp0)-0       # FDE address range
	.byte	0                       # Augmentation size
	.align	4
.Ltmp17:
	.long	(.Ltmp19-.Ltmp18)-0     # FDE Length
.Ltmp18:
	.long	(.Ltmp18-.Ltmp14)-0     # FDE CIE Offset
	.long	.Ltmp6                  # FDE initial location
	.long	(.Ltmp12-.Ltmp6)-0      # FDE address range
	.byte	0                       # Augmentation size
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp7-.Ltmp6
	.byte	14                      # DW_CFA_def_cfa_offset
	.byte	8                       # Offset 8
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp8-.Ltmp7
	.byte	133                     # DW_CFA_offset + Reg(5)
	.byte	2                       # Offset 2
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp9-.Ltmp8
	.byte	13                      # DW_CFA_def_cfa_register
	.byte	5                       # Reg 5
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp10-.Ltmp9
	.byte	134                     # DW_CFA_offset + Reg(6)
	.byte	3                       # Offset 3
	.align	4
	.align	4
.Ltmp19:
