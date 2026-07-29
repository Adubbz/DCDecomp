.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceDeci2Open
/* 0154A8 001153A8 2A00023C */  lui         $2, %hi(userarea)
/* 0154AC 001153AC E0FFBD27 */  addiu       $29, $29, -0x20
/* 0154B0 001153B0 0020033C */  lui         $3, (0x20000000 >> 16)
/* 0154B4 001153B4 B0534224 */  addiu       $2, $2, %lo(userarea)
/* 0154B8 001153B8 FFFF8430 */  andi        $4, $4, 0xFFFF
/* 0154BC 001153BC 25104300 */  or          $2, $2, $3
/* 0154C0 001153C0 0400A5AF */  sw          $5, 0x4($29)
/* 0154C4 001153C4 0000A4AF */  sw          $4, 0x0($29)
/* 0154C8 001153C8 2D28A003 */  daddu       $5, $29, $0
/* 0154CC 001153CC 1000BFFF */  sd          $31, 0x10($29)
/* 0154D0 001153D0 01000424 */  addiu       $4, $0, 0x1
/* 0154D4 001153D4 0800A6AF */  sw          $6, 0x8($29)
/* 0154D8 001153D8 D451040C */  jal         Deci2Call
/* 0154DC 001153DC 0C00A2AF */   sw         $2, 0xC($29)
/* 0154E0 001153E0 1000BFDF */  ld          $31, 0x10($29)
/* 0154E4 001153E4 0800E003 */  jr          $31
/* 0154E8 001153E8 2000BD27 */   addiu      $29, $29, 0x20
/* 0154EC 001153EC 00000000 */  nop
