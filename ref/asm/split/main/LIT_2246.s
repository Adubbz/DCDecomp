.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2246
/* 19B230 0029B130 73616F00 */ .word GlobalDataBuffer + 0x44B0F3
/* 19B234 0029B134 00000000 */ .word 0x00000000
/* 19B238 0029B138 00000000 */ .word 0x00000000
/* 19B23C 0029B13C 00000000 */ .word 0x00000000
