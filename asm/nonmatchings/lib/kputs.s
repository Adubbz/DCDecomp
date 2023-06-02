.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel kputs
/* 15660 00115560 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 15664 00115564 0000A4AF */  sw         $4, 0x0($sp)
/* 15668 00115568 2D28A003 */  daddu      $5, $sp, $0
/* 1566C 0011556C 1000BFFF */  sd         $31, 0x10($sp)
/* 15670 00115570 D451040C */  jal        Deci2Call
/* 15674 00115574 10000424 */   addiu     $4, $0, 0x10
/* 15678 00115578 1000BFDF */  ld         $31, 0x10($sp)
/* 1567C 0011557C 0800E003 */  jr         $31
/* 15680 00115580 2000BD27 */   addiu     $sp, $sp, 0x20
/* 15684 00115584 00000000 */  nop
