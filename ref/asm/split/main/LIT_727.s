.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_727
/* 199058 00298F58 4D4F4445 */ .word 0x45444F4D
/* 19905C 00298F5C 4C000000 */ .word 0x0000004C
