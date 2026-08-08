.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2740
/* 19AE10 0029AD10 6D657377 */ .word 0x7773656D
/* 19AE14 0029AD14 696E2F67 */ .word 0x672F6E69
/* 19AE18 0029AD18 61696A69 */ .word 0x696A6961
/* 19AE1C 0029AD1C 2E696D67 */ .word 0x676D692E
/* 19AE20 0029AD20 00000000 */ .word 0x00000000
/* 19AE24 0029AD24 00000000 */ .word 0x00000000
/* 19AE28 0029AD28 00000000 */ .word 0x00000000
/* 19AE2C 0029AD2C 00000000 */ .word 0x00000000
