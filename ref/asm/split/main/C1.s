.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel C1
/* 198898 00298798 4C555555 */ .word 0x5555554C
/* 19889C 0029879C 5555A53F */ .word 0x3FA55555
