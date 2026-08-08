.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1035__3
/* 19E008 0029DF08 77303100 */ .word GlobalDataBuffer + 0x67FF7
/* 19E00C 0029DF0C 00000000 */ .word 0x00000000
