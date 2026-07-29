.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _ASQ_ROT_MOVE__FP12RS_STACKDATAi
/* 0946B0 001945B0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0946B4 001945B4 1000BF7F */  sq          $31, 0x10($29)
/* 0946B8 001945B8 0000B07F */  sq          $16, 0x0($29)
/* 0946BC 001945BC 08009024 */  addiu       $16, $4, 0x8
/* 0946C0 001945C0 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 0946C4 001945C4 00000000 */   nop
/* 0946C8 001945C8 28264070 */  paddub      $4, $2, $0
/* 0946CC 001945CC 242C060C */  jal         GetActSeq__Fi
/* 0946D0 001945D0 00000000 */   nop
/* 0946D4 001945D4 281E4070 */  paddub      $3, $2, $0
/* 0946D8 001945D8 04006014 */  bnez        $3, .L001945EC
/* 0946DC 001945DC 00000000 */   nop
/* 0946E0 001945E0 28160070 */  paddub      $2, $0, $0
/* 0946E4 001945E4 09000010 */  b           .L0019460C
/* 0946E8 001945E8 00000000 */   nop
.L001945EC:
/* 0946EC 001945EC 28260072 */  paddub      $4, $16, $0
/* 0946F0 001945F0 E828060C */  jal         GetStackFloat__FP12RS_STACKDATA
/* 0946F4 001945F4 00000000 */   nop
/* 0946F8 001945F8 28266070 */  paddub      $4, $3, $0
/* 0946FC 001945FC 06030046 */  mov.s       $f12, $f0
/* 094700 00194600 4454050C */  jal         RotMoveSeq__10CActionSeqFf
/* 094704 00194604 00000000 */   nop
/* 094708 00194608 01000224 */  addiu       $2, $0, 0x1
.L0019460C:
/* 09470C 0019460C 1000BF7B */  lq          $31, 0x10($29)
/* 094710 00194610 0000B07B */  lq          $16, 0x0($29)
/* 094714 00194614 2000BD27 */  addiu       $29, $29, 0x20
/* 094718 00194618 0800E003 */  jr          $31
/* 09471C 0019461C 00000000 */   nop
