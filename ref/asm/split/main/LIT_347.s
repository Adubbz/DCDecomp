.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_347
/* 19A748 0029A648 4C414B45 */ .word 0x454B414C
/* 19A74C 0029A64C 5F504152 */ .word 0x5241505F
/* 19A750 0029A650 54530000 */ .word 0x00005354
/* 19A754 0029A654 00000000 */ .word 0x00000000
