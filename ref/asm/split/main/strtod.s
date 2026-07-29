.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel strtod
/* 006B30 00106A30 2D108000 */  daddu       $2, $4, $0
/* 006B34 00106A34 2500033C */  lui         $3, %hi(_impure_ptr)
/* 006B38 00106A38 F0FFBD27 */  addiu       $29, $29, -0x10
/* 006B3C 00106A3C 2D30A000 */  daddu       $6, $5, $0
/* 006B40 00106A40 ECFD648C */  lw          $4, %lo(_impure_ptr)($3)
/* 006B44 00106A44 0000BFFF */  sd          $31, 0x0($29)
/* 006B48 00106A48 CC16040C */  jal         _strtod_r
/* 006B4C 00106A4C 2D284000 */   daddu      $5, $2, $0
/* 006B50 00106A50 0000BFDF */  ld          $31, 0x0($29)
/* 006B54 00106A54 0800E003 */  jr          $31
/* 006B58 00106A58 1000BD27 */   addiu      $29, $29, 0x10
/* 006B5C 00106A5C 00000000 */  nop
