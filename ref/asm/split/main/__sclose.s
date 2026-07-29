.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __sclose
/* 005318 00105218 F0FFBD27 */  addiu       $29, $29, -0x10
/* 00531C 0010521C 0000BFFF */  sd          $31, 0x0($29)
/* 005320 00105220 0E008584 */  lh          $5, 0xE($4)
/* 005324 00105224 C800040C */  jal         _close_r
/* 005328 00105228 5400848C */   lw         $4, 0x54($4)
/* 00532C 0010522C 0000BFDF */  ld          $31, 0x0($29)
/* 005330 00105230 0800E003 */  jr          $31
/* 005334 00105234 1000BD27 */   addiu      $29, $29, 0x10
