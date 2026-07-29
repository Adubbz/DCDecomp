.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel kputs
/* 015660 00115560 E0FFBD27 */  addiu       $29, $29, -0x20
/* 015664 00115564 0000A4AF */  sw          $4, 0x0($29)
/* 015668 00115568 2D28A003 */  daddu       $5, $29, $0
/* 01566C 0011556C 1000BFFF */  sd          $31, 0x10($29)
/* 015670 00115570 D451040C */  jal         Deci2Call
/* 015674 00115574 10000424 */   addiu      $4, $0, 0x10
/* 015678 00115578 1000BFDF */  ld          $31, 0x10($29)
/* 01567C 0011557C 0800E003 */  jr          $31
/* 015680 00115580 2000BD27 */   addiu      $29, $29, 0x20
/* 015684 00115584 00000000 */  nop
