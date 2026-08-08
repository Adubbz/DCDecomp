.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_880__2
/* 19A9C0 0029A8C0 48414C4C */ .word 0x4C4C4148
/* 19A9C4 0029A8C4 00000000 */ .word 0x00000000
