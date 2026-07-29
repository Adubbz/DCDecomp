.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel raise
/* 004FC8 00104EC8 2D288000 */  daddu       $5, $4, $0
/* 004FCC 00104ECC 2500023C */  lui         $2, %hi(_impure_ptr)
/* 004FD0 00104ED0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 004FD4 00104ED4 ECFD448C */  lw          $4, %lo(_impure_ptr)($2)
/* 004FD8 00104ED8 0000BFFF */  sd          $31, 0x0($29)
/* 004FDC 00104EDC 4813040C */  jal         _raise_r
/* 004FE0 00104EE0 00000000 */   nop
/* 004FE4 00104EE4 0000BFDF */  ld          $31, 0x0($29)
/* 004FE8 00104EE8 0800E003 */  jr          $31
/* 004FEC 00104EEC 1000BD27 */   addiu      $29, $29, 0x10
