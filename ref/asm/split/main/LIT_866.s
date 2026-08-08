.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_866
/* 19BC50 0029BB50 2E776774 */ .word 0x7467772E
/* 19BC54 0029BB54 00000000 */ .word 0x00000000
/* 19BC58 0029BB58 00000000 */ .word 0x00000000
/* 19BC5C 0029BB5C 00000000 */ .word 0x00000000
