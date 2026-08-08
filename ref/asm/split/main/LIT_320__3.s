.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_320__3
/* 19A610 0029A510 42475F43 */ .word 0x435F4742
/* 19A614 0029A514 4F4C3200 */ .word GlobalDataBuffer + 0x79BCF
