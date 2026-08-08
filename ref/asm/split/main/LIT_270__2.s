.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_270__2
/* 199DC0 00299CC0 68617368 */ .word 0x68736168
/* 199DC4 00299CC4 69676F00 */ .word GlobalDataBuffer + 0x44B6E9
