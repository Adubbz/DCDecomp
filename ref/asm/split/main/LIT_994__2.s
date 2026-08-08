.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_994__2
/* 19F2C0 0029F1C0 53746179 */ .word 0x79617453
/* 19F2C4 0029F1C4 54657800 */ .word GlobalDataBuffer + 0x4DB4D4
