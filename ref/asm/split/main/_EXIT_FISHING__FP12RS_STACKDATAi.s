.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _EXIT_FISHING__FP12RS_STACKDATAi
/* 096D80 00196C80 F0FFBD27 */  addiu       $29, $29, -0x10
/* 096D84 00196C84 0000BF7F */  sq          $31, 0x0($29)
/* 096D88 00196C88 3CA4060C */  jal         FishingExit__Fv
/* 096D8C 00196C8C 00000000 */   nop
/* 096D90 00196C90 01000224 */  addiu       $2, $0, 0x1
/* 096D94 00196C94 0000BF7B */  lq          $31, 0x0($29)
/* 096D98 00196C98 1000BD27 */  addiu       $29, $29, 0x10
/* 096D9C 00196C9C 0800E003 */  jr          $31
/* 096DA0 00196CA0 00000000 */   nop
/* 096DA4 00196CA4 00000000 */  nop
/* 096DA8 00196CA8 00000000 */  nop
/* 096DAC 00196CAC 00000000 */  nop
