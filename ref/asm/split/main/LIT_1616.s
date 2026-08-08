.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1616
/* 19BA70 0029B970 67706F73 */ .word 0x736F7067
/* 19BA74 0029B974 20252E32 */ .word 0x322E2520
/* 19BA78 0029B978 662F2025 */ .word 0x25202F66
/* 19BA7C 0029B97C 2E32662F */ .word 0x2F66322E
/* 19BA80 0029B980 20252E32 */ .word 0x322E2520
/* 19BA84 0029B984 660A0000 */ .word 0x00000A66
/* 19BA88 0029B988 00000000 */ .word 0x00000000
/* 19BA8C 0029B98C 00000000 */ .word 0x00000000
