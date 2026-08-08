.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_321
/* 199FC8 00299EC8 6D6B6962 */ .word 0x62696B6D
/* 199FCC 00299ECC 61000000 */ .word 0x00000061
