.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceSifLoadElfPart
/* 0192A0 001191A0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0192A4 001191A4 0000BFFF */  sd          $31, 0x0($29)
/* 0192A8 001191A8 2664040C */  jal         _sceSifLoadElfPart
/* 0192AC 001191AC 01000724 */   addiu      $7, $0, 0x1
/* 0192B0 001191B0 0000BFDF */  ld          $31, 0x0($29)
/* 0192B4 001191B4 0800E003 */  jr          $31
/* 0192B8 001191B8 1000BD27 */   addiu      $29, $29, 0x10
/* 0192BC 001191BC 00000000 */  nop
