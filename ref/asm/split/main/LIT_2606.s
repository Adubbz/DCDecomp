.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_2606
/* 19B2C8 0029B1C8 20726F74 */ .word 0x746F7220
/* 19B2CC 0029B1CC 203D2000 */ .word 0x00203D20
