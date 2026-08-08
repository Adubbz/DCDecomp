.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_670__2
/* 19E780 0029E680 63726561 */ .word 0x61657263
/* 19E784 0029E684 7465206E */ .word 0x6E206574
/* 19E788 0029E688 65772064 */ .word 0x64207765
/* 19E78C 0029E68C 69720A00 */ .word 0x000A7269
