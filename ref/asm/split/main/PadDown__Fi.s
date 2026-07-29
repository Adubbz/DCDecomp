.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel PadDown__Fi
/* 069C30 00169B30 F0FFBD27 */  addiu       $29, $29, -0x10
/* 069C34 00169B34 0000BF7F */  sq          $31, 0x0($29)
/* 069C38 00169B38 78A6050C */  jal         keylock__Fv
/* 069C3C 00169B3C 00000000 */   nop
/* 069C40 00169B40 04004010 */  beqz        $2, .L00169B54
/* 069C44 00169B44 00000000 */   nop
/* 069C48 00169B48 28160070 */  paddub      $2, $0, $0
/* 069C4C 00169B4C 04000010 */  b           .L00169B60
/* 069C50 00169B50 00000000 */   nop
.L00169B54:
/* 069C54 00169B54 01000524 */  addiu       $5, $0, 0x1
/* 069C58 00169B58 64A6050C */  jal         EdPadDown__Fii
/* 069C5C 00169B5C 00000000 */   nop
.L00169B60:
/* 069C60 00169B60 0000BF7B */  lq          $31, 0x0($29)
/* 069C64 00169B64 1000BD27 */  addiu       $29, $29, 0x10
/* 069C68 00169B68 0800E003 */  jr          $31
/* 069C6C 00169B6C 00000000 */   nop
