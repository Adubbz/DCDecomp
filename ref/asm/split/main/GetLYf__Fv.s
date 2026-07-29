.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetLYf__Fv
/* 069BB0 00169AB0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 069BB4 00169AB4 0000BF7F */  sq          $31, 0x0($29)
/* 069BB8 00169AB8 78A6050C */  jal         keylock__Fv
/* 069BBC 00169ABC 00000000 */   nop
/* 069BC0 00169AC0 04004010 */  beqz        $2, .L00169AD4
/* 069BC4 00169AC4 00000000 */   nop
/* 069BC8 00169AC8 00008044 */  mtc1        $0, $f0
/* 069BCC 00169ACC 04000010 */  b           .L00169AE0
/* 069BD0 00169AD0 00000000 */   nop
.L00169AD4:
/* 069BD4 00169AD4 01000424 */  addiu       $4, $0, 0x1
/* 069BD8 00169AD8 3CA6050C */  jal         EdGetLYf__Fi
/* 069BDC 00169ADC 00000000 */   nop
.L00169AE0:
/* 069BE0 00169AE0 0000BF7B */  lq          $31, 0x0($29)
/* 069BE4 00169AE4 1000BD27 */  addiu       $29, $29, 0x10
/* 069BE8 00169AE8 0800E003 */  jr          $31
/* 069BEC 00169AEC 00000000 */   nop
