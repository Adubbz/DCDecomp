.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2047
/* 19F1A0 0029F0A0 61747472 */ .word 0x72747461
/* 19F1A4 0029F0A4 69627574 */ .word 0x74756269
/* 19F1A8 0029F0A8 653A2573 */ .word 0x73253A65
/* 19F1AC 0029F0AC 0A000000 */ .word 0x0000000A
