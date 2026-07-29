.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceSifLoadModule
/* 019178 00119078 F0FFBD27 */  addiu       $29, $29, -0x10
/* 01917C 0011907C 0000BFFF */  sd          $31, 0x0($29)
/* 019180 00119080 9E63040C */  jal         _sceSifLoadModule
/* 019184 00119084 2D380000 */   daddu      $7, $0, $0
/* 019188 00119088 0000BFDF */  ld          $31, 0x0($29)
/* 01918C 0011908C 0800E003 */  jr          $31
/* 019190 00119090 1000BD27 */   addiu      $29, $29, 0x10
/* 019194 00119094 00000000 */  nop
