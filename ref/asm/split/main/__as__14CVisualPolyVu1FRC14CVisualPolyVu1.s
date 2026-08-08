.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __as__14CVisualPolyVu1FRC14CVisualPolyVu1
/* 043460 00143360 E0FFBD27 */  addiu       $29, $29, -0x20
/* 043464 00143364 1000BF7F */  sq          $31, 0x10($29)
/* 043468 00143368 0000B07F */  sq          $16, 0x0($29)
/* 04346C 0014336C 28868070 */  paddub      $16, $4, $0
/* 043470 00143370 E40C050C */  jal         __as__10CVisualVu1FRC10CVisualVu1
/* 043474 00143374 00000000 */   nop
/* 043478 00143378 28160072 */  paddub      $2, $16, $0
/* 04347C 0014337C 1000BF7B */  lq          $31, 0x10($29)
/* 043480 00143380 0000B07B */  lq          $16, 0x0($29)
/* 043484 00143384 2000BD27 */  addiu       $29, $29, 0x20
/* 043488 00143388 0800E003 */  jr          $31
/* 04348C 0014338C 00000000 */   nop
