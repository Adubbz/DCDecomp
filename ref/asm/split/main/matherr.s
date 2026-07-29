.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel matherr
/* 01D3E8 0011D2E8 F0FFBD27 */  addiu       $29, $29, -0x10
/* 01D3EC 0011D2EC 0000BFFF */  sd          $31, 0x0($29)
/* 01D3F0 0011D2F0 080084DC */  ld          $4, 0x8($4)
/* 01D3F4 0011D2F4 E840040C */  jal         dpcmp
/* 01D3F8 0011D2F8 2D288000 */   daddu      $5, $4, $0
/* 01D3FC 0011D2FC 0000BFDF */  ld          $31, 0x0($29)
/* 01D400 0011D300 2D100000 */  daddu       $2, $0, $0
/* 01D404 0011D304 0800E003 */  jr          $31
/* 01D408 0011D308 1000BD27 */   addiu      $29, $29, 0x10
/* 01D40C 0011D30C 00000000 */  nop
