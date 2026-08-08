.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1084
/* 199770 00299670 6D657377 */ .word 0x7773656D
/* 199774 00299674 696E2F67 */ .word 0x672F6E69
/* 199778 00299678 61696A69 */ .word 0x696A6961
/* 19977C 0029967C 2E696D67 */ .word 0x676D692E
/* 199780 00299680 00000000 */ .word 0x00000000
/* 199784 00299684 00000000 */ .word 0x00000000
