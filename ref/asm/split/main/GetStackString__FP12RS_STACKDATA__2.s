.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetStackString__FP12RS_STACKDATA__2
/* 0BBAB0 001BB9B0 0400828C */  lw          $2, 0x4($4)
/* 0BBAB4 001BB9B4 0800E003 */  jr          $31
/* 0BBAB8 001BB9B8 00000000 */   nop
/* 0BBABC 001BB9BC 00000000 */  nop
