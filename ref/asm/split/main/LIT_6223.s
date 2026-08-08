.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_6223
/* 19DDC0 0029DCC0 6D757375 */ .word 0x7573756D
/* 19DDC4 0029DCC4 6B612E70 */ .word 0x702E616B
/* 19DDC8 0029DCC8 61630000 */ .word 0x00006361
/* 19DDCC 0029DCCC 00000000 */ .word 0x00000000
