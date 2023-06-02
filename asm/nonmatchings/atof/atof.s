.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel atof
/* 318 00100218 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 31C 0010021C 0000BFFF */  sd         $31, 0x0($sp)
/* 320 00100220 8C1A040C */  jal        strtod
/* 324 00100224 2D280000 */   daddu     $5, $0, $0
/* 328 00100228 0000BFDF */  ld         $31, 0x0($sp)
/* 32C 0010022C 0800E003 */  jr         $31
/* 330 00100230 1000BD27 */   addiu     $sp, $sp, 0x10
/* 334 00100234 00000000 */  nop
