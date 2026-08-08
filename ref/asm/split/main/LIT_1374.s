.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1374
/* 19F0D8 0029EFD8 71756963 */ .word 0x63697571
/* 19F0DC 0029EFDC 6B636861 */ .word 0x6168636B
/* 19F0E0 0029EFE0 72610000 */ .word 0x00006172
/* 19F0E4 0029EFE4 00000000 */ .word 0x00000000
