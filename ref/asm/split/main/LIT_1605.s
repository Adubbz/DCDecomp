.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1605
/* 19B500 0029B400 57415445 */ .word 0x45544157
/* 19B504 0029B404 525F5355 */ .word 0x55535F52
/* 19B508 0029B408 52464143 */ .word 0x43414652
/* 19B50C 0029B40C 45000000 */ .word 0x00000045
