.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceDeci2ExReqSend
/* 155E0 001154E0 002E0500 */  sll        $5, $5, 24
/* 155E4 001154E4 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 155E8 001154E8 032E0500 */  sra        $5, $5, 24
/* 155EC 001154EC 0000A4AF */  sw         $4, 0x0($sp)
/* 155F0 001154F0 0400A5AF */  sw         $5, 0x4($sp)
/* 155F4 001154F4 F9FF0424 */  addiu      $4, $0, -0x7
/* 155F8 001154F8 1000BFFF */  sd         $31, 0x10($sp)
/* 155FC 001154FC D451040C */  jal        Deci2Call
/* 15600 00115500 2D28A003 */   daddu     $5, $sp, $0
/* 15604 00115504 1000BFDF */  ld         $31, 0x10($sp)
/* 15608 00115508 0800E003 */  jr         $31
/* 1560C 0011550C 2000BD27 */   addiu     $sp, $sp, 0x20
