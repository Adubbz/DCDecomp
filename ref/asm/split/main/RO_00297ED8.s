.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel RO_00297ED8
/* 197FD8 00297ED8 5454593A */ .word 0x3A595454
/* 197FDC 00297EDC 2073656E */ .word 0x6E657320
/* 197FE0 00297EE0 64206572 */ .word 0x72652064
/* 197FE4 00297EE4 72202564 */ .word 0x64252072
/* 197FE8 00297EE8 0A000000 */ .word 0x0000000A
/* 197FEC 00297EEC 00000000 */ .word 0x00000000
