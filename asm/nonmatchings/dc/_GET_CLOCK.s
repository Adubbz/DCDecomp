.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GET_CLOCK__FP12RS_STACKDATAi
/* 90770 00190670 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 90774 00190674 1000BF7F */  sq         $31, 0x10($sp)
/* 90778 00190678 0000B07F */  sq         $16, 0x0($sp)
/* 9077C 0019067C 28868070 */  paddub     $16, $4, $0
/* 90780 00190680 50E0050C */  jal        EdGetClock__Fv
/* 90784 00190684 00000000 */   nop
/* 90788 00190688 28260072 */  paddub     $4, $16, $0
/* 9078C 0019068C 06030046 */  mov.s      $f12, $f0
/* 90790 00190690 0029060C */  jal        SetStack__FP12RS_STACKDATAf
/* 90794 00190694 00000000 */   nop
/* 90798 00190698 01000224 */  addiu      $2, $0, 0x1
/* 9079C 0019069C 1000BF7B */  lq         $31, 0x10($sp)
/* 907A0 001906A0 0000B07B */  lq         $16, 0x0($sp)
/* 907A4 001906A4 2000BD27 */  addiu      $sp, $sp, 0x20
/* 907A8 001906A8 0800E003 */  jr         $31
/* 907AC 001906AC 00000000 */   nop
