.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _STOP_SPECIAL_SE__FP12RS_STACKDATAi
/* 096400 00196300 F0FFBD27 */  addiu       $29, $29, -0x10
/* 096404 00196304 0000BF7F */  sq          $31, 0x0($29)
/* 096408 00196308 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 09640C 0019630C 00000000 */   nop
/* 096410 00196310 28264070 */  paddub      $4, $2, $0
/* 096414 00196314 406E050C */  jal         SndSPSeStop__Fi
/* 096418 00196318 00000000 */   nop
/* 09641C 0019631C 01000224 */  addiu       $2, $0, 0x1
/* 096420 00196320 0000BF7B */  lq          $31, 0x0($29)
/* 096424 00196324 1000BD27 */  addiu       $29, $29, 0x10
/* 096428 00196328 0800E003 */  jr          $31
/* 09642C 0019632C 00000000 */   nop
