.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetStackString__FP12RS_STACKDATA__3
/* 0E17C0 001E16C0 0400828C */  lw          $2, 0x4($4)
/* 0E17C4 001E16C4 0800E003 */  jr          $31
/* 0E17C8 001E16C8 00000000 */   nop
/* 0E17CC 001E16CC 00000000 */  nop
