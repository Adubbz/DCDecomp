.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceDeci2ExUnLock
/* 15638 00115538 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 1563C 0011553C 0000A4AF */  sw         $4, 0x0($sp)
/* 15640 00115540 2D28A003 */  daddu      $5, $sp, $0
/* 15644 00115544 1000BFFF */  sd         $31, 0x10($sp)
/* 15648 00115548 D451040C */  jal        Deci2Call
/* 1564C 0011554C F7FF0424 */   addiu     $4, $0, -0x9
/* 15650 00115550 1000BFDF */  ld         $31, 0x10($sp)
/* 15654 00115554 0800E003 */  jr         $31
/* 15658 00115558 2000BD27 */   addiu     $sp, $sp, 0x20
/* 1565C 0011555C 00000000 */  nop
