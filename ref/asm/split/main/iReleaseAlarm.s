.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel iReleaseAlarm
/* 0151B8 001150B8 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0151BC 001150BC 0000BFFF */  sd          $31, 0x0($29)
/* 0151C0 001150C0 4450040C */  jal         _iReleaseAlarm
/* 0151C4 001150C4 00000000 */   nop
/* 0151C8 001150C8 0F000000 */  sync
/* 0151CC 001150CC 0000BFDF */  ld          $31, 0x0($29)
/* 0151D0 001150D0 0800E003 */  jr          $31
/* 0151D4 001150D4 1000BD27 */   addiu      $29, $29, 0x10
