.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel strtodf
/* 006B60 00106A60 F0FFBD27 */  addiu       $29, $29, -0x10
/* 006B64 00106A64 0000BFFF */  sd          $31, 0x0($29)
/* 006B68 00106A68 8C1A040C */  jal         strtod
/* 006B6C 00106A6C 00000000 */   nop
/* 006B70 00106A70 9241040C */  jal         dptofp
/* 006B74 00106A74 2D204000 */   daddu      $4, $2, $0
/* 006B78 00106A78 0000BFDF */  ld          $31, 0x0($29)
/* 006B7C 00106A7C 0800E003 */  jr          $31
/* 006B80 00106A80 1000BD27 */   addiu      $29, $29, 0x10
/* 006B84 00106A84 00000000 */  nop
