.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel setlocale
/* 0026E8 001025E8 2D108000 */  daddu       $2, $4, $0
/* 0026EC 001025EC 2500033C */  lui         $3, %hi(_impure_ptr)
/* 0026F0 001025F0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0026F4 001025F4 2D30A000 */  daddu       $6, $5, $0
/* 0026F8 001025F8 ECFD648C */  lw          $4, %lo(_impure_ptr)($3)
/* 0026FC 001025FC 0000BFFF */  sd          $31, 0x0($29)
/* 002700 00102600 5409040C */  jal         _setlocale_r
/* 002704 00102604 2D284000 */   daddu      $5, $2, $0
/* 002708 00102608 0000BFDF */  ld          $31, 0x0($29)
/* 00270C 0010260C 0800E003 */  jr          $31
/* 002710 00102610 1000BD27 */   addiu      $29, $29, 0x10
/* 002714 00102614 00000000 */  nop
