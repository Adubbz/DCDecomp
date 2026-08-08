.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1383
/* 19CFF0 0029CEF0 6974656D */ .word 0x6D657469
/* 19CFF4 0029CEF4 7061636B */ .word 0x6B636170
/* 19CFF8 0029CEF8 00000000 */ .word 0x00000000
/* 19CFFC 0029CEFC 00000000 */ .word 0x00000000
