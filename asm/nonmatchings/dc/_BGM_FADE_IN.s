.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _BGM_FADE_IN__FP12RS_STACKDATAi
/* 95F90 00195E90 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 95F94 00195E94 5000BF7F */  sq         $31, 0x50($sp)
/* 95F98 00195E98 4000B47F */  sq         $20, 0x40($sp)
/* 95F9C 00195E9C 3000B37F */  sq         $19, 0x30($sp)
/* 95FA0 00195EA0 2000B27F */  sq         $18, 0x20($sp)
/* 95FA4 00195EA4 1000B17F */  sq         $17, 0x10($sp)
/* 95FA8 00195EA8 0000B07F */  sq         $16, 0x0($sp)
/* 95FAC 00195EAC 289EA070 */  paddub     $19, $5, $0
/* 95FB0 00195EB0 08009424 */  addiu      $20, $4, 0x8
/* 95FB4 00195EB4 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 95FB8 00195EB8 00000000 */   nop
/* 95FBC 00195EBC 28864070 */  paddub     $16, $2, $0
/* 95FC0 00195EC0 FFFF1124 */  addiu      $17, $0, -0x1
/* 95FC4 00195EC4 28960070 */  paddub     $18, $0, $0
/* 95FC8 00195EC8 0200612A */  slti       $at, $19, 0x2
/* 95FCC 00195ECC 06002014 */  bnez       $at, .L00195EE8
/* 95FD0 00195ED0 00000000 */   nop
/* 95FD4 00195ED4 28268072 */  paddub     $4, $20, $0
/* 95FD8 00195ED8 08009424 */  addiu      $20, $4, 0x8
/* 95FDC 00195EDC D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 95FE0 00195EE0 00000000 */   nop
/* 95FE4 00195EE4 288E4070 */  paddub     $17, $2, $0
.L00195EE8:
/* 95FE8 00195EE8 0300612A */  slti       $at, $19, 0x3
/* 95FEC 00195EEC 05002014 */  bnez       $at, .L00195F04
/* 95FF0 00195EF0 00000000 */   nop
/* 95FF4 00195EF4 28268072 */  paddub     $4, $20, $0
/* 95FF8 00195EF8 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 95FFC 00195EFC 00000000 */   nop
/* 96000 00195F00 28964070 */  paddub     $18, $2, $0
.L00195F04:
/* 96004 00195F04 28260072 */  paddub     $4, $16, $0
/* 96008 00195F08 282E2072 */  paddub     $5, $17, $0
/* 9600C 00195F0C 28364072 */  paddub     $6, $18, $0
/* 96010 00195F10 9067050C */  jal        SndBgmFadeIn__Fiii
/* 96014 00195F14 00000000 */   nop
/* 96018 00195F18 01000224 */  addiu      $2, $0, 0x1
/* 9601C 00195F1C 5000BF7B */  lq         $31, 0x50($sp)
/* 96020 00195F20 4000B47B */  lq         $20, 0x40($sp)
/* 96024 00195F24 3000B37B */  lq         $19, 0x30($sp)
/* 96028 00195F28 2000B27B */  lq         $18, 0x20($sp)
/* 9602C 00195F2C 1000B17B */  lq         $17, 0x10($sp)
/* 96030 00195F30 0000B07B */  lq         $16, 0x0($sp)
/* 96034 00195F34 6000BD27 */  addiu      $sp, $sp, 0x60
/* 96038 00195F38 0800E003 */  jr         $31
/* 9603C 00195F3C 00000000 */   nop
