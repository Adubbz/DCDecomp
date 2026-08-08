.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel RO_00297A38
/* 197B38 00297A38 44325F4D */ .word 0x4D5F3244
/* 197B3C 00297A3C 4144523D */ .word 0x3D524441
/* 197B40 00297A40 25303878 */ .word 0x78383025
/* 197B44 00297A44 3A000000 */ .word 0x0000003A
