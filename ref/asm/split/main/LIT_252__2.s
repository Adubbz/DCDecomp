.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_252__2
/* 199D18 00299C18 6B6F7961 */ .word 0x61796F6B
/* 199D1C 00299C1C 00000000 */ .word 0x00000000
