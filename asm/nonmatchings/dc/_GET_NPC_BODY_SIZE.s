.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GET_NPC_BODY_SIZE__FP12RS_STACKDATAi
/* 8F7B0 0018F6B0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 8F7B4 0018F6B4 2000BF7F */  sq         $31, 0x20($sp)
/* 8F7B8 0018F6B8 1000B17F */  sq         $17, 0x10($sp)
/* 8F7BC 0018F6BC 0000B07F */  sq         $16, 0x0($sp)
/* 8F7C0 0018F6C0 2886A070 */  paddub     $16, $5, $0
/* 8F7C4 0018F6C4 08009124 */  addiu      $17, $4, 0x8
/* 8F7C8 0018F6C8 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8F7CC 0018F6CC 00000000 */   nop
/* 8F7D0 0018F6D0 28264070 */  paddub     $4, $2, $0
/* 8F7D4 0018F6D4 842C060C */  jal        GetChara__Fi
/* 8F7D8 0018F6D8 00000000 */   nop
/* 8F7DC 0018F6DC 04004014 */  bnez       $2, .L0018F6F0
/* 8F7E0 0018F6E0 00000000 */   nop
/* 8F7E4 0018F6E4 28160070 */  paddub     $2, $0, $0
/* 8F7E8 0018F6E8 19000010 */  b          .L0018F750
/* 8F7EC 0018F6EC 00000000 */   nop
.L0018F6F0:
/* 8F7F0 0018F6F0 0200012A */  slti       $at, $16, 0x2
/* 8F7F4 0018F6F4 06002014 */  bnez       $at, .L0018F710
/* 8F7F8 0018F6F8 00000000 */   nop
/* 8F7FC 0018F6FC 28262072 */  paddub     $4, $17, $0
/* 8F800 0018F700 08009124 */  addiu      $17, $4, 0x8
/* 8F804 0018F704 B0004CC4 */  lwc1       $f12, 0xB0($2)
/* 8F808 0018F708 0029060C */  jal        SetStack__FP12RS_STACKDATAf
/* 8F80C 0018F70C 00000000 */   nop
.L0018F710:
/* 8F810 0018F710 0300012A */  slti       $at, $16, 0x3
/* 8F814 0018F714 06002014 */  bnez       $at, .L0018F730
/* 8F818 0018F718 00000000 */   nop
/* 8F81C 0018F71C 28262072 */  paddub     $4, $17, $0
/* 8F820 0018F720 08009124 */  addiu      $17, $4, 0x8
/* 8F824 0018F724 B4004CC4 */  lwc1       $f12, 0xB4($2)
/* 8F828 0018F728 0029060C */  jal        SetStack__FP12RS_STACKDATAf
/* 8F82C 0018F72C 00000000 */   nop
.L0018F730:
/* 8F830 0018F730 0400012A */  slti       $at, $16, 0x4
/* 8F834 0018F734 05002014 */  bnez       $at, .L0018F74C
/* 8F838 0018F738 00000000 */   nop
/* 8F83C 0018F73C 28262072 */  paddub     $4, $17, $0
/* 8F840 0018F740 B8004CC4 */  lwc1       $f12, 0xB8($2)
/* 8F844 0018F744 0029060C */  jal        SetStack__FP12RS_STACKDATAf
/* 8F848 0018F748 00000000 */   nop
.L0018F74C:
/* 8F84C 0018F74C 01000224 */  addiu      $2, $0, 0x1
.L0018F750:
/* 8F850 0018F750 2000BF7B */  lq         $31, 0x20($sp)
/* 8F854 0018F754 1000B17B */  lq         $17, 0x10($sp)
/* 8F858 0018F758 0000B07B */  lq         $16, 0x0($sp)
/* 8F85C 0018F75C 3000BD27 */  addiu      $sp, $sp, 0x30
/* 8F860 0018F760 0800E003 */  jr         $31
/* 8F864 0018F764 00000000 */   nop
/* 8F868 0018F768 00000000 */  nop
/* 8F86C 0018F76C 00000000 */  nop
