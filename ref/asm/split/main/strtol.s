.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel strtol
/* 006E88 00106D88 2D408000 */  daddu       $8, $4, $0
/* 006E8C 00106D8C 2500023C */  lui         $2, %hi(_impure_ptr)
/* 006E90 00106D90 2D18A000 */  daddu       $3, $5, $0
/* 006E94 00106D94 F0FFBD27 */  addiu       $29, $29, -0x10
/* 006E98 00106D98 2D38C000 */  daddu       $7, $6, $0
/* 006E9C 00106D9C ECFD448C */  lw          $4, %lo(_impure_ptr)($2)
/* 006EA0 00106DA0 0000BFFF */  sd          $31, 0x0($29)
/* 006EA4 00106DA4 2D280001 */  daddu       $5, $8, $0
/* 006EA8 00106DA8 D41A040C */  jal         _strtol_r
/* 006EAC 00106DAC 2D306000 */   daddu      $6, $3, $0
/* 006EB0 00106DB0 0000BFDF */  ld          $31, 0x0($29)
/* 006EB4 00106DB4 0800E003 */  jr          $31
/* 006EB8 00106DB8 1000BD27 */   addiu      $29, $29, 0x10
/* 006EBC 00106DBC 00000000 */  nop
