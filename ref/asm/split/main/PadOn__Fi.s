.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel PadOn__Fi
/* 069BF0 00169AF0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 069BF4 00169AF4 0000BF7F */  sq          $31, 0x0($29)
/* 069BF8 00169AF8 78A6050C */  jal         keylock__Fv
/* 069BFC 00169AFC 00000000 */   nop
/* 069C00 00169B00 04004010 */  beqz        $2, .L00169B14
/* 069C04 00169B04 00000000 */   nop
/* 069C08 00169B08 28160070 */  paddub      $2, $0, $0
/* 069C0C 00169B0C 04000010 */  b           .L00169B20
/* 069C10 00169B10 00000000 */   nop
.L00169B14:
/* 069C14 00169B14 01000524 */  addiu       $5, $0, 0x1
/* 069C18 00169B18 50A6050C */  jal         EdPadOn__Fii
/* 069C1C 00169B1C 00000000 */   nop
.L00169B20:
/* 069C20 00169B20 0000BF7B */  lq          $31, 0x0($29)
/* 069C24 00169B24 1000BD27 */  addiu       $29, $29, 0x10
/* 069C28 00169B28 0800E003 */  jr          $31
/* 069C2C 00169B2C 00000000 */   nop
