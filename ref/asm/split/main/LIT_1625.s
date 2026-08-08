.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1625
/* 19BB58 0029BA58 44697374 */ .word 0x74736944
/* 19BB5C 0029BA5C 203D2025 */ .word 0x25203D20
/* 19BB60 0029BA60 2E33660A */ .word 0x0A66332E
/* 19BB64 0029BA64 00000000 */ .word 0x00000000
