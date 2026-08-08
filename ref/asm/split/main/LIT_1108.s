.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1108
/* 19E0D0 0029DFD0 6D6F6465 */ .word 0x65646F6D
/* 19E0D4 0029DFD4 6C206275 */ .word 0x7562206C
/* 19E0D8 0029DFD8 696C6420 */ .word 0x20646C69
/* 19E0DC 0029DFDC 62756666 */ .word 0x66667562
/* 19E0E0 0029DFE0 65722020 */ .word 0x20207265
/* 19E0E4 0029DFE4 20203D20 */ .word 0x203D2020
/* 19E0E8 0029DFE8 25700A00 */ .word 0x000A7025
/* 19E0EC 0029DFEC 00000000 */ .word 0x00000000
