.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceDeci2ExLock
/* 015610 00115510 E0FFBD27 */  addiu       $29, $29, -0x20
/* 015614 00115514 0000A4AF */  sw          $4, 0x0($29)
/* 015618 00115518 2D28A003 */  daddu       $5, $29, $0
/* 01561C 0011551C 1000BFFF */  sd          $31, 0x10($29)
/* 015620 00115520 D451040C */  jal         Deci2Call
/* 015624 00115524 F8FF0424 */   addiu      $4, $0, -0x8
/* 015628 00115528 1000BFDF */  ld          $31, 0x10($29)
/* 01562C 0011552C 0800E003 */  jr          $31
/* 015630 00115530 2000BD27 */   addiu      $29, $29, 0x20
/* 015634 00115534 00000000 */  nop
