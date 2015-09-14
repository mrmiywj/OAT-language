	.file	"<stdin>"
	.text
	.globl	oat_init
	.align	16, 0x90
	.type	oat_init,@function
oat_init:                               # @oat_init
.Ltmp0:
# BB#0:                                 # %__fresh68
	ret
.Ltmp1:
	.size	oat_init, .Ltmp1-oat_init
.Ltmp2:

	.globl	program
	.align	16, 0x90
	.type	program,@function
program:                                # @program
.Ltmp8:
# BB#0:                                 # %__fresh67
	pushl	%ebp
.Ltmp9:
	pushl	%ebx
.Ltmp10:
	pushl	%edi
.Ltmp11:
	pushl	%esi
.Ltmp12:
	subl	$76, %esp
.Ltmp13:
.Ltmp14:
.Ltmp15:
.Ltmp16:
.Ltmp17:
	movl	100(%esp), %eax
	movl	96(%esp), %ecx
	movl	$1, %edx
	movl	$2, %esi
	movl	$3, %edi
	movl	$4, %ebx
	movl	$5, %ebp
	movl	%eax, 64(%esp)          # 4-byte Spill
	movl	$0, %eax
	movl	%ecx, 72(%esp)
	movl	64(%esp), %ecx          # 4-byte Reload
	movl	%ecx, 68(%esp)
	movl	%eax, %ecx
	subl	$3, %ecx
	movl	%eax, 60(%esp)          # 4-byte Spill
	subl	$4, %eax
	movl	%eax, 56(%esp)          # 4-byte Spill
	movl	60(%esp), %eax          # 4-byte Reload
	subl	$5, %eax
	movl	$1, (%esp)
	movl	$2, 4(%esp)
	movl	$3, 8(%esp)
	movl	$4, 12(%esp)
	movl	$5, 16(%esp)
	movl	%eax, 20(%esp)
	movl	56(%esp), %eax          # 4-byte Reload
	movl	%eax, 24(%esp)
	movl	%ecx, 28(%esp)
	movl	%ebp, 52(%esp)          # 4-byte Spill
	movl	%edx, 48(%esp)          # 4-byte Spill
	movl	%esi, 44(%esp)          # 4-byte Spill
	movl	%edi, 40(%esp)          # 4-byte Spill
	movl	%ebx, 36(%esp)          # 4-byte Spill
	calll	f
	addl	$76, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	ret
.Ltmp18:
	.size	program, .Ltmp18-program
.Ltmp19:

	.globl	f
	.align	16, 0x90
	.type	f,@function
f:                                      # @f
.Ltmp25:
# BB#0:                                 # %__fresh66
	pushl	%ebp
.Ltmp26:
	pushl	%ebx
.Ltmp27:
	pushl	%edi
.Ltmp28:
	pushl	%esi
.Ltmp29:
	subl	$36, %esp
.Ltmp30:
.Ltmp31:
.Ltmp32:
.Ltmp33:
.Ltmp34:
	movl	84(%esp), %eax
	movl	80(%esp), %ecx
	movl	76(%esp), %edx
	movl	72(%esp), %esi
	movl	68(%esp), %edi
	movl	64(%esp), %ebx
	movl	60(%esp), %ebp
	movl	%eax, (%esp)            # 4-byte Spill
	movl	56(%esp), %eax
	movl	%eax, 32(%esp)
	movl	%ebp, 28(%esp)
	movl	%ebx, 24(%esp)
	movl	%edi, 20(%esp)
	movl	%esi, 16(%esp)
	movl	%edx, 12(%esp)
	movl	%ecx, 8(%esp)
	movl	(%esp), %eax            # 4-byte Reload
	movl	%eax, 4(%esp)
	movl	32(%esp), %ecx
	addl	28(%esp), %ecx
	addl	24(%esp), %ecx
	addl	20(%esp), %ecx
	addl	16(%esp), %ecx
	addl	12(%esp), %ecx
	addl	8(%esp), %ecx
	addl	4(%esp), %ecx
	movl	%ecx, %eax
	addl	$36, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	ret
.Ltmp35:
	.size	f, .Ltmp35-f
.Ltmp36:


	.section	".note.GNU-stack","",@progbits
	.section	.eh_frame,"a",@progbits
.Ltmp37:
.Ltmp38:
	.long	(.Ltmp39-.Ltmp38)-4     # CIE Length
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
.Ltmp39:
	.long	(.Ltmp41-.Ltmp40)-0     # FDE Length
.Ltmp40:
	.long	(.Ltmp40-.Ltmp38)-0     # FDE CIE Offset
	.long	.Ltmp0                  # FDE initial location
	.long	(.Ltmp2-.Ltmp0)-0       # FDE address range
	.byte	0                       # Augmentation size
	.align	4
.Ltmp41:
	.long	(.Ltmp43-.Ltmp42)-0     # FDE Length
.Ltmp42:
	.long	(.Ltmp42-.Ltmp38)-0     # FDE CIE Offset
	.long	.Ltmp8                  # FDE initial location
	.long	(.Ltmp19-.Ltmp8)-0      # FDE address range
	.byte	0                       # Augmentation size
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp9-.Ltmp8
	.byte	14                      # DW_CFA_def_cfa_offset
	.byte	8                       # Offset 8
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp10-.Ltmp9
	.byte	14                      # DW_CFA_def_cfa_offset
	.byte	12                      # Offset 12
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp11-.Ltmp10
	.byte	14                      # DW_CFA_def_cfa_offset
	.byte	16                      # Offset 16
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp12-.Ltmp11
	.byte	14                      # DW_CFA_def_cfa_offset
	.byte	20                      # Offset 20
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp13-.Ltmp12
	.byte	14                      # DW_CFA_def_cfa_offset
	.byte	96                      # Offset 96
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp14-.Ltmp13
	.byte	134                     # DW_CFA_offset + Reg(6)
	.byte	5                       # Offset 5
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp15-.Ltmp14
	.byte	135                     # DW_CFA_offset + Reg(7)
	.byte	4                       # Offset 4
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp16-.Ltmp15
	.byte	131                     # DW_CFA_offset + Reg(3)
	.byte	3                       # Offset 3
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp17-.Ltmp16
	.byte	133                     # DW_CFA_offset + Reg(5)
	.byte	2                       # Offset 2
	.align	4
.Ltmp43:
	.long	(.Ltmp45-.Ltmp44)-0     # FDE Length
.Ltmp44:
	.long	(.Ltmp44-.Ltmp38)-0     # FDE CIE Offset
	.long	.Ltmp25                 # FDE initial location
	.long	(.Ltmp36-.Ltmp25)-0     # FDE address range
	.byte	0                       # Augmentation size
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp26-.Ltmp25
	.byte	14                      # DW_CFA_def_cfa_offset
	.byte	8                       # Offset 8
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp27-.Ltmp26
	.byte	14                      # DW_CFA_def_cfa_offset
	.byte	12                      # Offset 12
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp28-.Ltmp27
	.byte	14                      # DW_CFA_def_cfa_offset
	.byte	16                      # Offset 16
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp29-.Ltmp28
	.byte	14                      # DW_CFA_def_cfa_offset
	.byte	20                      # Offset 20
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp30-.Ltmp29
	.byte	14                      # DW_CFA_def_cfa_offset
	.byte	56                      # Offset 56
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp31-.Ltmp30
	.byte	134                     # DW_CFA_offset + Reg(6)
	.byte	5                       # Offset 5
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp32-.Ltmp31
	.byte	135                     # DW_CFA_offset + Reg(7)
	.byte	4                       # Offset 4
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp33-.Ltmp32
	.byte	131                     # DW_CFA_offset + Reg(3)
	.byte	3                       # Offset 3
	.byte	4                       # DW_CFA_advance_loc4
	.long	.Ltmp34-.Ltmp33
	.byte	133                     # DW_CFA_offset + Reg(5)
	.byte	2                       # Offset 2
	.align	4
	.align	4
.Ltmp45:
