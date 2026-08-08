.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel RO_00297A28
/* 197B28 00297A28 44325F54 */ .word 0x545F3244
/* 197B2C 00297A2C 4144523D */ .word 0x3D524441
/* 197B30 00297A30 25303878 */ .word 0x78383025
/* 197B34 00297A34 3A000000 */ .word 0x0000003A
