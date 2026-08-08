.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_800
/* 19A120 0029A020 5441424C */ .word 0x4C424154
/* 19A124 0029A024 45000000 */ .word 0x00000045
