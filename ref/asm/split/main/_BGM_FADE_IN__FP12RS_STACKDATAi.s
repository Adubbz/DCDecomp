.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _BGM_FADE_IN__FP12RS_STACKDATAi
/* 095F90 00195E90 A0FFBD27 */  addiu       $29, $29, -0x60
/* 095F94 00195E94 5000BF7F */  sq          $31, 0x50($29)
/* 095F98 00195E98 4000B47F */  sq          $20, 0x40($29)
/* 095F9C 00195E9C 3000B37F */  sq          $19, 0x30($29)
/* 095FA0 00195EA0 2000B27F */  sq          $18, 0x20($29)
/* 095FA4 00195EA4 1000B17F */  sq          $17, 0x10($29)
/* 095FA8 00195EA8 0000B07F */  sq          $16, 0x0($29)
/* 095FAC 00195EAC 289EA070 */  paddub      $19, $5, $0
/* 095FB0 00195EB0 08009424 */  addiu       $20, $4, 0x8
/* 095FB4 00195EB4 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 095FB8 00195EB8 00000000 */   nop
/* 095FBC 00195EBC 28864070 */  paddub      $16, $2, $0
/* 095FC0 00195EC0 FFFF1124 */  addiu       $17, $0, -0x1
/* 095FC4 00195EC4 28960070 */  paddub      $18, $0, $0
/* 095FC8 00195EC8 0200612A */  slti        $1, $19, 0x2
/* 095FCC 00195ECC 06002014 */  bnez        $1, .L00195EE8
/* 095FD0 00195ED0 00000000 */   nop
/* 095FD4 00195ED4 28268072 */  paddub      $4, $20, $0
/* 095FD8 00195ED8 08009424 */  addiu       $20, $4, 0x8
/* 095FDC 00195EDC D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 095FE0 00195EE0 00000000 */   nop
/* 095FE4 00195EE4 288E4070 */  paddub      $17, $2, $0
.L00195EE8:
/* 095FE8 00195EE8 0300612A */  slti        $1, $19, 0x3
/* 095FEC 00195EEC 05002014 */  bnez        $1, .L00195F04
/* 095FF0 00195EF0 00000000 */   nop
/* 095FF4 00195EF4 28268072 */  paddub      $4, $20, $0
/* 095FF8 00195EF8 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 095FFC 00195EFC 00000000 */   nop
/* 096000 00195F00 28964070 */  paddub      $18, $2, $0
.L00195F04:
/* 096004 00195F04 28260072 */  paddub      $4, $16, $0
/* 096008 00195F08 282E2072 */  paddub      $5, $17, $0
/* 09600C 00195F0C 28364072 */  paddub      $6, $18, $0
/* 096010 00195F10 9067050C */  jal         SndBgmFadeIn__Fiii
/* 096014 00195F14 00000000 */   nop
/* 096018 00195F18 01000224 */  addiu       $2, $0, 0x1
/* 09601C 00195F1C 5000BF7B */  lq          $31, 0x50($29)
/* 096020 00195F20 4000B47B */  lq          $20, 0x40($29)
/* 096024 00195F24 3000B37B */  lq          $19, 0x30($29)
/* 096028 00195F28 2000B27B */  lq          $18, 0x20($29)
/* 09602C 00195F2C 1000B17B */  lq          $17, 0x10($29)
/* 096030 00195F30 0000B07B */  lq          $16, 0x0($29)
/* 096034 00195F34 6000BD27 */  addiu       $29, $29, 0x60
/* 096038 00195F38 0800E003 */  jr          $31
/* 09603C 00195F3C 00000000 */   nop
