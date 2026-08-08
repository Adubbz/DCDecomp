.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_2754
/* 19AF18 0029AE18 77686174 */ .word 0x74616877
/* 19AF1C 0029AE1C 73646179 */ .word 0x79616473
/* 19AF20 0029AE20 2E696D67 */ .word 0x676D692E
/* 19AF24 0029AE24 00000000 */ .word 0x00000000
/* 19AF28 0029AE28 00000000 */ .word 0x00000000
/* 19AF2C 0029AE2C 00000000 */ .word 0x00000000
