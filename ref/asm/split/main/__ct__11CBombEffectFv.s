.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __ct__11CBombEffectFv
/* 043560 00143460 E0FFBD27 */  addiu       $29, $29, -0x20
/* 043564 00143464 1000BF7F */  sq          $31, 0x10($29)
/* 043568 00143468 0000B07F */  sq          $16, 0x0($29)
/* 04356C 0014346C 28868070 */  paddub      $16, $4, $0
/* 043570 00143470 240D050C */  jal         Initialize__11CBombEffectFv
/* 043574 00143474 00000000 */   nop
/* 043578 00143478 28160072 */  paddub      $2, $16, $0
/* 04357C 0014347C 1000BF7B */  lq          $31, 0x10($29)
/* 043580 00143480 0000B07B */  lq          $16, 0x0($29)
/* 043584 00143484 2000BD27 */  addiu       $29, $29, 0x20
/* 043588 00143488 0800E003 */  jr          $31
/* 04358C 0014348C 00000000 */   nop
