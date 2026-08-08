.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1593
/* 19B488 0029B388 4C494748 */ .word 0x4847494C
/* 19B48C 0029B38C 545F4300 */ .word GlobalDataBuffer + 0x18AED4
