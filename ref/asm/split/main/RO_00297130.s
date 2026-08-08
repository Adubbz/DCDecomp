.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel RO_00297130
/* 197230 00297130 4E20636D */ .word 0x6D63204E
/* 197234 00297134 64207761 */ .word 0x61772064
/* 197238 00297138 69740A00 */ .word 0x000A7469
/* 19723C 0029713C 00000000 */ .word 0x00000000
