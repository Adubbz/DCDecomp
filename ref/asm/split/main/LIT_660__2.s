.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_660__2
/* 19CBB0 0029CAB0 6B6F6E61 */ .word 0x616E6F6B
/* 19CBB4 0029CAB4 6D656475 */ .word 0x7564656D
/* 19CBB8 0029CAB8 00000000 */ .word 0x00000000
/* 19CBBC 0029CABC 00000000 */ .word 0x00000000
