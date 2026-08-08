.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_470__2
/* 199968 00299868 67000000 */ .word 0x00000067
/* 19996C 0029986C 00000000 */ .word 0x00000000
