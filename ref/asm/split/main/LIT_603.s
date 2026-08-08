.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_603
/* 19C8A0 0029C7A0 61746D61 */ .word 0x616D7461
/* 19C8A4 0029C7A4 67696300 */ .word GlobalDataBuffer + 0x38B8E7
