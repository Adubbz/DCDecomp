.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_336
/* 19A040 00299F40 68617369 */ .word 0x69736168
/* 19A044 00299F44 676F3100 */ .word GlobalDataBuffer + 0x6BEE7
