.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel atoi
/* 000338 00100238 F0FFBD27 */  addiu       $29, $29, -0x10
/* 00033C 0010023C 2D280000 */  daddu       $5, $0, $0
/* 000340 00100240 0000BFFF */  sd          $31, 0x0($29)
/* 000344 00100244 621B040C */  jal         strtol
/* 000348 00100248 0A000624 */   addiu      $6, $0, 0xA
/* 00034C 0010024C 0000BFDF */  ld          $31, 0x0($29)
/* 000350 00100250 3C100200 */  dsll32      $2, $2, 0
/* 000354 00100254 3F100200 */  dsra32      $2, $2, 0
/* 000358 00100258 0800E003 */  jr          $31
/* 00035C 0010025C 1000BD27 */   addiu      $29, $29, 0x10
