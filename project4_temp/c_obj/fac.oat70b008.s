	.file	"<stdin>"
	.text
	.globl	oat_init
	.align	16, 0x90
	.type	oat_init,@function
oat_init:                               # @oat_init
.Ltmp0:
# BB#0:                                 # %__fresh262
	ret
.Ltmp1:
	.size	oat_init, .Ltmp1-oat_init
.Ltmp2:

	.globl	program
	.align	16, 0x90
	.type	program,@function
program:                                # @program
.Ltmp4:
# BB#0:                                 # %__fresh261
	subl	$28, %esp
.Ltmp5:
	movl	36(%esp), %eax
	movl	32(%esp), %ecx
	movl	$5, %edx
	movl	%ecx, 24(%esp)
	movl	%eax, 16(%esp)
	movl	$5, (%esp)
	movl	%edx, 12(%esp)          # 4-byte Spill
	calll	f
	addl	$28, %esp
	ret
.Ltmp6:
	.size	program, .Ltmp6-program
.Ltmp7:

	.globl	f
	.align	16, 0x90
	.type	f,@function
f:                                      # @f
.Ltmp9:
# BB#0:                                 # %__fresh258
	subl	$28, %esp
.Ltmp10:
	movl	32(%esp), %eax
	movl	%eax, 24(%esp)
	movl	$0, 20(%esp)
	cmpl	$0, 24(%esp)
	jne	.LBB2_2
# BB#1:                                 # %__then257
	movl	$1, 20(%esp)
	jmp	.LBB2_3
.LBB2_2:                                # %__else256
	movl	24(%esp), %eax
	movl	24(%esp), %ecx
	subl	$1, %ecx
	movl	%ecx, (%esp)
	movl	%eax, 16(%esp)          # 4-byte Spill
	calll	f
	movl	16(%esp), %ecx          # 4-byte Reload
	imull	%eax, %ecx
	movl	%ecx, 20(%esp)
.LBB2_3:                                # %__merge255
	movl	20(%esp), %eax
	addl	$28, %esp
	ret
.Ltmp11:
	.size	f, .Ltmp11-f
.Ltmp12:


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
	.long	.Ltmp4                  # FDE initial location
	.long	(.Ltmp7-.Ltmp4)-0       # FDE address range
	.byte	0                       # Augmentation size
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp5-.Ltmp4
	.byte	14                      # DW_CFA_def_cfa_offset
	.byte	32                      # Offset 32
	.align	4
.Ltmp19:
	.long	(.Ltmp21-.Ltmp20)-0     # FDE Length
.Ltmp20:
	.long	(.Ltmp20-.Ltmp14)-0     # FDE CIE Offset
	.long	.Ltmp9                  # FDE initial location
	.long	(.Ltmp12-.Ltmp9)-0      # FDE address range
	.byte	0                       # Augmentation size
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp10-.Ltmp9
	.byte	14                      # DW_CFA_def_cfa_offset
	.byte	32                      # Offset 32
	.align	4
	.align	4
.Ltmp21:
