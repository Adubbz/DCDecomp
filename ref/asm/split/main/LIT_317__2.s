.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_317__2
/* 19A5F8 0029A4F8 4C494748 */ .word 0x4847494C
/* 19A5FC 0029A4FC 545F4300 */ .word GlobalDataBuffer + 0x18AED4
