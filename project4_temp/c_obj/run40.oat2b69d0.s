	.file	"<stdin>"
	.text
	.globl	oat_init
	.align	16, 0x90
	.type	oat_init,@function
oat_init:                               # @oat_init
.Ltmp0:
# BB#0:                                 # %__fresh94
	ret
.Ltmp1:
	.size	oat_init, .Ltmp1-oat_init
.Ltmp2:

	.globl	program
	.align	16, 0x90
	.type	program,@function
program:                                # @program
.Ltmp4:
# BB#0:                                 # %__fresh93
	subl	$12, %esp
.Ltmp5:
	movl	20(%esp), %eax
	movl	16(%esp), %ecx
	movl	%ecx, 8(%esp)
	movl	%eax, (%esp)
	calll	f
	addl	$12, %esp
	ret
.Ltmp6:
	.size	program, .Ltmp6-program
.Ltmp7:

	.globl	g
	.align	16, 0x90
	.type	g,@function
g:                                      # @g
.Ltmp8:
# BB#0:                                 # %__fresh92
	movl	i334, %eax
	ret
.Ltmp9:
	.size	g, .Ltmp9-g
.Ltmp10:

	.globl	f
	.align	16, 0x90
	.type	f,@function
f:                                      # @f
.Ltmp12:
# BB#0:                                 # %__fresh91
	subl	$12, %esp
.Ltmp13:
	movl	$0, 8(%esp)
	calll	g
	movl	%eax, 8(%esp)
	movl	8(%esp), %eax
	addl	$12, %esp
	ret
.Ltmp14:
	.size	f, .Ltmp14-f
.Ltmp15:

	.type	i334,@object            # @i334
	.data
	.globl	i334
	.align	4
i334:
	.long	8                       # 0x8
	.size	i334, 4


	.section	".note.GNU-stack","",@progbits
	.section	.eh_frame,"a",@progbits
.Ltmp16:
.Ltmp17:
	.long	(.Ltmp18-.Ltmp17)-4     # CIE Length
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
.Ltmp18:
	.long	(.Ltmp20-.Ltmp19)-0     # FDE Length
.Ltmp19:
	.long	(.Ltmp19-.Ltmp17)-0     # FDE CIE Offset
	.long	.Ltmp0                  # FDE initial location
	.long	(.Ltmp2-.Ltmp0)-0       # FDE address range
	.byte	0                       # Augmentation size
	.align	4
.Ltmp20:
	.long	(.Ltmp22-.Ltmp21)-0     # FDE Length
.Ltmp21:
	.long	(.Ltmp21-.Ltmp17)-0     # FDE CIE Offset
	.long	.Ltmp4                  # FDE initial location
	.long	(.Ltmp7-.Ltmp4)-0       # FDE address range
	.byte	0                       # Augmentation size
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp5-.Ltmp4
	.byte	14                      # DW_CFA_def_cfa_offset
	.byte	16                      # Offset 16
	.align	4
.Ltmp22:
	.long	(.Ltmp24-.Ltmp23)-0     # FDE Length
.Ltmp23:
	.long	(.Ltmp23-.Ltmp17)-0     # FDE CIE Offset
	.long	.Ltmp8                  # FDE initial location
	.long	(.Ltmp10-.Ltmp8)-0      # FDE address range
	.byte	0                       # Augmentation size
	.align	4
.Ltmp24:
	.long	(.Ltmp26-.Ltmp25)-0     # FDE Length
.Ltmp25:
	.long	(.Ltmp25-.Ltmp17)-0     # FDE CIE Offset
	.long	.Ltmp12                 # FDE initial location
	.long	(.Ltmp15-.Ltmp12)-0     # FDE address range
	.byte	0                       # Augmentation size
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp13-.Ltmp12
	.byte	14                      # DW_CFA_def_cfa_offset
	.byte	16                      # Offset 16
	.align	4
	.align	4
.Ltmp26:
