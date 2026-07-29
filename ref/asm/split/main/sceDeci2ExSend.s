.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceDeci2ExSend
/* 0155A8 001154A8 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0155AC 001154AC 2D10A000 */  daddu       $2, $5, $0
/* 0155B0 001154B0 FFFFC630 */  andi        $6, $6, 0xFFFF
/* 0155B4 001154B4 0000A4AF */  sw          $4, 0x0($29)
/* 0155B8 001154B8 1000BFFF */  sd          $31, 0x10($29)
/* 0155BC 001154BC 2D28A003 */  daddu       $5, $29, $0
/* 0155C0 001154C0 0400A2AF */  sw          $2, 0x4($29)
/* 0155C4 001154C4 FAFF0424 */  addiu       $4, $0, -0x6
/* 0155C8 001154C8 D451040C */  jal         Deci2Call
/* 0155CC 001154CC 0800A6AF */   sw         $6, 0x8($29)
/* 0155D0 001154D0 1000BFDF */  ld          $31, 0x10($29)
/* 0155D4 001154D4 0800E003 */  jr          $31
/* 0155D8 001154D8 2000BD27 */   addiu      $29, $29, 0x20
/* 0155DC 001154DC 00000000 */  nop
