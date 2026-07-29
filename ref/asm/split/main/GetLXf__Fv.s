.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetLXf__Fv
/* 069B70 00169A70 F0FFBD27 */  addiu       $29, $29, -0x10
/* 069B74 00169A74 0000BF7F */  sq          $31, 0x0($29)
/* 069B78 00169A78 78A6050C */  jal         keylock__Fv
/* 069B7C 00169A7C 00000000 */   nop
/* 069B80 00169A80 04004010 */  beqz        $2, .L00169A94
/* 069B84 00169A84 00000000 */   nop
/* 069B88 00169A88 00008044 */  mtc1        $0, $f0
/* 069B8C 00169A8C 04000010 */  b           .L00169AA0
/* 069B90 00169A90 00000000 */   nop
.L00169A94:
/* 069B94 00169A94 01000424 */  addiu       $4, $0, 0x1
/* 069B98 00169A98 28A6050C */  jal         EdGetLXf__Fi
/* 069B9C 00169A9C 00000000 */   nop
.L00169AA0:
/* 069BA0 00169AA0 0000BF7B */  lq          $31, 0x0($29)
/* 069BA4 00169AA4 1000BD27 */  addiu       $29, $29, 0x10
/* 069BA8 00169AA8 0800E003 */  jr          $31
/* 069BAC 00169AAC 00000000 */   nop
