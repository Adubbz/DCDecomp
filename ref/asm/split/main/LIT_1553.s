.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1553
/* 19BA10 0029B910 4E454241 */ .word 0x4142454E
/* 19BA14 0029B914 32000000 */ .word 0x00000032
