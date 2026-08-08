.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1205
/* 19E1F0 0029E0F0 30316400 */ .word GlobalDataBuffer + 0x3980B0
/* 19E1F4 0029E0F4 00000000 */ .word 0x00000000
