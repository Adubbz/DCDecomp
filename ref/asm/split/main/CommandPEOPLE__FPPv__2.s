.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CommandPEOPLE__FPPv__2
/* 09FFC0 0019FEC0 0800E003 */  jr          $31
/* 09FFC4 0019FEC4 00000000 */   nop
/* 09FFC8 0019FEC8 00000000 */  nop
/* 09FFCC 0019FECC 00000000 */  nop
