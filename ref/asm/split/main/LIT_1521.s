.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1521
/* 19D078 0029CF78 635F6469 */ .word 0x69645F63
/* 19D07C 0029CF7C 7374203D */ .word 0x3D207473
/* 19D080 0029CF80 20252E33 */ .word 0x332E2520
/* 19D084 0029CF84 660A0000 */ .word 0x00000A66
