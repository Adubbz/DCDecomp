.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_701__2
/* 19CDB8 0029CCB8 6B657973 */ .word 0x7379656B
/* 19CDBC 0029CCBC 656E7374 */ .word 0x74736E65
/* 19CDC0 0029CCC0 00000000 */ .word 0x00000000
/* 19CDC4 0029CCC4 00000000 */ .word 0x00000000
