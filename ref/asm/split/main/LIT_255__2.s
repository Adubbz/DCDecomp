.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_255__2
/* 199D38 00299C38 6C696768 */ .word 0x6867696C
/* 199D3C 00299C3C 74000000 */ .word 0x00000074
