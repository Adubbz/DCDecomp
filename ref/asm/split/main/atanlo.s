.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel atanlo
/* 198A90 00298990 E2652F22 */ .word 0x222F65E2
/* 198A94 00298994 7F2B7A3C */ .word 0x3C7A2B7F
/* 198A98 00298998 075C1433 */ .word 0x33145C07
/* 198A9C 0029899C 26A6813C */ .word 0x3C81A626
/* 198AA0 002989A0 BDCBF07A */ .word 0x7AF0CBBD
/* 198AA4 002989A4 8807703C */ .word 0x3C700788
/* 198AA8 002989A8 075C1433 */ .word 0x33145C07
/* 198AAC 002989AC 26A6913C */ .word 0x3C91A626
