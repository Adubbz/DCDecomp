.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2451
/* 19B290 0029B190 24204348 */ .word 0x48432024
/* 19B294 0029B194 41524143 */ .word 0x43415241
/* 19B298 0029B198 5445520A */ .word 0x0A524554
/* 19B29C 0029B19C 00000000 */ .word 0x00000000
