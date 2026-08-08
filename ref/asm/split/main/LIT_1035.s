.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1035
/* 198E30 00298D30 7374643A */ .word 0x3A647473
/* 198E34 00298D34 3A626164 */ .word 0x6461623A
/* 198E38 00298D38 5F657863 */ .word 0x6378655F
/* 198E3C 00298D3C 65707469 */ .word 0x69747065
/* 198E40 00298D40 6F6E0000 */ .word 0x00006E6F
/* 198E44 00298D44 00000000 */ .word 0x00000000
