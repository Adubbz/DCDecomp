.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GET_NPC_ROT__FP12RS_STACKDATAi
/* 8E7A0 0018E6A0 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 8E7A4 0018E6A4 2000BF7F */  sq         $31, 0x20($sp)
/* 8E7A8 0018E6A8 1000B17F */  sq         $17, 0x10($sp)
/* 8E7AC 0018E6AC 0000B07F */  sq         $16, 0x0($sp)
/* 8E7B0 0018E6B0 0400A128 */  slti       $at, $5, 0x4
/* 8E7B4 0018E6B4 04002010 */  beqz       $at, .L0018E6C8
/* 8E7B8 0018E6B8 00000000 */   nop
/* 8E7BC 0018E6BC 28160070 */  paddub     $2, $0, $0
/* 8E7C0 0018E6C0 2F000010 */  b          .L0018E780
/* 8E7C4 0018E6C4 00000000 */   nop
.L0018E6C8:
/* 8E7C8 0018E6C8 08009124 */  addiu      $17, $4, 0x8
/* 8E7CC 0018E6CC D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8E7D0 0018E6D0 00000000 */   nop
/* 8E7D4 0018E6D4 28264070 */  paddub     $4, $2, $0
/* 8E7D8 0018E6D8 842C060C */  jal        GetChara__Fi
/* 8E7DC 0018E6DC 00000000 */   nop
/* 8E7E0 0018E6E0 28864070 */  paddub     $16, $2, $0
/* 8E7E4 0018E6E4 04000016 */  bnez       $16, .L0018E6F8
/* 8E7E8 0018E6E8 00000000 */   nop
/* 8E7EC 0018E6EC 28160070 */  paddub     $2, $0, $0
/* 8E7F0 0018E6F0 23000010 */  b          .L0018E780
/* 8E7F4 0018E6F4 00000000 */   nop
.L0018E6F8:
/* 8E7F8 0018E6F8 28260072 */  paddub     $4, $16, $0
/* 8E7FC 0018E6FC 3000A527 */  addiu      $5, $sp, 0x30
/* 8E800 0018E700 A000198E */  lw         $25, 0xA0($16)
/* 8E804 0018E704 5800398F */  lw         $25, 0x58($25)
/* 8E808 0018E708 09F82003 */  jalr       $25
/* 8E80C 0018E70C 00000000 */   nop
/* 8E810 0018E710 BC00028E */  lw         $2, 0xBC($16)
/* 8E814 0018E714 15004010 */  beqz       $2, .L0018E76C
/* 8E818 0018E718 00000000 */   nop
/* 8E81C 0018E71C 1001428C */  lw         $2, 0x110($2)
/* 8E820 0018E720 12004010 */  beqz       $2, .L0018E76C
/* 8E824 0018E724 00000000 */   nop
/* 8E828 0018E728 28262072 */  paddub     $4, $17, $0
/* 8E82C 0018E72C 08009124 */  addiu      $17, $4, 0x8
/* 8E830 0018E730 3000ACC7 */  lwc1       $f12, 0x30($sp)
/* 8E834 0018E734 0029060C */  jal        SetStack__FP12RS_STACKDATAf
/* 8E838 0018E738 00000000 */   nop
/* 8E83C 0018E73C 28262072 */  paddub     $4, $17, $0
/* 8E840 0018E740 08009124 */  addiu      $17, $4, 0x8
/* 8E844 0018E744 3400ACC7 */  lwc1       $f12, 0x34($sp)
/* 8E848 0018E748 0029060C */  jal        SetStack__FP12RS_STACKDATAf
/* 8E84C 0018E74C 00000000 */   nop
/* 8E850 0018E750 28262072 */  paddub     $4, $17, $0
/* 8E854 0018E754 3800ACC7 */  lwc1       $f12, 0x38($sp)
/* 8E858 0018E758 0029060C */  jal        SetStack__FP12RS_STACKDATAf
/* 8E85C 0018E75C 00000000 */   nop
/* 8E860 0018E760 01000224 */  addiu      $2, $0, 0x1
/* 8E864 0018E764 06000010 */  b          .L0018E780
/* 8E868 0018E768 00000000 */   nop
.L0018E76C:
/* 8E86C 0018E76C 28262072 */  paddub     $4, $17, $0
/* 8E870 0018E770 3000A527 */  addiu      $5, $sp, 0x30
/* 8E874 0018E774 CC2D060C */  jal        SetRotation__FP12RS_STACKDATAPf
/* 8E878 0018E778 00000000 */   nop
/* 8E87C 0018E77C 01000224 */  addiu      $2, $0, 0x1
.L0018E780:
/* 8E880 0018E780 2000BF7B */  lq         $31, 0x20($sp)
/* 8E884 0018E784 1000B17B */  lq         $17, 0x10($sp)
/* 8E888 0018E788 0000B07B */  lq         $16, 0x0($sp)
/* 8E88C 0018E78C 4000BD27 */  addiu      $sp, $sp, 0x40
/* 8E890 0018E790 0800E003 */  jr         $31
/* 8E894 0018E794 00000000 */   nop
/* 8E898 0018E798 00000000 */  nop
/* 8E89C 0018E79C 00000000 */  nop
