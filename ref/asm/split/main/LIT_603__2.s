.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_603__2
/* 19D000 0029CF00 6974656D */ .word 0x6D657469
/* 19D004 0029CF04 7061636B */ .word 0x6B636170
/* 19D008 0029CF08 00000000 */ .word 0x00000000
/* 19D00C 0029CF0C 00000000 */ .word 0x00000000
