.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _ASQ_ROT_MOVE__FP12RS_STACKDATAi
/* 946B0 001945B0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 946B4 001945B4 1000BF7F */  sq         $31, 0x10($sp)
/* 946B8 001945B8 0000B07F */  sq         $16, 0x0($sp)
/* 946BC 001945BC 08009024 */  addiu      $16, $4, 0x8
/* 946C0 001945C0 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 946C4 001945C4 00000000 */   nop
/* 946C8 001945C8 28264070 */  paddub     $4, $2, $0
/* 946CC 001945CC 242C060C */  jal        GetActSeq__Fi
/* 946D0 001945D0 00000000 */   nop
/* 946D4 001945D4 281E4070 */  paddub     $3, $2, $0
/* 946D8 001945D8 04006014 */  bnez       $3, .L001945EC
/* 946DC 001945DC 00000000 */   nop
/* 946E0 001945E0 28160070 */  paddub     $2, $0, $0
/* 946E4 001945E4 09000010 */  b          .L0019460C
/* 946E8 001945E8 00000000 */   nop
.L001945EC:
/* 946EC 001945EC 28260072 */  paddub     $4, $16, $0
/* 946F0 001945F0 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 946F4 001945F4 00000000 */   nop
/* 946F8 001945F8 28266070 */  paddub     $4, $3, $0
/* 946FC 001945FC 06030046 */  mov.s      $f12, $f0
/* 94700 00194600 4454050C */  jal        RotMoveSeq__10CActionSeqFf
/* 94704 00194604 00000000 */   nop
/* 94708 00194608 01000224 */  addiu      $2, $0, 0x1
.L0019460C:
/* 9470C 0019460C 1000BF7B */  lq         $31, 0x10($sp)
/* 94710 00194610 0000B07B */  lq         $16, 0x0($sp)
/* 94714 00194614 2000BD27 */  addiu      $sp, $sp, 0x20
/* 94718 00194618 0800E003 */  jr         $31
/* 9471C 0019461C 00000000 */   nop
