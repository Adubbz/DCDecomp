.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_414
/* 198F48 00298E48 43505520 */ .word 0x20555043
/* 198F4C 00298E4C 25342E31 */ .word 0x312E3425
/* 198F50 00298E50 6625252C */ .word 0x2C252566
/* 198F54 00298E54 00000000 */ .word 0x00000000
