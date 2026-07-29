.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _EB_DEBUG__FP12RS_STACKDATAi
/* 096980 00196880 F0FFBD27 */  addiu       $29, $29, -0x10
/* 096984 00196884 0000BF7F */  sq          $31, 0x0($29)
/* 096988 00196888 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 09698C 0019688C 00000000 */   nop
/* 096990 00196890 28264070 */  paddub      $4, $2, $0
/* 096994 00196894 08A1050C */  jal         EBDebug__Fi
/* 096998 00196898 00000000 */   nop
/* 09699C 0019689C 01000224 */  addiu       $2, $0, 0x1
/* 0969A0 001968A0 0000BF7B */  lq          $31, 0x0($29)
/* 0969A4 001968A4 1000BD27 */  addiu       $29, $29, 0x10
/* 0969A8 001968A8 0800E003 */  jr          $31
/* 0969AC 001968AC 00000000 */   nop
