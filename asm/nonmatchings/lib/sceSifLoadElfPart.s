.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceSifLoadElfPart
/* 192A0 001191A0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 192A4 001191A4 0000BFFF */  sd         $31, 0x0($sp)
/* 192A8 001191A8 2664040C */  jal        _sceSifLoadElfPart
/* 192AC 001191AC 01000724 */   addiu     $7, $0, 0x1
/* 192B0 001191B0 0000BFDF */  ld         $31, 0x0($sp)
/* 192B4 001191B4 0800E003 */  jr         $31
/* 192B8 001191B8 1000BD27 */   addiu     $sp, $sp, 0x10
/* 192BC 001191BC 00000000 */  nop
