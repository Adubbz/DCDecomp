.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_698
/* 19CDA0 0029CCA0 7469636B */ .word 0x6B636974
/* 19CDA4 0029CCA4 65740000 */ .word 0x00007465
