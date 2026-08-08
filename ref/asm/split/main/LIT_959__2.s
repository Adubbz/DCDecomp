.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_959__2
/* 19DF18 0029DE18 6B676572 */ .word 0x7265676B
/* 19DF1C 0029DE1C 75627900 */ .word GlobalDataBuffer + 0x4EB1F5
