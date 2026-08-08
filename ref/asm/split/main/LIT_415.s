.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_415
/* 198F58 00298E58 2A2A2A2A */ .word 0x2A2A2A2A
/* 198F5C 00298E5C 2A2A0A00 */ .word 0x000A2A2A
