.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceSifLoadElf
/* 0192C0 001191C0 2D30A000 */  daddu       $6, $5, $0
/* 0192C4 001191C4 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0192C8 001191C8 2A00053C */  lui         $5, %hi(RO_00298078)
/* 0192CC 001191CC 0000BFFF */  sd          $31, 0x0($29)
/* 0192D0 001191D0 7880A524 */  addiu       $5, $5, %lo(RO_00298078)
/* 0192D4 001191D4 2664040C */  jal         _sceSifLoadElfPart
/* 0192D8 001191D8 01000724 */   addiu      $7, $0, 0x1
/* 0192DC 001191DC 0000BFDF */  ld          $31, 0x0($29)
/* 0192E0 001191E0 0800E003 */  jr          $31
/* 0192E4 001191E4 1000BD27 */   addiu      $29, $29, 0x10
