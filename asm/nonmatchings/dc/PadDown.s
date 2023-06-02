.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PadDown__Fi
/* 69C30 00169B30 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 69C34 00169B34 0000BF7F */  sq         $31, 0x0($sp)
/* 69C38 00169B38 78A6050C */  jal        keylock__Fv
/* 69C3C 00169B3C 00000000 */   nop
/* 69C40 00169B40 04004010 */  beqz       $2, .L00169B54
/* 69C44 00169B44 00000000 */   nop
/* 69C48 00169B48 28160070 */  paddub     $2, $0, $0
/* 69C4C 00169B4C 04000010 */  b          .L00169B60
/* 69C50 00169B50 00000000 */   nop
.L00169B54:
/* 69C54 00169B54 01000524 */  addiu      $5, $0, 0x1
/* 69C58 00169B58 64A6050C */  jal        EdPadDown__Fii
/* 69C5C 00169B5C 00000000 */   nop
.L00169B60:
/* 69C60 00169B60 0000BF7B */  lq         $31, 0x0($sp)
/* 69C64 00169B64 1000BD27 */  addiu      $sp, $sp, 0x10
/* 69C68 00169B68 0800E003 */  jr         $31
/* 69C6C 00169B6C 00000000 */   nop
