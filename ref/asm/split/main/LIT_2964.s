.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2964
/* 19D540 0029D440 66697368 */ .word 0x68736966
/* 19D544 0029D444 6D65732E */ .word 0x2E73656D
/* 19D548 0029D448 62696E00 */ .word GlobalDataBuffer + 0x43B8E2
/* 19D54C 0029D44C 00000000 */ .word 0x00000000
