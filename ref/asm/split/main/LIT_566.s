.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_566
/* 1992F8 002991F8 5449544C */ .word 0x4C544954
/* 1992FC 002991FC 452E4249 */ .word 0x49422E45
/* 199300 00299200 4E000000 */ .word 0x0000004E
/* 199304 00299204 00000000 */ .word 0x00000000
