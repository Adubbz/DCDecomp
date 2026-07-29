.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel atof
/* 000318 00100218 F0FFBD27 */  addiu       $29, $29, -0x10
/* 00031C 0010021C 0000BFFF */  sd          $31, 0x0($29)
/* 000320 00100220 8C1A040C */  jal         strtod
/* 000324 00100224 2D280000 */   daddu      $5, $0, $0
/* 000328 00100228 0000BFDF */  ld          $31, 0x0($29)
/* 00032C 0010022C 0800E003 */  jr          $31
/* 000330 00100230 1000BD27 */   addiu      $29, $29, 0x10
/* 000334 00100234 00000000 */  nop
