.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1107
/* 19E0B0 0029DFB0 72656164 */ .word 0x64616572
/* 19E0B4 0029DFB4 20627566 */ .word 0x66756220
/* 19E0B8 0029DFB8 66657220 */ .word 0x20726566
/* 19E0BC 0029DFBC 20202020 */ .word 0x20202020
/* 19E0C0 0029DFC0 20202020 */ .word 0x20202020
/* 19E0C4 0029DFC4 20203D20 */ .word 0x203D2020
/* 19E0C8 0029DFC8 25700A00 */ .word 0x000A7025
/* 19E0CC 0029DFCC 00000000 */ .word 0x00000000
