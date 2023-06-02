.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _ASQ_CLEAR_ROT__FP12RS_STACKDATAi
/* 94610 00194510 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 94614 00194514 0000BF7F */  sq         $31, 0x0($sp)
/* 94618 00194518 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 9461C 0019451C 00000000 */   nop
/* 94620 00194520 28264070 */  paddub     $4, $2, $0
/* 94624 00194524 242C060C */  jal        GetActSeq__Fi
/* 94628 00194528 00000000 */   nop
/* 9462C 0019452C 04004014 */  bnez       $2, .L00194540
/* 94630 00194530 00000000 */   nop
/* 94634 00194534 28160070 */  paddub     $2, $0, $0
/* 94638 00194538 05000010 */  b          .L00194550
/* 9463C 0019453C 00000000 */   nop
.L00194540:
/* 94640 00194540 28264070 */  paddub     $4, $2, $0
/* 94644 00194544 5854050C */  jal        ClearRotSeq__10CActionSeqFv
/* 94648 00194548 00000000 */   nop
/* 9464C 0019454C 01000224 */  addiu      $2, $0, 0x1
.L00194550:
/* 94650 00194550 0000BF7B */  lq         $31, 0x0($sp)
/* 94654 00194554 1000BD27 */  addiu      $sp, $sp, 0x10
/* 94658 00194558 0800E003 */  jr         $31
/* 9465C 0019455C 00000000 */   nop
