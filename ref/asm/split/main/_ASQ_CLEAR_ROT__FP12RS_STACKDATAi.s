.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _ASQ_CLEAR_ROT__FP12RS_STACKDATAi
/* 094610 00194510 F0FFBD27 */  addiu       $29, $29, -0x10
/* 094614 00194514 0000BF7F */  sq          $31, 0x0($29)
/* 094618 00194518 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 09461C 0019451C 00000000 */   nop
/* 094620 00194520 28264070 */  paddub      $4, $2, $0
/* 094624 00194524 242C060C */  jal         GetActSeq__Fi
/* 094628 00194528 00000000 */   nop
/* 09462C 0019452C 04004014 */  bnez        $2, .L00194540
/* 094630 00194530 00000000 */   nop
/* 094634 00194534 28160070 */  paddub      $2, $0, $0
/* 094638 00194538 05000010 */  b           .L00194550
/* 09463C 0019453C 00000000 */   nop
.L00194540:
/* 094640 00194540 28264070 */  paddub      $4, $2, $0
/* 094644 00194544 5854050C */  jal         ClearRotSeq__10CActionSeqFv
/* 094648 00194548 00000000 */   nop
/* 09464C 0019454C 01000224 */  addiu       $2, $0, 0x1
.L00194550:
/* 094650 00194550 0000BF7B */  lq          $31, 0x0($29)
/* 094654 00194554 1000BD27 */  addiu       $29, $29, 0x10
/* 094658 00194558 0800E003 */  jr          $31
/* 09465C 0019455C 00000000 */   nop
