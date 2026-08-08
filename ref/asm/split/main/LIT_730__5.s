.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_730__5
/* 19CF38 0029CE38 68616E74 */ .word 0x746E6168
/* 19CF3C 0029CE3C 6D696D69 */ .word 0x696D696D
/* 19CF40 0029CE40 00000000 */ .word 0x00000000
/* 19CF44 0029CE44 00000000 */ .word 0x00000000
