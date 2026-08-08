.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1004
/* 199660 00299560 25732573 */ .word 0x73257325
/* 199664 00299564 0A000000 */ .word 0x0000000A
/* 199668 00299568 00000000 */ .word 0x00000000
/* 19966C 0029956C 00000000 */ .word 0x00000000
