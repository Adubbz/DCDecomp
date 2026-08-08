.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1624
/* 19BB48 0029BA48 416E676C */ .word 0x6C676E41
/* 19BB4C 0029BA4C 65203D20 */ .word 0x203D2065
/* 19BB50 0029BA50 252E3366 */ .word 0x66332E25
/* 19BB54 0029BA54 0A000000 */ .word 0x0000000A
