.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_620__2
/* 19C990 0029C890 7A617473 */ .word 0x7374617A
/* 19C994 0029C894 746F726E */ .word 0x6E726F74
/* 19C998 0029C898 00000000 */ .word 0x00000000
/* 19C99C 0029C89C 00000000 */ .word 0x00000000
