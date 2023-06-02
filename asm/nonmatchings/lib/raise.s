.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel raise
/* 4FC8 00104EC8 2D288000 */  daddu      $5, $4, $0
/* 4FCC 00104ECC 2500023C */  lui        $2, (0x250000 >> 16)
/* 4FD0 00104ED0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 4FD4 00104ED4 ECFD448C */  lw         $4, -0x214($2)
/* 4FD8 00104ED8 0000BFFF */  sd         $31, 0x0($sp)
/* 4FDC 00104EDC 4813040C */  jal        _raise_r
/* 4FE0 00104EE0 00000000 */   nop
/* 4FE4 00104EE4 0000BFDF */  ld         $31, 0x0($sp)
/* 4FE8 00104EE8 0800E003 */  jr         $31
/* 4FEC 00104EEC 1000BD27 */   addiu     $sp, $sp, 0x10
