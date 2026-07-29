.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _GET_CLOCK__FP12RS_STACKDATAi
/* 090770 00190670 E0FFBD27 */  addiu       $29, $29, -0x20
/* 090774 00190674 1000BF7F */  sq          $31, 0x10($29)
/* 090778 00190678 0000B07F */  sq          $16, 0x0($29)
/* 09077C 0019067C 28868070 */  paddub      $16, $4, $0
/* 090780 00190680 50E0050C */  jal         EdGetClock__Fv
/* 090784 00190684 00000000 */   nop
/* 090788 00190688 28260072 */  paddub      $4, $16, $0
/* 09078C 0019068C 06030046 */  mov.s       $f12, $f0
/* 090790 00190690 0029060C */  jal         SetStack__FP12RS_STACKDATAf
/* 090794 00190694 00000000 */   nop
/* 090798 00190698 01000224 */  addiu       $2, $0, 0x1
/* 09079C 0019069C 1000BF7B */  lq          $31, 0x10($29)
/* 0907A0 001906A0 0000B07B */  lq          $16, 0x0($29)
/* 0907A4 001906A4 2000BD27 */  addiu       $29, $29, 0x20
/* 0907A8 001906A8 0800E003 */  jr          $31
/* 0907AC 001906AC 00000000 */   nop
