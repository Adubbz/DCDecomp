.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2943
/* 19D500 0029D400 66697368 */ .word 0x68736966
/* 19D504 0029D404 6D656E75 */ .word 0x756E656D
/* 19D508 0029D408 2E706163 */ .word 0x6361702E
/* 19D50C 0029D40C 00000000 */ .word 0x00000000
