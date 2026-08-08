.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_255
/* 1992E8 002991E8 6572726F */ .word 0x6F727265
/* 1992EC 002991EC 7221210A */ .word 0x0A212172
/* 1992F0 002991F0 00000000 */ .word 0x00000000
/* 1992F4 002991F4 00000000 */ .word 0x00000000
