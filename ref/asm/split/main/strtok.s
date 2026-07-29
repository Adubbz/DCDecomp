.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel strtok
/* 006B88 00106A88 2500023C */  lui         $2, %hi(_impure_ptr)
/* 006B8C 00106A8C F0FFBD27 */  addiu       $29, $29, -0x10
/* 006B90 00106A90 ECFD468C */  lw          $6, %lo(_impure_ptr)($2)
/* 006B94 00106A94 0000BFFF */  sd          $31, 0x0($29)
/* 006B98 00106A98 AC1A040C */  jal         strtok_r
/* 006B9C 00106A9C 5C00C624 */   addiu      $6, $6, 0x5C
/* 006BA0 00106AA0 0000BFDF */  ld          $31, 0x0($29)
/* 006BA4 00106AA4 0800E003 */  jr          $31
/* 006BA8 00106AA8 1000BD27 */   addiu      $29, $29, 0x10
/* 006BAC 00106AAC 00000000 */  nop
