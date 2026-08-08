.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_926__2
/* 19D5F8 0029D4F8 63686172 */ .word 0x72616863
/* 19D5FC 0029D4FC 61666163 */ .word 0x63616661
/* 19D600 0029D500 65000000 */ .word 0x00000065
/* 19D604 0029D504 00000000 */ .word 0x00000000
