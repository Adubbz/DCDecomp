.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_2963
/* 19D538 0029D438 66697368 */ .word 0x68736966
/* 19D53C 0029D43C 62726400 */ .word GlobalDataBuffer + 0x39C1E2
