.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_805
/* 19BC28 0029BB28 6974656D */ .word 0x6D657469
/* 19BC2C 0029BB2C 7061636B */ .word 0x6B636170
/* 19BC30 0029BB30 00000000 */ .word 0x00000000
/* 19BC34 0029BB34 00000000 */ .word 0x00000000
