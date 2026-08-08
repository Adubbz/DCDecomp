.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1101
/* 19F580 0029F480 6D656E75 */ .word 0x756E656D
/* 19F584 0029F484 5F657800 */ .word GlobalDataBuffer + 0x4DB4DF
