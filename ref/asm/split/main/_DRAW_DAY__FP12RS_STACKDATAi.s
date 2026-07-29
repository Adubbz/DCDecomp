.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _DRAW_DAY__FP12RS_STACKDATAi
/* 094070 00193F70 F0FFBD27 */  addiu       $29, $29, -0x10
/* 094074 00193F74 0000BF7F */  sq          $31, 0x0($29)
/* 094078 00193F78 04F4050C */  jal         EdStartDrawDay__Fv
/* 09407C 00193F7C 00000000 */   nop
/* 094080 00193F80 01000224 */  addiu       $2, $0, 0x1
/* 094084 00193F84 0000BF7B */  lq          $31, 0x0($29)
/* 094088 00193F88 1000BD27 */  addiu       $29, $29, 0x10
/* 09408C 00193F8C 0800E003 */  jr          $31
/* 094090 00193F90 00000000 */   nop
/* 094094 00193F94 00000000 */  nop
/* 094098 00193F98 00000000 */  nop
/* 09409C 00193F9C 00000000 */  nop
