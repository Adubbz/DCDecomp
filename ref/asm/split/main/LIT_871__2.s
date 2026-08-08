.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_871__2
/* 19DE80 0029DD80 70726576 */ .word 0x76657270
/* 19DE84 0029DD84 20737461 */ .word 0x61747320
/* 19DE88 0029DD88 74757320 */ .word 0x20737574
/* 19DE8C 0029DD8C 3D202564 */ .word 0x6425203D
/* 19DE90 0029DD90 0A000000 */ .word 0x0000000A
/* 19DE94 0029DD94 00000000 */ .word 0x00000000
