.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_482__2
/* 19A8D8 0029A7D8 63666200 */ .word GlobalDataBuffer + 0x37B5E3
/* 19A8DC 0029A7DC 00000000 */ .word 0x00000000
