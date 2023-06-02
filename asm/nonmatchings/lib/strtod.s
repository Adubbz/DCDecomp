.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel strtod
/* 6B30 00106A30 2D108000 */  daddu      $2, $4, $0
/* 6B34 00106A34 2500033C */  lui        $3, (0x250000 >> 16)
/* 6B38 00106A38 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 6B3C 00106A3C 2D30A000 */  daddu      $6, $5, $0
/* 6B40 00106A40 ECFD648C */  lw         $4, -0x214($3)
/* 6B44 00106A44 0000BFFF */  sd         $31, 0x0($sp)
/* 6B48 00106A48 CC16040C */  jal        _strtod_r
/* 6B4C 00106A4C 2D284000 */   daddu     $5, $2, $0
/* 6B50 00106A50 0000BFDF */  ld         $31, 0x0($sp)
/* 6B54 00106A54 0800E003 */  jr         $31
/* 6B58 00106A58 1000BD27 */   addiu     $sp, $sp, 0x10
/* 6B5C 00106A5C 00000000 */  nop
