.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1208
/* 19E208 0029E108 30356100 */ .word GlobalDataBuffer + 0x3684B0
/* 19E20C 0029E10C 00000000 */ .word 0x00000000
