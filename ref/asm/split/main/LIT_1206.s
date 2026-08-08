.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1206
/* 19E1F8 0029E0F8 30346200 */ .word GlobalDataBuffer + 0x3783B0
/* 19E1FC 0029E0FC 00000000 */ .word 0x00000000
