.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _EB_FINISH_SOUND__FP12RS_STACKDATAi
/* 0969B0 001968B0 D0FFBD27 */  addiu       $29, $29, -0x30
/* 0969B4 001968B4 2000BF7F */  sq          $31, 0x20($29)
/* 0969B8 001968B8 1000B17F */  sq          $17, 0x10($29)
/* 0969BC 001968BC 0000B07F */  sq          $16, 0x0($29)
/* 0969C0 001968C0 08009124 */  addiu       $17, $4, 0x8
/* 0969C4 001968C4 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 0969C8 001968C8 00000000 */   nop
/* 0969CC 001968CC 28864070 */  paddub      $16, $2, $0
/* 0969D0 001968D0 28262072 */  paddub      $4, $17, $0
/* 0969D4 001968D4 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 0969D8 001968D8 00000000 */   nop
/* 0969DC 001968DC 28260072 */  paddub      $4, $16, $0
/* 0969E0 001968E0 282E4070 */  paddub      $5, $2, $0
/* 0969E4 001968E4 7CA0050C */  jal         EBFinishSound__Fii
/* 0969E8 001968E8 00000000 */   nop
/* 0969EC 001968EC 01000224 */  addiu       $2, $0, 0x1
/* 0969F0 001968F0 2000BF7B */  lq          $31, 0x20($29)
/* 0969F4 001968F4 1000B17B */  lq          $17, 0x10($29)
/* 0969F8 001968F8 0000B07B */  lq          $16, 0x0($29)
/* 0969FC 001968FC 3000BD27 */  addiu       $29, $29, 0x30
/* 096A00 00196900 0800E003 */  jr          $31
/* 096A04 00196904 00000000 */   nop
/* 096A08 00196908 00000000 */  nop
/* 096A0C 0019690C 00000000 */  nop
