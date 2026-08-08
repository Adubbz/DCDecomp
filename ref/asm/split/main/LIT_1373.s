.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1373
/* 19F0C8 0029EFC8 71756963 */ .word 0x63697571
/* 19F0CC 0029EFCC 6B636872 */ .word 0x7268636B
/* 19F0D0 0029EFD0 2E696D67 */ .word 0x676D692E
/* 19F0D4 0029EFD4 00000000 */ .word 0x00000000
