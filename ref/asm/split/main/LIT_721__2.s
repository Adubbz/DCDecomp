.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_721__2
/* 19CED0 0029CDD0 74756B69 */ .word 0x696B7574
/* 19CED4 0029CDD4 66756500 */ .word GlobalDataBuffer + 0x3AC4E6
