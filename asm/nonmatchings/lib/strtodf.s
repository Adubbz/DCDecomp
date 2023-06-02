.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel strtodf
/* 6B60 00106A60 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 6B64 00106A64 0000BFFF */  sd         $31, 0x0($sp)
/* 6B68 00106A68 8C1A040C */  jal        strtod
/* 6B6C 00106A6C 00000000 */   nop
/* 6B70 00106A70 9241040C */  jal        dptofp
/* 6B74 00106A74 2D204000 */   daddu     $4, $2, $0
/* 6B78 00106A78 0000BFDF */  ld         $31, 0x0($sp)
/* 6B7C 00106A7C 0800E003 */  jr         $31
/* 6B80 00106A80 1000BD27 */   addiu     $sp, $sp, 0x10
/* 6B84 00106A84 00000000 */  nop
