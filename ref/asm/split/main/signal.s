.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel signal
/* 004FF0 00104EF0 2D108000 */  daddu       $2, $4, $0
/* 004FF4 00104EF4 2500033C */  lui         $3, %hi(_impure_ptr)
/* 004FF8 00104EF8 F0FFBD27 */  addiu       $29, $29, -0x10
/* 004FFC 00104EFC 2D30A000 */  daddu       $6, $5, $0
/* 005000 00104F00 ECFD648C */  lw          $4, %lo(_impure_ptr)($3)
/* 005004 00104F04 0000BFFF */  sd          $31, 0x0($29)
/* 005008 00104F08 2413040C */  jal         _signal_r
/* 00500C 00104F0C 2D284000 */   daddu      $5, $2, $0
/* 005010 00104F10 0000BFDF */  ld          $31, 0x0($29)
/* 005014 00104F14 0800E003 */  jr          $31
/* 005018 00104F18 1000BD27 */   addiu      $29, $29, 0x10
/* 00501C 00104F1C 00000000 */  nop
