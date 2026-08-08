.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_915
/* 19D040 0029CF40 62656520 */ .word 0x20656562
/* 19D044 0029CF44 6E756D20 */ .word 0x206D756E
/* 19D048 0029CF48 3D202564 */ .word 0x6425203D
/* 19D04C 0029CF4C 0A000000 */ .word 0x0000000A
