.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_309
/* 199F68 00299E68 77617261 */ .word 0x61726177
/* 199F6C 00299E6C 00000000 */ .word 0x00000000
