.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_321__2
/* 19A618 0029A518 444F4600 */ .word GlobalDataBuffer + 0x1B9EC4
/* 19A61C 0029A51C 00000000 */ .word 0x00000000
