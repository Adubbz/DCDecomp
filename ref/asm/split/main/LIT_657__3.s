.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_657__3
/* 19CB90 0029CA90 626F6D6E */ .word 0x6E6D6F62
/* 19CB94 0029CA94 75747300 */ .word GlobalDataBuffer + 0x48C3F5
