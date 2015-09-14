	.file	"<stdin>"
	.text
	.globl	oat_init
	.align	16, 0x90
	.type	oat_init,@function
oat_init:                               # @oat_init
.Ltmp0:
# BB#0:                                 # %__fresh12
	ret
.Ltmp1:
	.size	oat_init, .Ltmp1-oat_init
.Ltmp2:

	.globl	program
	.align	16, 0x90
	.type	program,@function
program:                                # @program
.Ltmp4:
# BB#0:                                 # %__fresh9
	subl	$20, %esp
.Ltmp5:
	movl	28(%esp), %eax
	movl	24(%esp), %ecx
	movl	%ecx, 16(%esp)
	movl	%eax, 8(%esp)
	movl	$0, 4(%esp)
	testb	$1, b30
	jne	.LBB1_1
	jmp	.LBB1_2
.LBB1_1:                                # %__then8
	movl	$1, 4(%esp)
	jmp	.LBB1_3
.LBB1_2:                                # %__else7
	jmp	.LBB1_3
.LBB1_3:                                # %__merge6
	movl	4(%esp), %eax
	addl	$20, %esp
	ret
.Ltmp6:
	.size	program, .Ltmp6-program
.Ltmp7:

	.type	b30,@object             # @b30
	.data
	.globl	b30
	.align	4
b30:
	.byte	1                       # 0x1
	.size	b30, 1


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
	.byte	24                      # Offset 24
	.align	4
	.align	4
.Ltmp14:
