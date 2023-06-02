.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceDeci2Poll
/* 15548 00115448 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 1554C 0011544C 0000A4AF */  sw         $4, 0x0($sp)
/* 15550 00115450 2D28A003 */  daddu      $5, $sp, $0
/* 15554 00115454 1000BFFF */  sd         $31, 0x10($sp)
/* 15558 00115458 D451040C */  jal        Deci2Call
/* 1555C 0011545C 04000424 */   addiu     $4, $0, 0x4
/* 15560 00115460 1000BFDF */  ld         $31, 0x10($sp)
/* 15564 00115464 0800E003 */  jr         $31
/* 15568 00115468 2000BD27 */   addiu     $sp, $sp, 0x20
/* 1556C 0011546C 00000000 */  nop
