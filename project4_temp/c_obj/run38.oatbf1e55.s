	.file	"<stdin>"
	.text
	.globl	oat_init
	.align	16, 0x90
	.type	oat_init,@function
oat_init:                               # @oat_init
.Ltmp0:
# BB#0:                                 # %__fresh26
	ret
.Ltmp1:
	.size	oat_init, .Ltmp1-oat_init
.Ltmp2:

	.globl	program
	.align	16, 0x90
	.type	program,@function
program:                                # @program
.Ltmp4:
# BB#0:                                 # %__fresh25
	subl	$12, %esp
.Ltmp5:
	movl	20(%esp), %eax
	movl	16(%esp), %ecx
	movl	%ecx, 8(%esp)
	movl	%eax, 4(%esp)
	calll	f1
	addl	$12, %esp
	ret
.Ltmp6:
	.size	program, .Ltmp6-program
.Ltmp7:

	.globl	f9
	.align	16, 0x90
	.type	f9,@function
f9:                                     # @f9
.Ltmp8:
# BB#0:                                 # %__fresh24
	movl	$31, %eax
	ret
.Ltmp9:
	.size	f9, .Ltmp9-f9
.Ltmp10:

	.globl	f8
	.align	16, 0x90
	.type	f8,@function
f8:                                     # @f8
.Ltmp12:
# BB#0:                                 # %__fresh23
	subl	$12, %esp
.Ltmp13:
	calll	f9
	addl	$12, %esp
	ret
.Ltmp14:
	.size	f8, .Ltmp14-f8
.Ltmp15:

	.globl	f7
	.align	16, 0x90
	.type	f7,@function
f7:                                     # @f7
.Ltmp17:
# BB#0:                                 # %__fresh22
	subl	$12, %esp
.Ltmp18:
	calll	f8
	addl	$12, %esp
	ret
.Ltmp19:
	.size	f7, .Ltmp19-f7
.Ltmp20:

	.globl	f6
	.align	16, 0x90
	.type	f6,@function
f6:                                     # @f6
.Ltmp22:
# BB#0:                                 # %__fresh21
	subl	$12, %esp
.Ltmp23:
	calll	f7
	addl	$12, %esp
	ret
.Ltmp24:
	.size	f6, .Ltmp24-f6
.Ltmp25:

	.globl	f5
	.align	16, 0x90
	.type	f5,@function
f5:                                     # @f5
.Ltmp27:
# BB#0:                                 # %__fresh20
	subl	$12, %esp
.Ltmp28:
	calll	f6
	addl	$12, %esp
	ret
.Ltmp29:
	.size	f5, .Ltmp29-f5
.Ltmp30:

	.globl	f4
	.align	16, 0x90
	.type	f4,@function
f4:                                     # @f4
.Ltmp32:
# BB#0:                                 # %__fresh19
	subl	$12, %esp
.Ltmp33:
	calll	f5
	addl	$12, %esp
	ret
.Ltmp34:
	.size	f4, .Ltmp34-f4
.Ltmp35:

	.globl	f3
	.align	16, 0x90
	.type	f3,@function
f3:                                     # @f3
.Ltmp37:
# BB#0:                                 # %__fresh18
	subl	$12, %esp
.Ltmp38:
	calll	f4
	addl	$12, %esp
	ret
.Ltmp39:
	.size	f3, .Ltmp39-f3
.Ltmp40:

	.globl	f2
	.align	16, 0x90
	.type	f2,@function
f2:                                     # @f2
.Ltmp42:
# BB#0:                                 # %__fresh17
	subl	$12, %esp
.Ltmp43:
	calll	f3
	addl	$12, %esp
	ret
.Ltmp44:
	.size	f2, .Ltmp44-f2
.Ltmp45:

	.globl	f1
	.align	16, 0x90
	.type	f1,@function
f1:                                     # @f1
.Ltmp47:
# BB#0:                                 # %__fresh16
	subl	$12, %esp
.Ltmp48:
	calll	f2
	addl	$12, %esp
	ret
.Ltmp49:
	.size	f1, .Ltmp49-f1
.Ltmp50:


	.section	".note.GNU-stack","",@progbits
	.section	.eh_frame,"a",@progbits
.Ltmp51:
.Ltmp52:
	.long	(.Ltmp53-.Ltmp52)-4     # CIE Length
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
.Ltmp53:
	.long	(.Ltmp55-.Ltmp54)-0     # FDE Length
.Ltmp54:
	.long	(.Ltmp54-.Ltmp52)-0     # FDE CIE Offset
	.long	.Ltmp0                  # FDE initial location
	.long	(.Ltmp2-.Ltmp0)-0       # FDE address range
	.byte	0                       # Augmentation size
	.align	4
.Ltmp55:
	.long	(.Ltmp57-.Ltmp56)-0     # FDE Length
.Ltmp56:
	.long	(.Ltmp56-.Ltmp52)-0     # FDE CIE Offset
	.long	.Ltmp4                  # FDE initial location
	.long	(.Ltmp7-.Ltmp4)-0       # FDE address range
	.byte	0                       # Augmentation size
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp5-.Ltmp4
	.byte	14                      # DW_CFA_def_cfa_offset
	.byte	16                      # Offset 16
	.align	4
.Ltmp57:
	.long	(.Ltmp59-.Ltmp58)-0     # FDE Length
.Ltmp58:
	.long	(.Ltmp58-.Ltmp52)-0     # FDE CIE Offset
	.long	.Ltmp8                  # FDE initial location
	.long	(.Ltmp10-.Ltmp8)-0      # FDE address range
	.byte	0                       # Augmentation size
	.align	4
.Ltmp59:
	.long	(.Ltmp61-.Ltmp60)-0     # FDE Length
.Ltmp60:
	.long	(.Ltmp60-.Ltmp52)-0     # FDE CIE Offset
	.long	.Ltmp12                 # FDE initial location
	.long	(.Ltmp15-.Ltmp12)-0     # FDE address range
	.byte	0                       # Augmentation size
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp13-.Ltmp12
	.byte	14                      # DW_CFA_def_cfa_offset
	.byte	16                      # Offset 16
	.align	4
.Ltmp61:
	.long	(.Ltmp63-.Ltmp62)-0     # FDE Length
.Ltmp62:
	.long	(.Ltmp62-.Ltmp52)-0     # FDE CIE Offset
	.long	.Ltmp17                 # FDE initial location
	.long	(.Ltmp20-.Ltmp17)-0     # FDE address range
	.byte	0                       # Augmentation size
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp18-.Ltmp17
	.byte	14                      # DW_CFA_def_cfa_offset
	.byte	16                      # Offset 16
	.align	4
.Ltmp63:
	.long	(.Ltmp65-.Ltmp64)-0     # FDE Length
.Ltmp64:
	.long	(.Ltmp64-.Ltmp52)-0     # FDE CIE Offset
	.long	.Ltmp22                 # FDE initial location
	.long	(.Ltmp25-.Ltmp22)-0     # FDE address range
	.byte	0                       # Augmentation size
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp23-.Ltmp22
	.byte	14                      # DW_CFA_def_cfa_offset
	.byte	16                      # Offset 16
	.align	4
.Ltmp65:
	.long	(.Ltmp67-.Ltmp66)-0     # FDE Length
.Ltmp66:
	.long	(.Ltmp66-.Ltmp52)-0     # FDE CIE Offset
	.long	.Ltmp27                 # FDE initial location
	.long	(.Ltmp30-.Ltmp27)-0     # FDE address range
	.byte	0                       # Augmentation size
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp28-.Ltmp27
	.byte	14                      # DW_CFA_def_cfa_offset
	.byte	16                      # Offset 16
	.align	4
.Ltmp67:
	.long	(.Ltmp69-.Ltmp68)-0     # FDE Length
.Ltmp68:
	.long	(.Ltmp68-.Ltmp52)-0     # FDE CIE Offset
	.long	.Ltmp32                 # FDE initial location
	.long	(.Ltmp35-.Ltmp32)-0     # FDE address range
	.byte	0                       # Augmentation size
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp33-.Ltmp32
	.byte	14                      # DW_CFA_def_cfa_offset
	.byte	16                      # Offset 16
	.align	4
.Ltmp69:
	.long	(.Ltmp71-.Ltmp70)-0     # FDE Length
.Ltmp70:
	.long	(.Ltmp70-.Ltmp52)-0     # FDE CIE Offset
	.long	.Ltmp37                 # FDE initial location
	.long	(.Ltmp40-.Ltmp37)-0     # FDE address range
	.byte	0                       # Augmentation size
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp38-.Ltmp37
	.byte	14                      # DW_CFA_def_cfa_offset
	.byte	16                      # Offset 16
	.align	4
.Ltmp71:
	.long	(.Ltmp73-.Ltmp72)-0     # FDE Length
.Ltmp72:
	.long	(.Ltmp72-.Ltmp52)-0     # FDE CIE Offset
	.long	.Ltmp42                 # FDE initial location
	.long	(.Ltmp45-.Ltmp42)-0     # FDE address range
	.byte	0                       # Augmentation size
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp43-.Ltmp42
	.byte	14                      # DW_CFA_def_cfa_offset
	.byte	16                      # Offset 16
	.align	4
.Ltmp73:
	.long	(.Ltmp75-.Ltmp74)-0     # FDE Length
.Ltmp74:
	.long	(.Ltmp74-.Ltmp52)-0     # FDE CIE Offset
	.long	.Ltmp47                 # FDE initial location
	.long	(.Ltmp50-.Ltmp47)-0     # FDE address range
	.byte	0                       # Augmentation size
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp48-.Ltmp47
	.byte	14                      # DW_CFA_def_cfa_offset
	.byte	16                      # Offset 16
	.align	4
	.align	4
.Ltmp75:
