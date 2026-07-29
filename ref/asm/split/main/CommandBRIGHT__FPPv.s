.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CommandBRIGHT__FPPv
/* 076A90 00176990 0800E003 */  jr          $31
/* 076A94 00176994 00000000 */   nop
/* 076A98 00176998 00000000 */  nop
/* 076A9C 0017699C 00000000 */  nop
