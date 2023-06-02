.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __sclose
/* 5318 00105218 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 531C 0010521C 0000BFFF */  sd         $31, 0x0($sp)
/* 5320 00105220 0E008584 */  lh         $5, 0xE($4)
/* 5324 00105224 C800040C */  jal        _close_r
/* 5328 00105228 5400848C */   lw        $4, 0x54($4)
/* 532C 0010522C 0000BFDF */  ld         $31, 0x0($sp)
/* 5330 00105230 0800E003 */  jr         $31
/* 5334 00105234 1000BD27 */   addiu     $sp, $sp, 0x10
