.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _ASQ_WAIT_ROT__FP12RS_STACKDATAi
/* 094660 00194560 F0FFBD27 */  addiu       $29, $29, -0x10
/* 094664 00194564 0000BF7F */  sq          $31, 0x0($29)
/* 094668 00194568 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 09466C 0019456C 00000000 */   nop
/* 094670 00194570 28264070 */  paddub      $4, $2, $0
/* 094674 00194574 242C060C */  jal         GetActSeq__Fi
/* 094678 00194578 00000000 */   nop
/* 09467C 0019457C 04004014 */  bnez        $2, .L00194590
/* 094680 00194580 00000000 */   nop
/* 094684 00194584 28160070 */  paddub      $2, $0, $0
/* 094688 00194588 05000010 */  b           .L001945A0
/* 09468C 0019458C 00000000 */   nop
.L00194590:
/* 094690 00194590 28264070 */  paddub      $4, $2, $0
/* 094694 00194594 6854050C */  jal         WaitRotSeq__10CActionSeqFv
/* 094698 00194598 00000000 */   nop
/* 09469C 0019459C 01000224 */  addiu       $2, $0, 0x1
.L001945A0:
/* 0946A0 001945A0 0000BF7B */  lq          $31, 0x0($29)
/* 0946A4 001945A4 1000BD27 */  addiu       $29, $29, 0x10
/* 0946A8 001945A8 0800E003 */  jr          $31
/* 0946AC 001945AC 00000000 */   nop
