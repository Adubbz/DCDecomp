.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_337
/* 19A048 00299F48 68617369 */ .word 0x69736168
/* 19A04C 00299F4C 676F3200 */ .word GlobalDataBuffer + 0x7BEE7
