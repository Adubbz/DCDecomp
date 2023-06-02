.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceDeci2ExLock
/* 15610 00115510 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 15614 00115514 0000A4AF */  sw         $4, 0x0($sp)
/* 15618 00115518 2D28A003 */  daddu      $5, $sp, $0
/* 1561C 0011551C 1000BFFF */  sd         $31, 0x10($sp)
/* 15620 00115520 D451040C */  jal        Deci2Call
/* 15624 00115524 F8FF0424 */   addiu     $4, $0, -0x8
/* 15628 00115528 1000BFDF */  ld         $31, 0x10($sp)
/* 1562C 0011552C 0800E003 */  jr         $31
/* 15630 00115530 2000BD27 */   addiu     $sp, $sp, 0x20
/* 15634 00115534 00000000 */  nop
