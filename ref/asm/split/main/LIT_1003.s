.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1003
/* 199640 00299540 4461726B */ .word 0x6B726144
/* 199644 00299544 20436C6F */ .word 0x6F6C4320
/* 199648 00299548 75642056 */ .word 0x56206475
/* 19964C 0029954C 6572322E */ .word 0x2E327265
/* 199650 00299550 31372032 */ .word 0x32203731
/* 199654 00299554 3030312F */ .word 0x2F313030
/* 199658 00299558 30352F31 */ .word 0x312F3530
/* 19965C 0029955C 310A0000 */ .word 0x00000A31
