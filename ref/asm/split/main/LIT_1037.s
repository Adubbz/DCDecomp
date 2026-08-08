.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1037
/* 198E48 00298D48 7374643A */ .word 0x3A647473
/* 198E4C 00298D4C 3A657863 */ .word 0x6378653A
/* 198E50 00298D50 65707469 */ .word 0x69747065
/* 198E54 00298D54 6F6E0000 */ .word 0x00006E6F
