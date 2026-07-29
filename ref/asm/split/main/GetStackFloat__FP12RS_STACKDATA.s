.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetStackFloat__FP12RS_STACKDATA
/* 08A4A0 0018A3A0 0000828C */  lw          $2, 0x0($4)
/* 08A4A4 0018A3A4 05004014 */  bnez        $2, .L0018A3BC
/* 08A4A8 0018A3A8 00000000 */   nop
/* 08A4AC 0018A3AC 040080C4 */  lwc1        $f0, 0x4($4)
/* 08A4B0 0018A3B0 20008046 */  cvt.s.w     $f0, $f0
/* 08A4B4 0018A3B4 03000010 */  b           .L0018A3C4
/* 08A4B8 0018A3B8 00000000 */   nop
.L0018A3BC:
/* 08A4BC 0018A3BC 040080C4 */  lwc1        $f0, 0x4($4)
/* 08A4C0 0018A3C0 00000000 */  nop
.L0018A3C4:
/* 08A4C4 0018A3C4 0800E003 */  jr          $31
/* 08A4C8 0018A3C8 00000000 */   nop
/* 08A4CC 0018A3CC 00000000 */  nop
