.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel RO_002979F8
/* 197AF8 002979F8 44315F4D */ .word 0x4D5F3144
/* 197AFC 002979FC 4144523D */ .word 0x3D524441
/* 197B00 00297A00 25303878 */ .word 0x78383025
/* 197B04 00297A04 3A000000 */ .word 0x0000003A
