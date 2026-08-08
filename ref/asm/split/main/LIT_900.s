.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_900
/* 19B5F8 0029B4F8 25732E63 */ .word 0x632E7325
/* 19B5FC 0029B4FC 66670000 */ .word 0x00006766
