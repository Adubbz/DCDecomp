.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_2822
/* 19B098 0029AF98 74657861 */ .word 0x61786574
/* 19B09C 0029AF9C 6E696D65 */ .word 0x656D696E
/* 19B0A0 0029AFA0 2E636667 */ .word 0x6766632E
/* 19B0A4 0029AFA4 00000000 */ .word 0x00000000
