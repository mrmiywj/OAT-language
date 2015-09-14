	.file	"<stdin>"
	.text
	.globl	oat_init
	.align	16, 0x90
	.type	oat_init,@function
oat_init:                               # @oat_init
.Ltmp0:
# BB#0:                                 # %__fresh209
	ret
.Ltmp1:
	.size	oat_init, .Ltmp1-oat_init
.Ltmp2:

	.globl	program
	.align	16, 0x90
	.type	program,@function
program:                                # @program
.Ltmp4:
# BB#0:                                 # %__fresh206
	subl	$44, %esp
.Ltmp5:
	movl	52(%esp), %eax
	movl	48(%esp), %ecx
	movl	%ecx, 40(%esp)
	movl	%eax, 32(%esp)
	movl	_oat_string1582, %eax
	movl	%eax, 28(%esp)
	movl	%esp, %ecx
	movl	%eax, (%ecx)
	calll	array_of_string
	movl	%eax, 24(%esp)
	movl	$0, 20(%esp)
	movl	$0, 16(%esp)
.LBB1_1:                                # %__cond205
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$5, 16(%esp)
	jge	.LBB1_3
# BB#2:                                 # %__body204
                                        #   in Loop: Header=BB1_1 Depth=1
	movl	20(%esp), %eax
	movl	16(%esp), %ecx
	movl	24(%esp), %edx
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 12(%esp)          # 4-byte Spill
	movl	%ecx, 8(%esp)           # 4-byte Spill
	calll	oat_array_bounds_check
	movl	12(%esp), %eax          # 4-byte Reload
	movl	8(%esp), %ecx           # 4-byte Reload
	addl	28(%esp,%ecx,4), %eax
	movl	%eax, 20(%esp)
	movl	16(%esp), %eax
	addl	$1, %eax
	movl	%eax, 16(%esp)
	jmp	.LBB1_1
.LBB1_3:                                # %__post203
	movl	20(%esp), %eax
	addl	$44, %esp
	ret
.Ltmp6:
	.size	program, .Ltmp6-program
.Ltmp7:

	.type	.L_oat_string1582.str.,@object # @_oat_string1582.str.
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	4
.L_oat_string1582.str.:
	.asciz	"hello"
	.size	.L_oat_string1582.str., 6

	.type	_oat_string1582,@object # @_oat_string1582
	.data
	.globl	_oat_string1582
	.align	4
_oat_string1582:
	.long	.L_oat_string1582.str.
	.size	_oat_string1582, 4


	.section	".note.GNU-stack","",@progbits
	.section	.eh_frame,"a",@progbits
.Ltmp8:
.Ltmp9:
	.long	(.Ltmp10-.Ltmp9)-4      # CIE Length
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
.Ltmp10:
	.long	(.Ltmp12-.Ltmp11)-0     # FDE Length
.Ltmp11:
	.long	(.Ltmp11-.Ltmp9)-0      # FDE CIE Offset
	.long	.Ltmp0                  # FDE initial location
	.long	(.Ltmp2-.Ltmp0)-0       # FDE address range
	.byte	0                       # Augmentation size
	.align	4
.Ltmp12:
	.long	(.Ltmp14-.Ltmp13)-0     # FDE Length
.Ltmp13:
	.long	(.Ltmp13-.Ltmp9)-0      # FDE CIE Offset
	.long	.Ltmp4                  # FDE initial location
	.long	(.Ltmp7-.Ltmp4)-0       # FDE address range
	.byte	0                       # Augmentation size
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp5-.Ltmp4
	.byte	14                      # DW_CFA_def_cfa_offset
	.byte	48                      # Offset 48
	.align	4
	.align	4
.Ltmp14:
