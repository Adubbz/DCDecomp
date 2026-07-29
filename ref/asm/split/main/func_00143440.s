.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel func_00143440
/* 043540 00143440 80BF033C */  lui         $3, (0xBF800000 >> 16)
/* 043544 00143444 000083AC */  sw          $3, 0x0($4)
/* 043548 00143448 100080AC */  sw          $0, 0x10($4)
/* 04354C 0014344C 03000324 */  addiu       $3, $0, 0x3
/* 043550 00143450 140083AC */  sw          $3, 0x14($4)
/* 043554 00143454 0800E003 */  jr          $31
/* 043558 00143458 00000000 */   nop
/* 04355C 0014345C 00000000 */  nop
