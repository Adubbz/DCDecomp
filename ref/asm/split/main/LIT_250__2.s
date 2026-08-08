.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_250__2
/* 199D08 00299C08 00000000 */ .word 0x00000000
/* 199D0C 00299C0C 00000000 */ .word 0x00000000
