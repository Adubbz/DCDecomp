.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_342
/* 19A708 0029A608 524F4144 */ .word 0x44414F52
/* 19A70C 0029A60C 5F504152 */ .word 0x5241505F
/* 19A710 0029A610 54530000 */ .word 0x00005354
/* 19A714 0029A614 00000000 */ .word 0x00000000
