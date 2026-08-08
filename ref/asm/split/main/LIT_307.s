.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_307
/* 199F58 00299E58 6B6F7961 */ .word 0x61796F6B
/* 199F5C 00299E5C 41000000 */ .word 0x00000041
