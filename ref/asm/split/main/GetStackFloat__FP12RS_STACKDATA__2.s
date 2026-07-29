.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetStackFloat__FP12RS_STACKDATA__2
/* 0BBA80 001BB980 0000828C */  lw          $2, 0x0($4)
/* 0BBA84 001BB984 05004014 */  bnez        $2, .L001BB99C
/* 0BBA88 001BB988 00000000 */   nop
/* 0BBA8C 001BB98C 040080C4 */  lwc1        $f0, 0x4($4)
/* 0BBA90 001BB990 20008046 */  cvt.s.w     $f0, $f0
/* 0BBA94 001BB994 03000010 */  b           .L001BB9A4
/* 0BBA98 001BB998 00000000 */   nop
.L001BB99C:
/* 0BBA9C 001BB99C 040080C4 */  lwc1        $f0, 0x4($4)
/* 0BBAA0 001BB9A0 00000000 */  nop
.L001BB9A4:
/* 0BBAA4 001BB9A4 0800E003 */  jr          $31
/* 0BBAA8 001BB9A8 00000000 */   nop
/* 0BBAAC 001BB9AC 00000000 */  nop
