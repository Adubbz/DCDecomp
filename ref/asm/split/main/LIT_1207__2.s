.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1207__2
/* 19E200 0029E100 30366200 */ .word GlobalDataBuffer + 0x3785B0
/* 19E204 0029E104 00000000 */ .word 0x00000000
