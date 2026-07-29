.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceDeci2Poll
/* 015548 00115448 E0FFBD27 */  addiu       $29, $29, -0x20
/* 01554C 0011544C 0000A4AF */  sw          $4, 0x0($29)
/* 015550 00115450 2D28A003 */  daddu       $5, $29, $0
/* 015554 00115454 1000BFFF */  sd          $31, 0x10($29)
/* 015558 00115458 D451040C */  jal         Deci2Call
/* 01555C 0011545C 04000424 */   addiu      $4, $0, 0x4
/* 015560 00115460 1000BFDF */  ld          $31, 0x10($29)
/* 015564 00115464 0800E003 */  jr          $31
/* 015568 00115468 2000BD27 */   addiu      $29, $29, 0x20
/* 01556C 0011546C 00000000 */  nop
