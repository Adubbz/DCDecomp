.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2803
/* 19AF60 0029AE60 6D657377 */ .word 0x7773656D
/* 19AF64 0029AE64 696E2F6D */ .word 0x6D2F6E69
/* 19AF68 0029AE68 65735F74 */ .word 0x745F7365
/* 19AF6C 0029AE6C 65782E70 */ .word 0x702E7865
/* 19AF70 0029AE70 616B0000 */ .word 0x00006B61
/* 19AF74 0029AE74 00000000 */ .word 0x00000000
