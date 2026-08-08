.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_493
/* 19C118 0029C018 4C494748 */ .word 0x4847494C
/* 19C11C 0029C01C 545F4300 */ .word GlobalDataBuffer + 0x18AED4
