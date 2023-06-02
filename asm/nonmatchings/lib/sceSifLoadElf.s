.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceSifLoadElf
/* 192C0 001191C0 2D30A000 */  daddu      $6, $5, $0
/* 192C4 001191C4 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 192C8 001191C8 2A00053C */  lui        $5, %hi(D_00298078)
/* 192CC 001191CC 0000BFFF */  sd         $31, 0x0($sp)
/* 192D0 001191D0 7880A524 */  addiu      $5, $5, %lo(D_00298078)
/* 192D4 001191D4 2664040C */  jal        _sceSifLoadElfPart
/* 192D8 001191D8 01000724 */   addiu     $7, $0, 0x1
/* 192DC 001191DC 0000BFDF */  ld         $31, 0x0($sp)
/* 192E0 001191E0 0800E003 */  jr         $31
/* 192E4 001191E4 1000BD27 */   addiu     $sp, $sp, 0x10
