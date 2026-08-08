.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_260__3
/* 19A430 0029A330 70303161 */ .word 0x61313070
/* 19A434 0029A334 00000000 */ .word 0x00000000
