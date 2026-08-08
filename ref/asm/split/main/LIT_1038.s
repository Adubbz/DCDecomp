.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1038
/* 19B1B8 0029B0B8 696E666F */ .word 0x6F666E69
/* 19B1BC 0029B0BC 2E636667 */ .word 0x6766632E
/* 19B1C0 0029B0C0 00000000 */ .word 0x00000000
/* 19B1C4 0029B0C4 00000000 */ .word 0x00000000
