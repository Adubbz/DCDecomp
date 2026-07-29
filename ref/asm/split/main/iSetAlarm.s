.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel iSetAlarm
/* 015198 00115098 F0FFBD27 */  addiu       $29, $29, -0x10
/* 01519C 0011509C 0000BFFF */  sd          $31, 0x0($29)
/* 0151A0 001150A0 4050040C */  jal         _iSetAlarm
/* 0151A4 001150A4 FFFF8430 */   andi       $4, $4, 0xFFFF
/* 0151A8 001150A8 0F000000 */  sync
/* 0151AC 001150AC 0000BFDF */  ld          $31, 0x0($29)
/* 0151B0 001150B0 0800E003 */  jr          $31
/* 0151B4 001150B4 1000BD27 */   addiu      $29, $29, 0x10
