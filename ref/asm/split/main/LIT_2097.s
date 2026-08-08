.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2097
/* 199CA0 00299BA0 73797374 */ .word 0x74737973
/* 199CA4 00299BA4 30340000 */ .word 0x00003430
