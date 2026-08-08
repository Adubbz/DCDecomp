.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_931__4
/* 19D638 0029D538 77657073 */ .word 0x73706577
/* 19D63C 0029D53C 74617475 */ .word 0x75746174
/* 19D640 0029D540 73000000 */ .word 0x00000073
/* 19D644 0029D544 00000000 */ .word 0x00000000
