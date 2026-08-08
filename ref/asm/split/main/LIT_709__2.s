.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_709__2
/* 19CE20 0029CD20 6B757361 */ .word 0x6173756B
/* 19CE24 0029CD24 73616B6E */ .word 0x6E6B6173
/* 19CE28 0029CD28 00000000 */ .word 0x00000000
/* 19CE2C 0029CD2C 00000000 */ .word 0x00000000
