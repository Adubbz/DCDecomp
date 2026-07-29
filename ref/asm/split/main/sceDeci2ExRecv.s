.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceDeci2ExRecv
/* 015570 00115470 E0FFBD27 */  addiu       $29, $29, -0x20
/* 015574 00115474 2D10A000 */  daddu       $2, $5, $0
/* 015578 00115478 FFFFC630 */  andi        $6, $6, 0xFFFF
/* 01557C 0011547C 0000A4AF */  sw          $4, 0x0($29)
/* 015580 00115480 1000BFFF */  sd          $31, 0x10($29)
/* 015584 00115484 2D28A003 */  daddu       $5, $29, $0
/* 015588 00115488 0400A2AF */  sw          $2, 0x4($29)
/* 01558C 0011548C FBFF0424 */  addiu       $4, $0, -0x5
/* 015590 00115490 D451040C */  jal         Deci2Call
/* 015594 00115494 0800A6AF */   sw         $6, 0x8($29)
/* 015598 00115498 1000BFDF */  ld          $31, 0x10($29)
/* 01559C 0011549C 0800E003 */  jr          $31
/* 0155A0 001154A0 2000BD27 */   addiu      $29, $29, 0x20
/* 0155A4 001154A4 00000000 */  nop
