.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel tiny__2
/* 1981B0 002980B0 59F3F8C2 */ .word 0xC2F8F359
/* 1981B4 002980B4 1F6EA501 */ .word GlobalDataBuffer + 0x17ABD9F
