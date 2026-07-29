.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CommandOBJECT_TIMER__FPPv
/* 076AA0 001769A0 0800E003 */  jr          $31
/* 076AA4 001769A4 00000000 */   nop
/* 076AA8 001769A8 00000000 */  nop
/* 076AAC 001769AC 00000000 */  nop
