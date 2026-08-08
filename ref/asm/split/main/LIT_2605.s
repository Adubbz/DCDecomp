.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2605
/* 19B2C0 0029B1C0 20706F73 */ .word 0x736F7020
/* 19B2C4 0029B1C4 203D2000 */ .word 0x00203D20
