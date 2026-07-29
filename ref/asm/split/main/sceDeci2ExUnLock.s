.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceDeci2ExUnLock
/* 015638 00115538 E0FFBD27 */  addiu       $29, $29, -0x20
/* 01563C 0011553C 0000A4AF */  sw          $4, 0x0($29)
/* 015640 00115540 2D28A003 */  daddu       $5, $29, $0
/* 015644 00115544 1000BFFF */  sd          $31, 0x10($29)
/* 015648 00115548 D451040C */  jal         Deci2Call
/* 01564C 0011554C F7FF0424 */   addiu      $4, $0, -0x9
/* 015650 00115550 1000BFDF */  ld          $31, 0x10($29)
/* 015654 00115554 0800E003 */  jr          $31
/* 015658 00115558 2000BD27 */   addiu      $29, $29, 0x20
/* 01565C 0011555C 00000000 */  nop
