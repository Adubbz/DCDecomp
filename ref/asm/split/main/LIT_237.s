.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_237
/* 198DB0 00298CB0 7374643A */ .word 0x3A647473
/* 198DB4 00298CB4 3A657863 */ .word 0x6378653A
/* 198DB8 00298CB8 65707469 */ .word 0x69747065
/* 198DBC 00298CBC 6F6E0000 */ .word 0x00006E6F
