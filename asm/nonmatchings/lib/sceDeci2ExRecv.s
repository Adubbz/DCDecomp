.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceDeci2ExRecv
/* 15570 00115470 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 15574 00115474 2D10A000 */  daddu      $2, $5, $0
/* 15578 00115478 FFFFC630 */  andi       $6, $6, 0xFFFF
/* 1557C 0011547C 0000A4AF */  sw         $4, 0x0($sp)
/* 15580 00115480 1000BFFF */  sd         $31, 0x10($sp)
/* 15584 00115484 2D28A003 */  daddu      $5, $sp, $0
/* 15588 00115488 0400A2AF */  sw         $2, 0x4($sp)
/* 1558C 0011548C FBFF0424 */  addiu      $4, $0, -0x5
/* 15590 00115490 D451040C */  jal        Deci2Call
/* 15594 00115494 0800A6AF */   sw        $6, 0x8($sp)
/* 15598 00115498 1000BFDF */  ld         $31, 0x10($sp)
/* 1559C 0011549C 0800E003 */  jr         $31
/* 155A0 001154A0 2000BD27 */   addiu     $sp, $sp, 0x20
/* 155A4 001154A4 00000000 */  nop
