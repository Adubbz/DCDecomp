.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetStackFloat__FP12RS_STACKDATA_2
/* BBA80 001BB980 0000828C */  lw         $2, 0x0($4)
/* BBA84 001BB984 05004014 */  bnez       $2, .L001BB99C
/* BBA88 001BB988 00000000 */   nop
/* BBA8C 001BB98C 040080C4 */  lwc1       $f0, 0x4($4)
/* BBA90 001BB990 20008046 */  cvt.s.w    $f0, $f0
/* BBA94 001BB994 03000010 */  b          .L001BB9A4
/* BBA98 001BB998 00000000 */   nop
.L001BB99C:
/* BBA9C 001BB99C 040080C4 */  lwc1       $f0, 0x4($4)
/* BBAA0 001BB9A0 00000000 */  nop
.L001BB9A4:
/* BBAA4 001BB9A4 0800E003 */  jr         $31
/* BBAA8 001BB9A8 00000000 */   nop
/* BBAAC 001BB9AC 00000000 */  nop
