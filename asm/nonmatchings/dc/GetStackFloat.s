.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetStackFloat__FP12RS_STACKDATA
/* 8A4A0 0018A3A0 0000828C */  lw         $2, 0x0($4)
/* 8A4A4 0018A3A4 05004014 */  bnez       $2, .L0018A3BC
/* 8A4A8 0018A3A8 00000000 */   nop
/* 8A4AC 0018A3AC 040080C4 */  lwc1       $f0, 0x4($4)
/* 8A4B0 0018A3B0 20008046 */  cvt.s.w    $f0, $f0
/* 8A4B4 0018A3B4 03000010 */  b          .L0018A3C4
/* 8A4B8 0018A3B8 00000000 */   nop
.L0018A3BC:
/* 8A4BC 0018A3BC 040080C4 */  lwc1       $f0, 0x4($4)
/* 8A4C0 0018A3C0 00000000 */  nop
.L0018A3C4:
/* 8A4C4 0018A3C4 0800E003 */  jr         $31
/* 8A4C8 0018A3C8 00000000 */   nop
/* 8A4CC 0018A3CC 00000000 */  nop
