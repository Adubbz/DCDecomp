.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CommandFLAME__FPPv
/* 076A80 00176980 0800E003 */  jr          $31
/* 076A84 00176984 00000000 */   nop
/* 076A88 00176988 00000000 */  nop
/* 076A8C 0017698C 00000000 */  nop
