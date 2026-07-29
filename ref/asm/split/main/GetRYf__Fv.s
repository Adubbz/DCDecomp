.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetRYf__Fv
/* 069B30 00169A30 F0FFBD27 */  addiu       $29, $29, -0x10
/* 069B34 00169A34 0000BF7F */  sq          $31, 0x0($29)
/* 069B38 00169A38 78A6050C */  jal         keylock__Fv
/* 069B3C 00169A3C 00000000 */   nop
/* 069B40 00169A40 04004010 */  beqz        $2, .L00169A54
/* 069B44 00169A44 00000000 */   nop
/* 069B48 00169A48 00008044 */  mtc1        $0, $f0
/* 069B4C 00169A4C 04000010 */  b           .L00169A60
/* 069B50 00169A50 00000000 */   nop
.L00169A54:
/* 069B54 00169A54 01000424 */  addiu       $4, $0, 0x1
/* 069B58 00169A58 14A6050C */  jal         EdGetRYf__Fi
/* 069B5C 00169A5C 00000000 */   nop
.L00169A60:
/* 069B60 00169A60 0000BF7B */  lq          $31, 0x0($29)
/* 069B64 00169A64 1000BD27 */  addiu       $29, $29, 0x10
/* 069B68 00169A68 0800E003 */  jr          $31
/* 069B6C 00169A6C 00000000 */   nop
