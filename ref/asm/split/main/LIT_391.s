.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_391
/* 199240 00299140 46414C53 */ .word 0x534C4146
/* 199244 00299144 45000000 */ .word 0x00000045
/* 199248 00299148 00000000 */ .word 0x00000000
/* 19924C 0029914C 00000000 */ .word 0x00000000
