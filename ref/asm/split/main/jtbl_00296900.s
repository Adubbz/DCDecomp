.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
.align 4
glabel jtbl_00296900
/* 196A00 00296900 80091000 */ .word .L00100980
/* 196A04 00296904 80091000 */ .word .L00100980
/* 196A08 00296908 9C091000 */ .word .L0010099C
/* 196A0C 0029690C C0091000 */ .word .L001009C0
/* 196A10 00296910 A0091000 */ .word .L001009A0
/* 196A14 00296914 C4091000 */ .word .L001009C4
