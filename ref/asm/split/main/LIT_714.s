.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_714
/* 19AA48 0029A948 65302564 */ .word 0x64253065
/* 19AA4C 0029A94C 00000000 */ .word 0x00000000
