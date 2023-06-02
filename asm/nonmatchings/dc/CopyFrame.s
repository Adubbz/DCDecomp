.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CopyFrame__FP6CFrameP14CDataAlloc2_1_
/* 27800 00127700 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 27804 00127704 3000BF7F */  sq         $31, 0x30($sp)
/* 27808 00127708 2000B27F */  sq         $18, 0x20($sp)
/* 2780C 0012770C 1000B17F */  sq         $17, 0x10($sp)
/* 27810 00127710 0000B07F */  sq         $16, 0x0($sp)
/* 27814 00127714 288E8070 */  paddub     $17, $4, $0
/* 27818 00127718 2896A070 */  paddub     $18, $5, $0
/* 2781C 0012771C 04002016 */  bnez       $17, .L00127730
/* 27820 00127720 00000000 */   nop
/* 27824 00127724 28160070 */  paddub     $2, $0, $0
/* 27828 00127728 29000010 */  b          .L001277D0
/* 2782C 0012772C 00000000 */   nop
.L00127730:
/* 27830 00127730 28264072 */  paddub     $4, $18, $0
/* 27834 00127734 26000524 */  addiu      $5, $0, 0x26
/* 27838 00127738 289E040C */  jal        Alloc__14CDataAlloc2_1_Fi
/* 2783C 0012773C 00000000 */   nop
/* 27840 00127740 60020424 */  addiu      $4, $0, 0x260
/* 27844 00127744 282E4070 */  paddub     $5, $2, $0
/* 27848 00127748 E09E040C */  jal        __nw__FUiP1
/* 2784C 0012774C 00000000 */   nop
/* 27850 00127750 28864070 */  paddub     $16, $2, $0
/* 27854 00127754 05000012 */  beqz       $16, .L0012776C
/* 27858 00127758 00000000 */   nop
/* 2785C 0012775C 28260072 */  paddub     $4, $16, $0
/* 27860 00127760 70A8040C */  jal        __ct__6CFrameFv
/* 27864 00127764 00000000 */   nop
/* 27868 00127768 28864070 */  paddub     $16, $2, $0
.L0012776C:
/* 2786C 0012776C 28260072 */  paddub     $4, $16, $0
/* 27870 00127770 5002198E */  lw         $25, 0x250($16)
/* 27874 00127774 1000398F */  lw         $25, 0x10($25)
/* 27878 00127778 09F82003 */  jalr       $25
/* 2787C 0012777C 00000000 */   nop
/* 27880 00127780 28260072 */  paddub     $4, $16, $0
/* 27884 00127784 282E2072 */  paddub     $5, $17, $0
/* 27888 00127788 ACA3040C */  jal        __as__6CFrameFR6CFrame
/* 2788C 0012778C 00000000 */   nop
/* 27890 00127790 3801318E */  lw         $17, 0x138($17)
/* 27894 00127794 0B000010 */  b          .L001277C4
/* 27898 00127798 00000000 */   nop
.L0012779C:
/* 2789C 0012779C 28262072 */  paddub     $4, $17, $0
/* 278A0 001277A0 282E4072 */  paddub     $5, $18, $0
/* 278A4 001277A4 C09D040C */  jal        CopyFrame__FP6CFrameP14CDataAlloc2_1_
/* 278A8 001277A8 00000000 */   nop
/* 278AC 001277AC 28264070 */  paddub     $4, $2, $0
/* 278B0 001277B0 282E0072 */  paddub     $5, $16, $0
/* 278B4 001277B4 20A0040C */  jal        SetParent__6CFrameFP6CFrame
/* 278B8 001277B8 00000000 */   nop
/* 278BC 001277BC 3C01318E */  lw         $17, 0x13C($17)
/* 278C0 001277C0 00000000 */  nop
.L001277C4:
/* 278C4 001277C4 F5FF2016 */  bnez       $17, .L0012779C
/* 278C8 001277C8 00000000 */   nop
/* 278CC 001277CC 28160072 */  paddub     $2, $16, $0
.L001277D0:
/* 278D0 001277D0 3000BF7B */  lq         $31, 0x30($sp)
/* 278D4 001277D4 2000B27B */  lq         $18, 0x20($sp)
/* 278D8 001277D8 1000B17B */  lq         $17, 0x10($sp)
/* 278DC 001277DC 0000B07B */  lq         $16, 0x0($sp)
/* 278E0 001277E0 4000BD27 */  addiu      $sp, $sp, 0x40
/* 278E4 001277E4 0800E003 */  jr         $31
/* 278E8 001277E8 00000000 */   nop
/* 278EC 001277EC 00000000 */  nop