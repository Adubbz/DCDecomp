.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1675
/* 19B1D8 0029B0D8 6D6F6F6E */ .word 0x6E6F6F6D
/* 19B1DC 0029B0DC 00000000 */ .word 0x00000000
