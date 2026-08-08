.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_788
/* 19D2A0 0029D1A0 73686F70 */ .word 0x706F6873
/* 19D2A4 0029D1A4 62726400 */ .word GlobalDataBuffer + 0x39C1E2
