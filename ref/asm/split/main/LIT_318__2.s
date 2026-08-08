.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_318__2
/* 19A600 0029A500 464F4700 */ .word GlobalDataBuffer + 0x1C9EC6
/* 19A604 0029A504 00000000 */ .word 0x00000000
