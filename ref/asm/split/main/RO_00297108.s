.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel RO_00297108
/* 197208 00297108 63647265 */ .word 0x65726463
/* 19720C 0029710C 61642065 */ .word 0x65206461
/* 197210 00297110 6E640A00 */ .word 0x000A646E
/* 197214 00297114 00000000 */ .word 0x00000000
