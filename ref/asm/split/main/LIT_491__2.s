.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_491__2
/* 19C108 0029C008 464F4700 */ .word GlobalDataBuffer + 0x1C9EC6
/* 19C10C 0029C00C 00000000 */ .word 0x00000000
