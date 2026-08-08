.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_714__3
/* 19CE68 0029CD68 6D617000 */ .word GlobalDataBuffer + 0x45B0ED
/* 19CE6C 0029CD6C 00000000 */ .word 0x00000000
