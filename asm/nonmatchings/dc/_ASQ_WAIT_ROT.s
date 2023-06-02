.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _ASQ_WAIT_ROT__FP12RS_STACKDATAi
/* 94660 00194560 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 94664 00194564 0000BF7F */  sq         $31, 0x0($sp)
/* 94668 00194568 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 9466C 0019456C 00000000 */   nop
/* 94670 00194570 28264070 */  paddub     $4, $2, $0
/* 94674 00194574 242C060C */  jal        GetActSeq__Fi
/* 94678 00194578 00000000 */   nop
/* 9467C 0019457C 04004014 */  bnez       $2, .L00194590
/* 94680 00194580 00000000 */   nop
/* 94684 00194584 28160070 */  paddub     $2, $0, $0
/* 94688 00194588 05000010 */  b          .L001945A0
/* 9468C 0019458C 00000000 */   nop
.L00194590:
/* 94690 00194590 28264070 */  paddub     $4, $2, $0
/* 94694 00194594 6854050C */  jal        WaitRotSeq__10CActionSeqFv
/* 94698 00194598 00000000 */   nop
/* 9469C 0019459C 01000224 */  addiu      $2, $0, 0x1
.L001945A0:
/* 946A0 001945A0 0000BF7B */  lq         $31, 0x0($sp)
/* 946A4 001945A4 1000BD27 */  addiu      $sp, $sp, 0x10
/* 946A8 001945A8 0800E003 */  jr         $31
/* 946AC 001945AC 00000000 */   nop
