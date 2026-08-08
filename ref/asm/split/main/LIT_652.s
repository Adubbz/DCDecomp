.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_652
/* 19CB40 0029CA40 6D617365 */ .word 0x6573616D
/* 19CB44 0029CA44 6B697464 */ .word 0x6474696B
/* 19CB48 0029CA48 00000000 */ .word 0x00000000
/* 19CB4C 0029CA4C 00000000 */ .word 0x00000000
