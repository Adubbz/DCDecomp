.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1012
/* 19D708 0029D608 6D736720 */ .word 0x2067736D
/* 19D70C 0029D60C 776F726B */ .word 0x6B726F77
/* 19D710 0029D610 20617265 */ .word 0x65726120
/* 19D714 0029D614 610A0000 */ .word 0x00000A61
