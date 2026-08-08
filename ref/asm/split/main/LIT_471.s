.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_471
/* 199970 00299870 6D000000 */ .word 0x0000006D
/* 199974 00299874 00000000 */ .word 0x00000000
