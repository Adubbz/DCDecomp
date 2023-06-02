.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceDeci2ReqSend
/* 15518 00115418 002E0500 */  sll        $5, $5, 24
/* 1551C 0011541C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 15520 00115420 032E0500 */  sra        $5, $5, 24
/* 15524 00115424 0000A4AF */  sw         $4, 0x0($sp)
/* 15528 00115428 0400A5AF */  sw         $5, 0x4($sp)
/* 1552C 0011542C 03000424 */  addiu      $4, $0, 0x3
/* 15530 00115430 1000BFFF */  sd         $31, 0x10($sp)
/* 15534 00115434 D451040C */  jal        Deci2Call
/* 15538 00115438 2D28A003 */   daddu     $5, $sp, $0
/* 1553C 0011543C 1000BFDF */  ld         $31, 0x10($sp)
/* 15540 00115440 0800E003 */  jr         $31
/* 15544 00115444 2000BD27 */   addiu     $sp, $sp, 0x20
