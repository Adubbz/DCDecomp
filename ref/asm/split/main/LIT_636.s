.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_636
/* 19C630 0029C530 636F6D6D */ .word 0x6D6D6F63
/* 19C634 0029C534 656E752F */ .word 0x2F756E65
/* 19C638 0029C538 77656170 */ .word 0x70616577
/* 19C63C 0029C53C 6F6E2F25 */ .word 0x252F6E6F
/* 19C640 0029C540 73000000 */ .word 0x00000073
/* 19C644 0029C544 00000000 */ .word 0x00000000
/* 19C648 0029C548 00000000 */ .word 0x00000000
/* 19C64C 0029C54C 00000000 */ .word 0x00000000
