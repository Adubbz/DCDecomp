.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceDeci2Close
/* 154F0 001153F0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 154F4 001153F4 0000A4AF */  sw         $4, 0x0($sp)
/* 154F8 001153F8 2D28A003 */  daddu      $5, $sp, $0
/* 154FC 001153FC 1000BFFF */  sd         $31, 0x10($sp)
/* 15500 00115400 D451040C */  jal        Deci2Call
/* 15504 00115404 02000424 */   addiu     $4, $0, 0x2
/* 15508 00115408 1000BFDF */  ld         $31, 0x10($sp)
/* 1550C 0011540C 0800E003 */  jr         $31
/* 15510 00115410 2000BD27 */   addiu     $sp, $sp, 0x20
/* 15514 00115414 00000000 */  nop
