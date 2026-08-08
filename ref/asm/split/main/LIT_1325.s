.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1325
/* 19B550 0029B450 67646174 */ .word 0x74616467
/* 19B554 0029B454 61302E65 */ .word 0x652E3061
/* 19B558 0029B458 64740000 */ .word 0x00007464
/* 19B55C 0029B45C 00000000 */ .word 0x00000000
