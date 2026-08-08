.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_958__2
/* 19DF10 0029DE10 6B676567 */ .word 0x6765676B
/* 19DF14 0029DE14 6F726F00 */ .word GlobalDataBuffer + 0x44C1EF
