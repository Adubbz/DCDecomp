.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_622
/* 19A210 0029A110 73686962 */ .word 0x62696873
/* 19A214 0029A114 756B6900 */ .word GlobalDataBuffer + 0x3EBAF5
