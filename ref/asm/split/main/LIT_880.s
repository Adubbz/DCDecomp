.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_880
/* 199570 00299470 23667261 */ .word 0x61726623
/* 199574 00299474 6D655F62 */ .word 0x625F656D
/* 199578 00299478 75666623 */ .word 0x23666675
/* 19957C 0029947C 36343023 */ .word 0x23303436
/* 199580 00299480 32323423 */ .word 0x23343232
/* 199584 00299484 34000000 */ .word 0x00000034
/* 199588 00299488 00000000 */ .word 0x00000000
/* 19958C 0029948C 00000000 */ .word 0x00000000
