.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_878
/* 19A9A0 0029A8A0 53545544 */ .word 0x44555453
/* 19A9A4 0029A8A4 494F5F42 */ .word 0x425F4F49
/* 19A9A8 0029A8A8 00000000 */ .word 0x00000000
/* 19A9AC 0029A8AC 00000000 */ .word 0x00000000
