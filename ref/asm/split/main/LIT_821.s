.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_821
/* 199B68 00299A68 2B25640A */ .word 0x0A64252B
/* 199B6C 00299A6C 00000000 */ .word 0x00000000
