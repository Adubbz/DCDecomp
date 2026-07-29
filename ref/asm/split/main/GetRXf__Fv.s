.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetRXf__Fv
/* 069AF0 001699F0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 069AF4 001699F4 0000BF7F */  sq          $31, 0x0($29)
/* 069AF8 001699F8 78A6050C */  jal         keylock__Fv
/* 069AFC 001699FC 00000000 */   nop
/* 069B00 00169A00 04004010 */  beqz        $2, .L00169A14
/* 069B04 00169A04 00000000 */   nop
/* 069B08 00169A08 00008044 */  mtc1        $0, $f0
/* 069B0C 00169A0C 04000010 */  b           .L00169A20
/* 069B10 00169A10 00000000 */   nop
.L00169A14:
/* 069B14 00169A14 01000424 */  addiu       $4, $0, 0x1
/* 069B18 00169A18 00A6050C */  jal         EdGetRXf__Fi
/* 069B1C 00169A1C 00000000 */   nop
.L00169A20:
/* 069B20 00169A20 0000BF7B */  lq          $31, 0x0($29)
/* 069B24 00169A24 1000BD27 */  addiu       $29, $29, 0x10
/* 069B28 00169A28 0800E003 */  jr          $31
/* 069B2C 00169A2C 00000000 */   nop
