.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_352
/* 19A788 0029A688 42524947 */ .word 0x47495242
/* 19A78C 0029A68C 48540000 */ .word 0x00005448
