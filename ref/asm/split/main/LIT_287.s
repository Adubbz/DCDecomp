.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_287
/* 199CC0 00299BC0 25732F6D */ .word 0x6D2F7325
/* 199CC4 00299BC4 7425642E */ .word 0x2E642574
/* 199CC8 00299BC8 746D3200 */ .word GlobalDataBuffer + 0x7BCF4
/* 199CCC 00299BCC 00000000 */ .word 0x00000000
