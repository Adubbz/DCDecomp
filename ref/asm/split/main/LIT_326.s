.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_326
/* 199FF0 00299EF0 77617369 */ .word 0x69736177
/* 199FF4 00299EF4 00000000 */ .word 0x00000000
