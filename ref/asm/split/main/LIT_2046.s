.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2046
/* 19F190 0029F090 75736520 */ .word 0x20657375
/* 19F194 0029F094 20202020 */ .word 0x20202020
/* 19F198 0029F098 203A2573 */ .word 0x73253A20
/* 19F19C 0029F09C 0A000000 */ .word 0x0000000A
